public class ColorRGB {
    private int r, g, b;

    // Constructores

    public ColorRGB(int r, int g, int b) throws ColorRGBException {
        if (r > 255 || r < 0) throw new ColorRGBException();
        else this.r = r;

        if (g > 255 || g < 0) throw new ColorRGBException();
        else this.g = g;

        if (b > 255 || b < 0) throw new ColorRGBException();
        else this.b = b;
    }

    // Setters y Getters

    public int[] getColor() {
        int colors[] = new int[] {this.r, this.g, this.b};
        return colors;
    } public void setColor(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public int getR() {
        return r;
    } public void setR(int r) {
        this.r = r;
    }

    public int getG() {
        return g;
    } public void setG(int g) {
        this.g = g;
    }

    public int getB() {
        return b;
    } public void setB(int b) {
        this.b = b;
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
