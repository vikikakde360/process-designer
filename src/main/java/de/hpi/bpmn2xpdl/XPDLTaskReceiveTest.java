package de.hpi.bpmn2xpdl;

import java.io.StringReader;
import java.io.StringWriter;

import junit.framework.TestCase;

import org.json.JSONException;
import org.json.JSONObject;
import org.xmappr.Xmappr;

public class XPDLTaskReceiveTest extends TestCase {

	private String jsonParse = "{" +
		"\"implementation\":\"Goes here\"," +
		"\"instantiate\":\"true\"" +
		"}";
	private String jsonWrite = "{" +
		"\"tasktype\":\"Receive\"," +
		"\"instantiate\":\"true\"," +
		"\"implementation\":\"Goes here\"" +
		"}";
	private String xpdl = "<TaskReceive Implementation=\"Goes here\" Instantiate=\"true\" />";

	public void testParse() throws JSONException {
		XPDLTaskReceive task = new XPDLTaskReceive();
		task.parse(new JSONObject(jsonParse));

		StringWriter writer = new StringWriter();

		Xmappr xmappr = new Xmappr(XPDLTaskReceive.class);
		xmappr.setPrettyPrint(false);
		xmappr.toXML(task, writer);

		assertEquals(xpdl, writer.toString());
	}

	public void testWrite() {		
		StringReader reader = new StringReader(xpdl);

		Xmappr xmappr = new Xmappr(XPDLTaskReceive.class);
		XPDLTaskReceive task = (XPDLTaskReceive) xmappr.fromXML(reader);

		JSONObject importObject = new JSONObject();
		task.write(importObject);

		assertEquals(jsonWrite, importObject.toString());
	}
}
