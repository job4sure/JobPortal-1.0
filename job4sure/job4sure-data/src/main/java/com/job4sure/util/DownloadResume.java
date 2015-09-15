package com.job4sure.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class DownloadResume {

	public static void downloadResume(String attachmentName, String path, HttpServletResponse response, String type) throws IOException {
		/*
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String filepath = path+ File.separator;
		String resumeFilePath=filepath.replaceAll("/", "//");
		File f = new File( url.getFile().replaceAll("/", "//") );
		bufferedResume bufferedResume=ImageIO.read(new File(filepath.replace("/", "//")));
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; attachmentName=\"" + attachmentName + "\"");
		FileInputStream fileInputStream = new FileInputStream("D:/jobPortal-1.0-2/localImages/myimag/3_7db.sql");
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		fileInputStream.close();
		out.close();*/
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String filename = attachmentName;
		String filepath = path + File.separator;
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath);
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		fileInputStream.close();
		out.close();
		
		
    }
	}


