<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--    
    This pattern ensures there is exactly one of every element inclusive of the Building element
    It walks the path: BuildingSync/Facilities/Facility/Sites/Site/Buildings/Building
    <severity> error
  -->
  <pattern id="root.oneOfEachUntilBuilding">
    <rule context="/">
      <assert test="count(auc:BuildingSync) = 1">[ERROR] element 'auc:BuildingSync' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:BuildingSync">
      <assert test="count(auc:Facilities) = 1">[ERROR] element 'auc:Facilities' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Facilities">
      <assert test="count(auc:Facility) = 1">[ERROR] element 'auc:Facility' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Facility">
      <assert test="count(auc:Sites) = 1">[ERROR] element 'auc:Sites' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Sites">
      <assert test="count(auc:Site) = 1">[ERROR] element 'auc:Site' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Site">
      <assert test="count(auc:Buildings) = 1">[ERROR] element 'auc:Buildings' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Buildings">
      <assert test="count(auc:Building) = 1">[ERROR] element 'auc:Building' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
  </pattern>
  <!--    
    This pattern ensures there is exactly one of every element inclusive of the Scenario element
    It starts at the Facility element and walks the path: Reports/Report/Scenarios/Scenario
    <severity> error
  -->
  <pattern id="root.oneOfEachFacilityUntilScenario">
    <rule context="auc:Facility">
      <assert test="count(auc:Reports) = 1">[ERROR] element 'auc:Reports' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Reports">
      <assert test="count(auc:Report) &gt;= 1">[ERROR] element 'auc:Report' is REQUIRED AT LEAST ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Report">
      <assert test="count(auc:Scenarios) = 1">[ERROR] element 'auc:Scenarios' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
    <rule context="auc:Scenarios">
      <assert test="count(auc:Scenario) &gt;= 1">[ERROR] element 'auc:Scenario' is REQUIRED AT LEAST ONCE for: '<name/>'</assert>
    </rule>
  </pattern>
  <!--    
    This pattern ensures there is exactly one of every element inclusive of the Contacts element
    It starts at the Facility element and walks the path: Facility/Contacts
    <severity> error
  -->
  <pattern id="root.oneOfEachFacilityUntilContacts">
    <rule context="auc:Facility">
      <assert test="count(auc:Contacts) = 1">[ERROR] element 'auc:Contacts' is REQUIRED EXACTLY ONCE for: '<name/>'</assert>
    </rule>
  </pattern>
  <!--    
    This pattern ensures there is at least one Report in a Facility
    <severity> error
  -->
  <pattern id="root.atleastOneReportInFacility">
    <rule context="auc:Facility">
      <assert test="auc:Reports/auc:Report">[ERROR] element 'auc:Report' is REQUIRED AT LEAST ONCE for: '<name/>'</assert>
    </rule>
  </pattern>
  <!--    
    This pattern ensures there is at least one Scenario in a Report
    <severity> error
  -->
  <pattern id="root.atleastOneScenarioInReport">
    <rule context="auc:Report">
      <assert test="auc:Scenarios/auc:Scenario">[ERROR] element 'auc:Scenario' is REQUIRED AT LEAST ONCE for: '<name/>'</assert>
    </rule>
  </pattern>
</schema>
