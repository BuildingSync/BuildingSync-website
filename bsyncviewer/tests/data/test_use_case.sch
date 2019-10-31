<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <sch:pattern>
    <sch:title>"Example UseCase Schematron Definitinos"</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Measures/auc:Measure/auc:LinkedPremises/auc:Site/auc:LinkedSiteID]">
      <sch:assert test="auc:Measures/auc:Measure/auc:LinkedPremises/auc:Site/auc:LinkedSiteID/@IDref/text() = auc:Sites/auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Reports/auc:Report/auc:AuditorContactID]">
      <sch:assert test="auc:Reports/auc:Report/auc:AuditorContactID/@IDref/text() = auc:Contacts/auc:Contact/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/">
      <sch:assert test="count(auc:BuildingSync) &gt;= 1">element "auc:BuildingSync" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync">
      <sch:assert test="count(auc:Facilities) &gt;= 1">element "auc:Facilities" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities">
      <sch:assert test="count(auc:Facility) &gt;= 1">element "auc:Facility" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Programs)">element "auc:Programs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Contacts) &gt;= 0">element "auc:Contacts" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Measures) &gt;= 0">element "auc:Measures" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Reports) &gt;= 0">element "auc:Reports" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Schedules) &gt;= 0">element "auc:Schedules" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Sites) &gt;= 1">element "auc:Sites" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Systems) &gt;= 0">element "auc:Systems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Tenants)">element "auc:Tenants" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts">
      <sch:assert test="count(auc:Contact) &gt;= 0">element "auc:Contact" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Address) &gt;= 0">element "auc:Address" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ContactCompany) &gt;= 0">element "auc:ContactCompany" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ContactEmailAddresses) &gt;= 0">element "auc:ContactEmailAddresses" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ContactName) &gt;= 0">element "auc:ContactName" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ContactRoles) &gt;= 0">element "auc:ContactRoles" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ContactTelephoneNumbers) &gt;= 0">element "auc:ContactTelephoneNumbers" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ContactTitle)">element "auc:ContactTitle" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:Address">
      <sch:assert test="count(auc:City) &gt;= 0">element "auc:City" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Country)">element "auc:Country" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:County)">element "auc:County" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PostalCode) &gt;= 0">element "auc:PostalCode" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PostalCodePlus4)">element "auc:PostalCodePlus4" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:State) &gt;= 0">element "auc:State" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:StreetAddressDetail) &gt;= 0">element "auc:StreetAddressDetail" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:Address/auc:StreetAddressDetail">
      <sch:assert test="not(auc:Complex)">element "auc:Complex" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Simplified) &gt;= 1">element "auc:Simplified" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:Address/auc:StreetAddressDetail/auc:Simplified">
      <sch:assert test="count(auc:StreetAddress) &gt;= 1">element "auc:StreetAddress" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:ContactEmailAddresses">
      <sch:assert test="count(auc:ContactEmailAddress) &gt;= 0">element "auc:ContactEmailAddress" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:ContactRoles">
      <sch:assert test="count(auc:ContactRole) &gt;= 0">element "auc:ContactRole" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:ContactRoles/auc:ContactRole">
      <sch:assert test="contains('_Energy Auditor_ _Owner_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Energy Auditor" or "Owner"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:ContactTelephoneNumbers">
      <sch:assert test="count(auc:ContactTelephoneNumber) &gt;= 0">element "auc:ContactTelephoneNumber" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Contacts/auc:Contact/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures">
      <sch:assert test="count(auc:Measure) &gt;= 0">element "auc:Measure" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:CapitalReplacementCost)">element "auc:CapitalReplacementCost" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CustomMeasureName)">element "auc:CustomMeasureName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DiscardReason)">element "auc:DiscardReason" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EndDate)">element "auc:EndDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ImplementationStatus) &gt;= 0">element "auc:ImplementationStatus" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 0">element "auc:LinkedPremises" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:LongDescription) &gt;= 0">element "auc:LongDescription" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MVCost) &gt;= 0">element "auc:MVCost" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:MVOption)">element "auc:MVOption" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:MeasureInstallationCost) &gt;= 0">element "auc:MeasureInstallationCost" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MeasureMaterialCost) &gt;= 0">element "auc:MeasureMaterialCost" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MeasureSavingsAnalysis) &gt;= 0">element "auc:MeasureSavingsAnalysis" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MeasureScaleOfApplication) &gt;= 0">element "auc:MeasureScaleOfApplication" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MeasureTotalFirstCost) &gt;= 0">element "auc:MeasureTotalFirstCost" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Recommended) &gt;= 0">element "auc:Recommended" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ResidualValue)">element "auc:ResidualValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:StartDate)">element "auc:StartDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SystemCategoryAffected) &gt;= 0">element "auc:SystemCategoryAffected" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:TechnologyCategories) &gt;= 0">element "auc:TechnologyCategories" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:TypeOfMeasure)">element "auc:TypeOfMeasure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UsefulLife) &gt;= 0">element "auc:UsefulLife" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:ImplementationStatus">
      <sch:assert test="contains('_Completed_ _Evaluated_ _Proposed_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Completed", "Evaluated", or "Proposed"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 0">element "auc:Building" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Site) &gt;= 0">element "auc:Site" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:LinkedPremises/auc:Site">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MVCost">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>

    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureSavingsAnalysis">
      <sch:assert test="not(auc:AnnualDemandSavingsCost)">element "auc:AnnualDemandSavingsCost" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualPeakElectricityReduction)">element "auc:AnnualPeakElectricityReduction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualSavingsByFuels)">element "auc:AnnualSavingsByFuels" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualSavingsCost)">element "auc:AnnualSavingsCost" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualSavingsSiteEnergy)">element "auc:AnnualSavingsSiteEnergy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualSavingsSourceEnergy)">element "auc:AnnualSavingsSourceEnergy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualWaterCostSavings)">element "auc:AnnualWaterCostSavings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AnnualWaterSavings)">element "auc:AnnualWaterSavings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CalculationMethodType) &gt;= 0">element "auc:CalculationMethodType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CostEffectivenessScreeningMethod)">element "auc:CostEffectivenessScreeningMethod" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EquipmentDisposalAndSalvageCosts)">element "auc:EquipmentDisposalAndSalvageCosts" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FundingFromIncentives) &gt;= 0">element "auc:FundingFromIncentives" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FundingFromTaxCredits)">element "auc:FundingFromTaxCredits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InternalRateOfReturn)">element "auc:InternalRateOfReturn" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MeasureRank)">element "auc:MeasureRank" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NPVofTaxImplications)">element "auc:NPVofTaxImplications" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NetPresentValue)">element "auc:NetPresentValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OMCostAnnualSavings) &gt;= 0">element "auc:OMCostAnnualSavings" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherCostAnnualSavings)">element "auc:OtherCostAnnualSavings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ReferenceCase)">element "auc:ReferenceCase" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SimplePayback)">element "auc:SimplePayback" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SummerPeakElectricityReduction)">element "auc:SummerPeakElectricityReduction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WinterPeakElectricityReduction)">element "auc:WinterPeakElectricityReduction" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureSavingsAnalysis/auc:CalculationMethodType">
      <sch:assert test="contains('_Estimated_ _Modeled_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Estimated" or "Modeled"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureScaleOfApplication">
      <sch:assert test="contains('_Whole building_ _Tenant spaces_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Whole building", or "Tenant spaces"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:SystemCategoryAffected">
      <sch:assert test="contains('_Air Distribution_ _Ceiling_ _Conveyance_ _Cooking_ _Cooling System_ _Critical IT System_ _Dishwasher_ _Domestic Hot Water_ _Fan_ _Fenestration_ _Foundation_ _General Controls and Operations_ _Heat Recovery_ _Heating System_ _Laundry_ _Lighting_ _Motor_ _Onsite Storage, Transmission, Generation_ _Other_ _Other HVAC_ _Plug Load_ _Pool_ _Process Load_ _Pump_ _Refrigeration_ _Roof_ _Wall_ _Water Use_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Air Distribution", "Ceiling", "Conveyance", "Cooking", "Cooling System", "Critical IT System", "Dishwasher", "Domestic Hot Water", "Fan", "Fenestration", "Foundation", "General Controls and Operations", "Heat Recovery", "Heating System", "Laundry", "Lighting", "Motor", "Onsite Storage, Transmission, Generation", "Other", "Other HVAC", "Plug Load", "Pool", "Process Load", "Pump", "Refrigeration", "Roof", "Wall", or "Water Use"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories">
      <sch:assert test="count(auc:TechnologyCategory) &gt;= 0">element "auc:TechnologyCategory" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Rebate Available']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Rebate Available']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Affected']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Affected']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Option 1_ _Option 2_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Option 1" or "Option 2"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Option 1']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Option 2']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports">
      <sch:assert test="count(auc:Report) &gt;= 0">element "auc:Report" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]) &gt;= 0">element "auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Report[auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]) &gt;= 0">element "auc:Report[auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]" is OPTIONAL</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
