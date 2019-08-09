package com.mingyuan.hander;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.mingyuan.bean.Msg;
import com.mingyuan.service.ex.ServiceException;

public class BaseHandler {
	
	@ExceptionHandler(ServiceException.class)
	public Msg HandlerException(Throwable e) {
		
		Msg msg=new Msg(e);
		msg.setCode(200);
		return msg;
	}
		
}
