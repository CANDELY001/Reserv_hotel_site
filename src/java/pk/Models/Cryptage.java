/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk.Models;

/**
 *
 * @author HP
 */
public class Cryptage {
  
public static  String encrypt(String password){
    String crypt="";
    for(int i=0;i<password.length();i++){
    
    int c=password.charAt(i)^48;
    crypt=crypt+(char)c;
    }
    return crypt;
   
}
public static String decrypt(String password){
        String aCrypter="";
        for (int i=0; i<password.length();i++)  {
            int c=password.charAt(i)^48; 
            aCrypter=aCrypter+(char)c;
        }
        return aCrypter;
    }

public static void main (String args[]){
    System.out.println("Crypter : 123456="+encrypt("samir"));
}
}

