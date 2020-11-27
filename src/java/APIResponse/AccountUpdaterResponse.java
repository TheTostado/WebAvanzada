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
public class AccountUpdaterResponse {
    
    public class Success {
        public String account_id;
        public String email;
        public String firstName;
        public String lastName;
        public String signature;
        
    }
    
    public Success success;
    
    public class Error{
        public String message;
        public String reason;
    }
    
    public Error error;
}
