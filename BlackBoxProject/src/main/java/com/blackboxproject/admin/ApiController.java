package com.blackboxproject.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.service.CourseService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/api")
public class ApiController {
	
	private static final String host = "http://192.168.0.14:5002";
	
	@Inject
	private CourseService courseService;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public void apiPage(){
		
		
	}
	
	@RequestMapping(value="/{univ}/lectures", method=RequestMethod.POST)
	public ResponseEntity<String> registLectures(@PathVariable("univ")String univ,
			@RequestBody List<CourseVO> lectures) throws Exception{
		
		ResponseEntity<String> entity = null;
		System.out.println("/{univ}/lectures POST");
		
		
		long startTime = System.currentTimeMillis();
		
		courseService.registAllCourese(lectures);
		
		long endTime = System.currentTimeMillis();
		System.out.println("Batch Insert Time : " + (endTime-startTime));
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/{univ}/lectures", method=RequestMethod.PUT)
	public ResponseEntity<String> listLectures4univ(@PathVariable("univ")String univ,@RequestBody String filename) throws JsonParseException, JsonMappingException, IOException{
		
		System.out.println(univ + filename);
		ResponseEntity<String> entity = null;
		// RestTemplate 에 MessageConverter 세팅
		List<HttpMessageConverter<?>> converters = new ArrayList<HttpMessageConverter<?>>();
		converters.add(new FormHttpMessageConverter());
		converters.add(new StringHttpMessageConverter());

		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setMessageConverters(converters);

		// parameter 세팅
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("filename", filename);

		String url = host + "/parseexcel";
		// REST API 호출
		String result = restTemplate.postForObject(url, map, String.class);
		// json 이 utf-8형태이면 이렇게 문자열 처리
		result = result.substring(1,result.length()-2);
		result = result.replace("\\\"", "\"");
		result = result.replace("\\\\", "\\");
		
		
		
		// json 파싱하기

		try {
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@RequestMapping(value="/{univ}/lectures", method=RequestMethod.GET)
	public ResponseEntity<String> getAvailableList(@PathVariable("univ")String univ) throws JsonParseException, JsonMappingException, IOException{
		
		ResponseEntity<String> entity = null;
		
		// RestTemplate 에 MessageConverter 세팅
		List<HttpMessageConverter<?>> converters = new ArrayList<HttpMessageConverter<?>>();
		converters.add(new FormHttpMessageConverter());
		converters.add(new StringHttpMessageConverter());

		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setMessageConverters(converters);


		String url = host + "/parseexcel";
		String query = "?univ=" + univ;
		String urlWithQuery = url + query;
		// REST API 호출
		String result = restTemplate.getForObject(urlWithQuery, String.class); 
		System.out.println(result);
		// json 파싱하기
/*		
		result = result.substring(1,result.length()-2);
		result = result.replace("\\\"", "\"");
		ObjectMapper mapper = new ObjectMapper();
		Map<String, List<String>> results = mapper.readValue(result,
				   new TypeReference<Map<String, List<String>>>() { } );
*/
		
		try {
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
}
