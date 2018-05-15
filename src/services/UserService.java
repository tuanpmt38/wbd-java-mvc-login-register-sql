package services;

import models.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    public String authorizetion (User user){
        String username = user.getUsername();
        String password = user.getPassword();

        String dbusername = "";
        String dbpassword = "";

        try{
            Connection conn = ConnectionUtils.connect();
            PreparedStatement statement = null;
            String sql;
            sql = "SELECT * FROM `users` WHERE `username`=? and `password`=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                dbusername = rs.getString("username");
                dbpassword = rs.getString("password");
                if(username.equals(dbusername)&password.equals(dbpassword)){
                    return "SUCCESS LOGIN";
                }
            }
            statement.cancel();
            conn.close();
        }catch ( SQLException e){
            e.printStackTrace();
        }
        return "WRONG USERNAME AND PASSWORD";
    }

    public String authorizeRegister (User user){
        String firstname = user.getFirtname();
        String lastname = user.getLastname();
        String username = user.getUsername();
        String password = user.getPassword();
        try{
            Connection conn = ConnectionUtils.connect();
            PreparedStatement statement = null;
            String sql;
            sql = "INSERT INTO `users`(`firt_name`,`last_name`,`username`,`password`) VALUES(?, ?, ?, md5(?))";
            statement = conn.prepareStatement(sql);
            statement.setString(1,firstname);
            statement.setString(2,lastname);
            statement.setString(3,username);
            statement.setString(4,encodeMD5(password));
            statement.executeUpdate();
            statement.cancel();
            conn.close();
            return "SUCCESS REGISTER";
        }catch ( SQLException e){
            e.printStackTrace();
        }
        return "FAIL REGISTER";
    }

    public String encodeMD5(String password) {
        StringBuffer sb = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());

            byte byteData[] = md.digest();

            sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
        } catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
