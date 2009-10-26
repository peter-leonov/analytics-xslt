<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dxp='http://schemas.google.com/analytics/2009' xmlns:a='http://www.w3.org/2005/Atom'>
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template match="/">
<pie>
	<xsl:variable name="cities" select="a:feed/a:entry[dxp:dimension[@name='ga:region']/@value != '(not set)']"/>
	<xsl:for-each select="$cities">
	<xsl:sort lang="ru" select="dxp:dimension[@name='ga:region']/@value"/>
	<xsl:variable name="title">
		<xsl:call-template name="FormatCity">
			<xsl:with-param name="city" select="dxp:dimension[@name='ga:region']/@value"/>
		</xsl:call-template>
	</xsl:variable>
	
	<slice title="{$title}">
		<xsl:value-of select="dxp:metric[@name='ga:visits']/@value"/>
	</slice>
	</xsl:for-each>
	
	<slice title="другие регионы">
		<xsl:value-of select="a:feed/dxp:aggregates/dxp:metric[@name='ga:visits']/@value - sum($cities/dxp:metric[@name='ga:visits']/@value)"/>
	</slice>
</pie>
</xsl:template>


<!-- based on http://geekswithblogs.net/workdog/archive/2007/02/08/105858.aspx -->
<xsl:template name="FormatCity">
	<xsl:param name="city"/>
	<xsl:choose>
		<xsl:when test="$city = 'Moscow'">Москва</xsl:when>
		<xsl:when test="$city = 'Moskovskaya oblast'">Московская область</xsl:when>
		<xsl:when test="$city = 'Sankt-Petersburg'">Санкт-Петербург</xsl:when>
		<xsl:when test="$city = 'Sverdlovskaya oblast'">Свердловская область</xsl:when>
		<xsl:otherwise><xsl:value-of select="$city"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>