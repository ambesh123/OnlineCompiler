import java.io.*;
import java.util.Scanner;

class jrunner{
	public static void main(String[] args) 
    { 
        try
        { 
            ProcessBuilder pb = new ProcessBuilder("C:\\cpfiles\\a.exe");
            pb.redirectErrorStream(true);
            Process process = pb.start(); 
            
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()));
            Scanner sc = new Scanner(new File("C:\\cpfiles\\in.txt"));

            while(sc.hasNextLine()){
                bw.write(sc.nextLine());
                bw.newLine();
            }

            bw.flush();
            bw.close();
            sc.close();

           sc = new Scanner(process.getInputStream());
           while(sc.hasNextLine()){
                System.out.println(sc.nextLine());
            }
            sc.close();
            process.destroy();
        } 
        catch (Exception e) 
        { 
            System.out.println("HEY Buddy ! U r Doing Something Wrong "); 
            e.printStackTrace(); 
        } 
    } 
}