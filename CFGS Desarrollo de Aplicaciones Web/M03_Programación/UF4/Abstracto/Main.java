package Abstracto;

public class Main {

	public static void main(String[] args) {
		Figura f[] = new Figura[5];
		
		f[0] = new Circulo(3, 4, 6);
		f[1] = new Rectangulo(3, 88);
		
		for(Figura fig:f) {
			if (fig != null) {
				if(fig instanceof Circulo) {
					System.out.println("El area del circulo es: " + fig.calcularArea());
				}
				
				else if (fig instanceof Rectangulo) { 
					System.out.println("El area del rectangulo es: " + fig.calcularArea());
				}
				
			}
		}
	}
}
