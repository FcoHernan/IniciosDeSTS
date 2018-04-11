<%@ page import="cl.test.db.DataBaseHelper"%>
<%
	String isbn= request.getParameter("isbn");
	String titulo= request.getParameter("titulo");
	String categoria= request.getParameter("categoria");
	//realizo la consulta usando el DBHelper y el codigo queda simplificado
	String consultaSQL= "insert into Libros (isbn,titulo,categoria) values ";
	consultaSQL+= "('" +isbn+ "','" +titulo + "','" +categoria+"')";
	DataBaseHelper db= new DataBaseHelper();
	int filas=db.modificarRegistro(consultaSQL);
	response.sendRedirect("MostrarLibros.jsp");
%>