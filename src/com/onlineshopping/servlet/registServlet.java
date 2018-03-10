package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.User;
import java.awt.Color;

import java.awt.Font;

import java.awt.Graphics;

import java.awt.image.BufferedImage;

import java.io.IOException;

import java.util.Random;

import javax.imageio.ImageIO;

import javax.servlet.ServletOutputStream;
/**
 * Servlet implementation class registeServlet
 */
@WebServlet("/registeServlet")
public class registServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao ud=new UserDao();
		//获取用户名
		String uname=request.getParameter("uername");
		User user;
		if(user==null) {
		public void getImage(){
			int width=90;//验证码图片宽度
			int height=30;//验证码图片高度
			BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
			Graphics g=image.getGraphics();
			Random random=new Random();//创建一个随机类
			g.setColor(getRandColor(200,250));//背景颜色要偏淡
			g.fillRect(0, 0, width, height);//画背景
			g.setColor(getRandColor(160,200));// 随机产生5条干扰线，使图象中的认证码不易被其它程序探测到
			for(int i=0;i<8;i++){
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			int x1=random.nextInt(width);
			int y1=random.nextInt(height);
			g.drawLine(x, y, x1, y1);
			}
			g.setColor(getRandColor(160,200));// 随机产生100点，使图象中的认证码不易被其它程序探测到
			for(int i=0;i<100;i++){
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			g.drawLine(x, y, x, y);
			}
			Font font = new Font("Times New Roman", Font.ITALIC,28); // 创建字体，字体的大小应该根据图片的高度来定。
			g.setFont(font);//设置字体
			int length = 4; // 设置默认生成4个验证码
			String s="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // 设置备选验证码:包括"a-z"和数字"0-9"
			String sRand="";
			// 用随机产生的颜色将验证码绘制到图像中。
			// 生成随机颜色(因为是做前景，所以偏深)
			//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
			for(int i=0;i<length;i++){
			String ch=String .valueOf(s.charAt(random.nextInt(s.length())));
			sRand+=ch;
			g.drawString(ch, 22*i+5, (random.nextInt(5)-2)*i+28); //调节字体的位置
			}
			//将生成的字符串存储在session中
			request.getSession().setAttribute("checkCode", sRand);
			g.dispose();//图像生效
			//禁止图像缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");
			//创建二进制的输出流
			ServletOutputStream sos;
			try {
			sos = response.getOutputStream();
			// 将图像输出到Servlet输出流中。
			ImageIO.write(image, "jpeg", sos);
			sos.flush();
			sos.close();
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			}
			//获取随机颜色值
			private Color getRandColor(int lower, int upper) {
			Random random = new Random();
			if(upper>255)
			upper=255;
			if(upper<1)
			upper=1;
			if(lower<1)
			lower=1;
			if(lower>255)
			lower=255;
			int r=lower+random.nextInt(upper-lower);
			int g=lower+random.nextInt(upper-lower);
			int b=lower+random.nextInt(upper-lower);
			return new Color(r,g,b);
			}
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


