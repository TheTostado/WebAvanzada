/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import APIRequest.LoginRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import com.google.gson.Gson;
import org.apache.commons.io.IOUtils;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;

/**
 *
 * @author Alrik
 */
public class httpAPIRequest <T>{
    private String endpoint = "https://example-ema-api.herokuapp.com";
    
    public T POST (String url, StringEntity body, boolean Ajson, Class<T> classOfT) throws Exception{
        HttpClient httpClient = HttpClientBuilder.create().build();
        Gson gson = new Gson();
        
            HttpPost request = new HttpPost(this.endpoint+url);
            if(Ajson == true)
            request.addHeader("content-type", "application/json");
            request.setEntity(body);
            HttpResponse response = httpClient.execute(request);
            String Stringbody = IOUtils.toString(response.getEntity().getContent());
            return gson.fromJson(Stringbody, classOfT);
    }
    
    public T GET (String url, boolean Ajson, Class<T> classOfT) throws Exception{
        HttpClient httpClient = HttpClientBuilder.create().build();
        Gson gson = new Gson();
        
            HttpGet request = new HttpGet(this.endpoint+url);
            if(Ajson == true)
            request.addHeader("content-type", "application/json");
            HttpResponse response = httpClient.execute(request);
            String Stringbody = IOUtils.toString(response.getEntity().getContent());
            return gson.fromJson(Stringbody, classOfT);
    }
    
    public T PUT (String url, StringEntity body, boolean Ajson, Class<T> classOfT) throws Exception{
        HttpClient httpClient = HttpClientBuilder.create().build();
        Gson gson = new Gson();
        
            HttpPut request = new HttpPut(this.endpoint+url);
            if(Ajson == true)
            request.addHeader("content-type", "application/json");
            request.setEntity(body);
            HttpResponse response = httpClient.execute(request);
            String Stringbody = IOUtils.toString(response.getEntity().getContent());
            return gson.fromJson(Stringbody, classOfT);
    }
    
    public T DELETE (String url, boolean Ajson, Class<T> classOfT) throws Exception{
        HttpClient httpClient = HttpClientBuilder.create().build();
        Gson gson = new Gson();
        
            HttpDelete request = new HttpDelete(this.endpoint+url);
            if(Ajson == true)
            request.addHeader("content-type", "application/json");
            HttpResponse response = httpClient.execute(request);
            String Stringbody = IOUtils.toString(response.getEntity().getContent());
            return gson.fromJson(Stringbody, classOfT);
    }
    
}//fin de class
