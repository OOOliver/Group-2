package com.alibaba.dubbo.demo.impl;
import com.alibaba.dubbo.demo.IProviderService3;
public class ProviderServiceImpl implements IProviderService3 {
	@Override
	public String service3(String word) {
		String lower = word.toLowerCase();
		String first = (lower.charAt(0)+"").toUpperCase();
		String s = lower.substring(1);
		return first+s;
	}
}
