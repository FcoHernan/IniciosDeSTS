<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%-- <%@ page import="cl.test.db.DataBaseHelper"%> --%>
<%@ page import="cl.test.db.Libro"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="cl.test.db.DataBaseHelper"%>
<body>
<%
	List<Libro> listaDeLibros=null;
	listaDeLibros=Libro.buscarTodos();
	for(Libro libro:listaDeLibros){ %>
		<%=libro.getIsbn()%>
		<%=libro.getTitulo()%>
		<%=libro.getCategoria()%>
		<br/>
	<% }	
%>

	<select name="categoria">
					<option value="seleccionar">seleccionar</option>
					<%
					ResultSet sr=null;
					try {
						String newConsultaSQL = "select distinct(categoria) from Libros";
						DataBaseHelper newHelper = new DataBaseHelper();
						sr=newHelper.seleccionarRegistros(newConsultaSQL);
					while(sr.next()) { 
					%>
					<option id="categoria" value="<%=sr.getString("categoria")%>">
					<%=sr.getString("categoria")%></option>
					<% }%>
				</select>
				<br/>
				<%
				}
				catch (SQLException e) {
					System.out.println("Error accediendo a la base de datos"
					+ e.getMessage());
				} finally {
					if (sr != null) {
						try {
							sr.close();
						} 
						catch (SQLException e) {
							System.out.println("Error cerrando el resultset" + e.getMessage());
						}
					}
				}
				%>
	<br/>
			
	<a href="FormularioInsertarLibro.jsp">Insertar Libro</a>
</body>