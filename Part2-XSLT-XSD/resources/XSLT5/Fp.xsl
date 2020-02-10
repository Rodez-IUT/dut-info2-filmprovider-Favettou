<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="films">
        <html>
            <head>
                <title>Film Provider</title>
            </head>

            <body>
                <h1>Liste des films</h1>
                <table width="60%">
                    <xsl:apply-templates select="film">
                        <xsl:sort select="attribute::annee" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">

        <xsl:variable name="idRea" select="attribute::id_realisateur"/>
        <xsl:variable name="image" select="resume/image/attribute::source"/>

        <tr>
            <td colspan="2">
                <b><xsl:value-of select="titre"/></b>
                <i>(<xsl:value-of select="../realisateur[attribute::id_realisateur = $idRea]"/>)</i>
            </td>
        </tr>
        <tr>
            <xsl:if test="resume/image=true()">
                <td>
                    <img src="{$image}"/>
                </td>
                <td>
                    <xsl:value-of select="resume/text"/>
                </td>
            </xsl:if>
            <xsl:if test="resume/image=false()">
                <td colspan="2">
                    <xsl:value-of select="resume/text"/>
                </td>
            </xsl:if>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </xsl:template>


</xsl:stylesheet>