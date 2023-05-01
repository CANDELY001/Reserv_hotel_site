/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk.Models;

/**
 *
 * @author HP
 */
public class Visiteur {
    private String pseudo,email,mdp,etate;

    public Visiteur(String pseudo, String email, String mdp,String etate) {
        this.pseudo = pseudo;
        this.email = email;
        this.mdp = mdp;
          this.etate = etate;
    }

    public String getEtate() {
        return etate;
    }

    public void setEtate(String etate) {
        this.etate = etate;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
    
}
