package ar.edu.unlam.tallerweb1.controladores;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Afiliado;
import ar.edu.unlam.tallerweb1.modelo.Cuota;
import ar.edu.unlam.tallerweb1.modelo.Prestamo;
import ar.edu.unlam.tallerweb1.servicios.ServicioAfiliado;
import ar.edu.unlam.tallerweb1.servicios.ServicioCuota;
import ar.edu.unlam.tallerweb1.servicios.ServicioPrestamo;

@Controller
public class ControladorPrestamo {
	
	@Inject
	private ServicioPrestamo servicioPrestamo;
	
	@Inject
	private ServicioCuota servicioCuota;
	
	@Inject
	private ServicioAfiliado servicioAfiliado;
	
	@RequestMapping("/listarprestamos")
	public ModelAndView listarPrestamo() {
		ModelMap modelo = new ModelMap();
		
		List<Prestamo> prestamos= servicioPrestamo.consultarPrestamo();
		modelo.put("prestamos", prestamos);
		
		return new ModelAndView("listarprestamos",modelo);
	}
	
	@RequestMapping("/nuevoprestamo")
	public ModelAndView nuevoPrestamo() {
		ModelMap modelo = new ModelMap();
		
		Prestamo prestamo = new Prestamo();
		modelo.put("prestamo", prestamo);
		return new ModelAndView("crearprestamo", modelo);		
	}
	
	@RequestMapping(path = "/crearprestamo", method=RequestMethod.POST)
	public ModelAndView crearPrestamo(@ModelAttribute("prestamo") Prestamo prestamo, HttpServletRequest request) {
		ModelMap modelo = new ModelMap();
		
		Prestamo nprestamo = prestamo;
		
		// calculamos el valor de la cuota mensual.
		double montoMensual = nprestamo.getValor()/nprestamo.getCuotas();
		// calculamos el valor mensual de interes (el interes es igual para todos las cuotas)
		double valorInteres = nprestamo.getValor() * (nprestamo.getInteres()/100);
		// capturamos la fecha actual
		double total = montoMensual + valorInteres;
		
		Calendar fechven = Calendar.getInstance();
		
		List<Cuota> cuotas = new ArrayList<Cuota>();
		
		for(int i=0; i<nprestamo.getCuotas(); i++){
			fechven.add(Calendar.DAY_OF_YEAR, 30);
			
			Cuota ncuota = new Cuota();
			
			ncuota.setMonto(montoMensual);
			ncuota.setInteres(valorInteres);
			ncuota.setMontoTotal(total);
			ncuota.setEstado(false);
			ncuota.setFechaDeVencimiento(fechven.getTime());

			cuotas.add(ncuota);
		}
		
		servicioCuota.insertarCuota(cuotas);
		//servicioPrestamo.insertarPrestamo(nprestamo);
		modelo.put("cuotas", cuotas);
		
		return new ModelAndView("realizarpagoafinan", modelo);		
	}
	
	@RequestMapping(path = "/refinanciar", method = RequestMethod.POST)
	public ModelAndView listaCuotasImp(Long idPrestamo) {
			ModelMap modelo=new ModelMap();
			
			List<Cuota> impagas=servicioCuota.consultarCuota(idPrestamo);
			
			Afiliado afiliado = servicioAfiliado.consultarAfiliado(idPrestamo);
			
			Double montoTotalARefinanciar = 0.0;
			int cuotasRestante = 0;
			
		    for(Cuota i :impagas) {
				montoTotalARefinanciar += i.getMontoTotal();
				cuotasRestante++;
			}
		    
		    modelo.put("afiliado", afiliado);
			modelo.put("cuotas", impagas);	
			modelo.put("MontoARefinanciar", montoTotalARefinanciar);
			modelo.put("cuotasRestante",cuotasRestante);
			return new ModelAndView("refinanciar",modelo);
	
	}
	
	@RequestMapping(path = "/refinanciar", method = RequestMethod.POST)
	public ModelAndView listaCuotasImp(@ModelAttribute("prestamo") Prestamo prestamo,Long idAfiliado, Long idPrestamoRef, HttpServletRequest request) {
		System.out.println(idAfiliado+"->"+prestamo.getIdPrestamo()+"->"+prestamo.getCuotas()+"->"+prestamo.getValor()+"-> REF: "+idPrestamoRef);
		return new ModelAndView("home");
	}
	
	// si ingresa por la url "/refinanciar" sin pasar por los prestamos lo redirige al home.
	@RequestMapping("/refinanciar")
	public ModelAndView irAHome() {
			
			return new ModelAndView("home");
	
	}
	
	
}
