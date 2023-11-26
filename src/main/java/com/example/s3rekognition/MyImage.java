package com.example.s3rekognition;

import java.io.Serializable;
import java.util.List;

public class MyImage implements Serializable{
    
    private String name;
    private int numberOfFamousPeople;
    private List<FamousPerson> famousPersons;
    

    public MyImage(String name, int numberOfFamousPeople, List<FamousPerson> famousPersons) {
        this.name = name;
        this.numberOfFamousPeople = numberOfFamousPeople;
        this.famousPersons = famousPersons;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public int isAreThereFamousPeople() {
        return numberOfFamousPeople;
    }
    
    public void setAreThereFamousPeople(int areThereFamousPeople) {
        this.numberOfFamousPeople = areThereFamousPeople;
    }

    public List<FamousPerson> getFamousPersons() {
        return famousPersons;
    }

    public void setFamousPersons(List<FamousPerson> famousPersons) {
        this.famousPersons = famousPersons;
    }
    
    
    
    
    
}
