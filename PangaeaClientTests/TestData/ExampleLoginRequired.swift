//
//  ExampleLoginRequired.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 27/02/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
let exampleLoginRequired = """
<md:MetaData xmlns:md="http://www.pangaea.de/MetaData" version="2018-09-26">
<md:citation id="dataset893044">
<md:author id="dataset.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:author id="dataset.author66385">
<md:lastName>Feldtmann</md:lastName>
<md:firstName>Mathias</md:firstName>
</md:author>
<md:author id="dataset.author50612">
<md:lastName>Vahlenkamp</md:lastName>
<md:firstName>Maximilian</md:firstName>
</md:author>
<md:author id="dataset.author56315">
<md:lastName>De Vleeschouwer</md:lastName>
<md:firstName>David</md:firstName>
<md:orcid>0000-0002-3323-807X</md:orcid>
</md:author>
<md:author id="dataset.author60689">
<md:lastName>Wu</md:lastName>
<md:firstName>FangLi</md:firstName>
</md:author>
<md:author id="dataset.author900">
<md:lastName>Zachos</md:lastName>
<md:firstName>James C</md:firstName>
<md:eMail>jzachos@ernerald.ucsc.edu</md:eMail>
<md:orcid>0000-0001-8439-1886</md:orcid>
</md:author>
<md:year>2018</md:year>
<md:title>
Stable isotope measurements from planktonic foraminifera Subbotina eocaena and Acarinina bullbrooki of IODP Site 342-U1408
</md:title>
<md:URI>https://doi.pangaea.de/10.1594/PANGAEA.893044</md:URI>
<md:dateTime>2018-08-16T06:38:57</md:dateTime>
<md:supplementTo id="ref97112">
<md:author id="ref97112.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:author id="ref97112.author66385">
<md:lastName>Feldtmann</md:lastName>
<md:firstName>Mathias</md:firstName>
</md:author>
<md:author id="ref97112.author50612">
<md:lastName>Vahlenkamp</md:lastName>
<md:firstName>Maximilian</md:firstName>
</md:author>
<md:author id="ref97112.author56315">
<md:lastName>De Vleeschouwer</md:lastName>
<md:firstName>David</md:firstName>
<md:orcid>0000-0002-3323-807X</md:orcid>
</md:author>
<md:author id="ref97112.author60689">
<md:lastName>Wu</md:lastName>
<md:firstName>FangLi</md:firstName>
</md:author>
<md:author id="ref97112.author900">
<md:lastName>Zachos</md:lastName>
<md:firstName>James C</md:firstName>
<md:eMail>jzachos@ernerald.ucsc.edu</md:eMail>
<md:orcid>0000-0001-8439-1886</md:orcid>
</md:author>
<md:prepubStatus>in prep.</md:prepubStatus>
<md:title>
Carbon and oxygen stable isotope measurements from planktonic foraminifera Subbotina eocaena (thermocline) and Acarinina bullbrooki (surface dweller) of IODP Site U1408 (middle Eocene)
</md:title>
</md:supplementTo>
</md:citation>
<md:abstract>in preparation</md:abstract>
<md:extent>
<md:geographic>
<md:westBoundLongitude>-49.78557</md:westBoundLongitude>
<md:eastBoundLongitude>-49.78557</md:eastBoundLongitude>
<md:southBoundLatitude>41.43813</md:southBoundLatitude>
<md:northBoundLatitude>41.43813</md:northBoundLatitude>
<md:meanLongitude>-49.78557</md:meanLongitude>
<md:meanLatitude>41.43813</md:meanLatitude>
</md:geographic>
<md:elevation geocodeId="geocode1" name="DEPTH, sediment/rock" unit="m">
<md:min>147.6</md:min>
<md:max>206.18</md:max>
</md:elevation>
<md:topoType id="topotype3">vertical profile</md:topoType>
</md:extent>
<md:project id="project4048" type="International">
<md:label>IODP</md:label>
<md:name>
Integrated Ocean Drilling Program / International Ocean Discovery Program
</md:name>
<md:URI>http://www.iodp.org/</md:URI>
</md:project>
<md:event id="event2810166">
<md:label>342-U1408</md:label>
<md:latitude>41.43813</md:latitude>
<md:longitude>-49.78557</md:longitude>
<md:elevation>-3022.5</md:elevation>
<md:campaign id="event2810166.campaign36782">
<md:name>Exp342</md:name>
<md:optionalName>Paleogene Newfoundland Sediment Drifts</md:optionalName>
</md:campaign>
<md:basis id="event2810166.basis5">
<md:name>Joides Resolution</md:name>
<md:URI>http://www-odp.tamu.edu/resolutn.html</md:URI>
</md:basis>
<md:device id="event2810166.term19457">
<md:name>Drilling/drill rig</md:name>
<md:optionalName>DRILL</md:optionalName>
</md:device>
</md:event>
<md:size unit="data points">6971</md:size>
<md:matrixColumn col="0" id="col0.ds13518095" label="342-U1408.19" source="data" type="string">
<md:parameter id="col0.ds13518095.param790">
<md:name>Sample code/label</md:name>
<md:shortName>Sample label</md:shortName>
</md:parameter>
<md:PI id="col0.ds13518095.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:caption>Sample label</md:caption>
</md:matrixColumn>
<md:matrixColumn behaviour="1" col="1" format="##0.00" id="col1.ds13518096" label="342-U1408.20" source="geocode" type="numeric">
<md:parameter id="col1.ds13518096.geocode1">
<md:name>DEPTH, sediment/rock</md:name>
<md:shortName>Depth</md:shortName>
<md:unit>m</md:unit>
</md:parameter>
<md:PI id="col1.ds13518096.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:caption>Depth [m]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="2" format="##0.00" id="col2.ds13518097" label="342-U1408.21" source="data" type="numeric">
<md:parameter id="col2.ds13518097.param2">
<md:name>Depth, composite</md:name>
<md:shortName>Depth comp</md:shortName>
<md:unit>mcd</md:unit>
</md:parameter>
<md:PI id="col2.ds13518097.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:caption>Depth comp [mcd]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="3" format="#0.00" id="col3.ds13518098" label="342-U1408.22" source="data" type="numeric">
<md:parameter id="col3.ds13518098.param1668" relatedTermIds="1045523,1073091">
<md:name>Foraminifera, planktic δ13C</md:name>
<md:shortName>Foram plankt δ13C</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col3.ds13518098.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:caption>Foram plankt δ13C [‰ PDB]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="4" format="#0.00" id="col4.ds13518099" label="342-U1408.23" source="data" type="numeric">
<md:parameter id="col4.ds13518099.param1667" relatedTermIds="1045523,1073090">
<md:name>Foraminifera, planktic δ18O</md:name>
<md:shortName>Foram plankt δ18O</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col4.ds13518099.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:caption>Foram plankt δ18O [‰ PDB]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="5" format="#0.000" id="col5.ds13518100" label="342-U1408.24" source="data" type="numeric">
<md:parameter id="col5.ds13518100.param58935" relatedTermIds="1047528,1073091">
<md:name>Acarinina bullbrooki, δ13C</md:name>
<md:shortName>A. bullbrooki δ13C</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col5.ds13518100.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:comment>vs. VPDB</md:comment>
<md:caption>A. bullbrooki δ13C [‰ PDB]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="6" format="#0.000" id="col6.ds13518101" label="342-U1408.25" source="data" type="numeric">
<md:parameter id="col6.ds13518101.param58934" relatedTermIds="1047528,1073090">
<md:name>Acarinina bullbrooki, δ18O</md:name>
<md:shortName>A. bullbrooki δ18O</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col6.ds13518101.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:comment>vs. VPDB</md:comment>
<md:caption>A. bullbrooki δ18O [‰ PDB]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="7" format="#0.000" id="col7.ds13518102" label="342-U1408.26" source="data" type="numeric">
<md:parameter id="col7.ds13518102.param58965" relatedTermIds="1047530,1073091">
<md:name>Subbotina eocaena, δ13C</md:name>
<md:shortName>S. eocaena δ13C</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col7.ds13518102.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:comment>vs. VPDB</md:comment>
<md:caption>S. eocaena δ13C [‰ PDB]</md:caption>
</md:matrixColumn>
<md:matrixColumn col="8" format="#0.000" id="col8.ds13518103" label="342-U1408.27" source="data" type="numeric">
<md:parameter id="col8.ds13518103.param58964" relatedTermIds="1047530,1073090">
<md:name>Subbotina eocaena, δ18O</md:name>
<md:shortName>S. eocaena δ18O</md:shortName>
<md:unit>‰ PDB</md:unit>
</md:parameter>
<md:PI id="col8.ds13518103.pi25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:PI>
<md:comment>vs. VPDB</md:comment>
<md:caption>S. eocaena δ18O [‰ PDB]</md:caption>
</md:matrixColumn>
<md:keywords>
<md:techKeyword type="autoGenerated">supplement</md:techKeyword>
<md:techKeyword type="autoGenerated">author25918</md:techKeyword>
<md:techKeyword type="autoGenerated">author50612</md:techKeyword>
<md:techKeyword type="autoGenerated">author56315</md:techKeyword>
<md:techKeyword type="autoGenerated">author60689</md:techKeyword>
<md:techKeyword type="autoGenerated">author66385</md:techKeyword>
<md:techKeyword type="autoGenerated">author900</md:techKeyword>
<md:techKeyword type="autoGenerated">basis5</md:techKeyword>
<md:techKeyword type="autoGenerated">campaign36782</md:techKeyword>
<md:techKeyword type="autoGenerated">event2810166</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1600</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1601</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode8128</md:techKeyword>
<md:techKeyword type="autoGenerated">param1667</md:techKeyword>
<md:techKeyword type="autoGenerated">param1668</md:techKeyword>
<md:techKeyword type="autoGenerated">param2</md:techKeyword>
<md:techKeyword type="autoGenerated">param58934</md:techKeyword>
<md:techKeyword type="autoGenerated">param58935</md:techKeyword>
<md:techKeyword type="autoGenerated">param58964</md:techKeyword>
<md:techKeyword type="autoGenerated">param58965</md:techKeyword>
<md:techKeyword type="autoGenerated">param790</md:techKeyword>
<md:techKeyword type="autoGenerated">pi25918</md:techKeyword>
<md:techKeyword type="autoGenerated">project4048</md:techKeyword>
<md:techKeyword type="autoGenerated">ref97112</md:techKeyword>
<md:techKeyword type="autoGenerated">term19457</md:techKeyword>
<md:techKeyword type="autoGenerated">topotype3</md:techKeyword>
</md:keywords>
<md:technicalInfo>
<md:entry key="xmlLastModified" value="2019-01-27T12:28:57Z"/>
<md:entry key="filename" value="342-U1408_isotopes"/>
<md:entry key="mimeType" value="text/tab-separated-values"/>
<md:entry key="status" value="validated"/>
<md:entry key="status_num" value="3"/>
<md:entry key="DOIRegistryStatus" value="not to be registered"/>
<md:entry key="DOIRegistryStatus_num" value="1"/>
<md:entry key="loginOption" value="access rights needed"/>
<md:entry key="loginOption_num" value="3"/>
</md:technicalInfo>
</md:MetaData>
"""
