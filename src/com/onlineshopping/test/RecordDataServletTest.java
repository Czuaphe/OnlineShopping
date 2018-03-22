package com.onlineshopping.test;

import com.onlineshopping.servlet.RecordDataServlet;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RecordDataServletTest {

    private RecordDataServlet recordDataServlet = new RecordDataServlet();

    @Test
    public void test() throws ServletException, IOException {

        HttpServletRequest request = null;

        HttpServletResponse response = null;

        recordDataServlet.doGet(request, response);

    }

}
