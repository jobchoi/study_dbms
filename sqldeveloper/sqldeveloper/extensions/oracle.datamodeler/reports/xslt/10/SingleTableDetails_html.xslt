<?xml version="1.0" encoding="UTF-8"?><!--Designed and generated by Altova StyleVision Enterprise Edition 2014 (x64) - see http://www.altova.com/stylevision for more information.--><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:altova="http://www.altova.com" xmlns:altovaext="http://www.altova.com/xslt-extensions" xmlns:clitype="clitype" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:iso4217="http://www.xbrl.org/2003/iso4217" xmlns:ix="http://www.xbrl.org/2008/inlineXBRL" xmlns:java="java" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:n1="http://oracle.com/datamodeler/reports/table" xmlns:sps="http://www.altova.com/StyleVision/user-xpath-functions" xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="altova altovaext clitype fn iso4217 ix java link n1 sps xbrldi xbrli xlink xs xsd xsi">	<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>	<xsl:param name="SV_OutputFormat" select="'HTML'"/>	<xsl:param name="p1"/>	<xsl:param name="p2"/>	<xsl:variable name="XML" select="/"/>	<xsl:variable name="altova:nPxPerIn" select="96"/>	<xsl:template match="/">		<html>			<head>				<title/>				<meta name="generator" content="Altova StyleVision Enterprise Edition 2014 (x64) (http://www.altova.com)"/>				<meta http-equiv="X-UA-Compatible" content="IE=7"/>                <xsl:value-of select="normalize-space(concat('&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;', $p1, '&quot;>'))" disable-output-escaping="yes"/>                <xsl:value-of select="normalize-space(concat('&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;', $p2, '&quot;>'))" disable-output-escaping="yes"/>				<xsl:comment>[if IE]&gt;&lt;STYLE type=&quot;text/css&quot;&gt;.altova-rotate-left-textbox{filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3)} .altova-rotate-right-textbox{filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1)} &lt;/STYLE&gt;&lt;![endif]</xsl:comment>				<xsl:comment>[if !IE]&gt;&lt;!</xsl:comment>				<style type="text/css">.altova-rotate-left-textbox{-webkit-transform: rotate(-90deg) translate(-100%, 0%); -webkit-transform-origin: 0% 0%;-moz-transform: rotate(-90deg) translate(-100%, 0%); -moz-transform-origin: 0% 0%;-ms-transform: rotate(-90deg) translate(-100%, 0%); -ms-transform-origin: 0% 0%;}.altova-rotate-right-textbox{-webkit-transform: rotate(90deg) translate(0%, -100%); -webkit-transform-origin: 0% 0%;-moz-transform: rotate(90deg) translate(0%, -100%); -moz-transform-origin: 0% 0%;-ms-transform: rotate(90deg) translate(0%, -100%); -ms-transform-origin: 0% 0%;}</style>				<xsl:comment>&lt;![endif]</xsl:comment>				<style type="text/css">@page { margin-left:2cm; margin-right:2cm; margin-top:2cm; margin-bottom:2cm } @media print { br.altova-page-break { page-break-before: always; } }</style>			</head>			<body style="font-family:Tahoma; font-size:xx-small; ">				<xsl:for-each select="$XML">					<xsl:for-each select="n1:Table">						<center>							<xsl:for-each select="n1:ReportCaption">								<span class="caption">									<xsl:apply-templates/>								</span>							</xsl:for-each>						</center>						<p/>						<table class="w_20">							<xsl:variable name="altova:CurrContextGrid_0" select="."/>							<tbody>								<tr>									<td class="td_h_v w_4">										<span>											<xsl:text>Design Name</xsl:text>										</span>									</td>									<td class="td w_16">										<xsl:for-each select="n1:DesignName">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Version Date</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:VersionDate">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Version Comment</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:VersionComment">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Model Name</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:ModelName">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>							</tbody>						</table>						<br/>						<p>							<span>								<xsl:text>&#160;</xsl:text>							</span>						</p>						<table class="w_16">							<xsl:variable name="altova:CurrContextGrid_1" select="."/>							<tbody>								<tr>									<td class="td_h_v w_4">										<span>											<xsl:text>Table Name</xsl:text>										</span>									</td>									<td class="td obj_name w_12">										<xsl:choose>											<xsl:when test="$SV_OutputFormat = &apos;HTML&apos;">												<xsl:choose>													<xsl:when test="n1:DiagramSuffix != &apos;&apos;">														<xsl:element name="a">															<xsl:attribute name="href">																<xsl:value-of select="concat('#' , n1:EncodedTableName , n1:DiagramSuffix)"/>															</xsl:attribute>															<xsl:attribute name="id">																<xsl:value-of select="n1:EncodedTableName"/>															</xsl:attribute>															<xsl:for-each select="n1:TableName">																<xsl:apply-templates/>															</xsl:for-each>														</xsl:element>													</xsl:when>													<xsl:otherwise>														<xsl:for-each select="n1:TableName">															<xsl:apply-templates/>														</xsl:for-each>													</xsl:otherwise>												</xsl:choose>											</xsl:when>											<xsl:otherwise>												<xsl:for-each select="n1:TableName">													<xsl:apply-templates/>												</xsl:for-each>											</xsl:otherwise>										</xsl:choose>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Functional Name</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:FunctionalName">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Abbreviation</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:Abbreviation">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Classification Type Name</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:ClassificationTypeName">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>Object Type Name</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:ObjectTypeName">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>MV Prebuilt</xsl:text>										</span>									</td>									<td class="td">										<xsl:for-each select="n1:MVPrebuilt">											<xsl:apply-templates/>										</xsl:for-each>									</td>								</tr>								<tr>									<td class="td_h_v">										<span>											<xsl:text>MV Query</xsl:text>										</span>									</td>									<td class="td">										<xsl:element name="pre">											<xsl:attribute name="style">												<xsl:value-of select="'word-wrap:break-word; white-space: pre-wrap; white-space: -moz-pre-wrap; '"/>											</xsl:attribute>											<xsl:for-each select="n1:MVQuery">												<xsl:apply-templates/>											</xsl:for-each>										</xsl:element>									</td>								</tr>							</tbody>						</table>						<xsl:if test="count( n1:DescriptionNotes )">							<p/>							<xsl:for-each select="n1:DescriptionNotes">								<table class="w_16">									<xsl:variable name="altova:CurrContextGrid_2" select="."/>									<tbody>										<tr>											<td class="td_h_v w_4">												<span>													<xsl:text>Description</xsl:text>												</span>											</td>											<td class="td w_11p5">												<xsl:for-each select="n1:Description">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Notes</xsl:text>												</span>											</td>											<td class="td">												<xsl:for-each select="n1:Notes">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>									</tbody>								</table>							</xsl:for-each>						</xsl:if>						<xsl:if test="count( n1:QuantitativeInfoCollection )">							<p/>							<xsl:for-each select="n1:QuantitativeInfoCollection">								<table class="w_8">									<xsl:variable name="altova:CurrContextGrid_3" select="."/>									<tbody>										<tr>											<td class="td_h_v w_4">												<span>													<xsl:text>Number Of Columns</xsl:text>												</span>											</td>											<td class="td_r w_4">												<xsl:for-each select="n1:NumberOfColumns">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Number Of Rows Min.</xsl:text>												</span>											</td>											<td class="td_r">												<xsl:for-each select="n1:NumberOfRowsMin">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Number Of Rows Max.</xsl:text>												</span>											</td>											<td class="td_r">												<xsl:for-each select="n1:NumberOfRowsMax">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Expected Number Of Rows</xsl:text>												</span>											</td>											<td class="td_r">												<xsl:for-each select="n1:ExpectedNumberOfRows">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Expected Growth</xsl:text>												</span>											</td>											<td class="td_r">												<xsl:for-each select="n1:ExpectedGrowth">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>										<tr>											<td class="td_h_v">												<span>													<xsl:text>Growth Interval</xsl:text>												</span>											</td>											<td class="td_r">												<xsl:for-each select="n1:GrowthInterval">													<xsl:apply-templates/>												</xsl:for-each>											</td>										</tr>									</tbody>								</table>							</xsl:for-each>						</xsl:if>						<xsl:if test="count( n1:DiagramsCollection)">							<p/>							<span class="t_cap">								<xsl:text>Used In Diagrams</xsl:text>							</span>							<br/>							<table class="w_8">								<xsl:variable name="altova:CurrContextGrid_4" select="."/>								<tbody>									<tr>										<td class="td_h_h w_8">											<span>												<xsl:text>Diagram Name</xsl:text>											</span>										</td>									</tr>									<xsl:for-each select="n1:DiagramsCollection">										<xsl:variable name="tName" select="../n1:TableName"/>										<xsl:variable name="vEncodedTableName" select="../n1:EncodedTableName"/>										<xsl:for-each select="n1:Diagram">											<xsl:variable name="dSuffix" select="n1:Suffix"/>											<tr>												<td class="td">													<xsl:choose>														<xsl:when test="$SV_OutputFormat = &apos;HTML&apos;">															<xsl:choose>																<xsl:when test="n1:Suffix != &apos;&apos;">																	<xsl:for-each select="n1:Name">																		<xsl:element name="a">																			<xsl:attribute name="href">																				<xsl:value-of select="concat('#' , $vEncodedTableName , $dSuffix)"/>																			</xsl:attribute>																			<xsl:attribute name="name">																				<xsl:value-of select="$tName"/>																			</xsl:attribute>																			<span>																				<xsl:value-of select="substring-after( . ,&apos;/&apos;)"/>																			</span>																		</xsl:element>																	</xsl:for-each>																</xsl:when>																<xsl:otherwise>																	<xsl:for-each select="n1:Name">																		<a>																			<xsl:choose>																				<xsl:when test="not(string(../n1:Link))">																					<xsl:attribute name="href">																						<xsl:text>#</xsl:text>																					</xsl:attribute>																				</xsl:when>																				<xsl:when test="substring(string(../n1:Link), 1, 1) = '#'">																					<xsl:attribute name="href">																						<xsl:value-of select="../n1:Link"/>																					</xsl:attribute>																				</xsl:when>																				<xsl:otherwise>																					<xsl:attribute name="href">																						<xsl:if test="substring(string(../n1:Link), 2, 1) = ':'">																							<xsl:text>file:///</xsl:text>																						</xsl:if>																						<xsl:value-of select="translate(string(../n1:Link), '&#x5c;', '/')"/>																					</xsl:attribute>																				</xsl:otherwise>																			</xsl:choose>																			<span>																				<xsl:value-of select="substring-after( . ,&apos;/&apos;)"/>																			</span>																		</a>																	</xsl:for-each>																</xsl:otherwise>															</xsl:choose>														</xsl:when>														<xsl:otherwise>															<xsl:choose>																<xsl:when test="contains( . ,  &apos;.pdf&apos; )">																	<xsl:for-each select="n1:Name">																		<a>																			<xsl:choose>																				<xsl:when test="not(string(concat(&apos;./&apos;,../n1:Link)))">																					<xsl:attribute name="href">																						<xsl:text>#</xsl:text>																					</xsl:attribute>																				</xsl:when>																				<xsl:when test="substring(string(concat(&apos;./&apos;,../n1:Link)), 1, 1) = '#'">																					<xsl:attribute name="href">																						<xsl:value-of select="concat(&apos;./&apos;,../n1:Link)"/>																					</xsl:attribute>																				</xsl:when>																				<xsl:otherwise>																					<xsl:attribute name="href">																						<xsl:if test="substring(string(concat(&apos;./&apos;,../n1:Link)), 2, 1) = ':'">																							<xsl:text>file:///</xsl:text>																						</xsl:if>																						<xsl:value-of select="translate(string(concat(&apos;./&apos;,../n1:Link)), '&#x5c;', '/')"/>																					</xsl:attribute>																				</xsl:otherwise>																			</xsl:choose>																			<span>																				<xsl:value-of select="substring-after( . ,&apos;/&apos;)"/>																			</span>																		</a>																	</xsl:for-each>																</xsl:when>																<xsl:otherwise>																	<xsl:for-each select="n1:Name">																		<a>																			<xsl:choose>																				<xsl:when test="not(string(concat(&apos;#&apos;, ../../../n1:EncodedTableName, ../n1:Suffix)))">																					<xsl:attribute name="href">																						<xsl:text>#</xsl:text>																					</xsl:attribute>																				</xsl:when>																				<xsl:when test="substring(string(concat(&apos;#&apos;, ../../../n1:EncodedTableName, ../n1:Suffix)), 1, 1) = '#'">																					<xsl:attribute name="href">																						<xsl:value-of select="concat(&apos;#&apos;, ../../../n1:EncodedTableName, ../n1:Suffix)"/>																					</xsl:attribute>																				</xsl:when>																				<xsl:otherwise>																					<xsl:attribute name="href">																						<xsl:if test="substring(string(concat(&apos;#&apos;, ../../../n1:EncodedTableName, ../n1:Suffix)), 2, 1) = ':'">																							<xsl:text>file:///</xsl:text>																						</xsl:if>																						<xsl:value-of select="translate(string(concat(&apos;#&apos;, ../../../n1:EncodedTableName, ../n1:Suffix)), '&#x5c;', '/')"/>																					</xsl:attribute>																				</xsl:otherwise>																			</xsl:choose>																			<span>																				<xsl:value-of select="substring-after( . ,&apos;/&apos;)"/>																			</span>																		</a>																	</xsl:for-each>																</xsl:otherwise>															</xsl:choose>														</xsl:otherwise>													</xsl:choose>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:ColumnsCollection )">							<p/>							<span class="t_cap">								<xsl:text>Columns</xsl:text>							</span>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_5" select="."/>								<thead>									<tr>										<th class="td_h_h w_1">											<span>												<xsl:text>No</xsl:text>											</span>										</th>										<th class="td_h_h w_5">											<span>												<xsl:text>Column Name</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>PK</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>FK</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>M</xsl:text>											</span>										</th>										<th class="td_h_h w_4">											<span>												<xsl:text>Data Type</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>DT </xsl:text>											</span>											<br/>											<span>												<xsl:text>kind</xsl:text>											</span>										</th>										<th class="td_h_h w_3">											<span>												<xsl:text>Domain Name</xsl:text>											</span>										</th>										<th class="td_h_h w_3">											<span>												<xsl:text>Formula</xsl:text>											</span>											<br/>											<span>												<xsl:text>(Default Value)</xsl:text>											</span>										</th>										<th class="td_h_h w_2">											<span>												<xsl:text>Security</xsl:text>											</span>										</th>										<th class="td_h_h w_3">											<span>												<xsl:text>Abbreviation</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:ColumnsCollection">										<xsl:for-each select="n1:ColumnDetails">											<tr>												<td class="td_r">													<xsl:for-each select="n1:Sequence">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:ColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:PK">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FK">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:M">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:DataType">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:DataTypeKind">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:DomainName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:Formula">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:Security">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:PreferredAbbreviation">														<xsl:apply-templates/>													</xsl:for-each>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:ColumnsCommentsCollection )">							<p/>							<span class="t_cap">								<xsl:text>Columns Comments</xsl:text>							</span>							<br/>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_6" select="."/>								<thead>									<tr>										<th class="td_h_h w_1">											<span>												<xsl:text>No</xsl:text>											</span>										</th>										<th class="td_h_h  w_6">											<span>												<xsl:text>Column Name</xsl:text>											</span>										</th>										<th class="td_h_h  w_9">											<span>												<xsl:text>Description</xsl:text>											</span>										</th>										<th class="td_h_h  w_9">											<span>												<xsl:text>Notes</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:ColumnsCommentsCollection">										<xsl:for-each select="n1:ColumnCommentsDetails">											<tr>												<td class="td_r">													<xsl:for-each select="n1:ColumnCommentsSequence">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:ColumnCommentsName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:ColumnDescription">														<xsl:apply-templates/>														<br/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:ColumnNotes">														<xsl:apply-templates/>														<br/>													</xsl:for-each>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:IndexesCollection )">							<p/>							<span class="t_cap">								<xsl:text>Indexes</xsl:text>							</span>							<br/>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_7" select="."/>								<thead>									<tr>										<th class="td_h_h w_7">											<span>												<xsl:text>Index Name</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>State</xsl:text>											</span>										</th>										<th class="td_h_h w_2">											<span>												<xsl:text>Functional</xsl:text>											</span>										</th>										<th class="td_h_h w_1p5">											<span>												<xsl:text>Spatial</xsl:text>											</span>										</th>										<th class="td_h_h w_5p5">											<span>												<xsl:text>Expression</xsl:text>											</span>										</th>										<th class="td_h_h w_7">											<span>												<xsl:text>Column Name</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>Sort</xsl:text>											</span>											<br/>											<span>												<xsl:text>Order</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:IndexesCollection">										<xsl:for-each select="n1:IndexDetails">											<tr>												<td class="td">													<xsl:for-each select="n1:IndexName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:IndexState">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:IndexFunctional">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:IndexSpatial">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:IndexExpression">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:IndexColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:IndexSortOrder">														<xsl:apply-templates/>													</xsl:for-each>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:ConstraintsCollection )">							<p/>							<span style="font-size:xx-small; font-style:italic; " class="t_cap">								<xsl:text>Constraints</xsl:text>							</span>							<br/>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_8" select="."/>								<thead>									<tr>										<th class="td_h_h w_3">											<span>												<xsl:text>Type</xsl:text>											</span>										</th>										<th class="td_h_h w_3">											<span>												<xsl:text>Column / Constraint Name</xsl:text>											</span>										</th>										<th class="td_h_h w_19">											<span>												<xsl:text>Details</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:ConstraintsCollection">										<xsl:for-each select="n1:TableLevelConstraintsCollection">											<xsl:for-each select="n1:TableLevelConstraintDetails">												<tr>													<td class="td">														<xsl:for-each select="n1:TLConstraintType">															<xsl:apply-templates/>														</xsl:for-each>													</td>													<td class="td">														<xsl:for-each select="n1:TLConstraintName">															<xsl:apply-templates/>														</xsl:for-each>													</td>													<td class="td">														<xsl:for-each select="n1:TLConstraintRule">															<xsl:apply-templates/>														</xsl:for-each>													</td>												</tr>											</xsl:for-each>										</xsl:for-each>									</xsl:for-each>									<xsl:for-each select="n1:ConstraintsCollection">										<xsl:for-each select="n1:ColumnLevelConstraintsCollection">											<xsl:for-each select="n1:ConstraintDetails">												<tr>													<td class="td">														<xsl:for-each select="n1:ContstraintType">															<xsl:apply-templates/>														</xsl:for-each>													</td>													<td class="td">														<xsl:for-each select="n1:ALCConstraintName">															<xsl:apply-templates/>														</xsl:for-each>													</td>													<td class="td">														<xsl:if test="count( n1:RangesCollection ) != 0">															<br/>															<span class="t_cap">																<xsl:text>Ranges</xsl:text>															</span>															<table>																<xsl:variable name="altova:CurrContextGrid_9" select="."/>																<thead class="w_19">																	<tr>																		<th class="td_h_h w_3">																			<span>																				<xsl:text>Begin Value</xsl:text>																			</span>																		</th>																		<th class="td_h_h w_3">																			<span>																				<xsl:text>End Value</xsl:text>																			</span>																		</th>																		<th class="td_h_h w_12p8">																			<span>																				<xsl:text>Description</xsl:text>																			</span>																		</th>																	</tr>																</thead>																<tbody>																	<xsl:for-each select="n1:RangesCollection">																		<xsl:for-each select="n1:RangeDetails">																			<tr>																				<td class="td">																					<xsl:for-each select="n1:RangeBeginValue">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																				<td class="td">																					<xsl:for-each select="n1:RangeEndValue">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																				<td class="td">																					<xsl:for-each select="n1:RangeShortDescription">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																			</tr>																		</xsl:for-each>																	</xsl:for-each>																</tbody>															</table>														</xsl:if>														<xsl:if test="count( n1:ValueListsCollection ) != 0">															<br/>															<span class="t_cap">																<xsl:text>Values List</xsl:text>															</span>															<br/>															<table>																<xsl:variable name="altova:CurrContextGrid_10" select="."/>																<thead>																	<tr>																		<th class="td_h_h w_3">																			<span>																				<xsl:text>Value</xsl:text>																			</span>																		</th>																		<th class="td_h_h w_15p8">																			<span>																				<xsl:text>Description</xsl:text>																			</span>																		</th>																	</tr>																</thead>																<tbody>																	<xsl:for-each select="n1:ValueListsCollection">																		<xsl:for-each select="n1:ValueListDetails">																			<tr>																				<td class="td">																					<xsl:for-each select="n1:VLValue">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																				<td class="td">																					<xsl:for-each select="n1:VLShortDescription">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																			</tr>																		</xsl:for-each>																	</xsl:for-each>																</tbody>															</table>														</xsl:if>														<xsl:if test="count( n1:CheckConstraintsCollection ) != 0">															<br/>															<span class="t_cap">																<xsl:text>Check Constraints</xsl:text>															</span>															<br/>															<table>																<xsl:variable name="altova:CurrContextGrid_11" select="."/>																<thead>																	<tr>																		<th class="td_h_h w_15p8">																			<span>																				<xsl:text>Text</xsl:text>																			</span>																		</th>																		<th class="td_h_h w_3">																			<span>																				<xsl:text>DB Type</xsl:text>																			</span>																		</th>																	</tr>																</thead>																<tbody>																	<xsl:for-each select="n1:CheckConstraintsCollection">																		<xsl:for-each select="n1:CheckConstraintDetails">																			<tr>																				<td class="td">																					<xsl:for-each select="n1:CheckConstraintText">																						<xsl:apply-templates/>																						<br/>																					</xsl:for-each>																				</td>																				<td class="td">																					<xsl:for-each select="n1:DatabaseType">																						<xsl:apply-templates/>																					</xsl:for-each>																				</td>																			</tr>																		</xsl:for-each>																	</xsl:for-each>																</tbody>															</table>														</xsl:if>													</td>												</tr>											</xsl:for-each>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:FKRTCollection )">							<p/>							<span class="t_cap">								<xsl:text>Foreign Keys (referring to)</xsl:text>							</span>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_12" select="."/>								<thead>									<tr>										<th class="td_h_h w_6">											<span>												<xsl:text>Name</xsl:text>											</span>										</th>										<th class="td_h_h w_5">											<span>												<xsl:text>Refering To</xsl:text>											</span>										</th>										<th class="td_h_h w_1p5">											<span>												<xsl:text>Mandatory</xsl:text>											</span>										</th>										<th class="td_h_h w_1p5">											<span>												<xsl:text>Transferable</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>In Arc</xsl:text>											</span>										</th>										<th class="td_h_h w_4">											<span>												<xsl:text>Columns</xsl:text>											</span>										</th>										<th class="td_h_h w_4">											<span>												<xsl:text>Referred Columns</xsl:text>											</span>										</th>										<th class="td_h_h w_2">											<span>												<xsl:text>Delete Rule</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:FKRTCollection">										<xsl:for-each select="n1:FKRTDetails">											<tr>												<td class="td">													<xsl:for-each select="n1:FKName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferringTo">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKMandatory">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKTransferable">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKInArc">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferringColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferredColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKDeleteRule">														<xsl:apply-templates/>													</xsl:for-each>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>						<xsl:if test="count( n1:FKRFCollection )">							<p/>							<span class="t_cap">								<xsl:text>Foreign Keys (referred from)</xsl:text>							</span>							<table class="w_25">								<xsl:variable name="altova:CurrContextGrid_13" select="."/>								<thead>									<tr>										<th class="td_h_h w_6">											<span>												<xsl:text>Name</xsl:text>											</span>										</th>										<th class="td_h_h w_5">											<span>												<xsl:text>Referred From</xsl:text>											</span>										</th>										<th class="td_h_h w_1p5">											<span>												<xsl:text>Mandatory</xsl:text>											</span>										</th>										<th class="td_h_h w_1p5">											<span>												<xsl:text>Transferable</xsl:text>											</span>										</th>										<th class="td_h_h w_1">											<span>												<xsl:text>In Arc</xsl:text>											</span>										</th>										<th class="td_h_h w_4">											<span>												<xsl:text>Columns</xsl:text>											</span>										</th>										<th class="td_h_h w_4">											<span>												<xsl:text>Referred Columns</xsl:text>											</span>										</th>										<th class="td_h_h w_2">											<span>												<xsl:text>Delete Rule</xsl:text>											</span>										</th>									</tr>								</thead>								<tbody>									<xsl:for-each select="n1:FKRFCollection">										<xsl:for-each select="n1:FKRFDetails">											<tr>												<td class="td">													<xsl:for-each select="n1:FKName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferredFrom">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKMandatory">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKTransferable">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKInArc">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferredColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td">													<xsl:for-each select="n1:FKReferringColumnName">														<xsl:apply-templates/>													</xsl:for-each>												</td>												<td class="td_c">													<xsl:for-each select="n1:FKDeleteRule">														<xsl:apply-templates/>													</xsl:for-each>												</td>											</tr>										</xsl:for-each>									</xsl:for-each>								</tbody>							</table>						</xsl:if>					</xsl:for-each>				</xsl:for-each>			</body>		</html>	</xsl:template></xsl:stylesheet>