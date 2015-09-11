package com.job4sure.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import sun.misc.BASE64Encoder;

public class ImageFormat {
	public static String readImage(String imagePath) throws IOException
	  {
	      //Pseudo Code 
	      BufferedImage bufferedImage=ImageIO.read(new File("E:\\Aartek Project\\Prestigepoint\\images\\Desert.jpg"));
	     
	      /* String []formatSplit=imageDao.split("\\.");
	       if(formatSplit.length==2){
	       String format=formatSplit[1];*/
	       String format="jpg";
	       
	       @SuppressWarnings("restriction")
		BASE64Encoder base64Encoder=new BASE64Encoder();
	       String imageString=null;
	       String encodedImage=null;
	       ByteArrayOutputStream bos = new ByteArrayOutputStream();
	       try {
	           ImageIO.write(bufferedImage, format, bos);
	           byte[] imageBytes = bos.toByteArray();
	           encodedImage=base64Encoder.encode(imageBytes);
	           imageString = "data:image/"+format+";base64,"+encodedImage;
	           bos.close();
	       } catch (IOException e) {
	           e.printStackTrace();
	       }
	       return imageString;
	      }
}
