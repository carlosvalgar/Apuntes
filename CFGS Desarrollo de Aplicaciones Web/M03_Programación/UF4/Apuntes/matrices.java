import java.util.Scanner;

public class matrices {

	public static void main(String[] args) {
		Scanner lector = new Scanner(System.in);
		int [][] matrizNum = new int [3][4]; // Se puede declarar como new int [3][] ya que podemos hacer que cada fila tenga una cantidad diferente de columnas
		int matrizNum2 [][] = {{ 1,   2,  3},
							   {11,  12, 13},	
							   {11, -12, 13}};
		
		for (int i = 0; i < matrizNum2.length; i++) {
			for (int j = 0; j < matrizNum2[i].length; j++) {
				System.out.print(matrizNum2[i][j] + "\t");
			}
			System.out.println();
		}
		
		for (int i = 0; i < matrizNum.length; i++) {
			for (int j = 0; j < matrizNum[i].length; j++) {
				System.out.print("MatriNum[" + i + "][" + j + "]: ");
				matrizNum[i][j] = lector.nextInt();
			}
		}
		
		for (int i = 0; i < matrizNum.length; i++) {
			for (int j = 0; j < matrizNum[i].length; j++) {
				System.out.print(matrizNum[i][j] + "\t");
			}
			System.out.println();
		}
		
	}

}
