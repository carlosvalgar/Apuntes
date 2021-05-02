public class MainPropagacioExepcions {
    public static void main(String[] args) {
        try {
            // Fem les proves al crear la clase Pixel
            // Pixel pixel = new Pixel(0, -1, -1, 255, 78); // Prova amb 1 valor de color erroni
            // Pixel pixel = new Pixel(0, -1, 0, 256, -78); // Prova amb 2 valors de color erronis
            Pixel pixel = new Pixel(0, -1, 0, 255, 78); // Creacio sense valors de color erronis

            // Fem les proves del metode setColor
            // pixel.setColor(-1, 255, 78); // Prova amb 1 valor de color erroni
            // pixel.setColor(0, 256, -78); // Prova amb 2 valors de color erronis
            pixel.setColor(7, 7, 7); // Prova sense valor de color erronis

            // Fem les proves dels metodes setColorR, setColorG, setColorB
            // pixel.setColorR(-5); // Prova amb el valor incorrecte
            pixel.setColorR(5); // Prova amb el valor correcte

            // pixel.setColorG(-5); // Prova amb el valor incorrecte
            pixel.setColorG(5); // Prova amb el valor correcte

            // pixel.setColorB(-5); // Prova amb el valor incorrecte
            pixel.setColorB(5); // Prova amb el valor correcte

            System.out.println(pixel);

        } catch (ColorRGBException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}
