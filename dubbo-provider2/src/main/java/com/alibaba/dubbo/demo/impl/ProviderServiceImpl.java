package com.alibaba.dubbo.demo.impl;

import com.alibaba.dubbo.demo.IProviderService2;


public class ProviderServiceImpl implements IProviderService2 {


	@Override
	public String service2(String word) {
		return word.toUpperCase();
	}

	

}
