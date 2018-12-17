import java.util.Scanner;
class jcompiler{
	public static void main(String[] args) 
    { 
        try
        { 
           Process process = Runtime.getRuntime().exec("C:\\MinGW\\bin\\g++.exe sol.cpp"); 
           Scanner sc = new Scanner(process.getErrorStream());
           while(sc.hasNextLine()){
                System.out.println(sc.nextLine() + "<br>");
            }
  
        } 
        catch (Exception e) 
        { 
            System.out.println("HEY Buddy ! U r Doing Something Wrong "); 
            e.printStackTrace(); 
        } 
    } 
}