<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt1">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--
    For logic that pertains to Section elements
-->
  <!--
    Check the main details for the Section element as required by 211.  Although this function
    can be run against any auc:Section element, it is typically restricted to 'Space function'
    element types, i.e. auc:Section[auc:SectionType='Space function']
    <severity> error
    <param> parent - an auc:Section element.
-->
  <pattern abstract="true" id="sec.mainDetails.L100.audit">
    <rule context="$parent">
      <assert test="auc:OccupancyClassification">
        [ERROR] element 'auc:OccupancyClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:OriginalOccupancyClassification">
        [WARNING] element 'auc:OriginalOccupancyClassification' is RECOMMENDED for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check the main details for the Section element as required by 211.  Although this function
    can be run against any auc:Section element, it is typically restricted to 'Space function'
    element types, i.e. auc:Section[auc:SectionType='Space function']
    <severity> error
    <param> parent - an auc:Section element.
-->
  <pattern abstract="true" id="sec.mainDetails.L100.sim">
    <rule context="$parent">
      <assert test="auc:OccupancyClassification">
        [ERROR] element 'auc:OccupancyClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Require that each auc:Section element is referenced to by exactly one of
    each of the following elements via an @IDref:
    1. auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID
    2. auc:System/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID
    3. auc:System/auc:PlugLoads/auc:PlugLoad/auc:LinkedPremises/auc:Section/auc:LinkedSectionID
    <severity> error
-->
  <pattern id="sec.primarySystems.L100">
    <rule context="auc:Section[auc:SectionType='Space function']">
      <let name="sectionID" value="@ID"/>
      <let name="hvacSystemLinkedSectionIDs" value="ancestor::auc:Facility/auc:Systems//auc:HVACSystem[auc:PrimaryHVACSystemType]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref"/>
      <let name="lightingSystemLinkedSectionIDs" value="ancestor::auc:Facility/auc:Systems//auc:LightingSystem[auc:PrimaryLightingSystemType]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref"/>
      <let name="plugLoadLinkedSectionIDs" value="ancestor::auc:Facility/auc:Systems//auc:PlugLoad[auc:PlugLoadType='Miscellaneous Electric Load' and auc:WeightedAverageLoad]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref"/>
      <assert test="$sectionID = $hvacSystemLinkedSectionIDs">
        [ERROR] '<name/>' ID = '<value-of select="@ID"/>' IS REQUIRED TO BE LINKED TO an 'auc:HVACSystem' with child element 'auc:PrimaryHVACSystemType'
      </assert>
      <assert test="$sectionID = $lightingSystemLinkedSectionIDs">
        [ERROR] '<name/>' ID = '<value-of select="@ID"/>' IS REQUIRED TO BE LINKED TO an 'auc:LightingSystem' with child element 'auc:PrimaryLightingSystemType'
      </assert>
      <assert test="$sectionID = $plugLoadLinkedSectionIDs">
        [ERROR] '<name/>' ID = '<value-of select="@ID"/>' IS REQUIRED TO BE LINKED TO an 'auc:PlugLoad' with child elements 'auc:PlugLoadType='Miscellaneous Electric Load'' and auc:WeightedAverageLoad
      </assert>
    </rule>
  </pattern>
</schema>
