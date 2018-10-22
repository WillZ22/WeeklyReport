package junit;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wr.dao.UserDao;
import com.wr.dao.impl.ReportDaoImpl;
import com.wr.dao.impl.SignDaoImpl;
import com.wr.dao.impl.UserDaoImpl;
import com.wr.model.MeetingRecord;
import com.wr.model.Notification;
import com.wr.model.Report;
import com.wr.model.Sign;
import com.wr.model.User;
import com.wr.service.MeetingRecordService;
import com.wr.service.NotificationService;
import com.wr.service.ReportService;
import com.wr.service.SignService;
import com.wr.service.UserService;
import com.wr.utils.FileNullCheck;
import com.wr.utils.SystemTime;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="applicationContext.xml")
//不要在测试类里直接用dao层，无效
public class hibernateTest {
	
	@Autowired
	UserService userservice;
	@Autowired
	UserDaoImpl userdao;
	
	@Autowired
	ReportService reportservice;
	@Autowired 
	SignService signservice;
	
	@Autowired
	SignDaoImpl signdao;
	
	@Autowired
	MeetingRecordService meetingRecordService;
	
	@Autowired
	NotificationService notificationService;
	
	@Test
	public void test() throws Exception {
//		userservice.addUser("teacher", "teacher", "teacher", "teacher", null);
////		userservice.addUser("admin", "admin", "admin", "admin", null);
////		userservice.update("1", "1", "1", "1", "1");
////		userservice.delete("1");
//		userservice.addUser("1", "1", "1", "groupmember", "2");
//		userservice.addUser("2", "2", "1", "groupmember", "2");
//		List<Report> reports = reportservice.getWeekAllReports("2018上半年", 1);
		
		Notification notification = new Notification();
		notification.setContent("1");
		notification.setDay(1);
		notification.setMonth(10);
		notification.setYear(2018);
		for(int i = 0; i < 9 ; i++) {
			notificationService.addNotification(notification);
		}
		
		MeetingRecord meetingRecord = new MeetingRecord();
		meetingRecord.setContent("1");
		meetingRecord.setDay(1);
		meetingRecord.setMonth(1);
		meetingRecord.setYear(2017);
		for(int i = 0; i < 9 ; i++) {
			meetingRecordService.addMeetingRecord(meetingRecord);
		}
	}
		
}
