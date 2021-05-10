<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="/">
    <xsl:for-each select="musica/musico">
      <p><xsl:value-of select="text()"/> nació en <xsl:value-of select="@pais" /> en <xsl:value-of select="nacido" /> y vivió <xsl:value-of select="fallecido - nacido"/> años.</p>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>