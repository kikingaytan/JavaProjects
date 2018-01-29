package nodos.reportes.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nodos.reportes.dto.RHDTO;
import nodos.reportes.service.POCService;
import nodos.reportes.service.SMSService;
import nodos.utils.WebUtils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * The Class POCController this class .
 */
@Controller
public class POCController {

    /** The logger. */
    protected final Log logger = LogFactory.getLog(getClass());

    /** The facturacion service. */
    @Resource
    private POCService facturacionService;

    /**
     * Sets the facturacion service.
     *
     * @param facturacionService the new facturacion service
     */
    public void setFacturacionService(POCService facturacionService) {
		this.facturacionService = facturacionService;
	}

    /** The sms service. */
    @Resource
    private SMSService smsService;

	/**
	 * Sets the sms service.
	 *
	 * @param smsService the new sms service
	 */
	public void setSmsService(SMSService smsService) {
		this.smsService = smsService;
	}

	/**
	 * Handle request.
	 *
	 * @param arg0 the arg0
	 * @param arg1 the arg1
	 * @return the model and view
	 * @throws Exception the exception
	 */
	@RequestMapping("facturacion.go")
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to Facturacion jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/facturacion.jsp");
	}

    /**
     * Gets the lista facturas.
     *
     * @param request the request
     * @param response the response
     * @return the lista facturas
     * @throws Exception the exception
     */
    @RequestMapping("/cargaDatosPay.go")	
	public void getListaFacturas(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
    	System.out.println("###############cargaDatosPay.go llamado");
    	String val = "";
    	val = "[[['A',10],['B',10],['C',5],['D', 5],['E', 50],['F',20]]]";
        WebUtils.writeJSONResponse(response, val);
        //WebUtils.writeStringResponse(response, val);
	}

    /**
     * Index.
     *
     * @param request the request
     * @param response the response
     * @return the model and view
     * @throws ServletException the servlet exception
     * @throws IOException Signals that an I/O exception has occurred.
     */
    @RequestMapping("/hello.go")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String now = (new Date()).toString();
        logger.info("Returning hello view with " + now);

        return new ModelAndView("WEB-INF/jsp/hello.jsp", "now", now);
    }

    /**
     * Pay.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("pay.go")
	public ModelAndView pay(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to pay jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/legendLabels.jsp");
	}

    /**
     * Tareas.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("tareas.go")
	public ModelAndView tareas(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to tareas jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/multipleBarColors.jsp");
	}

    /**
     * Status proyectos.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("statusProyectos.go")
	public ModelAndView statusProyectos(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to status proyectos jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/pointLabels.jsp");
	}

    
    /**
     * Menu general.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("menuGeneral.go")
	public ModelAndView menuGeneral(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to menu general jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/hiddenPlot.jsp");
	}

    /**
     * Detalle proyecto.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("detalleProyecto.go")
	public ModelAndView detalleProyecto(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to detalle proyecto jsp");
    	
        return new ModelAndView("WEB-INF/jsp/pantallas/Detalle_Proyecto.jsp");
	}

    /**
     * Gantt.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("gantt.go")
	public ModelAndView gantt(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to gantt chart jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/gantt.jsp");
	}

    /**
     * Layout.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("layout.go")
	public ModelAndView layout(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to gantt chart jsp");
    	
        return new ModelAndView("WEB-INF/jsp/reportes/layout1.jsp");
	}

    /**
     * Alta proyecto.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("altaProyecto.go")
	public ModelAndView altaProyecto(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to gantt chart jsp");
    	
        return new ModelAndView("WEB-INF/jsp/pantallas/Alta_de_Proyecto.jsp");
	}

    /**
     * Listado proyectos.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("listadoProyectos.go")
	public ModelAndView listadoProyectos(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to gantt chart jsp");
    	
        return new ModelAndView("WEB-INF/jsp/pantallas/Vista_Listado_Proyectos.jsp");
	}

    /**
     * Detalle wbs.
     *
     * @param arg0 the arg0
     * @param arg1 the arg1
     * @return the model and view
     * @throws Exception the exception
     */
    @RequestMapping("detalleWBS.go")
	public ModelAndView detalleWBS(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

    	logger.info("Redirecting to gantt chart jsp");
    	
        return new ModelAndView("WEB-INF/jsp/pantallas/Detalle_WBS.jsp");
	}

    /**
     * Carga wbs.
     *
     * @param request the request
     * @param response the response
     * @throws Exception the exception
     */
    @RequestMapping("/cargaWBS.go")	
	public void cargaWBS(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
    	String val = "";
    	//val = "[[['A',10],['B',10],['C',5],['D', 5],['E', 50],['F',20]]]";
    	
    	val = "[{"+
    		"\"id\":1,"+
    		"\"code\":\"01\","+
    		"\"name\":\"Proyecto Piloto\","+
    		"\"addr\":\"01-01-2010\","+
    		"\"col4\":\"01-01-2011\","+
    		"\"iconCls\":\"icon-ok\","+
    		"\"children\":[{"+
    			"\"id\":2,"+
    			"\"code\":\"0101\","+
    			"\"name\":\"Documento de diseño\","+
    			"\"addr\":\"05-01-2010\","+
    			"\"iconCls\":\"icon-no\","+
    			"\"col4\":\"10-01-2010\","+
    			"\"checked\":true"+
    		"},{"+
    			"\"id\":3,"+
    			"\"code\":\"0102\","+
    			"\"name\":\"Casos de uso\","+
    			"\"addr\":\"06-01-2010\","+
    			"\"iconCls\":\"icon-ok\","+
    			"\"col4\":\"7-01-2010\","+
    			"\"state\":\"closed\""+
    		"}]"+
    	"},{"+
    		"\"code\":\"02\","+
    		"\"name\":\"Desarrollo\","+
    		"\"iconCls\":\"icon-ok\","+
    		"\"addr\":\"8-01-2010\","+
    		"\"col4\":\"9-01-2010\","+
    		"\"state\":\"closed\","+
    		"\"children\":[{"+
    			"\"code\":\"0201\","+
    			"\"iconCls\":\"icon-ok\","+
    			"\"name\":\"Desarrollo Alta Proyectos\","+
        		"\"addr\":\"10-01-2010\","+    			
    			"\"col4\":\"11-01-2010\","+
    			"\"state\":\"closed\","+
    			"\"children\":[{"+
    				"\"code\":\"02013\","+
            		"\"addr\":\"12-01-2010\","+    			
        			"\"col4\":\"13-01-2010\","+
    				"\"iconCls\":\"icon-ok\","+
    				"\"name\":\"Persistencia\""+
    			"},{"+
    				"\"code\":\"02014\","+
            		"\"addr\":\"14-01-2010\","+    			
        			"\"col4\":\"15-01-2010\","+
    				"\"iconCls\":\"icon-no\","+
    				"\"name\":\"Controllers\""+
    			"}]"+
    		"},{"+
    			"\"code\":\"0202\","+
    			"\"name\":\"Desarrollo detalle de proyectos\","+
        		"\"addr\":\"16-01-2010\","+    			
    			"\"col4\":\"17-01-2010\","+
    			"\"iconCls\":\"icon-ok\","+
    			"\"col4\":\"col4 data\""+
    		"}]"+
    	"}]";
    	
        WebUtils.writeJSONResponse(response, val);
        //WebUtils.writeStringResponse(response, val);
	}

    /**
     * Carga sub datos wbs.
     *
     * @param request the request
     * @param response the response
     * @throws Exception the exception
     */
    @RequestMapping("/subDatosWBS.go")	
	public void cargaSubDatosWBS(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
    	String val = "";
    	//val = "[[['A',10],['B',10],['C',5],['D', 5],['E', 50],['F',20]]]";
    	
    	val = "[{"+
    		"\"code\":\"01021\","+
    		"\"name\":\"Caso de Uso Alta\","+
    		"\"iconCls\":\"icon-ok\","+
    		"\"addr\":\"17-01-2010\","+
    		"\"col4\":\"18-01-2010\""+
    	"},{"+
    		"\"code\":\"01022\","+
    		"\"name\":\"Caso de Uso Detalle Proyecto\","+
    		"\"iconCls\":\"icon-ok\","+
    		"\"addr\":\"19-01-2010\","+
    		"\"col4\":\"20-01-2010\""+
    	"}]";  	
    	
        WebUtils.writeJSONResponse(response, val);
        //WebUtils.writeStringResponse(response, val);
	}

    /**
     * Envia sms.
     *
     * @param request the request
     * @param response the response
     * @throws Exception the exception
     */
    @RequestMapping("/enviaSMS.go")	
	public void enviaSMS(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

    	JSONObject retVal = new JSONObject();
    	
    	String servicios = request.getParameter("servicios");

    	String telefono = request.getParameter("telefono");

    	String jsonServicios = "";
    	
    	jsonServicios = "{'servicios':[" + servicios + "]}";
        JSONObject jsonObj = JSONObject.fromObject(jsonServicios);
        List<RHDTO> listaServicios = new ArrayList<RHDTO>();    
    	JSONArray arrayServicios = jsonObj.getJSONArray("servicios");

    	System.out.println("telefono="+telefono);
    	Integer res=0;
    	for (int k = 0 ; k < arrayServicios.size() ; k++){
    		RHDTO servicioDto = (RHDTO) JSONObject.toBean((JSONObject)arrayServicios.get(k), RHDTO.class);
    		System.out.println("costo recurso="+servicioDto.getCostoPersona());
    		
    		res = res + new Integer(servicioDto.getCostoPersona());
    		
    	}

    	System.out.println("Suma Total="+res);

    	boolean smsRes = smsService.enviaSMS(telefono, "EL TOTAL DE LOS RECURSOS HUMANOS ES " + res);
        retVal.put("success", smsRes);
    	
        WebUtils.writeJSONResponse(response, retVal.toString());
        //WebUtils.writeStringResponse(response, val);
	}

}
