/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import APIRequest.RegistroRequest;
import APIResponse.AccountFinderResponse;
import APIResponse.RegistroResponse;
import APIResponse.SignatureResponse;
import com.google.gson.Gson;
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
import org.apache.http.entity.StringEntity;

/**
 *
 * @author Alrik
 */
@WebServlet(name = "AccountFinderServlet", urlPatterns = {"/AccountFinderServlet"})
public class AccountFinderServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountFinderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountFinderServlet at " + request.getContextPath() + "</h1>");
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
            httpAPIRequest<AccountFinderResponse> request2 = new httpAPIRequest<>();            
            AccountFinderResponse afresponse = request2.GET("/account/find/:account_id", false, AccountFinderResponse.class);
            
            String account_id = afresponse.success.account_id;
            String email = afresponse.success.email;
            String firstName = afresponse.success.firstName;
            String lastName = afresponse.success.lastName;
            String signature = afresponse.success.signature;
            boolean enterprise_account = afresponse.success.enterprise_account;

            System.out.println("***********");

//            if(afresponse.error != null){
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/CuentayFirma.jsp");
//                PrintWriter out = response.getWriter();
//                out.println("<div id=\"contenedor3\"><h2><font color=red>"+afresponse.error.message+"</font></h2>");
//                out.println("<h2><font color=red>"+afresponse.error.reason+"</font></h2></div>");
//                rd.include(request, response);
//            }
//            else if (afresponse.success != null) {
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/AccountFinder.jsp");
//                PrintWriter out = response.getWriter();
//                out.println("<div id=\"contenedor4\"><h1>ID: "+account_id+"</h1></div>");
//                rd.include(request, response);
//            }
                
                
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
