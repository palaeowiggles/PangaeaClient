//
//  ExampleDataset.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 27/02/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

let exampleParent = """
<md:MetaData xmlns:md="http://www.pangaea.de/MetaData" version="2019-02-13">
<md:citation id="dataset547942">
<md:author id="dataset.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:author id="dataset.author20020">
<md:lastName>Norris</md:lastName>
<md:firstName>Richard D</md:firstName>
<md:eMail>rnorris@whoi.edu</md:eMail>
</md:author>
<md:author id="dataset.author21844">
<md:lastName>Herrle</md:lastName>
<md:firstName>Jens O</md:firstName>
<md:eMail>jens.herrle@erdw.ethz.ch</md:eMail>
</md:author>
<md:author id="dataset.author28468">
<md:lastName>Wilson</md:lastName>
<md:firstName>Paul A</md:firstName>
</md:author>
<md:author id="dataset.author28971">
<md:lastName>Coxall</md:lastName>
<md:firstName>Helen</md:firstName>
</md:author>
<md:author id="dataset.author29618">
<md:lastName>Lear</md:lastName>
<md:firstName>Caroline H</md:firstName>
<md:orcid>0000-0002-7533-4430</md:orcid>
</md:author>
<md:author id="dataset.author526">
<md:lastName>Shackleton</md:lastName>
<md:firstName>Nicholas J</md:firstName>
<md:URI>http://en.wikipedia.org/wiki/Nicholas_Shackleton</md:URI>
</md:author>
<md:author id="dataset.author29222">
<md:lastName>Tripati</md:lastName>
<md:firstName>Aradhna K</md:firstName>
<md:eMail>atri02@esc.cam.ac.uk</md:eMail>
<md:orcid>0000-0002-1695-1754</md:orcid>
</md:author>
<md:author id="dataset.author30544">
<md:lastName>Wade</md:lastName>
<md:firstName>Bridget S</md:firstName>
<md:orcid>0000-0002-7245-8614</md:orcid>
</md:author>
<md:year>2006</md:year>
<md:title>
Age models and stable isotope analysis on sediment core Site 199-1218 from the equatorial Pacific
</md:title>
<md:URI>https://doi.org/10.1594/PANGAEA.547942</md:URI>
<md:dateTime>2006-11-03T13:58:19</md:dateTime>
<md:supplementTo id="ref27368">
<md:author id="ref27368.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:author id="ref27368.author20020">
<md:lastName>Norris</md:lastName>
<md:firstName>Richard D</md:firstName>
<md:eMail>rnorris@whoi.edu</md:eMail>
</md:author>
<md:author id="ref27368.author21844">
<md:lastName>Herrle</md:lastName>
<md:firstName>Jens O</md:firstName>
<md:eMail>jens.herrle@erdw.ethz.ch</md:eMail>
</md:author>
<md:author id="ref27368.author28468">
<md:lastName>Wilson</md:lastName>
<md:firstName>Paul A</md:firstName>
</md:author>
<md:author id="ref27368.author28971">
<md:lastName>Coxall</md:lastName>
<md:firstName>Helen</md:firstName>
</md:author>
<md:author id="ref27368.author29618">
<md:lastName>Lear</md:lastName>
<md:firstName>Caroline H</md:firstName>
<md:orcid>0000-0002-7533-4430</md:orcid>
</md:author>
<md:author id="ref27368.author526">
<md:lastName>Shackleton</md:lastName>
<md:firstName>Nicholas J</md:firstName>
<md:URI>http://en.wikipedia.org/wiki/Nicholas_Shackleton</md:URI>
</md:author>
<md:author id="ref27368.author29222">
<md:lastName>Tripati</md:lastName>
<md:firstName>Aradhna K</md:firstName>
<md:eMail>atri02@esc.cam.ac.uk</md:eMail>
<md:orcid>0000-0002-1695-1754</md:orcid>
</md:author>
<md:author id="ref27368.author30544">
<md:lastName>Wade</md:lastName>
<md:firstName>Bridget S</md:firstName>
<md:orcid>0000-0002-7245-8614</md:orcid>
</md:author>
<md:year>2006</md:year>
<md:title>The Heartbeat of the Oligocene Climate System</md:title>
<md:source id="ref27368.journal14481" relatedTermIds="34013">Science</md:source>
<md:volume>314(5807)</md:volume>
<md:URI>https://doi.org/10.1126/science.1133822</md:URI>
<md:pages>1894-1898</md:pages>
</md:supplementTo>
</md:citation>
<md:abstract>
A 13-million-year continuous record of Oligocene climate from the equatorial Pacific reveals a pronounced "heartbeat" in the global carbon cycle and periodicity of glaciations. This heartbeat consists of 405,000-, 127,000-, and 96,000-year eccentricity cycles and 1.2-million-year obliquity cycles in periodically recurring glacial and carbon cycle events. That climate system response to intricate orbital variations suggests a fundamental interaction of the carbon cycle, solar forcing, and glacial events. Box modeling shows that the interaction of the carbon cycle and solar forcing modulates deep ocean acidity as well as the production and burial of global biomass. The pronounced 405,000-year eccentricity cycle is amplified by the long residence time of carbon in the oceans.
</md:abstract>
<md:reference id="ref27372" relationType="Related to" relationTypeId="12">
<md:author id="ref27372.author28971">
<md:lastName>Coxall</md:lastName>
<md:firstName>Helen</md:firstName>
</md:author>
<md:author id="ref27372.author28468">
<md:lastName>Wilson</md:lastName>
<md:firstName>Paul A</md:firstName>
</md:author>
<md:author id="ref27372.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:author id="ref27372.author29618">
<md:lastName>Lear</md:lastName>
<md:firstName>Caroline H</md:firstName>
<md:orcid>0000-0002-7533-4430</md:orcid>
</md:author>
<md:author id="ref27372.author265">
<md:lastName>Backman</md:lastName>
<md:firstName>Jan</md:firstName>
<md:eMail>backman@geo.su.se</md:eMail>
</md:author>
<md:year>2005</md:year>
<md:title>
Rapid stepwise onset of Antarctic glaciation and deeper calcite compensation in the Pacific Ocean
</md:title>
<md:source id="ref27372.journal11658" relatedTermIds="34013">Nature</md:source>
<md:volume>433</md:volume>
<md:URI>https://doi.org/10.1038/nature03135</md:URI>
<md:pages>53-57</md:pages>
</md:reference>
<md:reference id="ref27369" relationType="Related to" relationTypeId="12">
<md:author id="ref27369.author29618">
<md:lastName>Lear</md:lastName>
<md:firstName>Caroline H</md:firstName>
<md:orcid>0000-0002-7533-4430</md:orcid>
</md:author>
<md:author id="ref27369.author919">
<md:lastName>Rosenthal</md:lastName>
<md:firstName>Yair</md:firstName>
</md:author>
<md:author id="ref27369.author28971">
<md:lastName>Coxall</md:lastName>
<md:firstName>Helen</md:firstName>
</md:author>
<md:author id="ref27369.author28468">
<md:lastName>Wilson</md:lastName>
<md:firstName>Paul A</md:firstName>
</md:author>
<md:year>2004</md:year>
<md:title>
Late Eocene to early Miocene ice sheet dynamics and the global carbon cycle
</md:title>
<md:source id="ref27369.journal12511" relatedTermIds="33974,34022,34030">Paleoceanography</md:source>
<md:volume>19</md:volume>
<md:URI>https://doi.org/10.1029/2004PA001039</md:URI>
<md:pages>PA4015</md:pages>
</md:reference>
<md:reference id="ref27370" relationType="Related to" relationTypeId="12">
<md:author id="ref27370.author29222">
<md:lastName>Tripati</md:lastName>
<md:firstName>Aradhna K</md:firstName>
<md:eMail>atri02@esc.cam.ac.uk</md:eMail>
<md:orcid>0000-0002-1695-1754</md:orcid>
</md:author>
<md:author id="ref27370.author10780">
<md:lastName>Elderfield</md:lastName>
<md:firstName>Henry</md:firstName>
<md:eMail>he101@esc.cam.ac.uk</md:eMail>
<md:URI>
http://www.esc.cam.ac.uk/people/academic-staff/harry-elderfield
</md:URI>
</md:author>
<md:author id="ref27370.author40828">
<md:lastName>Booth</md:lastName>
<md:firstName>Linda</md:firstName>
</md:author>
<md:author id="ref27370.author900">
<md:lastName>Zachos</md:lastName>
<md:firstName>James C</md:firstName>
<md:eMail>jzachos@ernerald.ucsc.edu</md:eMail>
<md:orcid>0000-0001-8439-1886</md:orcid>
</md:author>
<md:author id="ref27370.author29223">
<md:lastName>Ferretti</md:lastName>
<md:firstName>Patrizia</md:firstName>
<md:eMail>patrizia.ferretti@unive.it</md:eMail>
</md:author>
<md:year>2006</md:year>
<md:title>
Data report: High-resolution benthic foraminiferal stable isotope stratigraphy across the Oligocene/Miocene boundary at Site 1218
</md:title>
<md:source>
In: Wilson, PA; Lyle, M; Firth, JV (eds.), Proceedings of the Ocean Drilling Program, Scientific Results, College Station, TX (Ocean Drilling Program)
</md:source>
<md:volume>199</md:volume>
<md:URI>https://doi.org/10.2973/odp.proc.sr.199.221.2006</md:URI>
<md:pages>1-13</md:pages>
</md:reference>
<md:reference id="ref27371" relationType="Related to" relationTypeId="12">
<md:author id="ref27371.author30544">
<md:lastName>Wade</md:lastName>
<md:firstName>Bridget S</md:firstName>
<md:orcid>0000-0002-7245-8614</md:orcid>
</md:author>
<md:author id="ref27371.author25918">
<md:lastName>Pälike</md:lastName>
<md:firstName>Heiko</md:firstName>
<md:eMail>hpaelike@marum.de</md:eMail>
<md:orcid>0000-0003-3386-0923</md:orcid>
</md:author>
<md:year>2004</md:year>
<md:title>Oligocene climate dynamics</md:title>
<md:source id="ref27371.journal12511" relatedTermIds="33974,34022,34030">Paleoceanography</md:source>
<md:volume>19</md:volume>
<md:URI>https://doi.org/10.1029/2004PA001042</md:URI>
<md:pages>PA4019</md:pages>
</md:reference>
<md:extent>
<md:geographic>
<md:westBoundLongitude>-135.36665999999997</md:westBoundLongitude>
<md:eastBoundLongitude>-135.36665999999997</md:eastBoundLongitude>
<md:southBoundLatitude>8.889629999999999</md:southBoundLatitude>
<md:northBoundLatitude>8.889629999999999</md:northBoundLatitude>
<md:meanLongitude>-135.36665999999997</md:meanLongitude>
<md:meanLatitude>8.889629999999999</md:meanLatitude>
</md:geographic>
<md:temporal>
<md:minDateTime>2001-11-14T00:00:00</md:minDateTime>
<md:maxDateTime>2001-11-14T00:00:00</md:maxDateTime>
</md:temporal>
<md:topoType id="topotype3">vertical profile</md:topoType>
</md:extent>
<md:project id="project3" type="International">
<md:label>ODP</md:label>
<md:name>Ocean Drilling Program</md:name>
<md:URI>http://www-odp.tamu.edu/</md:URI>
</md:project>
<md:event id="event2075195">
<md:label>199-1218</md:label>
<md:latitude>8.88963</md:latitude>
<md:longitude>-135.36666</md:longitude>
<md:elevation>-4827.2</md:elevation>
<md:dateTime>2001-11-14T00:00:00</md:dateTime>
<md:attribute attid="19162" name="Penetration">797.1 m</md:attribute>
<md:attribute attid="19163" name="Recovery">723.7 m</md:attribute>
<md:location id="event2075195.term23838">
<md:name>North Pacific Ocean</md:name>
</md:location>
<md:campaign id="event2075195.campaign21711">
<md:name>Leg199</md:name>
<md:URI>https://doi.org/10.2973/odp.proc.ir.199.2002</md:URI>
</md:campaign>
<md:basis id="event2075195.basis5">
<md:name>Joides Resolution</md:name>
<md:URI>http://www-odp.tamu.edu/resolutn.html</md:URI>
</md:basis>
<md:device id="event2075195.term19373">
<md:name>Composite Core</md:name>
<md:optionalName>COMPCORE</md:optionalName>
</md:device>
<md:comment>
80 cores; 735.1 m cored; 62 m drilled; 98.5% recovery
</md:comment>
</md:event>
<md:size unit="datasets">3</md:size>
<md:license id="license101">
<md:label>CC-BY-3.0</md:label>
<md:name>Creative Commons Attribution 3.0 Unported</md:name>
<md:URI>https://creativecommons.org/licenses/by/3.0/</md:URI>
</md:license>
<md:comment>
For additional data from other sources used in this publication see doi:10.1594/PANGAEA.547800 and doi:10.1594/PANGAEA.547798
</md:comment>
<md:additionalSearchableContent>
Depth, composite | Depth comp | see Paelike et al., 2005 | Depth, composite revised | Depth cr | Sample code/label | Sample label | ODP sample designation | Sample, optional label/labor no | Lab no | consistent with Cande and Kent, 1995 | Age model | calibrated manually to astronomical template | calibrated automatically to astronomical template, used for figures | δ13C, carbonate | δ13C carb | δ18O, carbonate | δ18O carb | Calcium carbonate | CaCO3 | Reference/source | Reference | Intercore correlation | Age model in radiocarbon 14C ages | Cibicidoides spp., δ13C | Cibicidoides spp. δ13C | Isotope ratio mass spectrometry | Cibicidoides spp., δ18O | Cibicidoides spp. δ18O | Cibicidoides grimsdalei, δ13C | C. grimsdalei δ13C | Cibicidoides grimsdalei, δ18O | C. grimsdalei δ18O | Cibicidoides havanensis, δ13C | C. havanensis δ13C | Cibicidoides havanensis, δ18O | C. havanensis δ18O | Comment | B = bottom, T = top | Chronozone | Age model, GPTS (geomagnetic polarity timescale), Cande and Kent (1995) | Neogene age | Age model, optional | Age model opt | Age model, ATNTS2004, Lourens et al., 2004 | manual | auto
</md:additionalSearchableContent>
<md:keywords>
<md:techKeyword type="autoGenerated">supplement</md:techKeyword>
<md:techKeyword type="autoGenerated">citable</md:techKeyword>
<md:techKeyword type="autoGenerated">method250</md:techKeyword>
<md:techKeyword type="autoGenerated">method259</md:techKeyword>
<md:techKeyword type="autoGenerated">method5001</md:techKeyword>
<md:techKeyword type="autoGenerated">method5059</md:techKeyword>
<md:techKeyword type="autoGenerated">method64</md:techKeyword>
<md:techKeyword type="autoGenerated">method7399</md:techKeyword>
<md:techKeyword type="autoGenerated">param118</md:techKeyword>
<md:techKeyword type="autoGenerated">param119</md:techKeyword>
<md:techKeyword type="autoGenerated">param15372</md:techKeyword>
<md:techKeyword type="autoGenerated">param1570</md:techKeyword>
<md:techKeyword type="autoGenerated">param17859</md:techKeyword>
<md:techKeyword type="autoGenerated">param2</md:techKeyword>
<md:techKeyword type="autoGenerated">param2094</md:techKeyword>
<md:techKeyword type="autoGenerated">param2095</md:techKeyword>
<md:techKeyword type="autoGenerated">param50042</md:techKeyword>
<md:techKeyword type="autoGenerated">param50043</md:techKeyword>
<md:techKeyword type="autoGenerated">param51991</md:techKeyword>
<md:techKeyword type="autoGenerated">param51992</md:techKeyword>
<md:techKeyword type="autoGenerated">param6</md:techKeyword>
<md:techKeyword type="autoGenerated">param6666</md:techKeyword>
<md:techKeyword type="autoGenerated">param6857</md:techKeyword>
<md:techKeyword type="autoGenerated">param70</md:techKeyword>
<md:techKeyword type="autoGenerated">param7359</md:techKeyword>
<md:techKeyword type="autoGenerated">param790</md:techKeyword>
<md:techKeyword type="autoGenerated">pi25918</md:techKeyword>
<md:techKeyword type="autoGenerated">author10780</md:techKeyword>
<md:techKeyword type="autoGenerated">author20020</md:techKeyword>
<md:techKeyword type="autoGenerated">author21844</md:techKeyword>
<md:techKeyword type="autoGenerated">author25918</md:techKeyword>
<md:techKeyword type="autoGenerated">author265</md:techKeyword>
<md:techKeyword type="autoGenerated">author28468</md:techKeyword>
<md:techKeyword type="autoGenerated">author28971</md:techKeyword>
<md:techKeyword type="autoGenerated">author29222</md:techKeyword>
<md:techKeyword type="autoGenerated">author29223</md:techKeyword>
<md:techKeyword type="autoGenerated">author29618</md:techKeyword>
<md:techKeyword type="autoGenerated">author30544</md:techKeyword>
<md:techKeyword type="autoGenerated">author40828</md:techKeyword>
<md:techKeyword type="autoGenerated">author526</md:techKeyword>
<md:techKeyword type="autoGenerated">author900</md:techKeyword>
<md:techKeyword type="autoGenerated">author919</md:techKeyword>
<md:techKeyword type="autoGenerated">basis5</md:techKeyword>
<md:techKeyword type="autoGenerated">campaign21711</md:techKeyword>
<md:techKeyword type="autoGenerated">event2075195</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1599</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1600</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode1601</md:techKeyword>
<md:techKeyword type="autoGenerated">geocode8128</md:techKeyword>
<md:techKeyword type="autoGenerated">journal11658</md:techKeyword>
<md:techKeyword type="autoGenerated">journal12511</md:techKeyword>
<md:techKeyword type="autoGenerated">journal14481</md:techKeyword>
<md:techKeyword type="autoGenerated">license101</md:techKeyword>
<md:techKeyword type="autoGenerated">project3</md:techKeyword>
<md:techKeyword type="autoGenerated">ref27368</md:techKeyword>
<md:techKeyword type="autoGenerated">ref27369</md:techKeyword>
<md:techKeyword type="autoGenerated">ref27370</md:techKeyword>
<md:techKeyword type="autoGenerated">ref27371</md:techKeyword>
<md:techKeyword type="autoGenerated">ref27372</md:techKeyword>
<md:techKeyword type="autoGenerated">term19373</md:techKeyword>
<md:techKeyword type="autoGenerated">term23838</md:techKeyword>
<md:techKeyword type="autoGenerated">topotype3</md:techKeyword>
</md:keywords>
<md:technicalInfo>
<md:entry key="xmlLastModified" value="2019-02-13T11:08:43Z"/>
<md:entry key="filename" value="199-1218_age-model_stab-isot"/>
<md:entry key="mimeType" value="application/zip"/>
<md:entry key="status" value="published"/>
<md:entry key="status_num" value="4"/>
<md:entry key="DOIRegistryStatus" value="registered"/>
<md:entry key="DOIRegistryStatus_num" value="4"/>
<md:entry key="hierarchyLevel" value="parent"/>
<md:entry key="collectionType" value="publication series"/>
<md:entry key="collectionType_num" value="4"/>
<md:entry key="collectionChilds" value="D547797,D547799,D771930"/>
<md:entry key="loginOption" value="unrestricted"/>
<md:entry key="loginOption_num" value="1"/>
</md:technicalInfo>
</md:MetaData>
"""
