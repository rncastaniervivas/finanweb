package ar.edu.unlam.tallerweb1.persistencia;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.controladores.ControladorLogin;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioLogin;

public class UsuarioTest {
	
	@Test
	@Transactional
	@Rollback (true)
	public void testQueElUsuarioNoExiste() {
		//genero un controller para usarlo NO MOCKEAR
		ControladorLogin controlador = new ControladorLogin();
		
		HttpSession httpMock = mock (HttpSession.class);
		HttpServletRequest httpRequestMock = mock(HttpServletRequest.class); 
		ServicioLogin servicioLoginMock = mock(ServicioLogin.class);
		Usuario usuarioMock = mock(Usuario.class);
				
		controlador.setServicioLogin(servicioLoginMock);
		
		when(servicioLoginMock.consultarUsuario(usuarioMock)).thenReturn(null);
		
		ModelAndView modelo = controlador.validarLogin(usuarioMock, httpRequestMock);
		
		assertThat(modelo.getViewName()).isEqualTo("login");
		
	}

}
