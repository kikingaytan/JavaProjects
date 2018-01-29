package nodos.utils;

public class Send 
{
//unsigned char pdu[284],cont;
public static byte pdu[]=new byte[284];
public static int cont;
public static String hex1="0123456789ABCDEF";
byte msgpdu[]=new byte[310];


  public Send()
  {
  inicializa(pdu);
  }
  
public void text2hex(byte c)
{
         byte aux1,aux2;
         byte hex[];
         hex=hex1.getBytes();
         aux1=(byte)(c & 0x0f);
         aux2=(byte)(c&0xf0);
         aux2=(byte)(aux2>>4);
         aux2=(byte)(aux2&0x0f);
                    
         pdu[cont++]=hex[aux2];
         pdu[cont++]=hex[aux1];

}
public void text2pdu(byte msg[])
{
        byte num,i,j,k,l,c;
        int p=0;
        byte msg2[]=new byte[160];
        inicializa(msg2);
        byte inter[]=new byte[3];
        inicializa(inter);
        cont=0;

        num=(byte)msg.length;

        for(i=0,c=0,j=1;i<num;i++,j++,c++)
        {
                if(j==8)
                {
                	j=1;
                  i++;
                }
                for(k=0,l=1;k<j;k++,l=(byte)(l<<1))
                {
                         if(i!=num-1)
                         		if((msg[i+1]&l)!=0)
                               msg[i]=(byte)(msg[i]|0x80);

                         if((k+1)<j)
                         {
                         	msg[i]=(byte)(msg[i]>>1);
                           msg[i]=(byte)(msg[i]&0x7f);
                         }
                }
                msg2[c]=msg[i];
        }
        msg2[c]='\0';

        text2hex(num);
        p=longitud(msg2)-1;
        for(int m=0;m<p;m++)
               text2hex(msg2[m]);
}

public void invnum(byte num[])
{
        byte aux;
        for(int i=0;i<10;i+=2)
        {
                aux=num[i];
                num[i]=num[i+1];
                num[i+1]=aux;
        }

}

public byte[] concatena(byte orig[],byte porSumar[]){
      int lon=0,lonOrig;
      lon=longitud(orig);
      for(int k=lon,j=0;k<lon+porSumar.length;k++,j++)
          orig[k]=porSumar[j];
          return orig;
}

public int longitud(byte orig[]){
   int lon=0;
   for(int k=0;k<orig.length;k++)
       if(orig[k]!=-1)
          lon++;
   return lon;
}

public int longitudRcv(byte orig[]){
   int lon=0;
   for(int k=0;k<orig.length;k++){
       if(orig[k]!=-1)
          lon++;
          else
             return lon;
   }
   return lon;
}

public void inicializa(byte orig[]){
   for(int k=0;k<orig.length;k++)
       orig[k]=-1;
}

  public String getMsg(){  
        String Msg="";
        for(int p=0;p<longitud(msgpdu);p++){
            Msg=Msg+(char)msgpdu[p];
           }
        return Msg;   
  }
  
  public String sendOut(String mensaje,String tel)
  {
        int length;
        int aux;
        //String mensaje="tu mensaje ha sido recibido";
        byte msg[]= new byte[mensaje.length()];
        for(int k=0;k<mensaje.length();k++)
           msg[k]=(byte)mensaje.charAt(k);
        //String tel="5591872122";
        byte num[]=new byte[tel.length()];
        for(int k=0;k<tel.length();k++)
           num[k]=(byte)tel.charAt(k);
        //String intNum="0015000A81";
        String intNum="0015FF0A81";
        byte intnum[]=new byte[intNum.length()];
        for(int k=0;k<intNum.length();k++)
           intnum[k]=(byte)intNum.charAt(k);        
        String jCode="00000C";
        byte code[]=new byte[jCode.length()];
        for(int k=0;k<jCode.length();k++)
           code[k]=(byte)jCode.charAt(k);                
        byte slen[]=new byte[5];
        byte out[]=new byte[20];

        Send send=new Send();
        send.inicializa(msgpdu);
        send.inicializa(slen);
        send.inicializa(out);
        send.invnum(num);
        send.text2pdu(msg);
        
        for(int k=0;k<intnum.length;k++)
            msgpdu[k]=intnum[k];       
        
        //concatena el numero
        msgpdu=send.concatena(msgpdu,num);
        //concatena la mascara
        msgpdu=send.concatena(msgpdu,code);
        //concatena el pdu
        msgpdu=send.concatena(msgpdu,pdu);

        length=(send.longitud(msgpdu)/2)-1;
        String longitud=Integer.toString(length);
        for(int k=0;k<longitud.length();k++)
        slen[k]=(byte)longitud.charAt(k);

        String comm="at+cmgs=";
        for(int k=0;k<comm.length();k++)
            out[k]=(byte)comm.charAt(k);
        
        out=send.concatena(out,slen);
        
        aux=send.longitud(out);
        out[aux++]=0x0d;
        out[aux++]=0x0a;
        out[aux]='\0';

        aux=send.longitud(msgpdu);
        msgpdu[aux++]=0x1a;
        msgpdu[aux]=-1;

        String OUT="";
        for(int p=0;p<send.longitud(out);p++){
            OUT=OUT+(char)out[p];
           }
        
        return OUT;   
        
  }
  
  public static void main (String args[]){
	  Send send = new Send();
      System.out.println("OUT=|"+send.sendOut("HOLA MARIO","4498941315")+"|");

	  System.out.println("getMSG=" + send.getMsg());
  }

}