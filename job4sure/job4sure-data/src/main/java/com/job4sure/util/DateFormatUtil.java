package com.job4sure.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	public static String getformattedDate(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return simpleDateFormat.format(date);
	}
}
