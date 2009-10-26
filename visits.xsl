<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dxp='http://schemas.google.com/analytics/2009' xmlns:a='http://www.w3.org/2005/Atom'>
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template match="/">
<chart>
	<series>
		<xsl:for-each select="a:feed/a:entry">
		<value xid="{position()-1}">
			<xsl:call-template name="FormatDate">
				<xsl:with-param name="DateTime" select="dxp:dimension[@name='ga:date']/@value"/>
			</xsl:call-template>
		</value>
		</xsl:for-each>
	</series>
	<graphs>
		<graph gid="pageviews">
			<xsl:for-each select="a:feed/a:entry">
			<value xid="{position()-1}"><xsl:value-of select="dxp:metric[@name='ga:pageviews']/@value"/></value>
			</xsl:for-each>
		</graph>
		<graph gid="visits">
			<xsl:for-each select="a:feed/a:entry">
			<value xid="{position()-1}"><xsl:value-of select="dxp:metric[@name='ga:visits']/@value"/></value>
			</xsl:for-each>
		</graph>
	</graphs>
</chart>
</xsl:template>


<!-- based on http://geekswithblogs.net/workdog/archive/2007/02/08/105858.aspx -->
<xsl:template name="FormatDate">
	<xsl:param name="DateTime" />
	<!-- from 20090719 to 19 июля -->
	<xsl:value-of select="substring($DateTime,7,2)"/>
	<xsl:value-of select="' '"/>
	<xsl:variable name="mo">
		<xsl:value-of select="substring($DateTime,5,2)" />
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$mo = '01'">января</xsl:when>
		<xsl:when test="$mo = '02'">февраля</xsl:when>
		<xsl:when test="$mo = '03'">марта</xsl:when>
		<xsl:when test="$mo = '04'">апреля</xsl:when>
		<xsl:when test="$mo = '05'">мая</xsl:when>
		<xsl:when test="$mo = '06'">июня</xsl:when>
		<xsl:when test="$mo = '07'">июля</xsl:when>
		<xsl:when test="$mo = '08'">августа</xsl:when>
		<xsl:when test="$mo = '09'">сентября</xsl:when>
		<xsl:when test="$mo = '10'">октября</xsl:when>
		<xsl:when test="$mo = '11'">ноября</xsl:when>
		<xsl:when test="$mo = '12'">декабря</xsl:when>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>