package com.onlineshopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import java.util.Iterator;
import java.util.List;
import java.io.File;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.User;

public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		String cz="";
		String wz="";
		request.setCharacterEncoding("utf-8");
        String uploadFileName="";
        String fieldName="";
        boolean isMultipart=ServletFileUpload.isMultipartContent(request);
        String uploadFilePath=request.getSession().getServletContext().getRealPath("img/user/");
        if(isMultipart){
        	FileItemFactory factory=new DiskFileItemFactory();
        	ServletFileUpload upload=new ServletFileUpload(factory);
        	try{
        		List<FileItem> items=upload.parseRequest((RequestContext) request);
        		Iterator<FileItem> iter=items.iterator();
        		while(iter.hasNext()){
        			FileItem item=(FileItem)iter.next();
        			if(item.isFormField()){
        				fieldName=item.getFieldName();
        				System.out.println("fieldName��ֵΪ"+fieldName);
        				if("cz".equals(fieldName)){
        					cz=item.getString("utf-8");
        				}else if("wz".equals(fieldName)) {
        					wz=item.getString("utf-8");
        				}
        			}else{
        				String fileName=item.getName();
        				System.out.println("fileName��ֵΪ"+fileName);
        				if(fileName!=null&&!"".equals(fileName)){
        					File fullFile=new File(fileName);
        					uploadFileName=fullFile.getName();
        					
        					int length=uploadFileName.length();
        			        if(length>20) {
        			        	int m=length-20;
        			        	uploadFileName=uploadFileName.substring(m);
        			        }
        					
        					
        					File saveFile=new File(uploadFilePath,uploadFileName);
        					item.write(saveFile);
        				}
        			}
        		}
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        }
        //int userid=Integer.parseInt((String)request.getSession().getAttribute("userid"));
        User user=new User();
        user.setUserid(100);
        user.setPhone(cz);
        user.setEmail(wz);
        user.setIcon(uploadFileName);
        UserDao dao=new UserDao();
        dao.updateInfo(user);
        AccountServlet servlet=new AccountServlet();
        try {
			servlet.doGet(request, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
}
