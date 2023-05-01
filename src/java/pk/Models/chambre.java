/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk.Models;

/**
 *
 * @author HP
 */
public class chambre {
    private int idch;
    private String img,title;

    public chambre(int idch, String img, String title) {
        this.idch = idch;
        this.img = img;
        this.title = title;
    }

    public int getIdch() {
        return idch;
    }

    public void setIdch(int idch) {
        this.idch = idch;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
   
}
