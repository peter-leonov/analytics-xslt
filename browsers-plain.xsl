<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dxp='http://schemas.google.com/analytics/2009' xmlns:a='http://www.w3.org/2005/Atom'>
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template match="/">
<pie>
	<xsl:variable name="opera" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Opera']"/>
	<xsl:variable name="opera_sum" select="sum($opera/dxp:metric[@name='ga:visits']/@value)"/>
	<slice title="Opera" color="#cc2200">
		<xsl:value-of select="$opera_sum"/>
	</slice>
	
	
	<xsl:variable name="opera_mini" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Opera Mini']"/>
	<xsl:variable name="opera_mini_sum" select="sum($opera_mini/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Opera Mini" color="#cc5533">
		<xsl:value-of select="$opera_mini_sum"/>
	</slice>
	
	
	<xsl:variable name="firefox" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Firefox']"/>
	<xsl:variable name="firefox_sum" select="sum($firefox/dxp:metric[@name='ga:visits']/@value)"/>
	<slice title="Firefox" color="#ff9900">
		<xsl:value-of select="$firefox_sum"/>
	</slice>
	
	
	<xsl:variable name="explorer" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Internet Explorer']"/>
	<xsl:variable name="explorer_sum" select="sum($explorer/dxp:metric[@name='ga:visits']/@value)"/>
	<slice title="Explorer" color="#4499ff">
		<xsl:value-of select="$explorer_sum"/>
	</slice>
	
	
	<xsl:variable name="safari" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Safari']"/>
	<xsl:variable name="safari_sum" select="sum($safari/dxp:metric[@name='ga:visits']/@value)"/>
	<slice title="Safari" color="#66ddff">
		<xsl:value-of select="$safari_sum"/>
	</slice>
	
	
	<xsl:variable name="chrome" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Chrome']"/>
	<xsl:variable name="chrome_sum" select="sum($chrome/dxp:metric[@name='ga:visits']/@value)"/>
	<slice title="Chrome" color="#66cc22">
		<xsl:value-of select="$chrome_sum"/>
	</slice>
	
	
	
	<slice title="остальные" color="#999999">
		<xsl:variable name="total" select="a:feed/dxp:aggregates/dxp:metric[@name='ga:visits']/@value"/>
		<xsl:value-of select="$total - $opera_sum - $opera_mini_sum - $firefox_sum - $explorer_sum - $safari_sum - $chrome_sum"/>
	</slice>
</pie>
</xsl:template>
</xsl:stylesheet>