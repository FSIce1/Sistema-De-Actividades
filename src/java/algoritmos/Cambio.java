
package algoritmos;

public class Cambio {
    
    public static String cambiala(String fecha){
        
        System.out.println("\nFecha: "+fecha);
        
        String parte1=fecha.substring(0, 11);
        String parte2="01";
        String parte3=fecha.substring(13,fecha.length());

        String unifica=parte1+parte2+parte3;

        System.out.println("Cambiado: "+unifica);
            
        return unifica;
        
    }
    
}
