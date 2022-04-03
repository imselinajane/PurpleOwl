package model;

import java.util.*;


public class Order {
    
    private static int userid, headcount;
    private static List<String> addOns = new ArrayList<String>();
    private static String name = "", occasion = "", contact = "", packages = "", food = "", venue = "",
            requests = "", theme = "", gdrive = "", quotes1 = "", quotes2 = "";
    private static Date date;

    public Order(int userid, String name, Date date, String occasion, int headcount, String contact, String packages,
            String food, String venue, List<String> addOns, String requests, String theme, String gdrive, String quotes1,
            String quotes2) {
        this.userid = userid;
        this.name = name;
        this.date = date;
        this.occasion = occasion;
        this.headcount = headcount;
        this.contact = contact;
        this.packages = packages;
        this.food = food;
        this.venue = venue;
        this.addOns = addOns;
        this.requests = requests;
        this.theme = theme;
        this.gdrive = gdrive;
        this.quotes1 = quotes1;
        this.quotes2 = quotes2;
    }

    public void setDetails(int userid, String name, Date date, String occasion, int headcount, String contact, String packages,
            String food, String venue, List<String> addOns, String requests, String theme, String gdrive, String quotes1,
            String quotes2) {
        this.userid = userid;
        this.name = name;
        this.date = date;
        this.occasion = occasion;
        this.headcount = headcount;
        this.contact = contact;
        this.packages = packages;
        this.food = food;
        this.venue = venue;
        this.addOns = addOns;
        this.requests = requests;
        this.theme = theme;
        this.gdrive = gdrive;
        this.quotes1 = quotes1;
        this.quotes2 = quotes2;
    }
    
    public int getUserID(){
        return userid;
    }
    
    public String getName(){
        return name;
    }
    
    public Date getDate(){
        return date;
    }
    
    public String getOccasion(){
        return occasion;
    }
    
    public int getHeadcount(){
        return headcount;
    }
    
    public String getContact(){
        return contact;
    }
    
    public String getPackage(){
        return packages;
    }
    
    public String getFood(){
        return food;
    }
    
    public String getVenue(){
        return venue;
    }
    
    public List<String> getAddOns(){
        return addOns;
    }
    
    public String getRequests(){
        return requests;
    }
    
    public String getTheme(){
        return theme;
    }
    
    public String getURL(){
        return gdrive;
    }
    
    public String getFirstQuote(){
        return quotes1;
    }
    
    public String getSecondQuote(){
        return quotes2;
    }
}
