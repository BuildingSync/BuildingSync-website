<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--
    For logic that pertains to either a Site OR a Building element.
-->
  <!--
    This pattern checks that: atleast 1 city and 1 state OR
    1 climate zone are specified at the site OR building level.
    A warning is issued if more than one of each element is specified.
    <severity> error
    <param> parent - an auc:Site
  -->
  <pattern abstract="true" id="sbe.cityStateOrClimateZone">
    <rule context="$parent">
      <let name="siteCityCount" value="count(auc:Address/auc:City)"/>
      <let name="siteStateCount" value="count(auc:Address/auc:State)"/>
      <let name="siteClimateZoneCount" value="count(auc:ClimateZoneType//auc:ClimateZone)"/>
      <let name="allCityCount" value="count(.//auc:Address/auc:City)"/>
      <let name="allStateCount" value="count(.//auc:Address/auc:State)"/>
      <let name="allClimateZoneCount" value="count(.//auc:ClimateZoneType//auc:ClimateZone)"/>
      <assert test="($allCityCount = 1 and $allStateCount = 1 and $allClimateZoneCount &lt;= 1) or ($allCityCount &lt;= 1 and $allStateCount &lt;= 1 and $allClimateZoneCount = 1)">
        [WARNING] elements 'auc:City' and 'auc:State' or element 'auc:ClimateZoneType//auc:ClimateZone' are RECOMMENDED EXACTLY ONCE at either the 'auc:Site' or 'auc:Building' level.
      </assert>
      <assert test="false()">
        [INFO] Number of 'auc:City' elements defined at the 'auc:Site' = <value-of select="$siteCityCount"/>, 'auc:Building' = <value-of select="$allCityCount - $siteCityCount"/>
      </assert>
      <assert test="false()">
        [INFO] Number of 'auc:State' elements defined at the 'auc:Site' = <value-of select="$siteStateCount"/>, 'auc:Building' = <value-of select="$allStateCount - $siteStateCount"/>
      </assert>
      <assert test="false()">
        [INFO] Number of 'auc:ClimateZoneType//auc:ClimateZone' elements defined at the 'auc:Site' = <value-of select="$siteClimateZoneCount"/>, 'auc:Building' = <value-of select="$allClimateZoneCount - $siteClimateZoneCount"/>
      </assert>
    </rule>
  </pattern>
</schema>
