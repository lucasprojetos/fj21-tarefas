<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de Tarefas</title>
</head>
<body>
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {
				'id' : id
			}, function(resposta) {
				$("#tarefa_" + id).html(resposta);
			});
		}
	</script>

	<a href="novaTarefa">Criar nova tarefa</a>
	Usuario atual:${usuarioLogado.login}
	<br />
	<br />

	<table border=4>
		<tr>
			<th>ID</th>
			<th>DESCRIÇÃO</th>
			<th>FINALIZADO?</th>
			<th>Data de finalização</th>
			<th>REMOVER</th>
			<th>ALTERAR</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq false }">
				<td><a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar</a></td>
				
				</c:if>
				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
						pattern="dd/MM/yyyy" /></td>

				<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>