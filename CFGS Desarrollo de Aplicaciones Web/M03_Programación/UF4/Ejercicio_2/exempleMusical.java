package Ejercicio_2;

public class exempleMusical {
    public static void main(String[] args) {
        InstrumentCorda Guitarra = new InstrumentCorda();
        InstrumentVent  Trompeta = new InstrumentVent();
        exempleMusical exempleMusical = new exempleMusical();
        exempleMusical.ManejoInstrument(Guitarra);
        exempleMusical.ManejoInstrument(Trompeta);

    }

    public void ManejoInstrument(InstrumentMusical instrument) {
        instrument.afinar();
        instrument.tocar();
        System.out.println(instrument.tipusInstrument());
    }

}
