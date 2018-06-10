package com.alibaba.dubbo.demo.impl;

import com.alibaba.dubbo.demo.IProviderService;

public class ProviderServiceImpl implements IProviderService{

	@Override
	public String service1(String word) {
		return word.toLowerCase();
	}

}
