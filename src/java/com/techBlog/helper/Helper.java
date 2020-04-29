package com.techBlog.helper;



import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    public static boolean deleteFile(String path)
   {
        boolean f=false;
        try {
            //create or select file path
            File file=new File(path);
            //delete file 
            file.delete();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public static boolean saveFile(InputStream ins , String path)
    {
        boolean f=false;
        try {
            byte b[]=new byte[ins.available()];
            ins.read(b);//InpStream is read file and put it in b[] array 
            //fos write file in given path
            FileOutputStream fos=new FileOutputStream(path,true);
            fos.write(b); //fos write new file which in (b) to the specified path 
            fos.flush();
            fos.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
