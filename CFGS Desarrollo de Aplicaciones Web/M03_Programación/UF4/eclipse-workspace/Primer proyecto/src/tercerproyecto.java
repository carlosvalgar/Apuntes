
public class tercerproyecto {

	public static void main(String[] args) {
		// CONDICIONAL cond? que harà si es verdadero: que hara si es falso
		int num = -1;
		System.out.println(num>=0?"Es positivo":"Es negativo");
		int num2 = 81;
		System.out.println(num2%2==0?"Es par":"Es impar");
		float num3 = 87.34f;
		float num4 = 0;
		num4 = num3 <= 100 ? 25 : 50;
		// Tenemos que usar print f o usar la funcion format()
		// %d => int, %c => char, %s => String, %f => float
		System.out.printf("num4= %.2f num3= %.3f num2= %d",num4, num3, num2);
		System.out.println(String.format("\nnum4= %.2f num3= %.3f num2= %d",num4, num3, num2));
		// i++ prioridad secundaria i y despues suma, ++i es al reves la suma tiene la prioridad
		int i = 9;
		System.out.println(i++);
		System.out.println(i);
		System.out.println(++i);
		System.out.println(i);
	}

}
