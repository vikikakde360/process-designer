<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
	<xsl:output method="xml" />
	
	<!-- Root element -->
	<xsl:template match="process">
		<div class="processdata">
			<div id="oryxcanvas" class="-oryx-canvas">
				<span class="oryx-type">http://b3mn.org/stencilset/bpel#Process</span>
				<span class="oryx-mode">writeable</span>
				<span class="oryx-mode">fullscreen</span>
				<a rel="oryx-stencilset" href="./stencilsets/bpel/bpel.json"/>
				<xsl:call-template name="add-render"/>
			</div>	
	         <div id="oryx_1">
				<span class="oryx-type">http://b3mn.org/stencilset/bpel#BPEL</span>
				<span class="oryx-bounds">114,18,714,518</span>
				<a rel="raziel-parent" href="#oryx-canvas123"/>
				<xsl:call-template name="add-attributes"/>
				<xsl:call-template name="add-children-nodes">
					<xsl:with-param name="parentID">oryx_1</xsl:with-param>
					<xsl:with-param name="parentBoundLeftUpperX">114</xsl:with-param>
					<xsl:with-param name="parentBoundLeftUpperY">18</xsl:with-param>
				</xsl:call-template>		
			</div>
		</div>	 
	</xsl:template>
	
	<xsl:template name="add-attributes">
	</xsl:template>
	
	<xsl:template name="add-children-nodes">
		<xsl:param name="parentID"/>
		<xsl:param name="parentBoundLeftUpperX"/>
		<xsl:param name="parentBoundLeftUpperY"/>
		
		<!--invoke-->	
		<xsl:template match="invoke">
			<xsl:variable name="id">	
				<xsl:value-of select="concat($parentID,'_',position())" />
			</xsl:variable>
			<xsl:variable name="BoundLUX" select="$parentBoundLeftUpperX + position()+ 30" />
			<xsl:variable name="BoundLUY" select="$parentBoundLeftUpperY + position()+ 30" />
			<xsl:variable name="BoundRLX" select="$BoundLUX + 100" />
			<xsl:variable name="BoundRLY" select="$BoundLUY + 80" />
	
			<div id="$id">
				<span class="oryx-type">http://b3mn.org/stencilset/bpel#invoke</span>
				<span class="oryx-bounds">$BoundLUX,$BoundLUY,$BoundRLX,$BoundRLY</span>
				<a rel="raziel-parent" href="concat('#',$parentID)"/>
				<xsl:call-template name="add-attributes"/>
			</div>
		</xsl:template>	
		
		<!--receive-->	
		<xsl:template match="receive">
			<xsl:variable name="id">	
				<xsl:value-of select="concat($parentID,'_',position())" />
			</xsl:variable>
			<xsl:variable name="BoundLUX" select="$parentBoundLeftUpperX + position()+ 30" />
			<xsl:variable name="BoundLUY" select="$parentBoundLeftUpperY + position()+ 30" />
			<xsl:variable name="BoundRLX" select="$BoundLUX + 100" />
			<xsl:variable name="BoundRLY" select="$BoundLUY + 80" />
	
			<div id="$id">
				<span class="oryx-type">http://b3mn.org/stencilset/bpel#receive</span>
				<span class="oryx-bounds">$BoundLUX,$BoundLUY,$BoundRLX,$BoundRLY</span>
				<a rel="raziel-parent" href="concat('#',$parentID)"/>
				<xsl:call-template name="add-attributes"/>
			</div>
		</xsl:template>	
	</xsl:template>
				
	<xsl:template name="add-render">
		 <a rel="oryx-render" href="#oryx_1" />
		<xsl:call-template name="DFS-for-adding-render">
			<xsl:with-param name="parentID">#oryx_1</xsl:with-param>
	    </xsl:call-template>
	</xsl:template>
		
	<xsl:template name="DFS-for-adding-render">
		<xsl:param name="parentID"/>
		
		<xsl:template match="invoke|receive|reply|assign|copy|empty|opaqueActivity|validate|extensionActivity|wait|throw|exit|rethrow|if|elseif|else|flow|sequence|link|pick|onMessage|onAlarm|while|repeatUntil|forEach|compensate|compensateScope|scope|onEvent|terminationHandler|catch|catchAll|compensationHandler" >	
 		    <xsl:variable name="id">
 		    	<xsl:value-of select="concat($parentID,'_',position())"/>
			</xsl:variable>	
 		    		
 			<a rel="oryx-render">
 				<xsl:attribute name="href">
 					<xsl:value-of select="$id" />
				</xsl:attribute>
			</a>
			
  			<xsl:call-template name="DFS-for-adding-render">
   				<xsl:with-param name="parentID" select="id"/>
  			</xsl:call-template>
 		
		</xsl:template>
    </xsl:template>		

</xsl:stylesheet>
		