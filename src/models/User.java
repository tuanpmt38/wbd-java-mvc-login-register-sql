package models;

public class User {
    private String firtname;
    private String lastname;
    private String username;
    private String password;

    public User(){}
    public User(String firtname, String lastname, String username, String password){
        this.firtname = firtname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
    }

    public String getFirtname() {
        return firtname;
    }

    public void setFirtname(String firtname) {
        this.firtname = firtname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
