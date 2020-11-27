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
public class SignatureResponse {
    
    public class Success {
        public String signature;
    }
    
    public Success success;
    
    public class Error{
        public String message;
        public String reason;
    }
    
    public Error error;
}
