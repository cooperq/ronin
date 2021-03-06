<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes" />

  <xsl:template match="/ronin-overlay">
    <html>
      <head>
        <title>Ronin Overlay :: <xsl:value-of select="title/." /></title>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
        <style type="text/css">
          html {
            height: 100%;
          }

          body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            font-size: 1.0em;
            background: url(http://ronin.rubyforge.org/images/diamond.png) repeat top left;
            over-flow: auto;
          }

          img {
            border: none;
          }

          #content {
            margin: 1em 10em 1em 10em;
            padding: 1em 1em 1em 1em;
            border: 20px solid black;
            background-color: white;
          }

          #content a {
            color: black;
            font-weight: bold;
            text-decoration: none;
          }

          #content pre.shell {
            margin: 0.5em 0 0.5em 0;
            padding: 0.5em;
            color: white;
            background-color: black;
            white-space: pre;
            over-flow: auto;
          }

          #content a:hover {
            color: #BD0000;
          }
        </style>
        <style type="text/css" media="print">
          #content {
            border: none;
          }

          #content a {
            font-weight: normal;
          }
        </style>
      </head>

      <body>
        <div id="page">
          <div id="banner">
            <a href="http://ronin.rubyforge.org/">
              <img id="logo" src="http://ronin.rubyforge.org/images/logo.png" />
            </a>
          </div>

          <div id="content">
            <h2><xsl:value-of select="title/." /></h2>
            <xsl:apply-templates select="description" />

            <xsl:apply-templates select="dependencies" />

            <xsl:apply-templates select="source" />

            <xsl:apply-templates select="maintainers" />

            <xsl:apply-templates select="license" />
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="/ronin-overlay/description">
    <p><xsl:value-of select="." /></p>

    <xsl:if test="@href">
      <p>
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
          [ Continued ]
        </a>
      </p>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/ronin-overlay/dependencies">
    <h2>Dependencies</h2>

    <p>Before installing this Overlay you will need to install some other things first.</p>
    <xsl:if test="gem">
      <pre class="shell">$ <xsl:for-each select="gem"> <xsl:value-of select="." /></xsl:for-each></pre>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/ronin-overlay/source">
    <h2>Install</h2>

    <p>To install this Overlay, simply run the following command:</p>
    <pre class="shell">$ ronin install <xsl:value-of select="." /></pre>
  </xsl:template>

  <xsl:template match="/ronin-overlay/maintainers">
    <h2>Maintainers</h2>

    <ul>
      <xsl:apply-templates select="maintainer" />
    </ul>
  </xsl:template>

  <xsl:template match="/ronin-overlay/maintainers/maintainer">
    <li>
      <xsl:choose>
        <xsl:when test="email">
          <a>
            <xsl:attribute name="href">mailto:<xsl:value-of select="email/." /></xsl:attribute>
            <xsl:value-of select="name/." />
          </a>
        </xsl:when>

        <xsl:otherwise>
          <xsl:value-of select="name/." />
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="/ronin-overlay/license">
    <h2>License</h2>

    <p>
      This Overlay is licensed under the 
      <a>
        <xsl:attribute name="target">blank</xsl:attribute>

        <xsl:choose>
          <xsl:when test="@href">
            <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'GPL-2'">
            <xsl:attribute name="href">http://www.gnu.org/licenses/gpl-2.0.html</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'GPL-3'">
            <xsl:attribute name="href">http://www.gnu.org/licenses/gpl-3.0.html</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'BSD'">
            <xsl:attribute name="href">http://www.opensource.org/licenses/bsd-license.php</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'MIT'">
            <xsl:attribute name="href">http://www.opensource.org/licenses/mit-license.html</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-by'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/by/3.0/</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-by-nd'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/by-nd/3.0/</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-by-nc-nd'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/by-nc-nd/3.0/</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-by-nc'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/by-nc/3.0/</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-by-nc-sa'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/by-nc-sa/3.0/</xsl:attribute>
          </xsl:when>

          <xsl:when test=". = 'CC-sa'">
            <xsl:attribute name="href">http://creativecommons.org/licenses/sa/3.0/</xsl:attribute>
          </xsl:when>
        </xsl:choose>

        <xsl:value-of select="." />
      </a> license.
    </p>
  </xsl:template>
</xsl:stylesheet>
