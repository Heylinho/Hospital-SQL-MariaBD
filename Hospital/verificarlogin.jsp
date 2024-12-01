<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guarulhos</title>
</head>

<body>
<%
    //cria variaveis e armazena as informações digitadas pelo usuário
    String vlogin = request.getParameter( "txtLogin" ) ;
    String vsenha = request.getParameter( "txtSenha" ) ;

    //variavel para acessar o banco de dados
    String database   = "hospital" ;
    String enderecoBD = "jdbc:mysql://localhost:3306/" + database ;
    String usuarioBD  = "root" ;
    String senhaBD    = "" ;


    //Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver ) ;    

    //Cria uma variavel para conexao com o banco de dados
    Connection conexao;

    //Abrir a conexao com o banco
    conexao = DriverManager.getConnection( enderecoBD, usuarioBD , senhaBD ) ;

    //comando para consultar no banco
    String sql = "SELECT * FROM tabelalogin WHERE email=? AND senha=?" ;

    //cria a variavel do tipo Statement
    PreparedStatement stm = conexao.prepareStatement( sql );

    stm.setString( 1 , vlogin ) ;    
    stm.setString( 2 , vsenha ) ;

    //cria a variavel do tipo ResultSet
    //para armazenar os dados que estão banco
    ResultSet dados  = stm.executeQuery() ;

    if( dados.next() ) {
        //LOGIN OK
        session.setAttribute("usuario" ,  dados.getString("nome") ) ;
        out.print("Login correto") ;
        response.sendRedirect("HospitalSite/index.html");
    }else{
        //LOGIN NÃO OK
        out.println("<html>");
            out.println("<head><title>Erro</title></head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('Login está INCORRETO!');");
            out.println("window.location.href = 'http://localhost:8080/Hospital/login.html';");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
    }

%>
    
</body>
</html>