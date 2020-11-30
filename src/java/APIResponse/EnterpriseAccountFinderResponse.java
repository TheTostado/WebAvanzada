/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package APIResponse;

import java.util.List;

/**
 *
 * @author Alrik
 */
public class EnterpriseAccountFinderResponse {
    
    public class Success {
        public List<EAFAccount> accounts;
    }
    
    public Success success;
    
    public class Error{
        public String message;
        public String reason;
    }
    
    public Error error;
}
