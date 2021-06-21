<%@page import="java.sql.*" %> 
 
 
<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","1234");
        pst = con.prepareStatement("delete from musteriler where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        <div align="right">          
                             <p><a href="index.jsp">Geri Dön</a></p>
                         </div>
        <script>
            
            alert("Musteri Silindi");
            
       </script>
