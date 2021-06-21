<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
 
    if(request.getParameter("kaydet")!=null)
    {
        String asciadsoyad = request.getParameter("asciadsoyad");
        String ascitc = request.getParameter("ascitc");
        String ascimaas = request.getParameter("ascimaas");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
        pst = con.prepareStatement("insert into ascilar(asciadsoyad,ascitc,ascimaas)values(?,?,?)");
        pst.setString(1, asciadsoyad);
        pst.setString(2, ascitc);
        pst.setString(3, ascimaas);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Asci Kayit Eklendi");     
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
                        <label class="form-label">Asci Adsoyad</label>
                        <input type="text" class="form-control" placeholder="Asci Adsoyad" name="asciadsoyad" id="asciadsoyad" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Asci TC</label>
                        <input type="text" class="form-control" placeholder="Asci TC" name="ascitc" id="ascitc" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Asci Maas</label>
                        <input type="text" class="form-control" placeholder="Asci Maas" name="ascimaas" id="ascimaas" required >
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
                                    <th>Asci Adsoyad</th>
                                    <th>Asci TC</th>
                                    <th>Asci Maas</th>
                                    <th>Guncelle</th>
                                    <th>Sil</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
                                
                                  String query = "select * from ascilar";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("asciadsoyad") %></td>
                                 <td><%=rs.getString("ascitc") %></td>
                                 <td><%=rs.getString("ascimaas") %></td>
                                 <td><a href="updateasci.jsp?id=<%=id%>">Guncelle</a></td>
                                 <td><a href="deleteasci.jsp?id=<%=id%>">Sil</a></td>
                             </tr> 
                                                                                        
                            
                                <%
                                 
                                 }
                               %>
                              <tr>
                                 
                                 <td> <a href="index.jsp" class="btn btn-info">Musteri Sayfasına Git</a></td>
                             </tr>
                     </table>    
                 </div>
 
            </div>  
        </div>
</body>
</html>

