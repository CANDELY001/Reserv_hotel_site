/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk.dao;


import com.mysql.jdbc.Connection;

import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class MyUtile {

    public static Connection seConnecter() throws Exception {
        String url = "jdbc:mysql://localhost:3306/Pfe";
        String user = "root";
        String mdp = "12345678";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver charger avec succes");
            Connection con = (Connection) DriverManager.getConnection(url, user, mdp);
            System.out.println("connexion etablir avec succes");
            return con;
        } catch (Exception e) {
            throw new Exception("une erreur est survenue: " + e.getMessage());
        }

}}
