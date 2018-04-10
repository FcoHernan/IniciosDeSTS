<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
	//1 Lee la información que proviene de FormularioInsertarLibro.html 
	// usando el objeto request de JSP.
	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String categoria = request.getParameter("categoria");
	Connection conexion = null;
	Statement sentencia = null;
	
	int filas=0;
	try {
		//2 Crea un objeto de tipo Connection(conexión) y un objeto de tipo Statement (sentencia)
		Class.forName("com.mysql.jdbc.Driver");
		conexion = DriverManager.getConnection("jdbc:mysql://localhost/arquitecturajava","root","");
		sentencia = conexion.createStatement();
		//3 Crea una consulta SQL de inserción con los datos del libro
		String consultaSQL = "insert into Libros (isbn,titulo,categoria) values ";
		consultaSQL += "('" + isbn + "','" + titulo + "','" + categoria + "')";
		//4 ejecuta SQL
		filas = sentencia.executeUpdate(consultaSQL);
		response.sendRedirect("MostrarLibros.jsp");
	} catch (ClassNotFoundException e) {
		System.out.println("Error en la carga del driver" + e.getMessage());
	} catch (SQLException e) {
		System.out.println("Error accediendo a la base de datos" + e.getMessage());
	} finally {
		//5 Cierra recursos
		if (sentencia != null) {
			try {
				sentencia.close();
			}
			catch (SQLException e){
				System.out.println("Error cerrando la sentencia" + e.getMessage());
			}
		}
		if (conexion != null) {
			try {
				conexion.close();
			}
			catch (SQLException e){
				System.out.println("Error cerrando la conexion" + e.getMessage());
				}
		}
	}
%>