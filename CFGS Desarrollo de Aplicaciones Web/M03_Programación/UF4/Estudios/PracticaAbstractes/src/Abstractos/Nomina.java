package Abstractos;

import java.util.Arrays;

public class Nomina {
	private Empleat v [] = new Empleat [10];
	
	// Constructor
	
	public Nomina () {};
	
	// Getters y Setters
	
	public Empleat[] getV() {
		return v;
	}

	public void setV(Empleat[] v) {
		this.v = v;
	}

	// Métodes

	public void insereixEmpleat (Empleat empleat) {
		int counter = 0;
		for (Empleat emp:v) {
			if (emp instanceof Empleat| emp instanceof Caixer | emp instanceof Neteja ) {
				counter++;
			}
			
		}
		
		if (counter < 10) {
			v[counter] = empleat;
		}
		else {
			System.out.println("No se pueden introducir mas empleados.");
		}
	}
	
	public void eliminaNeteja () {
		Empleat x [] = new Empleat [10];
		int counter = 0;
		for (Empleat empleat:v) {
			if (!(empleat instanceof Neteja)) {
				x[counter] = empleat;
				counter++;
			}
		}
		v = x;
	}
	
	public int quantsCornella() {
		int counter = 0;
		for(Empleat empleat:v) {
			if (empleat != null) {
				if (empleat.getCiutatOrigen().equals("Cornella") ) {
					counter++;
				}
			}
		}
		return counter;
	}
	
	public float costNomina() {
		float salari = 0;
		for(Empleat empleat:v) {
			if (empleat != null) {
				salari += empleat.salariDiari();
			}
		}
		return salari;
	}
	
	public int quantitatCaixers() {
		int counter = 0;
		for (Empleat empleat:v) {
			if (empleat instanceof Caixer) {
				counter++;
			}
		}
		return counter;
	} 
	
	public float souPromig() {
		float salari = 0;
		int counter = 0;
		for(Empleat empleat:v) {
			if (empleat != null) {
				salari += empleat.salariDiari();
				counter ++;
			}
		}
		return (salari/counter);
	}

	@Override
	public String toString() {
		return "Nomina [v=" + Arrays.toString(v) + "]";
	}
	
}
