package com.wr.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.validation.constraints.Null;

public class SystemTime {

	public static int start_NW_of_Term = 0;//测试用
	public static String term = null;//测试用
	public static int week = 0;
	public static int now_NW_of_Year = 0;
	public static int year = 0;
	public static int month = 0;
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
		
		this.year = nowYear();
		this.month = nowMonth();
		
		this.week = nowWeek();
		this.now_NW_of_Year = now_NW_of_Year();
		
		

		System.out.println(term + start_NW_of_Term);
		Timer timer = new Timer();
		Task task = new Task();
		timer.schedule(task, 1000,10000);
		
		//任务结束后，重置时间
		
	}	
	
	
	class Task extends TimerTask {

		@Override
		public void run() {
			// TODO Auto-generated method stub
			SystemTime.week = nowWeek();
			if (now_NW_of_Year == now_NW_of_Year() -1) {
				start_NW_of_Term = start_NW_of_Term + 1;
				now_NW_of_Year = now_NW_of_Year + 1;

			}
			if (start_NW_of_Term >= 25) {
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
	}
	
	//获取当前星期
	private int nowWeek() {
	    int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
	    return week;
	}
	
	//获取日期所属周数
	private int now_NW_of_Year() {
		int now_NW_of_Year = cal.get(Calendar.WEEK_OF_YEAR);
		return now_NW_of_Year;	
	}
	
	//获取日期所属周数
	private int nowYear() {
		int year = cal.get(Calendar.YEAR);
		return year;	
	}
	
	//获取日期所属周数
	private int nowMonth() {
		int month = cal.get(Calendar.MONTH);
		return month;	
	}
	
	
	public static void main(String[] args) {
		SystemTime systemTime = new SystemTime();
		systemTime.start("2018上半年", 1);
	}
}
