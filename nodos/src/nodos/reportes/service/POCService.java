package nodos.reportes.service;

import java.util.List;

import nodos.reportes.dto.POCDTO;

/**
 * The Interface POCService.
 */
public interface POCService {

	/**
	 * Carga lista facturas.
	 *
	 * @param columna the columna
	 * @param valor the valor
	 * @return the list
	 */
	public List<POCDTO> cargaListaFacturas(String columna, String valor);
}
