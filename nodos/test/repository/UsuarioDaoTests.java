package nodos.test.repository;

import java.util.List;

import nodos.main.dto.UsuarioDTO;
import nodos.main.repository.UsuarioDao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.test.context.junit38.AbstractJUnit38SpringContextTests;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.stereotype.Repository;
import javax.annotation.*;

@ContextConfiguration(locations={"classpath:test-context.xml"})
public class UsuarioDaoTests extends AbstractJUnit38SpringContextTests   {
	
	/** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
	@Resource
	private UsuarioDao usuarioDao;
	
	  public void setUsuarioDao(UsuarioDao usuarioDao) {
	        this.usuarioDao = usuarioDao;
	  }
	  
	    
	    protected String[] getConfigLocations() {
	        return new String[] {"classpath:test-context.xml"};
	    }
	    
	    public void testGetListaUsuarios() {
	        List<UsuarioDTO> usuarios = usuarioDao.getListaUsuarios();
	        logger.debug("Usuarios: "+usuarios);
	        
	    }
	
}
