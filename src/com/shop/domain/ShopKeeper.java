package com.shop.domain;

/**
 * @author joctas059
 * @create 2022/12/28
 */
public class ShopKeeper {
    private int keeperId;
    private String account;
    private String password;
    private String tel;
    private String email;

    public void setKeeperId(int keeperId) {
        this.keeperId = keeperId;
    }
    public int getKeeperId() {
        return keeperId;
    }

    public void setAccount(String account) {
        this.account = account;
    }
    public String getAccount() {
        return account;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return password;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getTel() {
        return tel;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "keeper [userId="+keeperId+",account="+account+",password="+password+",tel="+tel+",email="+email+"]";
    }
}
