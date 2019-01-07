package com.wr.utils;


import java.util.Calendar;
import java.util.Date;

public class SystemTime {

	public static int start_NW_of_Term = 0;
	public static String term = null;
	public static int week = 0;
	public static int now_NW_of_Year = 0;
	public static int year = 0;
	public static int month = 0;
	public static int day = 0;
	private static Calendar cal ;
	
	public static Boolean systemStatus = false;


	public static void start(String term, int start_NW_of_Term) {
		reset();

		Date date = new Date();
		SystemTime.term = term;
		SystemTime.start_NW_of_Term = start_NW_of_Term;
		SystemTime.cal = Calendar.getInstance();
		SystemTime.cal.setTime(date);
		SystemTime.cal.setFirstDayOfWeek(Calendar.SUNDAY);
		SystemTime.year = cal.get(Calendar.YEAR);
		SystemTime.month = cal.get(Calendar.MONTH) + 1;
		SystemTime.day = cal.get(Calendar.DAY_OF_MONTH);		
		SystemTime.week = cal.get(Calendar.DAY_OF_WEEK) - 1;
		SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);		
		SystemTime.systemStatus = true;

	}	
	
	
	
	public static void fresh() {
		
		if (SystemTime.systemStatus == false) {
			return;
		} else {
			Date date = new Date();
			cal.setTime(date);
			
			System.out.println(".............................................");
			
			SystemTime.year = cal.get(Calendar.YEAR);
			SystemTime.month = cal.get(Calendar.MONTH) + 1;
			SystemTime.day = cal.get(Calendar.DAY_OF_MONTH);
			SystemTime.week = cal.get(Calendar.DAY_OF_WEEK) - 1;
			
			if (SystemTime.now_NW_of_Year < cal.get(Calendar.WEEK_OF_YEAR)) {
				int n = cal.get(Calendar.WEEK_OF_YEAR) - SystemTime.now_NW_of_Year;
				SystemTime.start_NW_of_Term += n;
				SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);
			} else if (SystemTime.now_NW_of_Year > cal.get(Calendar.WEEK_OF_YEAR)) {
				reset();
			}
			
			if (SystemTime.start_NW_of_Term > 25) {
				reset();
			}
			
		}
	}
	
	
	private static void reset() {
		start_NW_of_Term = 0;
	 	term = null;
		week = 0;
		now_NW_of_Year = 0;
		year = 0;
		day = 0;
		month = 0;
	}
	
	
//	public static void main(String[] args) {
//		SystemTime.start("2019上半年", 1);
//		System.out.println(SystemTime.now_NW_of_Year+" "+SystemTime.start_NW_of_Term);
//		
//		SystemTime.now_NW_of_Year = 1;
//		SystemTime.fresh();
//		System.out.println(SystemTime.now_NW_of_Year+" "+SystemTime.start_NW_of_Term);
//	}
	
}
