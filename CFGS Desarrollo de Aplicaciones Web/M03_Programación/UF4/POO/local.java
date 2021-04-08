package POO;

public class local extends inmuebles {
	private int numeroVentanas;

	public local() {
		super();
	}

	public local(String direccion, int anios, int metros, float precio, boolean estado, int numeroVentanas) {
		super(direccion, anios, metros, precio, estado);
		setNumeroVentanas(numeroVentanas);
	}

	public int getNumeroVentanas() {
		return numeroVentanas;
	}

	public void setNumeroVentanas(int numeroVentanas) {
		if (numeroVentanas < 0) {
			numeroVentanas = 0;
		}
		this.numeroVentanas = numeroVentanas;
	}

	@Override
	public String toString() {
		return "local [numeroVentanas=" + numeroVentanas + "]";
	}
	
	@Override
	public void calcularPrecio() {
		super.calcularPrecio();
		if (getMetros() >= 50) {
			setPrecio(getPrecio()*1.01f);
		} 
		if (this.numeroVentanas <= 1) {
			setPrecio(getPrecio()*0.98f);
		}
		else if (this.numeroVentanas > 4) {
			setPrecio(getPrecio()*1.02f);
	}
	
	}
}