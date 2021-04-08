package Abstracto;
import java.util.ArrayList;

public class arrayList {

	public static void main(String[] args) {
		ArrayList v = new ArrayList();
		
		v.add(1234);
		System.out.println(v.listIterator());
		v.add(1235);
		System.out.println(v.listIterator());
		
	}

}
