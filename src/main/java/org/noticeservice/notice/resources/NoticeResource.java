package org.noticeservice.notice.resources;

import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.noticeservice.notice.beans.Notice;
import org.noticeservice.notice.service.NoticeService;

@Path("/notices")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class NoticeResource {
	NoticeService noticesService = new NoticeService();
	
	@GET
	public List<Notice> getMessages() throws SQLException{
		return noticesService.getAllMessages();
	}
	
	@POST
	public Notice addMessage(Notice notice) throws SQLException{
		return noticesService.addMessage(notice);
	}
	
	@PUT
	@Path("/{noticeId}")
	public Notice updateMessage(@PathParam("noticeId") int noticeId, Notice notice) throws SQLException{
		notice.setNoticeId(noticeId);
		return noticesService.updateMessage(notice);
	}
	
	@GET
	@Path("/{noticeId}")
	public Notice getMessage(@PathParam("noticeId") int noticeId) throws SQLException{
		return noticesService.getMessage(noticeId);
	}
	
	@DELETE
	@Path("/{noticeId}")
	public void deleteMessage(@PathParam("noticeId") int noticeId) throws SQLException{
		noticesService.deleteMessage(noticeId);
	}
}
