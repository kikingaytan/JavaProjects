package nodos.reportes.service;

import java.util.List;

import javax.annotation.Resource;

import nodos.reportes.dto.POCDTO;
import nodos.reportes.repository.POCDao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;



/**
 * The Class POCServiceImp.
 */
@Repository
public class POCServiceImp implements POCService{

	/** The facturacion dao. */
	@Resource
	private POCDao facturacionDao;
    
	/** Logger for this class and subclasses. */
    protected final Log logger = LogFactory.getLog(getClass());
	
	/* (non-Javadoc)
	 * @see nodos.reportes.service.POCService#cargaListaFacturas(java.lang.String, java.lang.String)
	 */
	@Override
	public List<POCDTO> cargaListaFacturas(String columna, String valor) {
		return facturacionDao.getListaFacturas(columna, valor);
	}	

	/**
	 * Sets the facturacion dao.
	 *
	 * @param facturacionDao the new facturacion dao
	 */
	public void setFacturacionDao(POCDao facturacionDao) {
		this.facturacionDao = facturacionDao;
	}	
}
