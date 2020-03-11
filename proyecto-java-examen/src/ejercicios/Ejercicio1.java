package ejercicios;
/**
 * Ejercicio: analizar la siguente clase y realizar las correcciones
 * necesarias para que compile  
 * @author examen
 *
 */
public class Ejercicio1 {
	
	  	static int count1;
	    static int count2;  

	    public Ejercicio1() {
	    	count1 = 0;
	    	count2 = 0;
	    }

	    public void incrementa1() {
	    	count1++;
	    }

	    public void incrementa2() {
	    	count2++;
	    }

	    public static void incrementa() {
	    	count1++;
	    }

	    public static void main(String[] args) {
	    	Ejercicio1 ej=new Ejercicio1();
	    	Ejercicio1.incrementa();
	    	ej.incrementa1();
	    	ej.incrementa2();
	    	System.out.println("Contador 1 : "+count1+"\nContador 2 : "+count2);
	    }
}
