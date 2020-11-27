/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import APIRequest.LoginRequest;
import APIRequest.LoginRequest2FA;
import APIRequest.RegistroRequest;
import APIResponse.LoginResponse;
import APIResponse.LoginResponse2FA;
import APIResponse.RegistroResponse;
import APIResponse.SignatureResponse;
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
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Registro Servlet at " + request.getContextPath() + "</h1>");
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
    }//fin de doGet

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
//        processRequest(request, response);
        Gson gson = new Gson();
        try {
            httpAPIRequest<RegistroResponse> request2 = new httpAPIRequest<>();
            httpAPIRequest<SignatureResponse> signa = new httpAPIRequest<>();
            RegistroRequest lr = new RegistroRequest();
            SignatureResponse firmaresponse = signa.GET("/account/signature/create", false, SignatureResponse.class);

            String email = request.getParameter("correo");
            String firstName = request.getParameter("nombre");
            String lastName = request.getParameter("apellido");
            String password = request.getParameter("contra");
            String EnterpriseA = request.getParameter("rb");
            
            lr.email = email;
            lr.firstName = firstName;
            lr.lastName = lastName;
            lr.password = password;
            lr.signature = firmaresponse.success.signature;
            lr.enterprise_account = Boolean.parseBoolean(EnterpriseA);

            RegistroResponse registroresponse = request2.POST("/credentials/register", new StringEntity(gson.toJson(lr)), true, RegistroResponse.class);
//            System.out.println(registroresponse.success.message);
//            System.out.println(registroresponse.success.user_id);
//            System.out.println(registroresponse.error.message);
//            System.out.println(registroresponse.error.reason);
//            System.out.println(firmaresponse.success.signature);

//            request.setAttribute("registroresponse", registroresponse);
//            request.getRequestDispatcher("LoginExitoso.jsp").forward(request, response);
            if(lr.email=="" || lr.firstName=="" || lr.lastName==""
                    || lr.password==""){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/RegistroUser.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div id=\"contenedor3\"><h2><font color=red>Los datos ingresados son incorrectos</font></h2></div>");
                rd.include(request, response);
            }
            else if (registroresponse.success == null) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/RegistroUser.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div id=\"contenedor3\"><h2><font color=red>El usuario ya existe</font></h2></div>");
                rd.include(request, response);
      
            }else if (lr.enterprise_account==true){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div id=\"contenedor5\"><h2><font color=red>Su peticion para su cuenta empresarial esta en revision</font></h2></div>");
                rd.include(request, response);
            }
            else{
                
                HttpSession session = request.getSession();
                    session.setAttribute("email", lr.email);
                    session.setMaxInactiveInterval(30 * 60);
                    Cookie userName = new Cookie("email", lr.email);
                    userName.setMaxAge(30 * 60);
                    response.addCookie(userName);
                
                request.setAttribute("registroresponse", registroresponse);
                request.getRequestDispatcher("MenuNuevoUser.jsp").forward(request, response);
                
                
                
//                System.out.println("Exito");
            }
        } catch (Exception ex) {
            System.out.println(ex);
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
