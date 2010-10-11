<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dxp='http://schemas.google.com/analytics/2009' xmlns:a='http://www.w3.org/2005/Atom'>
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template match="/">
<pie>
	<xsl:variable name="opera" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Opera']"/>
	<xsl:variable name="opera_10_7" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 4) = '10.7']"/>
	<xsl:variable name="opera_10_6" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 4) = '10.6']"/>
	<xsl:variable name="opera_10_5" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 4) = '10.5']"/>
	<xsl:variable name="opera_10_1" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 4) = '10.1']"/>
	<xsl:variable name="opera_10_0" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 4) = '10.0']"/>
	<xsl:variable name="opera_9_6" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '9.6']"/>
	<xsl:variable name="opera_9_5" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '9.5']"/>
	<xsl:variable name="opera_9_2" select="$opera[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '9.2']"/>
	
	<xsl:variable name="opera_sum" select="sum($opera/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_10_7_sum" select="sum($opera_10_7/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_10_6_sum" select="sum($opera_10_6/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_10_5_sum" select="sum($opera_10_5/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_10_1_sum" select="sum($opera_10_1/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_10_0_sum" select="sum($opera_10_0/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_9_6_sum" select="sum($opera_9_6/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_9_5_sum" select="sum($opera_9_5/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="opera_9_2_sum" select="sum($opera_9_2/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Opera 10.7" color="#cc2200" label_radius="70">
		<xsl:value-of select="$opera_10_7_sum"/>
	</slice>
	<slice title="Opera 10.6" color="#cc2200" label_radius="70">
		<xsl:value-of select="$opera_10_6_sum"/>
	</slice>
	<slice title="Opera 10.5" color="#cc2200" label_radius="70">
		<xsl:value-of select="$opera_10_5_sum"/>
	</slice>
	<slice title="Opera 10.1" color="#cc2200">
		<xsl:value-of select="$opera_10_1_sum"/>
	</slice>
	<slice title="Opera 10.0" color="#cc2200">
		<xsl:value-of select="$opera_10_0_sum"/>
	</slice>
	<slice title="Opera 9.6" color="#cc4422">
		<xsl:value-of select="$opera_9_6_sum"/>
	</slice>
	<slice title="Opera 9.5" color="#cc5533">
		<xsl:value-of select="$opera_9_5_sum"/>
	</slice>
	<slice title="Opera 9.2" color="#cc6644">
		<xsl:value-of select="$opera_9_2_sum"/>
	</slice>
	<slice title="другие оперы" color="#cc7755">
		<xsl:value-of select="$opera_sum - $opera_10_7_sum - $opera_10_6_sum - $opera_10_5_sum - $opera_10_1_sum - $opera_10_0_sum - $opera_9_6_sum - $opera_9_5_sum - $opera_9_2_sum"/>
	</slice>
	
	
	<xsl:variable name="firefox" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Firefox']"/>
	<xsl:variable name="firefox_3_6" select="$firefox[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '3.6']"/>
	<xsl:variable name="firefox_3_5" select="$firefox[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '3.5']"/>
	<xsl:variable name="firefox_3_0" select="$firefox[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '3.0']"/>
	<xsl:variable name="firefox_2_0" select="$firefox[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '2.0']"/>
	
	<xsl:variable name="firefox_sum" select="sum($firefox/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="firefox_3_6_sum" select="sum($firefox_3_6/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="firefox_3_5_sum" select="sum($firefox_3_5/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="firefox_3_0_sum" select="sum($firefox_3_0/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="firefox_2_0_sum" select="sum($firefox_2_0/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Firefox 3.6" color="#ff9900">
		<xsl:value-of select="$firefox_3_6_sum"/>
	</slice>
	<slice title="Firefox 3.5" color="#ffaa11">
		<xsl:value-of select="$firefox_3_5_sum"/>
	</slice>
	<slice title="Firefox 3.0" color="#ffbb22">
		<xsl:value-of select="$firefox_3_0_sum"/>
	</slice>
	<slice title="Firefox 2.0" color="#ffcc33">
		<xsl:value-of select="$firefox_2_0_sum"/>
	</slice>
	<slice title="другие лисы" color="#ffdd44">
		<xsl:value-of select="$firefox_sum - $firefox_3_6_sum - $firefox_3_5_sum - $firefox_3_0_sum - $firefox_2_0_sum"/>
	</slice>
	
	
	<xsl:variable name="explorer" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Internet Explorer']"/>
	<xsl:variable name="explorer_8" select="$explorer[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '8.0']"/>
	<xsl:variable name="explorer_7" select="$explorer[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '7.0']"/>
	<xsl:variable name="explorer_6" select="$explorer[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '6.0']"/>
	
	<xsl:variable name="explorer_sum" select="sum($explorer/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="explorer_8_sum" select="sum($explorer_8/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="explorer_7_sum" select="sum($explorer_7/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="explorer_6_sum" select="sum($explorer_6/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Explorer 8" color="#4499ff">
		<xsl:value-of select="$explorer_8_sum"/>
	</slice>
	<slice title="Explorer 7" color="#55aaff">
		<xsl:value-of select="$explorer_7_sum"/>
	</slice>
	<slice title="Explorer 6" color="#66bbff">
		<xsl:value-of select="$explorer_6_sum"/>
	</slice>
	<slice title="другие эксплореры" color="#77ccff">
		<xsl:value-of select="$explorer_sum - $explorer_8_sum - $explorer_7_sum - $explorer_6_sum"/>
	</slice>
	
	
	<xsl:variable name="safari" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Safari']"/>
	<xsl:variable name="safari_sum" select="sum($safari/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Safari" color="#66ddff">
		<xsl:value-of select="$safari_sum"/>
	</slice>
	
	
	<xsl:variable name="chrome" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Chrome']"/>
	<xsl:variable name="chrome_5" select="$chrome[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '5.0']"/>
	<xsl:variable name="chrome_4_1" select="$chrome[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '4.1']"/>
	<xsl:variable name="chrome_4" select="$chrome[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '4.0']"/>
	<xsl:variable name="chrome_3" select="$chrome[substring(dxp:dimension[@name='ga:browserVersion']/@value, 1, 3) = '3.0']"/>
	
	<xsl:variable name="chrome_sum" select="sum($chrome/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="chrome_5_sum" select="sum($chrome_5/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="chrome_4_1_sum" select="sum($chrome_4_1/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="chrome_4_sum" select="sum($chrome_4/dxp:metric[@name='ga:visits']/@value)"/>
	<xsl:variable name="chrome_3_sum" select="sum($chrome_3/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Chrome 5" color="#66cc22">
		<xsl:value-of select="$chrome_5_sum"/>
	</slice>
	<slice title="Chrome 4.1" color="#88cc44" label_radius="20">
		<xsl:value-of select="$chrome_4_1_sum"/>
	</slice>
	<slice title="Chrome 4" color="#aacc66" label_radius="50">
		<xsl:value-of select="$chrome_4_sum"/>
	</slice>
	<slice title="Chrome 3" color="#cccc88" label_radius="20">
		<xsl:value-of select="$chrome_3_sum"/>
	</slice>
	<slice title="другие хромы" color="#ccccaa">
		<xsl:value-of select="$chrome_sum - $chrome_5_sum - $chrome_4_1_sum - $chrome_4_sum - $chrome_3_sum"/>
	</slice>
	
	<xsl:variable name="opera_mini" select="a:feed/a:entry[dxp:dimension[@name='ga:browser']/@value = 'Opera Mini']"/>
	<xsl:variable name="opera_mini_sum" select="sum($opera_mini/dxp:metric[@name='ga:visits']/@value)"/>
	
	<slice title="Opera Mini" color="#888888">
		<xsl:value-of select="$opera_mini_sum"/>
	</slice>
	
	<slice title="остальные" color="#999999">
		<xsl:variable name="total" select="a:feed/dxp:aggregates/dxp:metric[@name='ga:visits']/@value"/>
		<xsl:value-of select="$total - $opera_sum - $opera_mini_sum - $firefox_sum - $explorer_sum - $safari_sum - $chrome_sum"/>
	</slice>
</pie>
</xsl:template>
</xsl:stylesheet>