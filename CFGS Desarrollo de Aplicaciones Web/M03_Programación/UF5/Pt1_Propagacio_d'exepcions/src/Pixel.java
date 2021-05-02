public class Pixel {
    int x, y;
    ColorRGB color = new ColorRGB(0, 0, 0);
    // Constructores

    public Pixel(int x, int y, int r, int g, int b) throws ColorRGBException {
        this.x = x;
        this.y = y;
        this.color.setColor(r, g, b);
    }

    // Setters y Getters

    public int[] getPosicion() {
        int[] posicion = new int[] {this.x, this.y};
        return posicion;
    } public void setPosicion(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    } public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    } public void setY(int y) {
        this.y = y;
    }

    public int[] getColor() {
        int[] colors = new int[] {color.getR(), color.getG(), this.color.getB()};
        return colors;
    } public void setColor(int r, int g, int b) throws ColorRGBException {
        this.color.setColor(r, g, b);
    }

    public int getColorR() {
        return color.getR();
    } public void setColorR(int r) throws ColorRGBException {
        color.setR(r);
    }

    public int getColorG() {
        return color.getG();
    } public void setColorG(int g) throws ColorRGBException {
        color.setG(g);
    }

    public int getColorB() {
        return color.getB();
    } public void setColorB(int b) throws ColorRGBException {
        color.setB(b);
    }


    // Metodos

    @Override
    public String toString() {
        return "Pixel{" +
                "x=" + x +
                ", y=" + y +
                ", color=" + color +
                '}';
    }
}
