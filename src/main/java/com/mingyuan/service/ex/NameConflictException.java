package com.mingyuan.service.ex;

public class NameConflictException extends ServiceException {

	/**
	 * 用户名冲突异常,例如注册是用户名已经被占用
	 */
	private static final long serialVersionUID = -4915302462279017425L;

	public NameConflictException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NameConflictException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public NameConflictException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public NameConflictException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public NameConflictException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	

}
