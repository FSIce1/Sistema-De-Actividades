
package algoritmos;

import beans.Actividad;
import java.sql.SQLException;
import java.util.List;
import modelos.Modelo_Actividad;

public class PorcentajeSubTareas {

    public static double porcentaje(int codEvento){
    
        try {
            
            List<Actividad> listaActividades=Modelo_Actividad.listaActividades(codEvento, -1);
            
            int cod = listaActividades.size();
            double porcentajeSubtarea=100.0/cod;
            double totalDelAvance=0.0;
            
            for (int i = 0; i < cod; i++) {
            
                if(listaActividades.get(i).getConfirmar_actividad()==1)
                    totalDelAvance=totalDelAvance+(double)((listaActividades.get(i).getPorcentaje_actividad()/100.0)*porcentajeSubtarea);
                
            }
            
            return (Math.round(totalDelAvance * 100d) / 100d);
            
        } catch (SQLException e) {
            
        }
        
        return 0;
    }
    
    
    
}
