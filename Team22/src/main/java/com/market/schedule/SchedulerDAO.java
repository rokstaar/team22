package com.market.schedule;

import java.util.List;

public interface SchedulerDAO {
	public Integer schedule() throws Exception;
	
	public List<Integer> endNum() throws Exception;
	
	public void endPlusPay(int num) throws Exception;
	
	public void confirmRan() throws Exception;
	
	public void endATime() throws Exception;
}
