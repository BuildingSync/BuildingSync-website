<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt1">
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
  <!--  
  Ensure that every Building is linked to a Benchmark Scenario
  <severity> error
  -->
  <pattern id="sc.be.hasBenchmarkType">
    <rule context="auc:Buildings/auc:Building">
      <let name="buildingID" value="@ID"/>
      <let name="benchmarkLinkedBuildingIDs" value="ancestor::auc:Facility/auc:Reports//auc:Scenario[auc:ScenarioType/auc:Benchmark]/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref"/>
      <assert test="$buildingID = $benchmarkLinkedBuildingIDs ">
        [ERROR] '<name/>' ID = '<value-of select="$buildingID"/>' IS REQUIRED TO BE LINKED TO an 'auc:Scenario/auc:ScenarioType/auc:Benchmark'
      </assert>
    </rule>
  </pattern>
  <!--  
  Ensure that every BenchmarkType Scenario has necessary info per Std 211 5.2.3
  <severity> error
  -->
  <pattern id="sc.benchmarkType.mainDetails.L000">
    <rule context="auc:Scenario[auc:ScenarioType/auc:Benchmark]/auc:ScenarioType/auc:Benchmark">
<!--      <assert test="auc:BenchmarkType/*">-->
      <assert test="count(auc:BenchmarkType/*) > 0">
        [ERROR] child element for 'auc:BenchmarkType' is REQUIRED AT LEAST ONCE for '<name/>’
      </assert>
      <assert test="auc:BenchmarkTool">
        [ERROR] element 'auc:BenchmarkTool' is REQUIRED EXACTLY ONCE for '<name/>’
      </assert>
      <assert test="auc:BenchmarkYear">
        [ERROR] element 'auc:BenchmarkYear' is REQUIRED EXACTLY ONCE for '<name/>’
      </assert>
      <assert test="../../auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
        [ERROR] elements 'auc:LinkedPremises/auc:Building/auc:LinkedBuildingID' is REQUIRED EXACTLY ONCE for '<name/>’
      </assert>
    </rule>
  </pattern>
  <!--  
  Ensure that every Building is linked to a Measurement Scenario
  <severity> error
  -->
  <pattern id="sc.be.hasMeasured">
    <rule context="auc:Buildings/auc:Building">
      <let name="buildingID" value="@ID"/>
      <let name="benchmarkLinkedBuildingIDs" value="ancestor::auc:Facility/auc:Reports//auc:Scenario[auc:ScenarioType/auc:CurrentBuilding/auc:CalculationMethod/auc:Measured]/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref"/>
      <assert test="$buildingID = $benchmarkLinkedBuildingIDs ">
        [ERROR] '<name/>' ID = '<value-of select="$buildingID"/>' IS REQUIRED TO BE LINKED TO an 'auc:Scenario/auc:ScenarioType/auc:CurrentBuilding/auc:CalculationMethod/auc:Measured'
      </assert>
    </rule>
  </pattern>
  <!--  
  Ensure that Measurement Scenario has:
  - ResourceUses defined
  - At least one ResourceUse/EnergyResource
  <severity> error
  -->
  <pattern id="sc.measured.resourceUseReqs">
    <rule context="auc:Scenario[auc:ScenarioType/auc:CurrentBuilding/auc:CalculationMethod/auc:Measured]">
      <assert test="count(auc:ResourceUses) = 1">
        [ERROR] '<name/>' ID = '<value-of select="@ID"/>' MUST HAVE EXACTLY ONE 'auc:ResourceUses' child element
      </assert>
      <assert test="count(auc:ResourceUses/auc:ResourceUse/auc:EnergyResource) >= 1">
        [ERROR] '<name/>' ID = '<value-of select="@ID"/>' MUST HAVE AT LEAST ONE 'auc:ResourceUses/auc:ResourceUse/auc:EnergyResource'
      </assert>
    </rule>
  </pattern>
</schema>
