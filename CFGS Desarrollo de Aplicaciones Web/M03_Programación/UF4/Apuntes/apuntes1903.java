import java.util.Scanner;

public class apuntes1903 {

	public static void main(String[] args) {
		apuntes1903 suma = new apuntes1903();
		suma.Suma1();
		suma.Suma2(0, 0);
		System.out.print(suma.Suma3());
		System.out.print(suma.Suma4(0, 0));
	}
	
	public void Suma1() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Entra dos numeros: ");
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		System.out.println(num1 + num2);
	}
	
	public void Suma2(int num1, int num2) {
		System.out.println(num1 + num2);
	}
	
	public int Suma3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Entra dos numeros: ");
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		return (num1 + num2);
	}
	
	public int Suma4(int num1, int num2) {
		return (num1 + num2);
	}
}
