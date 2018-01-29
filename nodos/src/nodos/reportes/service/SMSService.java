package nodos.reportes.service;


/**
 * The Interface SMSService.
 */
public interface SMSService {
	
	/**
	 * Envia sms.
	 *
	 * @param numero the numero
	 * @param mensaje the mensaje
	 * @return true, if successful
	 */
	public boolean enviaSMS(String numero, String mensaje);
}
