package org.noticeservice.notice.service;


import java.sql.SQLException;
import java.util.List;

import org.noticeservice.notice.beans.Notice;
import org.noticeservice.notice.model.NoticeManager;

public class NoticeService {
	public List<Notice> getAllMessages() throws SQLException{
		return NoticeManager.displayAllRows();
	}
	
	public Notice getMessage(int noticeId) throws SQLException{
		return NoticeManager.getRow(noticeId);
	}
	
	public Notice addMessage(Notice notice) throws SQLException{
		return NoticeManager.insert(notice);
	}
	
	public Notice updateMessage(Notice notice) throws SQLException{
		return NoticeManager.update(notice);
	}
	
	public void deleteMessage(int noticeId) throws SQLException{
		 NoticeManager.delete(noticeId);
	}
}
