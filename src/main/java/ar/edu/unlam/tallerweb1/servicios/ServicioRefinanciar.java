package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cuota;

public interface ServicioRefinanciar {
	
	List<Cuota> consultarCuota(Long arefinanciar);

}
