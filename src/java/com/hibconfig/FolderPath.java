package com.hibconfig;
// Generated Jul 12, 2016 10:03:55 AM by Hibernate Tools 4.3.1



/**
 * FolderPath generated by hbm2java
 */
public class FolderPath  implements java.io.Serializable {


     private Integer id;
     private String path;

    public FolderPath() {
    }

    public FolderPath(String path) {
       this.path = path;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getPath() {
        return this.path;
    }
    
    public void setPath(String path) {
        this.path = path;
    }




}

