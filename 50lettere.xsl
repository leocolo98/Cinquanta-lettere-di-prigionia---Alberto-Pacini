<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">

        <html>
            <head> 
                <script type="text/javascript" src="css_javascript/slider.js" defer="yes"></script>
                <script type="text/javascript" src="css_javascript/50lettere.js"></script>
                <link rel= "stylesheet" href="css_javascript/50lettere.css"/>
                <script src="https://kit.fontawesome.com/1d7498dc84.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" media="screen" href="https://fontlibrary.org//face/tt-norms-medium" type="text/css"/> 
            </head>
            <body>
                <header id="sezione_centrale">
                    <h1 class="titoli_fissi" id="TITOLO">
                        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                    <h2 class="titoli_fissi" id="TITOLINO">
                        Corrispondenza epistolare inedita tra Alberto Pacini, marinaio livornese, e la sua famiglia
                    </h2>
                    <nav id="barra_navigazione">
                        <ul>
                            <li>Home</li>
                            <li>1943</li>
                            <li>1944</li>
                            <li>1945</li>
                            <li>Tutte le lettere</li>
                            <li>La biografia</li>
                        </ul>
                    </nav>
                </header>


                <div class="container" id="contenitore_galleria">
                    <div class="slides">
                        <xsl:apply-templates select="//tei:back/tei:div[@type='immagini_galleria']"/>
                    </div>
                </div>
                <div class="frecce-slides">
                    <button id="prev-btn"><i class="fa-solid fa-circle-arrow-left"></i></button>
                    <button id="next-btn"><i class="fa-solid fa-circle-arrow-right"></i></button>
                </div>

                <div class="contenitori_body" id="contenitore_presentazione">
                    <div id="sottotitolo" class="sottotitoli">
                        <h1>ALBERTO PACINI E LA CORRISPONDENZA</h1>
                    </div>

                    <div id="testo_presentazione">
                        <p class="presentazione">
                            Alberto Pacini (11 settembre 1919 - 11 gennaio 1995) è stato un Internato Militare Italiano, catturato dopo essersi rifiutato di servire la Repubblica di Salò in seguito all'Armistizio.
                        </p>
                        <br/>
                        <p class="presentazione">
                            Dopo un primo periodo nel campo di smistamento di Fallingbostel viene trasferito al campo di lavoro di Treuenbrietzen: in un anno e mezzo di fatiche e dolori, scrivere e ricevere lettere lo ha aiutato in qualche modo ad alleggerire la situazione, che era di per sè drammatica.
                        </p>
                        <br/>
                        <p class="presentazione">
                            Leggere, analizzare e interpretare le suddette lettere può essere un modo per condividere, a distanza di quasi ottant'anni, quelle stesse emozioni e sensazioni.
                        </p>
                    </div>
                </div>

                <!-- contenitore che racchiude le anteprime delle lettere -->
                <div class="contenitori_body" id="contenitore_anteprime">
                    <h1 id="titolo_anteprime">Seleziona una lettera per visualizzarne alcune informazioni e la sua trascrizione</h1>
                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:facsimile">
                        <div class="div_anteprima" id="anteprima_lettera{position()}">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                </div>

                <!-- contenitore che racchiude la lettera da visualizzare -->
                <div class="contenitori_body" id="contenitore_lettere">
                    <xsl:for-each select="tei:teiCorpus/tei:TEI">
                        <div class="lettera" id="lettera{position()}">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                </div>

                <!-- contenitore che racchiude la lettera da visualizzare -->
                <div class="contenitori_body" id="contenitore_biografia">
                    <h1>La biografia di Alberto Pacini</h1>
                    <div class="biografia" id="biografia_testo">    
                        <xsl:apply-templates select="//tei:back/tei:div[@type='biografia']/tei:p[@n='1']"/>
                        <xsl:apply-templates select="//tei:back/tei:div[@type='immagini_biografia']/tei:figure[@xml:id='angiolo']"/>
                        <xsl:apply-templates select="//tei:back/tei:div[@type='immagini_biografia']/tei:figure[@xml:id='argia']"/>
                        <xsl:apply-templates select="//tei:back/tei:div[@type='biografia']/tei:p[@n='2']"/>
                        <xsl:apply-templates select="//tei:back/tei:div[@type='biografia']/tei:p[@n='3']"/>
                    </div>
                    <div class="biografia" id="biografia_galleria">
                        <xsl:apply-templates select="//tei:back/tei:div[@type='immagini_biografia']/tei:figure[@xml:id='famiglia1']"/>
                    </div>
                    <div class="biografia" id="biografia_maxi">
                    <xsl:apply-templates select="//tei:back/tei:div[@type='biografia']/tei:p[@n='4']"/>
                        <xsl:apply-templates select="//tei:back/tei:div[@type='immagini_biografia']/tei:figure[@xml:id='angiolo_cuoco']"/>
                    </div>
                </div>

                
                <!-- footer da cambiare o togliere-->
                <footer>
                    <div id="testo_footer"> 
                        <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc"/>
                    </div>
                </footer>

            </body>
        </html>
    </xsl:template>


    <xsl:template match="//tei:back/tei:div">
        <xsl:for-each select="tei:figure">
            <div class="slide">
                <xsl:element name="img">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select='tei:graphic/@url'/>
                    </xsl:attribute>
                </xsl:element>
                <div class="slide-content">
                    <p><xsl:value-of select="tei:head"/></p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="//tei:back/tei:div/tei:figure">
        <xsl:element name="img">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select='tei:graphic/@url'/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:back/tei:div/tei:p">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="@class"/>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <!-- ######################################################## -->
    <!-- ##### TEMPLATE PER PRENDERE ANTEPRIME DELLE LETTERE ##### -->
    <!-- ######################################################## -->
    
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:facsimile">
        <xsl:element name="p">
            <xsl:attribute name="class">titolo_anteprima_lettera</xsl:attribute>
            <xsl:value-of select="../tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        </xsl:element>
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('Immagini/anteprime/', substring-after(tei:surfaceGrp[1]/tei:surface[1]/tei:graphic/@url,'Immagini/image/'))"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="concat('anteprima_lettere_', substring-before(../tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:date/@when,'-'))"/>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="concat('anteprima_', tei:surfaceGrp[1]/tei:surface[1]/@xml:id)"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <!-- ######################################################## -->
    <!-- ### TEMPLATE PER PRENDERE INFORMAZIONI SULLE LETTERE ### -->
    <!-- ######################################################## -->
    
    <!-- template generico che richiama tutti i template di ogni lettera-->
    <xsl:template match="tei:teiCorpus/tei:TEI">
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/> <!-- prende titolo lettera -->
        <div class="indirizzi">
            <table class="tabella_partenza">
                <tr class="tr_indirizzi">
                    <th colspan="5"> INDIRIZZO DI PARTENZA:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div/tei:div[@type='mittente']/tei:ab/tei:address">
                        <xsl:for-each select="tei:text/tei:body/tei:div/tei:div[@type='mittente']/tei:ab/tei:address">
                            <xsl:apply-templates select="tei:addrLine"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat/tei:ab[@type='mittente']/tei:address">
                        <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat/tei:ab[@type='mittente']/tei:address">
                            <xsl:apply-templates select="tei:addrLine"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibile </td>
                    </xsl:otherwise>
                </xsl:choose>
            </table>
            <table class="tabella_destinazione">   
                <tr class="tr_indirizzi">    
                    <th colspan="5">INDIRIZZO DI DESTINAZIONE:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div/tei:div[@type='destinatario']/tei:ab/tei:address">
                        <xsl:for-each select="tei:text/tei:body/tei:div/tei:div[@type='destinatario']/tei:ab/tei:address">
                            <xsl:apply-templates select="tei:addrLine"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat/tei:ab[@type='destinatario']/tei:address">
                        <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat/tei:ab[@type='destinatario']/tei:address">
                            <xsl:apply-templates select="tei:addrLine"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibile </td>
                    </xsl:otherwise>
                </xsl:choose>  
            </table>
        </div>
        <xsl:for-each select="tei:facsimile/tei:surfaceGrp">
            <xsl:apply-templates select="tei:surface/tei:graphic/@url"/> <!-- prende immagini lettera -->
        </xsl:for-each>
        <div class="dettagli">
            <table class="tabella_dettagli">
                <tr>
                    <th colspan="5">STAMPE:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div/tei:div[@type='stamp']/tei:ab">
                        <xsl:for-each select="tei:text/tei:body/tei:div/tei:div[@type='stamp']/tei:ab">
                            <xsl:apply-templates select="tei:stamp"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibili </td>
                    </xsl:otherwise>
                </xsl:choose>  
                <tr>
                    <th colspan="5">TIMBRI E FRANCOBOLLI:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div/tei:div[@type='francobolli_e_timbri']/tei:ab">
                        <xsl:for-each select="tei:text/tei:body/tei:div/tei:div[@type='francobolli_e_timbri']/tei:ab">
                            <xsl:apply-templates select="tei:stamp"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat">
                        <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat">
                            <xsl:apply-templates select="tei:stamp"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibili </td>
                    </xsl:otherwise>
                </xsl:choose>
                <tr>
                    <th colspan="5">NOTE AGGIUNTIVE:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div/tei:div[@type='messaggio_aggiunto']/tei:ab">
                        <xsl:for-each select="tei:text/tei:body/tei:div/tei:div[@type='messaggio_aggiunto']/tei:ab">
                            <xsl:apply-templates select="tei:seg"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat">
                        <xsl:for-each select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat">
                            <xsl:apply-templates select="tei:seg"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibili </td>
                    </xsl:otherwise>
                </xsl:choose> 
                <tr>
                    <th colspan="5">ALTRE STAMPE:</th>
                </tr>
                <xsl:choose>
                    <xsl:when test="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='intestazione']/tei:ab">
                        <xsl:for-each select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='intestazione']/tei:ab">
                            <xsl:apply-templates select="tei:stamp"/> 
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibili </td>
                    </xsl:otherwise>
                </xsl:choose>  
            </table>
            <xsl:apply-templates select="tei:text/tei:body"/>
        </div>
        <div class="mappe">
            <!-- generare mappe --> 
            <xsl:for-each select="tei:facsimile/tei:surfaceGrp">
                <xsl:for-each select="tei:surface">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:for-each>
        </div>
    </xsl:template>


        <!-- titolo lettera -->
        <xsl:template match="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
            <p class="titolo_lettera">
                <xsl:value-of select="."/>
            </p>
        </xsl:template>

        <!-- immagine -->
        <xsl:template match="tei:surface/tei:graphic/@url">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="."/>
                </xsl:attribute>
                <xsl:attribute name="class">img_lettera</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="../../@xml:id"/>
                </xsl:attribute>
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#mappa_', ../../@xml:id)"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:template>

        <!-- numero lettera -->
        <xsl:template match="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:template>

        <!-- indirizzi -->
        <xsl:template match="tei:addrLine">
            <xsl:element name="tr">
                <xsl:attribute name="class">tr_indirizzi</xsl:attribute>
                <xsl:for-each select="*">
                    <xsl:choose>  
                        <xsl:when test="tei:choice">
                            <xsl:apply-templates select="tei:choice"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="td">
                                <xsl:attribute name="id">
                                    <!-- utilizzo substring per non considerare il puntatore "#" -->
                                    <xsl:value-of select="substring(@facs,2)"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:element>
        </xsl:template> 

        <!-- stampe + timbri e francobolli -->
        <xsl:template match="tei:stamp">
            <xsl:element name="tr">
                <xsl:choose>  
                    <xsl:when test="tei:choice">
                        <xsl:apply-templates select="tei:choice"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="td">
                            <xsl:attribute name="id">
                                <!-- utilizzo substring per non considerare il puntatore "#" -->
                                <xsl:value-of select="substring(@facs,2)"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:template>

        <!-- aggiunte -->
        <xsl:template match="tei:seg">
            <xsl:element name="tr">
                <xsl:choose>  
                    <xsl:when test="tei:choice">
                        <xsl:apply-templates select="tei:choice"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="td">
                            <xsl:attribute name="id">
                                <!-- utilizzo substring per non considerare il puntatore "#" -->
                                <xsl:value-of select="substring(@facs,2)"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:template>

        <!-- messaggio e sue componenti-->
        <xsl:template match="tei:text/tei:body">
            <xsl:element name="table">
                <xsl:element name="tr">
                    <xsl:element name="th">MESSAGGIO:</xsl:element>
                </xsl:element>
                <xsl:apply-templates select="tei:div/tei:div[@type='messaggio']/tei:opener/tei:dateline"/>
            </xsl:element>
            <xsl:apply-templates select="tei:div/tei:div[@type='messaggio']/tei:opener/tei:salute"/>
            <xsl:apply-templates select="tei:div/tei:div[@type='messaggio']/tei:ab"/>
            <xsl:apply-templates select="tei:div/tei:div[@type='messaggio']/tei:closer"/>
        </xsl:template>

        <!-- data e luogo -->
        <xsl:template match="tei:div/tei:div[@type='messaggio']/tei:opener/tei:dateline">
            <xsl:element name="tr">
                <xsl:element name="td">
                    Luogo:
                </xsl:element>
                <xsl:choose>
                    <xsl:when test="tei:placeName">
                        <xsl:for-each select="tei:placeName">
                            <xsl:element name="td">
                                <xsl:attribute name="id">
                                    <!-- utilizzo substring per non considerare il puntatore "#" -->
                                    <xsl:value-of select="substring(@facs,2)"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibile </td>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:element>
            <xsl:element name="tr">
                <xsl:element name="td">
                    Data:
                </xsl:element>
                <xsl:choose>
                    <xsl:when test="tei:date">
                        <xsl:for-each select="tei:date">
                            <xsl:element name="td">
                                <xsl:attribute name="id">
                                    <!-- utilizzo substring per non considerare il puntatore "#" -->
                                    <xsl:value-of select="substring(@facs,2)"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <td> Non disponibile </td>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:element>
        </xsl:template>

        <!-- saluto iniziale -->
        <xsl:template match="tei:div/tei:div[@type='messaggio']/tei:opener/tei:salute">
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring(@facs,2)"/>
                </xsl:attribute>
                2 ➛ &#160;
            </xsl:element>
            <xsl:value-of select="."/>
        </xsl:template>

        <!-- righe -->
        <xsl:template match="tei:div/tei:div[@type='messaggio']/tei:ab">
            <xsl:apply-templates select="node() except tei:anchor"/>
        </xsl:template>

        <xsl:template match="tei:ab/tei:lb[1]">
            <br/>
            <br/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring(@facs,2)"/>
                </xsl:attribute>
                <xsl:value-of select="@n"/> ➛
            </xsl:element>
            &#160;
        </xsl:template>

        <xsl:template match="tei:ab/tei:lb[position() > 1]">
            <br/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring(@facs,2)"/>
                </xsl:attribute>
                <xsl:value-of select="@n"/> ➛
            </xsl:element>
            &#160;
        </xsl:template>

        <xsl:template match="tei:anchor">
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring(@facs,2)"/>
                </xsl:attribute>
                2 ➛
            </xsl:element>
            &#160;
        </xsl:template>
        
        <xsl:template match="tei:persName">
            <xsl:choose>    
                <xsl:when test="tei:choice">
                    <xsl:apply-templates select="tei:choice"/>
                </xsl:when>
                <xsl:otherwise>
                    &#160;<xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        

        <!-- closer -->
        <xsl:template match="tei:div/tei:div[@type='messaggio']/tei:closer">
            <br/>
            <br/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:choose>
                        <xsl:when test="@facs">
                            <!-- utilizzo substring per non considerare il puntatore "#" -->
                            <xsl:value-of select="substring(@facs,2)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring(tei:signed/@facs,2)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="preceding-sibling::*[1]/@n"/> ➛
                &#160;
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:template>

        <xsl:template match="tei:closer/tei:seg">
            <br/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    span_righe
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring(@facs,2)"/>
                </xsl:attribute>
                <xsl:value-of select="@n"/> ➛
            </xsl:element>
            <xsl:value-of select="."/>
            &#160;
        </xsl:template>

        <!-- template per scegliere l'espansione quando ho un abbreviazione -->
        <xsl:template match="tei:choice">
            <xsl:element name="td">
                <xsl:attribute name="id">
                    <!-- utilizzo substring per non considerare il puntatore "#" -->
                    <xsl:value-of select="tei:choice/../substring(@facs,2)"/>
                </xsl:attribute>
                &#160;<xsl:value-of select="tei:choice/tei:expan"/>
            </xsl:element>
        </xsl:template>
                    
        <!-- ######################################################### -->  

        <!-- GENERARE MAPPE -->
        <xsl:template match="tei:surface">
            <map class="Map"> 
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('mappa_', @xml:id)"/>
                </xsl:attribute>
                <xsl:variable name="width_original">
                    <xsl:value-of select="substring-before(tei:graphic/@width,'px')"/>
                </xsl:variable>
                <xsl:variable name="height_original">
                    <xsl:value-of select="substring-before(tei:graphic/@height,'px')"/>
                </xsl:variable>
                <xsl:variable name="width_site">
                    436.367
                </xsl:variable>
                <xsl:variable name="height_site">
                    1
                </xsl:variable>
                <xsl:variable name="rapp_width">
                    <xsl:value-of select="$width_original div $width_site"/>
                </xsl:variable>
                <xsl:variable name="rapp_height">
                    <xsl:value-of select="$height_original div $height_site"/>
                </xsl:variable>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">   
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('zona_', @xml:id)"/>       
                        </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="@ulx">
                                    <xsl:attribute name="shape">
                                        <xsl:text>rect</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="@ulx div $rapp_width"/>,<xsl:value-of select="@uly div $rapp_width"/>,<xsl:value-of select="@lrx div $rapp_width"/>,<xsl:value-of select="@lry div $rapp_width"/>
                                    </xsl:attribute>
                                    <!-- moltiplico le coordinate originali (zona per zona) per i rapporti tra le grandezze delle immagini (originali e del sito), in questo modo ottengo le coordinate proporzionali delle zone appartenenti alle immagini sul sito-->
                                </xsl:when>
                               
                            </xsl:choose>
                        <xsl:attribute name="onmouseover">
                            <xsl:value-of select="concat('gestoreEvidenzia(&quot;', @xml:id, '&quot;)' )"/>
                        </xsl:attribute>
                        <xsl:attribute name="onmouseout">
                            <xsl:value-of select="concat('gestoreDisEvidenzia(&quot;', @xml:id, '&quot;)' )"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </map>
        </xsl:template>   

    <!-- ######################################################### -->
    <!-- TEMPLATE PER PRENDERE INFORMAZIONI GENERALI SITO (FOOTER) -->
    <!-- ######################################################### -->

    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <h2 id="titolo_info_pubblicazione">Informazioni sulla pubblicazione</h2>
        <div id="info_pubblicazione">
            <xsl:apply-templates select="tei:publicationStmt"/>
            <!-- <xsl:apply-templates select="tei:publicationStmt/tei:availability"/> -->
        </div>
        <h2 id="titolo_info_edizione">Informazioni sull'edizione</h2>
        <div id="info_edizione">
            <xsl:for-each select="tei:titleStmt/tei:respStmt">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
            <xsl:for-each select="tei:editionStmt/tei:respStmt">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- Pubblicato da e presso -->
    <xsl:template match="tei:publicationStmt">
        <p class="p_footer"> Pubblicato da: <xsl:value-of select="tei:publisher"/>, <xsl:value-of select="tei:pubPlace"/> </p>  
    </xsl:template>
    
    <!-- Licenza, da capire se la devo inserire
    <xsl:template match="tei:publicationStmt/tei:availability">
        <p> Licenza: <xsl:value-of select="."/> </p> 
    </xsl:template> -->

    <!-- Trascritto da -->
    <xsl:template match="tei:titleStmt/tei:respStmt">
        <p class="p_footer"> <xsl:value-of select="tei:resp"/>: <xsl:value-of select="tei:name"/> </p> 
    </xsl:template>


    <!-- Compilatore, responsabile scientifico e funzionario responsabile --> 
    <xsl:template match="tei:editionStmt/tei:respStmt">
        <p class="p_footer"> <xsl:value-of select="tei:resp"/>: <xsl:value-of select="tei:name"/></p>
    </xsl:template>

    <!-- ######################################################### -->

</xsl:stylesheet>