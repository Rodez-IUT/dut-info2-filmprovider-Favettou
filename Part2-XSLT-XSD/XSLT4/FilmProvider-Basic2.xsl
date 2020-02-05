<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/films">
        <head>
            <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Films</title>
        </head>
        <body>
            <h1>Films</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Résumé</th>
                        <th>Prénom</th>
                        <th>Nom</th>
                    </tr>
                </thead>
                    <xsl:apply-templates select="film" />
            </table>
        </body>


    </xsl:template>

    <xsl:template match="film">
        <tr>
            <td>
                <xsl:value-of select="titre"/>
            </td>
            <td>
                <xsl:value-of select="resume"/>
            </td>
            <td>
                <xsl:variable name="id_real" select="@id_realisateur"/>
                <xsl:value-of select="../realisateur[@id_realisateur=$id_real]/prenom"/>
            </td>
            <td>
                <xsl:variable name="id_real" select="@id_realisateur"/>
                <xsl:value-of select="../realisateur[@id_realisateur=$id_real]/nom"/>
            </td>
        </tr>
    </xsl:template>


</xsl:stylesheet>