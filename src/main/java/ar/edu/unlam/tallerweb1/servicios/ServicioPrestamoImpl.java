package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.dao.PrestamoDao;
import ar.edu.unlam.tallerweb1.modelo.Prestamo;

@Service("servicioPrestamo")
@Transactional
public class ServicioPrestamoImpl implements ServicioPrestamo {
	@Inject
	private PrestamoDao servicioPrestamoDao;
	
	@Override
	public List<Prestamo> consultarPrestamo() {
		return servicioPrestamoDao.consultarPrestamo();
	}
}