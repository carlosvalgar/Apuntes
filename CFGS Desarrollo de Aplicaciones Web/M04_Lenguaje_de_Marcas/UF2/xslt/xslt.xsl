<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:strip-space elements="*" />
  <xsl:template match="/musica/musico">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="musico">
    <p><xsl:value-of select="./node()" /><xsl:value-of select="@pais" /><xsl:value-of select="nacido" /></p>
  </xsl:template>

</xsl:stylesheet>