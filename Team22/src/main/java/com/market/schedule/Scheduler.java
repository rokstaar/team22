package com.market.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	@Autowired
    private SchedulerDAO dao;
	
	@Scheduled(cron = "00 00 00 * * *")
	public void endRan() throws Exception {
		dao.endATime();
		dao.schedule();
		
		List<Integer> numList = dao.endNum();
		
		for(int i=0; i<numList.size(); i++) {
			dao.endPlusPay(numList.get(i));
		}
		
		dao.confirmRan();
	}
	
	@Scheduled(cron = "00 11 17 * * *")
	public void test() throws Exception{
		dao.endATime();
	}

}
