package model;


public class Admin {
    private static String userEmail, username, email, password;
    
    public Admin(String uEmail, String pWord) { //for login
        userEmail = uEmail;
        password = pWord;
    }

    public Admin(String user, String email, String pWord) {
        username = user;
        this.email = email;
        password = pWord;
    }

    public void setDetails(String user, String email, String pWord) {
        username = user;
        this.email = email;
        password = pWord;
    }
    
    public String getUEmail(){
        return userEmail;
    }

    public String getUsername() {
        return username;
    }
    
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

}
