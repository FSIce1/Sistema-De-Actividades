
package algoritmos;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class PorcentajeFechas {
    
    public static double hallarPorcentaje(Date diaFin,Date diaIni){
        
        //Date diaFinal=lista.get(0).getDiaFinal();
        //Date diaInicial=lista.get(3).getDiaInicio();
        
        Date diaFinal=diaFin;
        Date diaInicial=diaIni;
        String diaTerminado="2019-02-11";
        System.out.println("Día Inicial: "+diaInicial);
        System.out.println("Día Final: "+diaFinal);
        System.out.println("Día que actual: "+diaTerminado);
        // HALLAMOS LA CANTIDAD DE DÍAS QUE DURARÁ EL EVENTO
        
        int diasDURACION=(int) ((diaFinal.getTime()-diaInicial.getTime())/86400000);
        System.out.println("\nTotal que durará: "+diasDURACION);
        // HALLAMOS EL PORCENTAJE DE CUANDO VA DEL EVENTO
        
        Calendar calenda = GregorianCalendar.getInstance();
        Date fechaActual = calenda.getTime();
        int tiempoActual=(int) ((fechaActual.getTime()-diaInicial.getTime())/86400000);
        double por;
        if(tiempoActual>0){
            
            System.out.println("Lo que va durando el evento: "+tiempoActual);
            
            // HALLAMOS EL PORCENTAJE
            por=((double)tiempoActual/(double)diasDURACION)*100;
            
            if(por>100){
                por=-1;
            }
            
        } else {
            por=0;
        }
        
        if(por==-1){
            System.out.println("Evento terminado");
        } else if(por==0){
            System.out.println("No ha comenzado el evento");
        } else{
            System.out.println("Porcentaje: "+(Math.round(por * 100d) / 100d));
            return (Math.round(por * 100d) / 100d);
        }
        
        return por;
     
    }
    
    
    public static double hallarPorcentaje2(Date diaFin,Date diaIni,Date diaTerm){
        
        //Date diaFinal=lista.get(0).getDiaFinal();
        //Date diaInicial=lista.get(3).getDiaInicio();
        
        Date diaFinal=diaFin;
        Date diaInicial=diaIni;
        Date diaTerminado=diaTerm;
        
        System.out.println("Día Inicial: "+diaInicial);
        System.out.println("Día Final: "+diaFinal);
        System.out.println("Día en que lo terminó: "+diaTerminado);
        
// HALLAMOS LA CANTIDAD DE DÍAS QUE DURARÁ EL EVENTO
        
        int diasESTIMADO=(int) ((diaFinal.getTime()-diaInicial.getTime())/86400000);
        System.out.println("\nTiempo estimado: "+diasESTIMADO);
        
// HALLAMOS LA CANTIDAD DE DÏAS QUE DURÓ EL EVENTO

        int diasREAL=(int) ((diaTerminado.getTime()-diaInicial.getTime())/86400000);
        System.out.println("\nTiempo real: "+diasREAL);

        
        // HALLAMOS EL PORCENTAJE DE PRODUCTIVIDAD
        
        double por;
        if(diasREAL>0){
            
            // HALLAMOS EL PORCENTAJE
            por=((double)diasREAL/(double)diasESTIMADO)*100;
            
            if(por>100){
                por=-1;
            }
            
        } else {
            por=0;
        }
        
        if(por==-1){
            System.out.println("Evento terminado");
        } else if(por==0){
            System.out.println("No ha comenzado el evento");
        } else{
            System.out.println("Porcentaje: "+(Math.round(por * 100d) / 100d));
            return (Math.round(por * 100d) / 100d);
        }
        
        return por;
     
    }
    
}
