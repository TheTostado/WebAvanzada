/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import APIRequest.LoginRequest;
import APIRequest.LoginRequest2FA;
import APIResponse.LoginResponse;
import APIResponse.LoginResponse2FA;
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
@WebServlet(name = "LoginServlet2FA", urlPatterns = {"/LoginServlet2FA"})
public class LoginServlet2FA extends HttpServlet {

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
            httpAPIRequest<LoginResponse2FA> request2 = new httpAPIRequest<>();
            LoginRequest2FA lr = new LoginRequest2FA();
          
            HttpSession session = request.getSession();
            

            String codigo2fa = request.getParameter("codigo");
            lr.code = codigo2fa;
            lr.email = (String)session.getAttribute("email");
            
            

            LoginResponse2FA loginresponse2fa = request2.POST("/credentials/2fa", new StringEntity(gson.toJson(lr)), true, LoginResponse2FA.class);
            System.out.println(lr.email);
            System.out.println(loginresponse2fa.success.status);

            if (loginresponse2fa != null) {
                if (loginresponse2fa.success.status.equals("OK")) {
                    request.setAttribute("loginresponse2fa", loginresponse2fa);
                    request.getRequestDispatcher("Menu2FA.jsp").forward(request, response);
                }
                if (loginresponse2fa.success.status.equals("FAILED")) {
                    request.setAttribute("loginresponse2fa", loginresponse2fa);
//                    request.getRequestDispatcher("Login2FA.jsp").forward(request, response);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login2FA.jsp");
                    PrintWriter out = response.getWriter();
                    out.println("<div id=\"contenedor3\"><h2><font color=red>Los datos ingresados son incorrectos</font></h2></div>");
                    rd.include(request, response);
                }
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login2FA.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div id=\"contenedor3\"><h2><font color=red>Los datos ingresados son incorrectos</font></h2></div>");
                rd.include(request, response);
            }

        } catch (Exception ex) {
        } finally {
            //@Deprecated httpClient.getConnectionManager().shutdown(); 
        }
    }//fin de doPost

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
