<!--
 - Copyright (C) Internet Systems Consortium, Inc. ("ISC")
 -
 - This Source Code Form is subject to the terms of the Mozilla Public
 - License, v. 2.0. If a copy of the MPL was not distributed with this
 - file, you can obtain one at https://mozilla.org/MPL/2.0/.
 -
 - See the COPYRIGHT file distributed with this work for additional
 - information regarding copyright ownership.
-->

<!-- ISC customizations for Docbook-XSL chunked HTML generator -->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:db="http://docbook.org/ns/docbook">

  <!-- Import the Docbook HTML stuff -->
  <xsl:import href="html/chunk.xsl"/>

  <!-- Readable HTML output, please -->
  <xsl:output indent="yes"/>
  <xsl:param name="chunker.output.indent" select="'yes'"/>

  <!-- Chunk at section level, please -->
  <xsl:param name="chunk.section.depth" select="0"/>

  <!-- Generate chunk filenames from id attribute values -->
  <xsl:param name="use.id.as.filename" select="1"/>

  <!-- ANSI C function prototypes, please -->
  <xsl:param name="funcsynopsis.style">ansi</xsl:param>

  <!-- Use ranges when constructing copyrights -->
  <xsl:param name="make.year.ranges" select="1"/>

  <!-- Include our copyright generator -->
  <xsl:include href="copyright.xsl"/>

  <!-- Set comment convention for this output format -->
  <xsl:param name="isc.copyright.leader"> - </xsl:param>
  <xsl:param name="isc.copyright.breakline"/>

  <!-- Generate consistent id attributes -->
  <xsl:param name="generate.consistent.ids" select="1"/>

  <!-- Override Docbook template to insert DOCTYPE and copyright -->
  <xsl:template name="user.preroot">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:comment>
      <xsl:text>&#10;</xsl:text>
      <xsl:value-of select="$isc.copyright"/>
    </xsl:comment>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="root.attributes">
    <xsl:attribute name="lang">en</xsl:attribute>
  </xsl:template>

  <xsl:template name="user.footer.navigation">
    <p style="text-align: center;">BIND 9.11.36 (Extended Support Version)</p>
  </xsl:template>

</xsl:stylesheet>

<!--
  - Local variables:
  - mode: sgml
  - End:
 -->
