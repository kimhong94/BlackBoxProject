package com.blackboxproject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.management.Query;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.aspectj.annotation.LazySingletonAspectInstanceFactoryDecorator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.deser.std.DateDeserializers.CalendarDeserializer;

import util.MediaUtils;
import util.UploadUtils;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() throws Exception{
		
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
			produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		
		logger.info("originalFileName : " + file.getOriginalFilename());
		return new ResponseEntity<String>(UploadUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes())
				, HttpStatus.CREATED);
	}
	
	private String uploadFile(String originalFilename, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalFilename;
		
		File file = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, file);
		
		return savedName;
	}
	
	  @ResponseBody
	  @RequestMapping("/displayFile")
	  public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
	    
	    InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    logger.info("FILE NAME: " + fileName);
	    
	    try{
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+fileName);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        
	        fileName = fileName.substring(fileName.indexOf("_")+1);       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	  }
	
	  @ResponseBody
	  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(String fileName) throws Exception{
		  
		  logger.info("Delete File : " + fileName);
		  
		  String formatName = fileName.substring(fileName.lastIndexOf('.')+1);
		  
		  MediaType mType = MediaUtils.getMediaType(formatName);
		  
		  if(mType != null){	// �������� ����
			  String front = fileName.substring(0, 12);
			  String end = fileName.substring(14);
			  logger.info("Delete File end: " + end);
			  new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		  }
		  
		  new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		  
		  return new ResponseEntity<>("deleted", HttpStatus.OK);
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
	    
	    logger.info("delete all files: "+ files);
	    
	    if(files == null || files.length == 0) {
	      return new ResponseEntity<String>("deleted", HttpStatus.OK);
	    }
	    
	    for (String fileName : files) {
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      if(mType != null){      
	        // ���� ���� �����
	        String front = fileName.substring(0,12);
	        String end = fileName.substring(14);
	        new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
	      }
	      
	      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	      
	    }
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }  
	
}
