package com.blackboxproject.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.service.AutoUploadService;

@Controller
public class AutoUploadController {

	private static final Logger logger = LoggerFactory.getLogger(AutoUploadController.class);

	@Inject
	private AutoUploadService service;

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void findCoureseCode() throws Exception {
		logger.info("find");
	}

	@ResponseBody
	@RequestMapping(value = "/find", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> findCoureseCode(String fileName) throws Exception {

		System.out.println(fileName);
		// fileName = "2017_09_21_10.30.12_공7_218";
		// 
		int year = Integer.parseInt(fileName.substring(0, 4)); // 년
		int month = Integer.parseInt(fileName.substring(5, 7)); // 월
		int day = Integer.parseInt(fileName.substring(8, 10)); // 일
		String days[] = { "토", "일", "월", "화", "수", "목", "금" };

		// 요일 확인하기, 젤러의 공식 사용
		String courseDay;
		if (month == 1) {
			month = 13;
			year = year - 1;
		} else if (month == 2) {
			month = 14;
			year = year - 1;
		}

		int j = year / 100;
		int k = year % 100;

		int h = (day + ((26 * (month + 1)) / 10) + k + (k / 4) + j / 4 + (5 * j)) % 7;

		courseDay = days[h];

		// 몇 교시 인지 확인하기
		int hour = Integer.parseInt(fileName.substring(11, 13));
		int minute = Integer.parseInt(fileName.substring(14, 16));
		int time = 0;
		int allMinute = hour * 60 + minute - 60 * 9; // 현재 시간을 분으로 환산 후, 9시를 기준으로 시간 시작
		int period; // 몇 교시

		if (h % 2 == 1) {
			time = 90; // 화목 수업의 경우에는 1시간30분 잡기(원래 수업시간은 1시간 15분이나 대부분 끝나고 누르므로 쉬는시간 포함)
		} else if (h % 2 == 0) {
			time = 60; // 월수 수업의 경우에는 1시간
		}

		period = (allMinute / time) + 1;

		String courseTime = courseDay + period; // 수3

		// 건물 위치 및 강의실 확인
		// String building = fileName.substring(20, fileName.lastIndexOf("_"));
		String building = "공7";
		String roomNumber = fileName.substring(fileName.lastIndexOf("_") + 1);
		// 공7-218, 인문대303
		System.out.println(courseTime + " " + building + "-" + roomNumber);
		CourseVO vo;
		String courseClassroom;

		// 1차로 하이픈 붙이고 검색
		courseClassroom = building + "-" + roomNumber;
		vo = service.getFileName(courseTime, courseClassroom);

		// 없을 시에 하이픈 제거하고 검색하기
		if (vo == null) {
			
			
			courseClassroom = building + roomNumber;
			vo = service.getFileName(courseTime, courseClassroom);
		}

		String result = vo.getCourseCode() + "-" + vo.getCourseClass();
		System.out.println(result); // 예를 들어, CLT0573-1 
		//CLT0573-1_1~100 

		return new ResponseEntity<String>(result, HttpStatus.CREATED);
	}
}
