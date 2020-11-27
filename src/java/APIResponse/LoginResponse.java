/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package APIResponse;

/**
 *
 * @author Alrik
 */
public class LoginResponse {
    
    public class Success {
        public String status;
        public String user_id;
        public boolean enterprise_account;
    }
    
    public Success success;
    
    public class Error{
        public String message;
        public String reason;
    }
    
    public Error error;
}