package com.onlineshopping.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import java.util.List;
import java.io.File;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        		List<FileItem> items=upload.parseRequest(request);
        		Iterator<FileItem> iter=items.iterator();
        		while(iter.hasNext()){
        			FileItem item=(FileItem)iter.next();
        			if(item.isFormField()){
        				fieldName=item.getFieldName();
        				System.out.println("fieldName的值为"+fieldName);
        				if("cz".equals(fieldName)){
        					cz=item.getString("utf-8");
        				}else if("wz".equals(fieldName)) {
        					wz=item.getString("utf-8");
        				}
        			}else{
        				String fileName=item.getName();
        				System.out.println("fileName的值为"+fileName);
        				if(fileName!=null&&!"".equals(fileName)){
        					File fullFile=new File(fileName);
        					uploadFileName=fullFile.getName();
        					File saveFile=new File(uploadFilePath,uploadFileName);
        					item.write(saveFile);
        				}
        			}
        		}
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        }
	}
}
