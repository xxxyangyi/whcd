package com.hand.intercepter;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("进入校验");
		Map session = invocation.getInvocationContext().getSession();
		if (session.get("loginSign") == null) {
			System.out.println("login");
			return "login";
		} else {
			String result = invocation.invoke();
			System.out.println("result");
			return result;
		}
	}
}
