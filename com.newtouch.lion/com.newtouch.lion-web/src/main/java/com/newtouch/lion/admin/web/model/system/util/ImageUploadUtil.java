
/*
* Copyright (c)  2015, NewTouch
* All rights reserved. 
*
* $id: ImageUploadUtil.java 9552 Mar 2, 2015 4:07:20 PM MaoJiaWei$
*/
package com.newtouch.lion.admin.web.model.system.util; 

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * Title: 
 * </p>
 * <p>
 * Description: 
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * Company: NewTouch
 * </p>
 * 
 * @author MaoJiaWei
 * @version 1.0
 */
public class ImageUploadUtil {
	private static String IMAGE_JPEG = "FFD8FF";
	private static String IMAGE_JPG = "FFD8FF";
	private static String IMAGE_PNG = "89504E47";
	private static String IMAGE_GIF = "47494638";
	
	public static boolean isImage(MultipartFile image) throws IOException{
		
		boolean flag = false;
		// 图片流
        byte[] imgBuffer = readInputStream(image.getInputStream());
        // 判断要上传得文件的类型
        byte[] b = new byte[3];
        for (int i = 0; i < b.length; i++) {
            b[i] = imgBuffer[i];
        }
        // 获取上传文件的文件头判断是否是图片
        String imgHead = bytesToHexString(b);
        System.out.println(imgHead+"========================");
        if (IMAGE_JPEG.equalsIgnoreCase(imgHead)) {
            flag = true;
        }else if(IMAGE_JPG.equalsIgnoreCase(imgHead)){
        	flag = true;
        } else if (IMAGE_PNG.equalsIgnoreCase(imgHead)) {
            flag = true;
        } else if (IMAGE_GIF.equalsIgnoreCase(imgHead)) {
            flag = true;
        }
		return flag;
	}
	
	private static byte[] readInputStream(InputStream input) throws IOException {
	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    byte[] buffer = new byte[4096];
	    int n = 0;
	    while (-1 != (n = input.read(buffer))) {
	        output.write(buffer, 0, n);
	    }
	    return output.toByteArray();
	}
	
	/**
    * Convert byte[] to hex string. 把字节数组转化为字符串
    * 这里我们可以将byte转换成int，然后利用Integer.toHexString(int)来转换成16进制字符串。
    * @param src byte[] data
    * @return hex string
    */  
	private static String bytesToHexString(byte[] src){
       StringBuilder stringBuilder = new StringBuilder("");
       if (src == null || src.length <= 0) {
           return null;
       }
       for (int i = 0; i < src.length; i++) {
           int v = src[i] & 0xFF;
           String hv = Integer.toHexString(v);
           if (hv.length() < 2) {
               stringBuilder.append(0);
           }
           stringBuilder.append(hv);
       }
       return stringBuilder.toString();
   }
}

	