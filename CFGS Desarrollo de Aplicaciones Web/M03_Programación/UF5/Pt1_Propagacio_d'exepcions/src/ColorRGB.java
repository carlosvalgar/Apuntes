public class ColorRGB {
    private int r, g, b;

    // Constructores

    public ColorRGB(int r, int g, int b) throws ColorRGBException {
        boolean booleanColor = false;
        String mensajeError = "";
        if (r > 255 || r < 0) {
            booleanColor = true;
            mensajeError += "Valor R = " + r + " fora de rang. ";
        } else this.r = r;

        if (g > 255 || g < 0) {
            booleanColor = true;
            mensajeError += "Valor G = " + g + " fora de rang. ";
        } else this.g = g;

        if (b > 255 || b < 0) {
            booleanColor = true;
            mensajeError += "Valor B = " + b + " fora de rang. ";
        } else this.b = b;

        if (booleanColor == true) throw new ColorRGBException(mensajeError);
    }

    // Setters y Getters

    public int[] getColor() {
        int[] colors = new int[] {this.r, this.g, this.b};
        return colors;
    } public void setColor(int r, int g, int b) throws ColorRGBException {
        boolean booleanColor = false;
        String mensajeError = "";
        if (r > 255 || r < 0) {
            booleanColor = true;
            mensajeError += "Valor R = " + r + " fora de rang. ";
        } else this.r = r;

        if (g > 255 || g < 0) {
            booleanColor = true;
            mensajeError += "Valor G = " + g + " fora de rang. ";
        } else this.g = g;

        if (b > 255 || b < 0) {
            booleanColor = true;
            mensajeError += "Valor B = " + b + " fora de rang. ";
        } else this.b = b;

        if (booleanColor == true) throw new ColorRGBException(mensajeError);
    }

    public int getR() {
        return r;
    } public void setR(int r) throws ColorRGBException {
        if (r > 255 || r < 0) throw new ColorRGBException("Valor R = " + r + " fora de rang. ");
        else this.r = r;
    }

    public int getG() {
        return g;
    } public void setG(int g) throws ColorRGBException {
        if (g > 255 || g < 0) throw new ColorRGBException("Valor G = " + g + " fora de rang. ");
        else this.g = g;
    }

    public int getB() {
        return b;
    } public void setB(int b) throws ColorRGBException {
        if (b > 255 || b < 0) throw new ColorRGBException("Valor B = " + b + " fora de rang. ");
        else this.b = b;
    }

    // Metodos

    @Override
    public String toString() {
        return "ColorRGB{" +
                "r=" + r +
                ", g=" + g +
                ", b=" + b +
                '}';
    }
}
