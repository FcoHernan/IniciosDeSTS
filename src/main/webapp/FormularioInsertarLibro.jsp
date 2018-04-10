<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<title>Formulario Libro</title>
	<link rel="stylesheet" type="text/css" href="css/formato.css" />
	<script type="text/javascript" src="js/validacion.js" ></script>
</head>
<body>		
	<form id="miformulario" action="InsertarLibro.jsp" onsubmit="return validacion();" >
		<fieldset>
			<legend>Formulario alta libro</legend>
			<p>
				<label for="isbn">ISBN:</label>
				<input id="isbn" type="text" name="isbn"/>
			</p>
			<p>
				<label for="titulo">Titulo:</label>
				<input id="titulo" type="text" name= "titulo"/>
			</p>
			<p>
				<label for="categoria">Categoria :</label>
				<input id="categoria" type="text" name="categoria"/>
			</p>
			<p>
				<input type="submit" value="Insertar" />
			</p>
		</fieldset>
	</form>
</body>
</html>