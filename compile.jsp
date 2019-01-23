<%@ page import = "java.io.*" %>
<%@ page import = "java.util.Scanner" %>
<%@ page import = "java.io.FileWriter" %>
<%
  String lang = request.getParameter("lang");
	String code = request.getParameter("code");
    String input = request.getParameter("input");
	File file;
  if(lang.equals("c") || lang.equals("c++"))file = new File("C:\\cpfiles\\sol.cpp");
  else
  if(lang.equals("java"))file = new File("C:\\cpfiles\\sol.java");
  else file = new File("");

	FileWriter fr = null;
    Scanner sc;
    Process process;
        try{    //Writing code and input to their respective files
            fr = new FileWriter(file,false);
            fr.write(code);
            file = new File("C:\\cpfiles\\in.txt");
            fr.close();
            fr = new FileWriter(file,false);
            fr.write(input);
            fr.close();
            
        } catch (Exception e) {
        		out.println(e.toString()+"<br>");
    		}
    		finally{
    		try{fr.close();}
    		catch(Exception e){}
    	}
      if(lang.equals("c") || lang.equals("c++")){
        	try{
                Runtime r = Runtime.getRuntime();
                   process = r.exec("cmd /c cd C:\\cpfiles\\ && g++ sol.cpp");  //compile
                   sc = new Scanner(process.getErrorStream());
                   if(sc.hasNextLine()){
                      out.println("<font color = \"red\"><h1>Compilation Error :( </h1></font>");
                    }
                    else{
                      out.println("<font color = \"green\"><h1>Successfully Compiled :) </h1></font>");
                    }
                   while(sc.hasNextLine()){
                    out.println(sc.nextLine() + "<br>");
                   }
                   process.waitFor();
                   Thread.sleep(3000);
                   process.destroy();
                   process = r.exec("cmd /c cd C:\\cpfiles\\ && a <in.txt> out.txt");   //run
                   sc = new Scanner(process.getErrorStream());
                   while(sc.hasNextLine()){
                    out.println(sc.nextLine() + "<br>");
                   }
                   process.waitFor();
                   Thread.sleep(2000);
                   process.destroy();
        	}
        	catch(Exception e){
            		out.println(e.toString()+"<br>"); 		
        	}
        }
      else if(lang.equals("java")){
        try{
                Runtime r = Runtime.getRuntime();
                   process = r.exec("cmd /c cd C:\\cpfiles\\ && javac sol.java");  //compile
                   sc = new Scanner(process.getErrorStream());
                   if(sc.hasNextLine()){
                      out.println("<font color = \"red\"><h1>Compilation Error :( </h1></font>");
                    }
                    else{
                      out.println("<font color = \"green\"><h1>Successfully Compiled :) </h1></font>");
                    }
                   while(sc.hasNextLine()){
                    out.println(sc.nextLine() + "<br>");
                   }
                   process.waitFor();
                   Thread.sleep(3000);
                   process.destroy();
                   process = r.exec("cmd /c cd C:\\cpfiles\\ && java sol <in.txt> out.txt");
                   sc = new Scanner(process.getErrorStream());
                   while(sc.hasNextLine()){
                    out.println(sc.nextLine() + "<br>");
                   }
                  sc.close();

                  
                   process.waitFor();
                   Thread.sleep(1000);
                   process.destroy();
          }
          catch(Exception e){
                out.println(e.toString()+"<br>");     
          }
      }


    	out.println("<center><h2>Output : <br>");
        file = new File("C:\\cpfiles\\out.txt");
        sc = new Scanner(file);
        while(sc.hasNextLine()){
            out.println(sc.nextLine() + "<br>");
        }
        out.println("</h2></center>");
%>