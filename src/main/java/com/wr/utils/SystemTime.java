package com.wr.utils;

import java.time.DayOfWeek;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.validation.constraints.Null;

public class SystemTime {

	public static int start_NW_of_Term = 0;
	public static String term = null;
	public static int week = 0;
	public static int now_NW_of_Year = 0;
	public static int year = 0;
	public static int month = 0;
	public static int day = 0;
	private static Calendar cal ;
	
	private Timer timer ;
	private Task task;


	public void start(String term, int start_NW_of_Term) {
		//调用方法前先结束任务，重置时间
		this.term = term;
		this.start_NW_of_Term = start_NW_of_Term;
		
		Date date = new Date();
		
		cal = Calendar.getInstance();
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.SUNDAY);
		
		this.year = cal.get(Calendar.YEAR);

		this.month = cal.get(Calendar.MONTH) + 1;

		this.day = cal.get(Calendar.DAY_OF_MONTH);

		
		this.week = cal.get(Calendar.DAY_OF_WEEK) - 1;

		this.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);

		
		Timer timer = new Timer();
		Task task = new Task();
		timer.schedule(task, 1000,10000);
	}	
	
	
	class Task extends TimerTask {
		@Override
		public void run() {
			// TODO Auto-generated method stub
			SystemTime.week =  cal.get(Calendar.DAY_OF_WEEK) - 1;
			if (SystemTime.now_NW_of_Year < cal.get(Calendar.WEEK_OF_YEAR)) {
				SystemTime.start_NW_of_Term += 1;
				SystemTime.now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);
			}
			System.out.println(SystemTime.start_NW_of_Term);
			if (SystemTime.start_NW_of_Term >= 25) {
				cancel();
				reset();
			}
		}	  	
	}
	
	
	private void reset() {
		start_NW_of_Term = 0;
	 	term = null;
		week = 0;
		now_NW_of_Year = 0;
		year = 0;
		day = 0;
		month = 0;
	}
	
	public static void main(String[] args) {
		SystemTime systemTime = new SystemTime();
		systemTime.start("2018上半年", 1);
	}
}
