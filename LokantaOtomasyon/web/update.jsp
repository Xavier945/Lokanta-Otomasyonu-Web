<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
    if(request.getParameter("update")!=null)
    {
        String id = request.getParameter("id");
        String musteriadsoyad = request.getParameter("musteriadsoyad");
        String musteritc = request.getParameter("musteritc");
        String musteriyemek = request.getParameter("musteriyemek");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
        pst = con.prepareStatement("update musteriler set musteriadsoyad = ?,musteritc =?,musteriyemek= ? where id = ?");
        pst.setString(1, musteriadsoyad);
        pst.setString(2, musteritc);
        pst.setString(3, musteriyemek);
         pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
         <script>   
            alert("Musteri Guncellendi");           
       </script>
    <%             
    }
 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-grid.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-grid.rtl.min.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-utilities.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-utilities.min.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-utilities.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap-utilities.rtl.min.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.rtl.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.rtl.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Musteri Guncelle</h1>
    <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" autocomplete= "off" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from musteriler where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Musteri Adsoyad</label>
                        <input type="text" class="form-control" placeholder="Musteri Adsoyad" value="<%= rs.getString("musteriadsoyad")%>" name="musteriadsoyad" id="musteriadsoyad" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Musteri TC</label>
                        <input type="text" class="form-control" placeholder="Musteri TC" name="musteritc" value="<%= rs.getString("musteritc")%>" id="musteritc" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Musteri Yemek</label>
                        <input type="text" class="form-control" placeholder="Musteri Yemek" name="musteriyemek" id="musteriyemek" value="<%= rs.getString("musteriyemek")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="update" name="update" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="index.jsp">Geri Dön</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
</body>
</html>
