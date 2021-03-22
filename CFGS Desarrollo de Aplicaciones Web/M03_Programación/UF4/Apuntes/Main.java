
public class Main {

	public static void main(String[] args) {
		Discos monstor = new Discos();
		Discos master = new Discos(1, "Master", "Motollica", "Uno qualquiera");
		System.out.println(master.GetCodigo());
		System.out.println(master.GetTitulo());
		System.out.println(master.GetAutor());
		System.out.println(master.GetNomDiscografica());
		
		System.out.println(monstor);
		System.out.println(master.toString()); // System.out.println(master); Es equivalente
		System.out.println(master);
		
		Libros piesBarro = new Libros(1, "Pies de barro", "Torry protchet", 1234);
		System.out.println(piesBarro.GetCodigo());
		System.out.println(piesBarro.GetTitulo());
		System.out.println(piesBarro.GetAutor());
		System.out.println(piesBarro.GetNumeroPaginas());
		System.out.println(piesBarro.toString());
	}
}
