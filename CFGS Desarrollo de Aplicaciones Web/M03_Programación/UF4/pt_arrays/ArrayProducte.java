package pt_arrays;

import java.util.ArrayList;
import java.util.Scanner;

public class ArrayProducte {

	ArrayList<Producto> a = new ArrayList<Producto>();
	Scanner s = new Scanner(System.in);
	
	public void agregar() {
		Producto p = new Producto();
		System.out.println("codigo: ");
		p.setCodigo(s.nextInt());
		s.nextLine();
		System.out.println("nombre: ");
		p.setNombre(s.nextLine());
		System.out.println("tipus: ");
		p.setTipus(s.nextLine());
		System.out.println("preu: ");
		p.setPreu(s.nextDouble());
		System.out.println("stock: ");
		p.setStock(s.nextInt());
		s.nextLine();
		a.add(p);
	}
	
	public void agregar(int codi) {
		Producto p = new Producto();
		p.setCodigo(codi);
		if (buscarCod(codi)) {
		System.out.println("nombre: ");
		p.setNombre(s.nextLine());
		System.out.println("tipus: ");
		p.setTipus(s.nextLine());
		System.out.println("preu: ");
		p.setPreu(s.nextDouble());
		System.out.println("stock: ");
		p.setStock(s.nextInt());
		s.nextLine();
		a.add(p);
		}
	}
	
	public void eliminar() {
		System.out.println("codigo a borrar: ");
		int cod=s.nextInt();
		s.nextLine();
		for (Producto prod:a) {
			if (prod.getCodigo()==cod) {
				a.remove(prod);
				break;
			}
		}
	}
	public Producto obtenir() {
		System.out.println("nombre a obtenir: ");
		String nom=s.nextLine();
		for (Producto prod:a) {
			if (prod.getNombre().equalsIgnoreCase(nom)) {
				return prod;
			}
		}
		return null;
	}
	public boolean buscar() {
		System.out.println("nombre a buscar: ");
		String nom=s.nextLine();
		for (Producto prod:a) {
			if (prod.getNombre().compareToIgnoreCase(nom)==0) {
				return true;
			}
		}
		return false;
	}
	public boolean buscarCod(int cod) {
		for (Producto prod:a) {
			if (prod.getCodigo()==cod) {
				return true;
			}
		}
		return false;
	}
	
	public int grandaria() {
		return a.size();
	}
	
	public void aumentarPreuOficina() {
		for (Producto item : a) {
			if (item.getTipus().equalsIgnoreCase("Oficina")) {
				item.setPreu(item.getPreu() * 1.1f);
			}
		}
	}
}