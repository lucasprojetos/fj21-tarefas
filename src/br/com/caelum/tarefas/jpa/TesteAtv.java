package br.com.caelum.tarefas.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.caelum.tarefas.modelo.Tarefa;

public class TesteAtv {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();
		
		//Tarefa encontrada = manager.find(Tarefa.class, 5L);
		Tarefa t = new Tarefa();
		t.setId(1L);
		t.setDescricao("T1");
		manager.getTransaction().begin();
		t = manager.merge(t);
		t.setDescricao("T2");
		manager.getTransaction().commit();
		System.out.println(t.getDescricao());
		
		

	}

}
