package com.example.s3rekognition;

import java.io.Serializable;
import java.util.List;

public class FamousPerson implements Serializable{
    
    private String name;
    private List<String> links;
    
    public FamousPerson(String name, List<String> links) {
        this.name = name;
        this.links = links;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public List<String> getLinks(){
        return links;
    }
    
    public void setLinks(List<String> links){
        this.links = links;
    }
    
    
    
}
