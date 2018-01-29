package nodos.reportes.repository;

import java.util.List;

import nodos.reportes.dto.POCDTO;


/**
 * The Interface POCDao defines the methods to be implemented.
 */
public interface POCDao {

	/**
	 * Gets the lista facturas.
	 *
	 * @param columna the columna
	 * @param valor the valor
	 * @return the lista facturas
	 */
	public List<POCDTO> getListaFacturas(String columna, String valor);
	
	/**
	 * Gets the ultima factura.
	 *
	 * @return the ultima factura
	 */
	public POCDTO getUltimaFactura();
	
	/**
	 * Save factura.
	 *
	 * @param factura the factura
	 * @return true, if successful
	 */
	public boolean saveFactura(POCDTO factura);
}
