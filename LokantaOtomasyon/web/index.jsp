
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
 
    if(request.getParameter("kaydet")!=null)
    {
        String musteriadsoyad = request.getParameter("musteriadsoyad");
        String musteritc = request.getParameter("musteritc");
        String musteriyemek = request.getParameter("musteriyemek");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
        pst = con.prepareStatement("insert into musteriler(musteriadsoyad,musteritc,musteriyemek)values(?,?,?)");
        pst.setString(1, musteriadsoyad);
        pst.setString(2, musteritc);
        pst.setString(3, musteriyemek);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Kayit Eklendi");     
    </script> 
    <%             
    }
   %>
   
   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Lokanta Otomasyonu</h1>
    </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" autocomplete="off" > 
                    
                    <div alight="left">
                        <label class="form-label">Musteri Adsoyad</label>
                        <input type="text" class="form-control" placeholder="Musteri Adsoyad" name="musteriadsoyad" id="musteriadsoyad" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Musteri TC</label>
                        <input type="text" class="form-control" placeholder="Musteri TC" name="musteritc" id="musteritc" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Musteri Yemek</label>
                        <input type="text" class="form-control" placeholder="Musteri Yemek" name="musteriyemek" id="musteriyemek" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="kaydet" name="kaydet" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-musteri" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Musteri Adsoyad</th>
                                    <th>Musteri TC</th>
                                    <th>Musteri Yemek</th>
                                    <th>Guncelle</th>
                                    <th>Sil</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
                                
                                  String query = "select * from musteriler";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("musteriadsoyad") %></td>
                                 <td><%=rs.getString("musteritc") %></td>
                                 <td><%=rs.getString("musteriyemek") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Guncelle</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Sil</a></td>
                             </tr> 
                                                                                        
                            
                                <%
                                 
                                 }
                               %>
                              <tr>
                                 <td> <a href="indexasci.jsp" class="btn btn-info">Asci Sayfasina Git</a></td>
                             </tr>
                     </table>    
                 </div>
 
            </div>  
        </div>
</body>
</html>
