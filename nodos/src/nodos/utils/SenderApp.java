package nodos.utils;
import java.io.*;
import java.util.*;

import javax.comm.*;

public class SenderApp
{
    static Enumeration portList;
    static CommPortIdentifier portId;
    static SerialPort serialPort;
    static OutputStream outputStream;

  public static void main(String args[]){
  Send send=new Send();
  System.out.println("---------------1");
  SenderApp gps=new SenderApp("");
  //gps.SendToPort(send.sendOut("Hola juan","5551863713"));
  //gps.SendToPort(send.sendOut("Hola mario","5554384055"));
  //prepara el comando para enviar el mensaje con el numero y el comando AT
  
  String s=send.sendOut("ENVIADO DE FALCOM "+Calendar.getInstance().getTime(),"4498941315");
  //String s=send.sendOut("ENVIADO DE FALCOM "+Calendar.getInstance().getTime(),"4491964918");
  String test1 = "";
  for(int k=0;k<s.length();k++){
	  //escribe el PDU a ser enviado
     gps.SendToPort(""+s.charAt(k));
//	  test1 = test1.concat(s.charAt(k)+"");
//     System.out.println(s.charAt(k));
     }
  
//  System.out.println("----1="+test1);

  gps.delay(2);
  String msg=send.getMsg();
  
  String test2 = "";  
  for(int k=0;k<msg.length();k++){
	  //escribe el PDU a ser enviado
     gps.SendToPort(""+msg.charAt(k));
//	  test2 = test2.concat(msg.charAt(k)+"");
//     System.out.println(msg.charAt(k));
     }

//  System.out.println("----2="+test2);

  System.out.println("El mensaje ha sido enviado!"); 

 //was commented.
//  try{
//  outputStream.close();
//  }catch(Exception e){e.printStackTrace();}
//  serialPort.close();

  }

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
  public SenderApp()
  {
  }
  public SenderApp(String a)
  {
	  
	  try{
      	System.out.println("#######1");
		        	
        portList = CommPortIdentifier.getPortIdentifiers();

      	System.out.println("#######portList=" + CommPortIdentifier.getPortIdentifiers().hasMoreElements());

        while (portList.hasMoreElements()) {
            portId = (CommPortIdentifier) portList.nextElement();
            if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
            	/*
            	Siemens AG WM USB Modem, se tiene que usar el puerto donde este alojado este 
            	dispositivo.
            	*/
            	System.out.println("#######portid = "+ portId.getName());
                 if (portId.getName().equals("COM14")) {
                    try {
                        serialPort = (SerialPort)
                            portId.open("GpsApp", 500);
                    } catch (PortInUseException e) {
                    	e.printStackTrace();
                    }
                    try {
                    	System.out.println("-------------before Output Stream");
                        outputStream = serialPort.getOutputStream();
                        System.out.println("-------------after Output Stream");
                    } catch (IOException e) {
                    	e.printStackTrace();
                    }
                    try {
                        serialPort.setSerialPortParams(9600,
                            SerialPort.DATABITS_8,
                            SerialPort.STOPBITS_1,
                            SerialPort.PARITY_NONE);
                    } catch (UnsupportedCommOperationException e) {
                    	e.printStackTrace();
                    }
                }
            }
        }

	  }catch(Exception e){
		  e.printStackTrace();
	  }

  }

 public void SendToPort(String messageString){
       try {
            outputStream.write(messageString.getBytes());
           } catch (IOException e) {
                    e.printStackTrace();
                    }
 }

}
