<%@ page import="cl.test.db.Libro"%>
<%
	String isbn= request.getParameter("isbn");
	String titulo= request.getParameter("titulo");
	String categoria= request.getParameter("categoria");
	//realizo la consulta usando el DBHelper y el codigo queda simplificado
	Libro libro= new Libro(isbn,titulo,categoria);
	libro.insertar();
	response.sendRedirect("MostrarLibros.jsp");
%>