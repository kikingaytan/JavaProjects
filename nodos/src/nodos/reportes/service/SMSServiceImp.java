package nodos.reportes.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.comm.CommPortIdentifier;
import javax.comm.SerialPort;

import org.springframework.stereotype.Repository;

/**
 * The Class SMSServiceImp.
 */
@Repository
public class SMSServiceImp implements SMSService{

    /** The output stream. */
    static OutputStream outputStream;
    
    /** The port id. */
    static CommPortIdentifier portId;
    
    /** The port list. */
    static Enumeration portList;
    
    /** The serial port. */
    static SerialPort serialPort;

	/**
  	 * Delay.
  	 *
  	 * @param sec the sec
  	 */
  	public void delay(int sec){
		  GregorianCalendar g=new GregorianCalendar();
		  Date d=g.getTime();
		  int secOrig=d.getSeconds();
		  int act=secOrig;
		  secOrig+=sec;
		  if(secOrig>60)
		     secOrig-=60;
		  while(act!=secOrig){
		  GregorianCalendar w=new GregorianCalendar();
		  Date u=w.getTime();
		  act=u.getSeconds();
		  }
		  }

	  /* (non-Javadoc)
	 * @see nodos.reportes.service.SMSService#enviaSMS(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean enviaSMS(String numero, String mensaje) {

		Process pr2;
		boolean res = false;
		String cmdSend = "java core.SenderApp \"" + mensaje + "\" " + numero;
		try{   
				
				System.out.println("######cmdSend="+cmdSend);
				pr2 = Runtime.getRuntime().exec(cmdSend);

				delay(4);
				 // Se obtiene el stream de salida del programa 
	            InputStream is = pr2.getInputStream(); 
	             
	            /* Se prepara un bufferedReader para poder leer la salida más comodamente. */ 
	            BufferedReader br = new BufferedReader (new InputStreamReader (is)); 
	             
	            // Se lee la primera linea 
	            String aux = br.readLine(); 
	             
	            // Mientras se haya leido alguna linea 
	            while (aux!=null) 
	            { 
	                // Se escribe la linea en pantalla 
	                System.out.println ("%%%%"+aux); 
	                 
	                // y se lee la siguiente. 
	                aux = br.readLine(); 
	            } 
				System.out.println("######exitValue="+pr2.exitValue());
				if (pr2.exitValue() == 0){
					res = true;
				}
			}catch(Exception ex)
				{   
					System.out.println("Ha ocurrido un error al ejecutar el comando. Error: "+ex);
				}
		return res;
	}

}
