package com.jsite.common.beetl.fn;

import java.awt.*;

public class Test {
	
	public static void main(String[] args) {

		String str = "genTable.id";
		
		String arr[] = str.split("\\.");
		
		System.out.println("判断--->" + str.contains("."));
		System.out.println("长度--->" + arr.length);
		
		
		 //获取系统中可用的字体的名字
        GraphicsEnvironment e = GraphicsEnvironment.getLocalGraphicsEnvironment();
        String[] fontName = e.getAvailableFontFamilyNames();
        for (int i = 0; i < fontName.length; i++) {
            System.out.println(fontName[i]);
        }
	}

	
}
