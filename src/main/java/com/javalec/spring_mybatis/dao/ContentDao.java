package com.javalec.spring_mybatis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.javalec.spring_mybatis.dto.ContentDto;

public class ContentDao implements IDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public ContentDao() {
		// TODO Auto-generated constructor stub
	}
	
	public void loginconfirmDao(String id, String Password, String value) {
		
	}
	
	@Override
	public void singupDao(final String lName,final String lId,final String lPassword,final String lPassword_confirm) {
//		System.out.println("signupDao()");
//		this.template.update(new PreparedStatementCreator() {
//			
//			@Override
//			public PreparedStatement createPreparedStatement(Connection con)
//					throws SQLException {
//				
//				String query = "insert into boardmember (lId, lPassword, lName) values (?,?,?)";
//				PreparedStatement pstmt = con.prepareStatement(query);
//				pstmt.setString(1, lId);
//				pstmt.setString(2, lPassword);
//				pstmt.setString(3, lName);
//				
//				
//				return pstmt;
//			}
//		});
//		
	}
	@Override
	public ArrayList<ContentDto> contentView(String bId) {
		String query = "select * from mvc_board where bId = ?";
		ArrayList<ContentDto> dtos = (ArrayList<ContentDto>) template.query(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
		return dtos;
	}
	
	
	@Override
	public ArrayList<ContentDto> listDao() {
		String query = "select * from board order by mId desc";
		ArrayList<ContentDto> dtos = (ArrayList<ContentDto>) template.query(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
		return dtos;
	}
	
	
	@Override
	public void writeDao(final String mSession, final String mWriter, final String mContent) {
		System.out.println("writeDao()");
		
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				String query = "insert into board (mId, mWriter, mContent) values (board_seq.nextval, ?, ?)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, mWriter);
				pstmt.setString(2, mContent);
				return pstmt;
			}
		});
		
	}

	
	@Override
	public ContentDto viewDao(String strID) {
		System.out.println("viewDao()");
		
		String query = "select * from board where mId = " + strID;
		return template.queryForObject(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
	}

	
	@Override
	public void deleteDao(final String bId) {
		System.out.println("deleteDao()");
		
		String query = "delete from board where mId = ?";
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(bId));
			}
		});
		
	}
	
	@Override
	public void modifyDao(String bId, String bTitle, String bContent) {
		
	}
	
	
	@Override
	public ArrayList<ContentDto> replyViewDao(String bId) {
		String query = "select * from board order by mId desc";
		ArrayList<ContentDto> dtos = (ArrayList<ContentDto>) template.query(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
		return dtos;		
	}
	
	@Override
	public void replyDao(String bName, String bTitle, String bContent, String bGroup, String bStep,
			String bIndent) {
		
	}
	
	@Override
	public void upHit(String bId) {
		// TODO Auto-generated method stub
		
	}
	 
}
