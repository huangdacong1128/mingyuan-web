package com.mingyuan.util;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import java.lang.annotation.RetentionPolicy;

import java.lang.annotation.ElementType;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface FormToken {
	  boolean save() default false;
    boolean remove() default false;
}
