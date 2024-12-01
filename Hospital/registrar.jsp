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
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vnome  = request.getParameter("txtNome");
    String vidadeStr = request.getParameter("txtIdade"); // Considera idade como String antes de converter
    String vemail = request.getParameter("txtEmail");
    String vsenha = request.getParameter("txtSenha");

    // Verifica se alguma variável está vazia ou nula
    if (vnome == null || vnome.isEmpty() || vidadeStr == null || vidadeStr.isEmpty() || vemail == null || vemail.isEmpty() || vsenha == null || vsenha.isEmpty()) {
        // Se alguma variável estiver vazia, redireciona para a página de login
        response.sendRedirect("login.html");
    } else {
        try {
            // Convertendo a idade para inteiro
            int vidade = Integer.parseInt(vidadeStr);

            // Variáveis para acessar o banco de dados
            String database = "hospital"; 
            String endereco = "jdbc:mysql://localhost:3306/" + database; 
            String usuario  = "root"; 
            String senha    = "";

            // Driver
            String driver = "com.mysql.jdbc.Driver";

            // Carrega o driver na memória
            Class.forName(driver);

            // Cria a variável para conectar com o banco
            Connection conexao;

            // Abrir a conexão com o banco
            conexao = DriverManager.getConnection(endereco, usuario, senha);

            // Variável para o comando Insert do SQL
            String sql = "INSERT INTO tabelalogin (nome, idade, email, senha) values (?, ?, ?, ?)";

            // Cria a variável PreparedStatement para executar o SQL
            PreparedStatement stm = conexao.prepareStatement(sql);
            stm.setString(1, vnome);
            stm.setInt(2, vidade);
            stm.setString(3, vemail);
            stm.setString(4, vsenha);

            stm.execute();
            stm.close();

            response.sendRedirect("http://localhost:8080/Hospital/contaexistente.html");
        } catch (Exception e) {
            response.setContentType("text/html");
            out.println("<html>");
            out.println("<head><title>Erro</title></head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('Login incorreto');");
            out.println("window.location.href = 'http://localhost:8080/Hospital/login.html';");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
            e.printStackTrace();
        }
    }
%>
   
</body>
</html>