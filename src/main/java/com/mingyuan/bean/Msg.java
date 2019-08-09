package com.mingyuan.bean;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
@Component
public class Msg {
	//100为成功,200为失败
	private Integer code;
	private String msg;
	private Map<String,Object> extend=new HashMap<>();
	
	
	public Msg() {
		super();
	}
	
	public static Msg success() {
		Msg msg=new Msg();
		msg.setCode(100);
		msg.setMsg("处理成功");
		return msg;
	}
	public static Msg fail() {
		Msg msg=new Msg();
		msg.setCode(200);
		msg.setMsg("处理失败");
		return msg;
	}
	
	
	
	public Msg(Throwable e) {
		super();
		this.msg = e.getMessage();
	}

	public Msg(Integer code) {
		super();
		this.code = code;
	}
	public Msg addMap(String key,Object value) {
		extend.put(key, value);
		return this;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	

}
