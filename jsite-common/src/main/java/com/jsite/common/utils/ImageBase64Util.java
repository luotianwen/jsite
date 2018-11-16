package com.jsite.common.utils;

import com.jsite.common.web.Servlets;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Base64;

public class ImageBase64Util {
	
	private static String headphotoPath = "userfiles"+File.separator+"headphoto";
	private static String defaultPath = headphotoPath+File.separator+"userinfo.jpg";
	final Base64.Decoder decoder = Base64.getDecoder();
	final Base64.Encoder encoder = Base64.getEncoder();
	 //base64字符串转化成图片  返回保存路径
    public static String GenerateImage(String imgStr,String fileName)  
    {   //对字节数组字符串进行Base64解码并生成图片  
        if (imgStr == null) //图像数据为空  
            return Servlets.getRequest().getContextPath()+File.separator+defaultPath;  
        BASE64Decoder decoder = new BASE64Decoder();  
        try
        {  
        	 imgStr = imgStr.split(",")[1];
        	 byte[] b = decoder.decodeBuffer(imgStr);
            String basePath = Servlets.getRequest().getSession().getServletContext().getRealPath(File.separator) + headphotoPath + File.separator;
            File file = new File(basePath);
    		if (!file.exists()) {
    			file.mkdirs();
    		}
    		String filePath = basePath+fileName;
            //生成图片  
            OutputStream out = new FileOutputStream(filePath);
            
            out.write(b);  
            out.flush();  
            out.close();  
            return Servlets.getRequest().getContextPath()+File.separator+headphotoPath+File.separator+fileName;  
        }   
        catch (Exception e)   
        {  
            return Servlets.getRequest().getContextPath()+File.separator+defaultPath;  
        }  
    }  
    
}
