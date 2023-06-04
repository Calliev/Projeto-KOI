<%@page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	<!--Vai recupera as info dos usuários no puxando do banco de dados-->
    String nome 	= request.getParameter("reg_nome") + " " + request.getParameter("reg_snome");
    String sexo 	= request.getParameter("reg_sexo");
    String data 	= request.getParameter("reg_data");
    String cpf 		= request.getParameter("reg_cpf");
    String endereco = request.getParameter("reg_rua") + "-" + request.getParameter("reg_cidade") + "-" + 
                        request.getParameter("reg_estado") + "-" + request.getParameter("reg_cep");
    String email 	= request.getParameter("reg_email");
    String telefone = request.getParameter("reg_fone");
    String senha 	= request.getParameter("reg_password");

    <!--Vai recupera as info dos motora no puxando do banco de dados-->
    String cnh = request.getParameter("reg_cnh");
    String placa = request.getParameter("reg_placa");
    String modelo = request.getParameter("reg_modelo");
    String marca = request.getParameter("reg_marca");
    String cor = request.getParameter("reg_cor");

    <!-- Vai conecta no banco de dados -->
    String db   	= "dbouber";
	String user 	= "root";
	String password	= "";
	String url     	= "jdbc:mysql://localhost:3306/" + db;
	String driver  	= "com.mysql.jdbc.Driver";

	<!--Vai colocar as coisas do usuario no banco de dados -->
	String usuario 		= "INSERT INTO usuario(CPF, NOME, SEXO, ENDERECO, EMAIL, TELEFONE, SENHA, DATA_NASCIMENTO, MOTORISTA) VALUES ('" + cpf + "', '" + nome + "', '" + sexo + "', '" + endereco + "', '" + email + "', '" + telefone + "', '" + senha + "', '" + data + "', 1)";
	String carro 		= "INSERT INTO carro(PLACA, MODELO, MARCA, COR) VALUES ('" + placa + "', '" + modelo + "', '" + marca + "', '" + cor + "')";<!--Vai colocar as coisas do carro -->
	String motorista	= "INSERT INTO motorista(CNH, AVALIACOES, VIAGENS_CONCLUIDAS, PLACA_CARRO, CPF_USUARIO) VALUES ('" + cnh + "', '0', '0', '" + placa + "', '" + cpf + "')";<!--Vai colocar as coisas do motora no banco de dados -->

	Class.forName(driver);

	<!-- Vai conecta no banco de dados -->
	Connection _conexão;
	_conexão = DriverManager.getConnection(url, user, password);
	Statement stm = _conexão.createStatement();

	<!-- Aqui vai ser a parte que ele vai dar o comando pra colocar no bds -->
	try {
		stm.executeUpdate(usuario);
		stm.executeUpdate(carro);
		stm.executeUpdate(motorista);
	} catch(Exception ex) {
		out.println(ex);
	} finally {
		_conexão.close();
		stm.close();
	}

	response.sendRedirect("../login.html");

%>