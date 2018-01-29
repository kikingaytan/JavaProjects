package nodos.reportes.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import nodos.reportes.dto.POCDTO;

import org.springframework.jdbc.core.RowMapper;

/**
 * The Class POCRowMapper define the data type to be returned .
 */
public class POCRowMapper implements RowMapper<POCDTO>{


	/* (non-Javadoc)
	 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
	 */
	public POCDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		POCDTO factura = new POCDTO();
		factura.setIdFactura(rs.getString("ID_FACTURA"));
		factura.setNombre(rs.getString("NOMBRE"));
		factura.setApellidoPaterno(rs.getString("APELLIDO_PATERNO"));
		factura.setApellidoMaterno(rs.getString("APELLIDO_MATERNO"));
		factura.setTel1(rs.getString("TEL_1"));
		factura.setTel2(rs.getString("TEL_2"));
		factura.setDomicilio(rs.getString("DOMICILIO"));
		factura.setEmail(rs.getString("EMAIL"));
		factura.setCodigoPostal(rs.getString("CODIGO_POSTAL"));
		factura.setFechaCreacion(rs.getString("FECHA_CREACION"));
		factura.setUsuarioCreacion(rs.getString("USUARIO_CREACION"));
		factura.setRfc(rs.getString("RFC"));
		factura.setCiudad(rs.getString("CIUDAD"));
		factura.setGiro(rs.getString("GIRO"));
		
		return factura;
	}
	
}
