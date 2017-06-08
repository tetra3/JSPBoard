package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import com.javalec.spring_mybatis.dto.ContentDto;

public interface IDao {
	
	public ArrayList<ContentDto> listDao();
	public void writeDao(String mSession, String mWriter, String mContent);
	public ContentDto viewDao(String strID);
	public void deleteDao(String bId);
	public void singupDao(String lName, String lId, String lPassword, String lPassword_confirm);
	public ArrayList<ContentDto> contentView(String bId);
	public void loginconfirmDao(String id, String Password, String value);
	public void modifyDao(String bId, String bTitle, String bContent);
	public ArrayList<ContentDto> replyViewDao(String bId);
	public void replyDao(String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent);
	public void upHit(String bId);
}
