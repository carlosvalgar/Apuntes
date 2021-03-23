
public class EjercicioNotasMedias {

	public static void main(String[] args) {
		float[][] arrayBidiNotes = { { 4.5f,   6f,   5f,   8f, 0f },
									 {  10f,   8f, 7.5f, 9.5f, 0f },
									 {   3f, 2.5f, 4.5f,   6f, 0f },
									 {   6f, 8.5f,   6f,   4f, 0f },
									 {   9f, 7.5f,   7f,   8f, 0f } };
		
		String [] nomAlumnat = {"Pere", "Anna", "Xavi", "Elena", "Marc"};
		
		
		int millorMitjaAlumne = 0;
		float maxNota = 0;
		for (int i = 0; i < arrayBidiNotes.length; i++) {
			float mitjaNum1 = 0;
			for (int j = 0; j < arrayBidiNotes[i].length; j++) {
				mitjaNum1 += arrayBidiNotes[i][j];
			}
			
			mitjaNum1 /= arrayBidiNotes[i].length;
			System.out.println(mitjaNum1);
			
			if (mitjaNum1 > maxNota) {
				maxNota =  mitjaNum1;
				millorMitjaAlumne = i;
				System.out.println(millorMitjaAlumne);
			}
		}
		
		System.out.println(millorMitjaAlumne);
		
		System.out.println("L'alumne amb millor mitja es: " + nomAlumnat[millorMitjaAlumne]);
		
		
		
		
		
		
		
		
		
		
		
	}

}
