<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--  
    For logic that pertains to Scenario elements
-->
  <!--
    A baseline scenario must be defined.  Within the baseline scenario, the following 
    must be defined exactly: auc:ScenarioType/auc:PackageOfMeasures/auc:ReferenceCase IDref='Baseline'
    TODO: Need to update BuildingSync-gem to look for following and change this function to look for:
      auc:ScenarioType/auc:CurrentBuilding/auc:CalculationMethod/auc:Modeled
      The thought being that there should only be ONE of these types for a building.  Any other iterations
      based on this original should be defined as:
        auc:ScenarioType/auc:PackageOfMeasures/auc:ReferenceCase/@IDref='above'
-->
  <pattern id="sc.baseline.ID">
    <let name="baselineCount" value="count(//auc:Scenario[@ID='Baseline'])"/>
    <rule context="auc:Scenarios">
      <assert test="$baselineCount = 1">
        [ERROR] element 'auc:Scenario' with attribute ID='Baseline' is REQUIRED EXACTLY ONCE for: <name/>
      </assert>
    </rule>
  </pattern>
  <pattern id="sc.baseline.asPackageOfMeasures">
    <rule context="auc:Scenario[@ID='Baseline']">
      <assert test="auc:ScenarioType/auc:PackageOfMeasures/auc:ReferenceCase/@IDref = 'Baseline'">
        [ERROR] element 'auc:Scenario' with attribute ID='Baseline' MUST CONTAIN the following subelements:
        auc:ScenarioType/auc:PackageOfMeasures/auc:ReferenceCase IDref='Baseline'
      </assert>
    </rule>
  </pattern>
</schema>
