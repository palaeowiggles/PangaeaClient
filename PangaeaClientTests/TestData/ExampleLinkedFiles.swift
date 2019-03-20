//
//  ExampleLinkedFiles.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 27/02/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

let exampleLinkedFiles = """
<md:MetaData xmlns:md="http://www.pangaea.de/MetaData" version="2018-09-26">
<md:citation id="dataset611408">
<md:author id="dataset.author9">
<md:lastName>Grobe</md:lastName>
<md:firstName>Hannes</md:firstName>
<md:eMail>hannes.grobe@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hannes-grobe.html
</md:URI>
<md:orcid>0000-0002-4133-2218</md:orcid>
</md:author>
<md:author id="dataset.author12">
<md:lastName>Hubberten</md:lastName>
<md:firstName>Hans-Wolfgang</md:firstName>
<md:eMail>hans-wolfgang.hubberten@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hans-wolfgang-hubberten.html
</md:URI>
<md:orcid>0000-0002-3922-4680</md:orcid>
</md:author>
<md:author id="dataset.author28988">
<md:lastName>Krause</md:lastName>
<md:firstName>Reinhard A</md:firstName>
<md:eMail>reinhard.krause@awi.de</md:eMail>
</md:author>
<md:author id="dataset.author31129">
<md:lastName>Mondzech</md:lastName>
<md:firstName>Juliane</md:firstName>
</md:author>
<md:author id="dataset.author883">
<md:lastName>Schenke</md:lastName>
<md:firstName>Hans Werner</md:firstName>
<md:eMail>infobathy@awi.de</md:eMail>
</md:author>
<md:year>2007</md:year>
<md:title>Documentation of IPY Seamount</md:title>
<md:source id="dataset.sourceinst32">
Alfred Wegener Institute, Helmholtz Centre for Polar and Marine Research, Bremerhaven
</md:source>
<md:URI>https://doi.org/10.1594/PANGAEA.611408</md:URI>
<md:dateTime>2007-05-11T09:16:46</md:dateTime>
</md:citation>
<md:abstract>
During Leg ANT-XXIII/9 on 2007-04-04 the German research vessel POLARSTERN mapped a significant bathymetric feature with its swath sonar system in the area of the Indian Ridge in the Southern Indian Ocean. The feature is a vulcano located 800 km northwest of Crozet Island. The vulcano with a crater has an absolute height of 1370 m, extending from 3100 m mean depth of the surrounding sea floor to a depth of 1730 m at the top of the crater rim. The crater has a depth of about 135 m. Due to the fact, that the feature was discovered just a month after the fourth International Polar Year (IPY) 2007/2009 has started, it was named "IPY Seamount". The undersea feature name proposal was submitted to the International Hydrographic Organisation (IHO) and the Intergovernmental Oceanographic Commission (IOC of UNESCO) on 2007-05-11. The name was officially accepted by the GEBCO Sub-Committee on Undersea Feature Names (SCUFN) at its 20th meeting in July and was added to the GEBCO Gazetteer of UFN.
</md:abstract>
<md:reference id="ref42945" relationType="Further details" relationTypeId="17">
<md:year>2007</md:year>
<md:title>
Protokoll of SCUFN meeting related to the proposal of two new undersea features
</md:title>
<md:source>IHO (International Hydrographic Organization).</md:source>
<md:URI>hdl:10013/epic.28777.d001</md:URI>
</md:reference>
<md:reference id="ref59870" relationType="Further details" relationTypeId="17">
<md:author id="ref59870.author40543">
<md:lastName>GEBCO</md:lastName>
</md:author>
<md:title>
General Bathymetric Chart of the Oceans - Undersea feature names
</md:title>
<md:source>(website)</md:source>
<md:URI>
https://www.gebco.net/data_and_products/undersea_feature_names/
</md:URI>
</md:reference>
<md:extent>
<md:geographic>
<md:westBoundLongitude>43.6416666666666</md:westBoundLongitude>
<md:eastBoundLongitude>43.6416666666666</md:eastBoundLongitude>
<md:southBoundLatitude>-42.55</md:southBoundLatitude>
<md:northBoundLatitude>-42.55</md:northBoundLatitude>
<md:meanLongitude>43.6416666666666</md:meanLongitude>
<md:meanLatitude>-42.55</md:meanLatitude>
</md:geographic>
<md:temporal>
<md:minDateTime>2007-04-04T10:30:00</md:minDateTime>
<md:maxDateTime>2007-04-04T10:30:00</md:maxDateTime>
</md:temporal>
<md:elevation name="Elevation" unit="m">
<md:min>-1780.0</md:min>
<md:max>-1780.0</md:max>
</md:elevation>
<md:topoType id="topotype1">not specified</md:topoType>
</md:extent>
<md:project id="project1" type="National institution">
<md:label>AWI_Paleo</md:label>
<md:name>
Paleoenvironmental Reconstructions from Marine Sediments @ AWI
</md:name>
<md:URI>
http://www.awi.de/en/science/geosciences/marine-geology.html
</md:URI>
</md:project>
<md:event id="event2490576">
<md:label>IPY-Seamount</md:label>
<md:latitude>-42.55</md:latitude>
<md:longitude>43.6416666666666</md:longitude>
<md:elevation>-1780.0</md:elevation>
<md:dateTime>2007-04-04T10:30:00</md:dateTime>
<md:location id="event2490576.term20611">
<md:name>Indian Ocean</md:name>
</md:location>
<md:campaign id="event2490576.campaign30653">
<md:name>ANT-XXIII/9</md:name>
<md:optionalName>PS69</md:optionalName>
<md:URI>https://doi.org/10.2312/BzPM_0583_2008</md:URI>
<md:attribute attid="2055" name="BSH ID">20080030</md:attribute>
<md:attribute attid="2054" name="End location">Cape Town</md:attribute>
<md:attribute attid="2053" name="Start location">Punta Arenas</md:attribute>
</md:campaign>
<md:basis id="event2490576.basis1">
<md:name>Polarstern</md:name>
<md:URI>
http://www.awi.de/en/expedition/ships/polarstern.html
</md:URI>
</md:basis>
<md:device id="event2490576.term19652">
<md:name>HydroSweep</md:name>
<md:optionalName>HS</md:optionalName>
</md:device>
<md:comment>
Relative height is ~1400 m; date is date of discovery
</md:comment>
</md:event>
<md:size unit="data points">100</md:size>
<md:license id="license101">
<md:label>CC-BY-3.0</md:label>
<md:name>Creative Commons Attribution 3.0 Unported</md:name>
<md:URI>https://creativecommons.org/licenses/by/3.0/</md:URI>
</md:license>
<md:matrixColumn col="0" id="col0.ds13092332" label="IPY-Seamount.1" source="data" type="string">
<md:parameter id="col0.ds13092332.param25541">
<md:name>File name</md:name>
<md:shortName>File name</md:shortName>
</md:parameter>
<md:PI id="col0.ds13092332.pi9">
<md:lastName>Grobe</md:lastName>
<md:firstName>Hannes</md:firstName>
<md:eMail>hannes.grobe@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hannes-grobe.html
</md:URI>
<md:orcid>0000-0002-4133-2218</md:orcid>
</md:PI>
<md:caption>File name</md:caption>
</md:matrixColumn>
<md:matrixColumn col="1" id="col1.ds13092333" label="IPY-Seamount.2" source="data" type="string">
<md:parameter id="col1.ds13092333.param16143">
<md:name>File format</md:name>
<md:shortName>File format</md:shortName>
</md:parameter>
<md:PI id="col1.ds13092333.pi9">
<md:lastName>Grobe</md:lastName>
<md:firstName>Hannes</md:firstName>
<md:eMail>hannes.grobe@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hannes-grobe.html
</md:URI>
<md:orcid>0000-0002-4133-2218</md:orcid>
</md:PI>
<md:caption>File format</md:caption>
</md:matrixColumn>
<md:matrixColumn col="2" format="####0.000" id="col2.ds13092334" label="IPY-Seamount.3" source="data" type="numeric">
<md:parameter id="col2.ds13092334.param16144">
<md:name>File size</md:name>
<md:shortName>File size</md:shortName>
<md:unit>kByte</md:unit>
</md:parameter>
<md:PI id="col2.ds13092334.pi9">
<md:lastName>Grobe</md:lastName>
<md:firstName>Hannes</md:firstName>
<md:eMail>hannes.grobe@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hannes-grobe.html
</md:URI>
<md:orcid>0000-0002-4133-2218</md:orcid>
</md:PI>
<md:caption>File size [kByte]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="3" id="col3.ds13092335" label="IPY-Seamount.4" source="data" type="uri">
<md:parameter id="col3.ds13092335.param54251">
<md:name>Uniform resource locator/link to file</md:name>
<md:shortName>URL file</md:shortName>
</md:parameter>
<md:PI id="col3.ds13092335.pi9">
<md:lastName>Grobe</md:lastName>
<md:firstName>Hannes</md:firstName>
<md:eMail>hannes.grobe@awi.de</md:eMail>
<md:URI>
http://www.awi.de/en/about-us/organisation/staff/hannes-grobe.html
</md:URI>
<md:orcid>0000-0002-4133-2218</md:orcid>
</md:PI>
<md:caption>URL file</md:caption>
</md:matrixColumn>
<md:keywords>
<md:techKeyword type="autoGenerated">citable</md:techKeyword>
<md:techKeyword type="autoGenerated">author12</md:techKeyword>
<md:techKeyword type="autoGenerated">author28988</md:techKeyword>
<md:techKeyword type="autoGenerated">author31129</md:techKeyword>
<md:techKeyword type="autoGenerated">author40543</md:techKeyword>
<md:techKeyword type="autoGenerated">author883</md:techKeyword>
<md:techKeyword type="autoGenerated">author9</md:techKeyword>
<md:techKeyword type="autoGenerated">basis1</md:techKeyword>
<md:techKeyword type="autoGenerated">campaign30653</md:techKeyword>
<md:techKeyword type="autoGenerated">event2490576</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1599</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1600</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1601</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode8128</md:techKeyword>
<md:techKeyword type="autoGenerated">license101</md:techKeyword>
<md:techKeyword type="autoGenerated">param16143</md:techKeyword>
<md:techKeyword type="autoGenerated">param16144</md:techKeyword>
<md:techKeyword type="autoGenerated">param25541</md:techKeyword>
<md:techKeyword type="autoGenerated">param54251</md:techKeyword>
<md:techKeyword type="autoGenerated">pi9</md:techKeyword>
<md:techKeyword type="autoGenerated">project1</md:techKeyword>
<md:techKeyword type="autoGenerated">ref42945</md:techKeyword>
<md:techKeyword type="autoGenerated">ref59870</md:techKeyword>
<md:techKeyword type="autoGenerated">sourceinst32</md:techKeyword>
<md:techKeyword type="autoGenerated">term19652</md:techKeyword>
<md:techKeyword type="autoGenerated">term20611</md:techKeyword>
<md:techKeyword type="autoGenerated">topotype1</md:techKeyword>
</md:keywords>
<md:technicalInfo>
<md:entry key="xmlLastModified" value="2019-01-27T13:45:53Z"/>
<md:entry key="filename" value="IPY-Seamount_links-to-images"/>
<md:entry key="mimeType" value="text/tab-separated-values"/>
<md:entry key="status" value="published"/>
<md:entry key="status_num" value="4"/>
<md:entry key="DOIRegistryStatus" value="registered"/>
<md:entry key="DOIRegistryStatus_num" value="4"/>
<md:entry key="loginOption" value="unrestricted"/>
<md:entry key="loginOption_num" value="1"/>
</md:technicalInfo>
</md:MetaData>
"""
