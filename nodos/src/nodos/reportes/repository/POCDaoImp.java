package nodos.reportes.repository;


import java.util.List;

import javax.annotation.Resource;

import nodos.reportes.dto.POCDTO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

/**
 * The Class POCDaoImp implements the methods.
 */
@Repository
public class POCDaoImp implements POCDao {

	/** The data source. */
    @Resource
    private DriverManagerDataSource dataSource;
	
    /** The jdbctemplate. */
    @Resource
    private JdbcTemplate jdbctemplate;

    /** Logger for this class and subclasses. */
    protected final Log logger = LogFactory.getLog(getClass());
    
    /* (non-Javadoc)
	 * @see nodos.reportes.repository.POCDao#getListaFacturas(java.lang.String, java.lang.String)
	 */
	@Override
	public List<POCDTO> getListaFacturas(String columna, String valor) {
        String sql = "select * from factura where upper(" + columna + ") like " + "'%" + valor.toUpperCase() + "%'";
        List<POCDTO> facturas;
        facturas = jdbctemplate.query(sql, new POCRowMapper());
        return facturas;
	}
            
	/* (non-Javadoc)
	 * @see nodos.reportes.repository.POCDao#getUltimaFactura()
	 */
	@Override
	public POCDTO getUltimaFactura() {
        String sql = "select * from factura where id_factura = (select max(id_factura) from factura);";
        POCDTO factura;
        factura = jdbctemplate.queryForObject(sql, new POCRowMapper());
        return factura;
	}


	/* (non-Javadoc)
	 * @see nodos.reportes.repository.POCDao#saveFactura(nodos.reportes.dto.POCDTO)
	 */
	@Override
	public boolean saveFactura(POCDTO factura) {
		String sql = "";		
		int moral = 0;
		
		if (factura.isMoralFl()){
			moral = 1;
		}
		
		sql = "INSERT INTO `mydb`.`factura` (`MORAL_FL`, `NOMBRE`, `APELLIDO_PATERNO`, `APELLIDO_MATERNO`, `RFC`, " + 
		" `DOMICILIO`, `CIUDAD`, `GIRO`, `EMAIL`, `CODIGO_POSTAL`, " + 
		" `TEL_1`, `TEL_2`, `FECHA_CREACION`) " + 
		" VALUES ('" +
		moral + "', '" + factura.getNombre() + "', '" + factura.getApellidoPaterno() + "', '" + factura.getApellidoMaterno() + "', '" + factura.getRfc() + "', '" + 
		factura.getDomicilio() + "', '" + factura.getCiudad() + "', '" + factura.getGiro() + "', '" + factura.getEmail() + "', '" + factura.getCodigoPostal() + "', '" + 
		factura.getTel1() + "', '" + factura.getTel2() + "', SYSDATE());";

        //System.out.println("############" + sql);
        boolean saved = true;
        try{
            jdbctemplate.execute(sql);
        }catch(Exception e){
        	e.printStackTrace();
        	saved = false;
        }
        return saved;
	}
	
	/**
	 * Sets the data source.
	 *
	 * @param dataSource the new data source
	 */
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
     * Sets the jdbctemplate.
     *
     * @param jdbctemplate the new jdbctemplate
     */
    public void setjdbctemplate(JdbcTemplate jdbctemplate) {
    	this.jdbctemplate = jdbctemplate;
    }
}
	
