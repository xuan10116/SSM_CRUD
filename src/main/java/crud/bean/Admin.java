package crud.bean;

import org.springframework.stereotype.Component;

@Component
public class Admin {
    private String aUsername;
    private String aPassword;

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }
}
