/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import APIRequest.LoginRequest;
import APIResponse.LoginResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import com.google.gson.Gson;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Alrik
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();
        try {
            httpAPIRequest<LoginResponse> request2 = new httpAPIRequest<>();
            LoginRequest lr = new LoginRequest();

            String email = request.getParameter("usuario");
            String password = request.getParameter("contrasena");
            lr.email = email;
            lr.password = password;
            

            LoginResponse loginresponse = request2.POST("/credentials/login", new StringEntity(gson.toJson(lr)), true, LoginResponse.class);
            System.out.println(loginresponse.success.status);

            if (loginresponse != null) {
                if (loginresponse.success.status.equals("VALID_CREDENTIALS")) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("email", lr.email);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("email", lr.email);
                    userName.setMaxAge(30 * 60);
                    response.addCookie(userName);
                    
                    request.setAttribute("loginresponse", loginresponse);
                    request.getRequestDispatcher("Menu.jsp").forward(request, response);
//                    response.sendRedirect("LoginExistoso.jsp");

                }
                if (loginresponse.success.status.equals("2FA_REQUIRED")) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("email", lr.email);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("email", lr.email);
                    userName.setMaxAge(30 * 60);
                    response.addCookie(userName);
                    
                    request.setAttribute("loginresponse", loginresponse);
                    request.getRequestDispatcher("Login2FA.jsp").forward(request, response);
                }
                if (loginresponse.success.status.equals("NOT_AUTHORIZED")) {
                    request.setAttribute("loginresponse", loginresponse);
//                  request.getRequestDispatcher("/index.jsp").forward(request, response);

                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                    PrintWriter out = response.getWriter();
                    out.println("<div id=\"contenedor3\"><h2><font color=red>Los datos ingresados son incorrectos</font></h2></div>");
                    rd.include(request, response);
                }
            }else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div id=\"contenedor3\"><h2><font color=red>Los datos ingresados son incorrectos</font></h2></div>");
                rd.include(request, response);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            //@Deprecated httpClient.getConnectionManager().shutdown(); 
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
