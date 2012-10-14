<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:exsl="http://exslt.org/common"
		xmlns:func="http://exslt.org/functions"
		xmlns:utils="http://exslt.org/utils"
		extension-element-prefixes="exsl func">




	<!-- Small if-then function -->
	<func:function name="utils:ift">
		<xsl:param name="if"/>
		<xsl:param name="then"/>

		<func:result>
			<xsl:if test="$if">
				<xsl:apply-templates select="exsl:node-set($then)" mode="html"/>
			</xsl:if>
		</func:result>
	</func:function>




	<!-- Small if-then-else function -->
	<func:function name="utils:ifte">
		<xsl:param name="if"/>
		<xsl:param name="then"/>
		<xsl:param name="else"/>

		<func:result>
			<xsl:choose>
				<xsl:when test="$if">
					<xsl:apply-templates select="exsl:node-set($then)" mode="html"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="exsl:node-set($else)" mode="html"/>
				</xsl:otherwise>
			</xsl:choose>
		</func:result>
	</func:function>




	<!-- ends-with() for XSLT 1.0 -->
	<func:function name="utils:ends-with">
		<xsl:param name="str1" select="''"/>
		<xsl:param name="str2" select="''"/>

		<xsl:variable name="end" select="substring($str1, string-length($str1) - string-length($str2) + 1)"/>

		<func:result>
			<xsl:value-of select="utils:ifte($str2 = $end, 'yes', 'no')"/>
		</func:result>
	</func:function>




	<!-- min() for XSLT 1.0 -->
	<func:function name="utils:min">
		<xsl:param name="n1" select="'0'"/>
		<xsl:param name="n2" select="'0'"/>

		<xsl:variable name="p1" select="number($n1)"/>
		<xsl:variable name="p2" select="number($n2)"/>

		<func:result>
			<xsl:value-of select="utils:ifte($p1 > $p2, $p2, $p1)"/>
		</func:result>
	</func:function>




</xsl:stylesheet>
