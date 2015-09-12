package com.job4sure.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFormatUtil {
	public static String getformattedDate(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return simpleDateFormat.format(date);
	}
	
	public static int getRemainingDays(String validUpTo) {
	    Date now = new Date();
		int numberOfDaysRemaining = 0;
		DateFormat formatter = new SimpleDateFormat(IConstant.VALID_UP_TO_DATE_FORMAT);
		try {
		    Date ValidityDate = (Date) formatter.parse(validUpTo);
		    if (ValidityDate.compareTo(now) > 0) {
			Calendar day1 = Calendar.getInstance();
			Calendar day2 = Calendar.getInstance();
			day1.setTime(ValidityDate);
			day2.setTime(now);
			numberOfDaysRemaining = day1.get(Calendar.DAY_OF_YEAR) - day2.get(Calendar.DAY_OF_YEAR);
		    }
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		return numberOfDaysRemaining;
	}
	
}
