<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <sch:pattern>
    <sch:title>"New York City Energy Efficiency Report"</sch:title>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Measures/auc:Measure/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Measures/auc:Measure/auc:LinkedPremises/auc:Site/auc:LinkedSiteID]">
      <sch:assert test="auc:Measures/auc:Measure/auc:LinkedPremises/auc:Site/auc:LinkedSiteID/@IDref/text() = auc:Sites/auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Reports/auc:Report/auc:AuditorContactID]">
      <sch:assert test="auc:Reports/auc:Report/auc:AuditorContactID/@IDref/text() = auc:Contacts/auc:Contact/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Reports/auc:Report/auc:Qualifications/auc:Qualification/auc:CertifiedAuditTeamMemberContactID]">
      <sch:assert test="auc:Reports/auc:Report/auc:Qualifications/auc:Qualification/auc:CertifiedAuditTeamMemberContactID/@IDref/text() = auc:Contacts/auc:Contact/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]">
      <sch:assert test="auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID/@IDref/text() = auc:Sites/auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:ExteriorFloors/auc:ExteriorFloor/auc:ExteriorFloorID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:ExteriorFloors/auc:ExteriorFloor/auc:ExteriorFloorID/@IDref/text() = auc:Systems/auc:ExteriorFloorSystems/auc:ExteriorFloorSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Foundations/auc:Foundation/auc:FoundationID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Foundations/auc:Foundation/auc:FoundationID/@IDref/text() = auc:Systems/auc:FoundationSystems/auc:FoundationSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Roofs/auc:Roof/auc:RoofID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Roofs/auc:Roof/auc:RoofID/@IDref/text() = auc:Systems/auc:RoofSystems/auc:RoofSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Roofs/auc:Roof/auc:RoofID/auc:SkylightIDs/auc:SkylightID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Roofs/auc:Roof/auc:RoofID/auc:SkylightIDs/auc:SkylightID/@IDref/text() = auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:DoorID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:DoorID/@IDref/text() = auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:WallID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:WallID/@IDref/text() = auc:Systems/auc:WallSystems/auc:WallSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:WindowID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:Sides/auc:Side/auc:WindowID/@IDref/text() = auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:ThermalZones/auc:ThermalZone/auc:HVACScheduleIDs/auc:HVACScheduleID]">
      <sch:assert test="auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:ThermalZones/auc:ThermalZone/auc:HVACScheduleIDs/auc:HVACScheduleID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID]">
      <sch:assert test="auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:SpaceHeatingSystem/auc:HeatingPlantID]">
      <sch:assert test="auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:SpaceHeatingSystem/auc:HeatingPlantID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:FanSystems/auc:FanSystem/auc:LinkedSystemIDs/auc:LinkedSystemID]">
      <sch:assert test="auc:Systems/auc:FanSystems/auc:FanSystem/auc:LinkedSystemIDs/auc:LinkedSystemID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:FoundationSystems/auc:FoundationSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName/text() = 'Linked Wall ID']">
      <sch:assert test="auc:Systems/auc:FoundationSystems/auc:FoundationSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']/auc:FieldValue/text() = auc:Systems/auc:WallSystems/auc:WallSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSource/auc:CoolingSourceType/auc:CoolingPlantID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSource/auc:CoolingSourceType/auc:CoolingPlantID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:DeliveryType/auc:CentralAirDistribution/auc:ReheatPlantID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:DeliveryType/auc:CentralAirDistribution/auc:ReheatPlantID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSource/auc:HeatingSourceType/auc:SourceHeatingPlantID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSource/auc:HeatingSourceType/auc:SourceHeatingPlantID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Site/auc:LinkedSiteID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:LinkedPremises/auc:Site/auc:LinkedSiteID/@IDref/text() = auc:Sites/auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue/text() = auc:Sites/auc:Site[not(auc:Buildings/auc:Building)]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:CondenserPlantIDs/auc:CondenserPlantID]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:CondenserPlantIDs/auc:CondenserPlantID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue/text() = auc:Sites/auc:Site[not(auc:Buildings/auc:Building)]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue]">
      <sch:assert test="auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue/text() = auc:Sites/auc:Site[not(auc:Buildings/auc:Building)]/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID]">
      <sch:assert test="auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:MotorSystems/auc:MotorSystem/auc:LinkedSystemIDs/auc:LinkedSystemID]">
      <sch:assert test="auc:Systems/auc:MotorSystems/auc:MotorSystem/auc:LinkedSystemIDs/auc:LinkedSystemID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID]">
      <sch:assert test="auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID]">
      <sch:assert test="auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/@IDref/text() = auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType/text() = 'Space function']/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility[auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:LinkedSystemIDs/auc:LinkedSystemID]">
      <sch:assert test="(auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:LinkedSystemIDs/auc:LinkedSystemID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/@ID/text()) | (auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:LinkedSystemIDs/auc:LinkedSystemID/@IDref/text() = auc:Systems/auc:HVACSystems/auc:HVACSystem/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/@ID/text())"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:OtherHVACSystems/auc:OtherHVACSystem/auc:LinkedDeliveryIDs/auc:LinkedDeliveryID]">
      <sch:assert test="auc:OtherHVACSystems/auc:OtherHVACSystem/auc:LinkedDeliveryIDs/auc:LinkedDeliveryID/@IDref/text() = auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:CoolingSourceID]">
      <sch:assert test="auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:CoolingSourceID/@IDref/text() = auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSource/@ID/text()"></sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:HeatingSourceID]">
      <sch:assert test="auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:HeatingSourceID/@IDref/text() = auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSource/@ID/text()"></sch:assert>
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
      <sch:assert test="contains('_Contributor_ _Energy Auditor_ _Operator_ _Owner_ _Property Management Company_ _Qualified Assessor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Contributor", "Energy Auditor", "Operator", "Owner", "Property Management Company", or "Qualified Assessor"</sch:assert>
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
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureInstallationCost">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureMaterialCost">
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
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureSavingsAnalysis/auc:FundingFromIncentives">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureSavingsAnalysis/auc:OMCostAnnualSavings">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureScaleOfApplication">
      <sch:assert test="contains('_Common areas_ _Entire building_ _Tenant areas_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Common areas", "Entire building", or "Tenant areas"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:MeasureTotalFirstCost">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:SystemCategoryAffected">
      <sch:assert test="contains('_Air Distribution_ _Ceiling_ _Conveyance_ _Cooking_ _Cooling System_ _Critical IT System_ _Dishwasher_ _Domestic Hot Water_ _Fan_ _Fenestration_ _Foundation_ _General Controls and Operations_ _Heat Recovery_ _Heating System_ _Laundry_ _Lighting_ _Motor_ _Onsite Storage, Transmission, Generation_ _Other_ _Other HVAC_ _Plug Load_ _Pool_ _Process Load_ _Pump_ _Refrigeration_ _Roof_ _Wall_ _Water Use_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Air Distribution", "Ceiling", "Conveyance", "Cooking", "Cooling System", "Critical IT System", "Dishwasher", "Domestic Hot Water", "Fan", "Fenestration", "Foundation", "General Controls and Operations", "Heat Recovery", "Heating System", "Laundry", "Lighting", "Motor", "Onsite Storage, Transmission, Generation", "Other", "Other HVAC", "Plug Load", "Pool", "Process Load", "Pump", "Refrigeration", "Roof", "Wall", or "Water Use"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories">
      <sch:assert test="count(auc:TechnologyCategory) &gt;= 0">element "auc:TechnologyCategory" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory">
      <sch:assert test="count(auc:AdvancedMeteringSystems) &gt;= 0">element "auc:AdvancedMeteringSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BoilerPlantImprovements) &gt;= 0">element "auc:BoilerPlantImprovements" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BuildingAutomationSystems) &gt;= 0">element "auc:BuildingAutomationSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BuildingEnvelopeModifications) &gt;= 0">element "auc:BuildingEnvelopeModifications" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ChilledWaterHotWaterAndSteamDistributionSystems) &gt;= 0">element "auc:ChilledWaterHotWaterAndSteamDistributionSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ChillerPlantImprovements) &gt;= 0">element "auc:ChillerPlantImprovements" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ConveyanceSystems) &gt;= 0">element "auc:ConveyanceSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DataCenterImprovements) &gt;= 0">element "auc:DataCenterImprovements" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DistributedGeneration) &gt;= 0">element "auc:DistributedGeneration" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ElectricalPeakShavingLoadShifting) &gt;= 0">element "auc:ElectricalPeakShavingLoadShifting" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:EnergyCostReductionThroughRateAdjustments) &gt;= 0">element "auc:EnergyCostReductionThroughRateAdjustments" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:EnergyDistributionSystems) &gt;= 0">element "auc:EnergyDistributionSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:EnergyRelatedProcessImprovements) &gt;= 0">element "auc:EnergyRelatedProcessImprovements" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FutureOtherECMs) &gt;= 0">element "auc:FutureOtherECMs" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HealthAndSafety)">element "auc:HealthAndSafety" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LightingImprovements) &gt;= 0">element "auc:LightingImprovements" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OtherElectricMotorsAndDrives) &gt;= 0">element "auc:OtherElectricMotorsAndDrives" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OtherHVAC) &gt;= 0">element "auc:OtherHVAC" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoadReductions) &gt;= 0">element "auc:PlugLoadReductions" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Refrigeration) &gt;= 0">element "auc:Refrigeration" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:RenewableEnergySystems) &gt;= 0">element "auc:RenewableEnergySystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ServiceHotWaterSystems) &gt;= 0">element "auc:ServiceHotWaterSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Uncategorized)">element "auc:Uncategorized" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WaterAndSewerConservationSystems) &gt;= 0">element "auc:WaterAndSewerConservationSystems" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:AdvancedMeteringSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:AdvancedMeteringSystems/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement training and/or documentation_ _Install advanced metering systems_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement training and/or documentation", "Install advanced metering systems", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BoilerPlantImprovements">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BoilerPlantImprovements/auc:MeasureName">
      <sch:assert test="contains('_Add energy recovery_ _Clean and/or repair_ _Convert gas-fired unit to boiler loop_ _Convert system from steam to hot water_ _Convert to Cleaner Fuels_ _Decentralize boiler_ _Implement training and/or documentation_ _Insulate boiler room_ _Other_ _Replace boiler_ _Replace burner_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add energy recovery", "Clean and/or repair", "Convert gas-fired unit to boiler loop", "Convert system from steam to hot water", "Convert to Cleaner Fuels", "Decentralize boiler", "Implement training and/or documentation", "Insulate boiler room", "Other", "Replace boiler", "Replace burner", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BuildingAutomationSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BuildingAutomationSystems/auc:MeasureName">
      <sch:assert test="contains('_Add or upgrade BAS/EMS/EMCS_ _Add or upgrade controls_ _Convert pneumatic controls to DDC_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add or upgrade BAS/EMS/EMCS", "Add or upgrade controls", "Convert pneumatic controls to DDC", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BuildingEnvelopeModifications">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:BuildingEnvelopeModifications/auc:MeasureName">
      <sch:assert test="contains('_Add attic/knee wall insulation_ _Add shading devices_ _Add window films_ _Air seal envelope_ _Clean and/or repair_ _Close shaft vents for elevators or stairwells_ _Increase ceiling insulation_ _Increase floor insulation_ _Increase roof insulation_ _Increase wall insulation_ _Install cool/green roof_ _Install or replace solar screens_ _Insulate attic hatch / stair box_ _Insulate foundation_ _Insulate thermal bypasses_ _Other_ _Replace glazing_ _Replace windows_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add attic/knee wall insulation", "Add shading devices", "Add window films", "Air seal envelope", "Clean and/or repair", "Close shaft vents for elevators or stairwells", "Increase ceiling insulation", "Increase floor insulation", "Increase roof insulation", "Increase wall insulation", "Install cool/green roof", "Install or replace solar screens", "Insulate attic hatch / stair box", "Insulate foundation", "Insulate thermal bypasses", "Other", "Replace glazing", or "Replace windows"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ChilledWaterHotWaterAndSteamDistributionSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ChilledWaterHotWaterAndSteamDistributionSystems/auc:MeasureName">
      <sch:assert test="contains('_Add energy recovery_ _Add pipe insulation_ _Add recirculating pumps_ _Clean and/or repair_ _Implement training and/or documentation_ _Install or upgrade master venting_ _Install solar hot water system_ _Install steam condensate heat recovery_ _Other_ _Repair and/or replace steam traps_ _Repair or replace existing condensate return systems or install new condensate return systems_ _Replace or upgrade water heater_ _Replace steam traps with orifice plates_ _Replace with higher efficiency pump_ _Replace with variable speed pump_ _Retrofit and replace chiller plant pumping, piping, and controls_ _Separate SHW from heating_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add energy recovery", "Add pipe insulation", "Add recirculating pumps", "Clean and/or repair", "Implement training and/or documentation", "Install or upgrade master venting", "Install solar hot water system", "Install steam condensate heat recovery", "Other", "Repair and/or replace steam traps", "Repair or replace existing condensate return systems or install new condensate return systems", "Replace or upgrade water heater", "Replace steam traps with orifice plates", "Replace with higher efficiency pump", "Replace with variable speed pump", "Retrofit and replace chiller plant pumping, piping, and controls", "Separate SHW from heating", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ChillerPlantImprovements">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ChillerPlantImprovements/auc:MeasureName">
      <sch:assert test="contains('_Add energy recovery_ _Add or repair economizer cycle_ _Add or replace cooling tower_ _Clean and/or repair_ _Implement training and/or documentation_ _Install VSD on electric centrifugal chillers_ _Install gas cooling_ _Other_ _Replace chiller_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add energy recovery", "Add or repair economizer cycle", "Add or replace cooling tower", "Clean and/or repair", "Implement training and/or documentation", "Install VSD on electric centrifugal chillers", "Install gas cooling", "Other", "Replace chiller", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ConveyanceSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ConveyanceSystems/auc:MeasureName">
      <sch:assert test="contains('_Add elevator regenerative drives_ _Clean and/or repair_ _Implement training and/or documentation_ _Other_ _Upgrade controls_ _Upgrade motors_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add elevator regenerative drives", "Clean and/or repair", "Implement training and/or documentation", "Other", "Upgrade controls", "Upgrade motors", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:DataCenterImprovements">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:DataCenterImprovements/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement hot aisle hold aisle design_ _Implement server virtualization_ _Implement training and/or documentation_ _Improve data center efficiency_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_ _Upgrade servers_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement hot aisle hold aisle design", "Implement server virtualization", "Implement training and/or documentation", "Improve data center efficiency", "Other", "Upgrade operating protocols, calibration, and/or sequencing", or "Upgrade servers"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:DistributedGeneration">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:DistributedGeneration/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Convert fuels_ _Implement training and/or documentation_ _Install CHP/cogeneration systems_ _Install fuel cells_ _Install microturbines_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Convert fuels", "Implement training and/or documentation", "Install CHP/cogeneration systems", "Install fuel cells", "Install microturbines", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ElectricalPeakShavingLoadShifting">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ElectricalPeakShavingLoadShifting/auc:MeasureName">
      <sch:assert test="contains('_Implement training and/or documentation_ _Install thermal energy storage_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Implement training and/or documentation", "Install thermal energy storage", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyCostReductionThroughRateAdjustments">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyCostReductionThroughRateAdjustments/auc:MeasureName">
      <sch:assert test="contains('_Change to lower energy cost supplier(s)_ _Change to more favorable rate schedule_ _Energy cost reduction through rate adjustments - uncategorized_ _Energy service billing and meter auditing recommendations_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Change to lower energy cost supplier(s)", "Change to more favorable rate schedule", "Energy cost reduction through rate adjustments - uncategorized", "Energy service billing and meter auditing recommendations", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyDistributionSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyDistributionSystems/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement power factor corrections_ _Implement power quality upgrades_ _Implement training and/or documentation_ _Install gas distribution systems_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_ _Upgrade transformers_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement power factor corrections", "Implement power quality upgrades", "Implement training and/or documentation", "Install gas distribution systems", "Other", "Upgrade operating protocols, calibration, and/or sequencing", or "Upgrade transformers"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyRelatedProcessImprovements">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:EnergyRelatedProcessImprovements/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement industrial process improvements_ _Implement production and/or manufacturing improvements_ _Implement training and/or documentation_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement industrial process improvements", "Implement production and/or manufacturing improvements", "Implement training and/or documentation", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:FutureOtherECMs">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:FutureOtherECMs/auc:MeasureName">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:LightingImprovements">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:LightingImprovements/auc:MeasureName">
      <sch:assert test="contains('_Add daylight controls_ _Add occupancy sensors_ _Clean and/or repair_ _Implement training and/or documentation_ _Install photocell control_ _Install spectrally enhanced lighting_ _Install timers_ _Other_ _Replace diffusers_ _Retrofit with CFLs_ _Retrofit with T-5_ _Retrofit with T-8_ _Retrofit with fiber optic lighting technologies_ _Retrofit with light emitting diode technologies_ _Upgrade exit signs to LED_ _Upgrade exterior lighting_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add daylight controls", "Add occupancy sensors", "Clean and/or repair", "Implement training and/or documentation", "Install photocell control", "Install spectrally enhanced lighting", "Install timers", "Other", "Replace diffusers", "Retrofit with CFLs", "Retrofit with T-5", "Retrofit with T-8", "Retrofit with fiber optic lighting technologies", "Retrofit with light emitting diode technologies", "Upgrade exit signs to LED", "Upgrade exterior lighting", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:OtherElectricMotorsAndDrives">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:OtherElectricMotorsAndDrives/auc:MeasureName">
      <sch:assert test="contains('_Add VFD/VSD motor controller_ _Add drive controls_ _Clean and/or repair_ _Implement training and/or documentation_ _Other_ _Replace with higher efficiency_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add VFD/VSD motor controller", "Add drive controls", "Clean and/or repair", "Implement training and/or documentation", "Other", "Replace with higher efficiency", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:OtherHVAC">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:OtherHVAC/auc:MeasureName">
      <sch:assert test="contains('_Add duct insulation_ _Add energy recovery_ _Add enhanced dehumidification_ _Add or repair economizer_ _Add or replace cooling tower_ _Balance ventilation/distribution system_ _Capture and return condensate_ _Clean and/or repair_ _Convert CAV system to VAV system_ _Implement training and/or documentation_ _Improve distribution fans_ _Improve ventilation fans_ _Install air source heat pump_ _Install demand control ventilation_ _Install gas cooling_ _Install or Upgrade Master Venting_ _Install passive solar heating_ _Install solar ventilation preheating system_ _Install thermal destratification fans_ _Install variable refrigerant flow system_ _Other_ _Other cooling_ _Other distribution_ _Other heating_ _Other ventilation_ _Repair leaks / seal ducts_ _Repair or replace HVAC damper and controller_ _Replace AC and heating units with ground coupled heat pump systems_ _Replace burner_ _Replace or modify AHU_ _Replace package units_ _Replace packaged terminal units_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Add duct insulation", "Add energy recovery", "Add enhanced dehumidification", "Add or repair economizer", "Add or replace cooling tower", "Balance ventilation/distribution system", "Capture and return condensate", "Clean and/or repair", "Convert CAV system to VAV system", "Implement training and/or documentation", "Improve distribution fans", "Improve ventilation fans", "Install air source heat pump", "Install demand control ventilation", "Install gas cooling", "Install or Upgrade Master Venting", "Install passive solar heating", "Install solar ventilation preheating system", "Install thermal destratification fans", "Install variable refrigerant flow system", "Other", "Other cooling", "Other distribution", "Other heating", "Other ventilation", "Repair leaks / seal ducts", "Repair or replace HVAC damper and controller", "Replace AC and heating units with ground coupled heat pump systems", "Replace burner", "Replace or modify AHU", "Replace package units", "Replace packaged terminal units", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:PlugLoadReductions">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:PlugLoadReductions/auc:MeasureName">
      <sch:assert test="contains('_Automatic shutdown or sleep mode for computers_ _Clean and/or repair_ _De-lamp vending machines_ _Implement training and/or documentation_ _Install plug load controls_ _Other_ _Replace clothes dryers_ _Replace washing machines_ _Replace with ENERGY STAR rated_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Automatic shutdown or sleep mode for computers", "Clean and/or repair", "De-lamp vending machines", "Implement training and/or documentation", "Install plug load controls", "Other", "Replace clothes dryers", "Replace washing machines", "Replace with ENERGY STAR rated", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:Refrigeration">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:Refrigeration/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement training and/or documentation_ _Other_ _Replace air-cooled ice/refrigeration equipment_ _Replace ice/refrigeration equipment with high efficiency units_ _Replace refrigerators_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement training and/or documentation", "Other", "Replace air-cooled ice/refrigeration equipment", "Replace ice/refrigeration equipment with high efficiency units", "Replace refrigerators", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:RenewableEnergySystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:RenewableEnergySystems/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement training and/or documentation_ _Install landfill gas, wastewater treatment plant digester gas, or coal bed methane power plant_ _Install photovoltaic system_ _Install wind energy system_ _Install wood waste or other organic waste stream heating or power plant_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement training and/or documentation", "Install landfill gas, wastewater treatment plant digester gas, or coal bed methane power plant", "Install photovoltaic system", "Install wind energy system", "Install wood waste or other organic waste stream heating or power plant", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ServiceHotWaterSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:ServiceHotWaterSystems/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Decrease SHW temperature_ _Implement training and/or documentation_ _Install SHW controls_ _Install heat pump SHW system_ _Install solar thermal SHW_ _Install tankless water heaters_ _Install water pressure booster_ _Insulate SHW piping_ _Insulate SHW tank_ _Other_ _Replace piping_ _Replace tankless coil_ _Separate SHW from heating_ _Upgrade SHW boiler_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Decrease SHW temperature", "Implement training and/or documentation", "Install SHW controls", "Install heat pump SHW system", "Install solar thermal SHW", "Install tankless water heaters", "Install water pressure booster", "Insulate SHW piping", "Insulate SHW tank", "Other", "Replace piping", "Replace tankless coil", "Separate SHW from heating", "Upgrade SHW boiler", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:WaterAndSewerConservationSystems">
      <sch:assert test="count(auc:MeasureName) &gt;= 1">element "auc:MeasureName" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:TechnologyCategories/auc:TechnologyCategory/auc:WaterAndSewerConservationSystems/auc:MeasureName">
      <sch:assert test="contains('_Clean and/or repair_ _Implement training and/or documentation_ _Implement water efficient irrigation_ _Install low-flow faucets and showerheads_ _Install low-flow plumbing equipment_ _Install on-site sewer treatment systems_ _Other_ _Upgrade operating protocols, calibration, and/or sequencing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clean and/or repair", "Implement training and/or documentation", "Implement water efficient irrigation", "Install low-flow faucets and showerheads", "Install low-flow plumbing equipment", "Install on-site sewer treatment systems", "Other", or "Upgrade operating protocols, calibration, and/or sequencing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UsefulLife">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
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
      <sch:assert test="contains('_Rebate Available_ _Shared Resource Affected_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Rebate Available" or "Shared Resource Affected"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Rebate Available']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Measures/auc:Measure/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Affected']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports">
      <sch:assert test="count(auc:Report) &gt;= 0">element "auc:Report" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]) &gt;= 0">element "auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Report[auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]) &gt;= 0">element "auc:Report[auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:AnalysisPeriod)">element "auc:AnalysisPeriod" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AuditCost)">element "auc:AuditCost" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AuditExemption)">element "auc:AuditExemption" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AuditorContactID) &gt;= 0">element "auc:AuditorContactID" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DiscountFactor)">element "auc:DiscountFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ElectricityPriceEscalationRate)">element "auc:ElectricityPriceEscalationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:GasPriceEscalationRate)">element "auc:GasPriceEscalationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InflationRate)">element "auc:InflationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremisesOrSystem) &gt;= 0">element "auc:LinkedPremisesOrSystem" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherEscalationRates)">element "auc:OtherEscalationRates" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Scenarios) &gt;= 0">element "auc:Scenarios" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WaterPriceEscalationRate)">element "auc:WaterPriceEscalationRate" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:LinkedPremisesOrSystem">
      <sch:assert test="count(auc:Building) &gt;= 0">element "auc:Building" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Site) &gt;= 0">element "auc:Site" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:System)">element "auc:System" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Site">
      <sch:assert test="count(auc:LinkedSiteID) &gt;= 1">element "auc:LinkedSiteID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:Scenarios">
      <sch:assert test="count(auc:Scenario) &gt;= 0">element "auc:Scenario" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report/auc:Scenarios/auc:Scenario">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]">
      <sch:assert test="count(auc:ASHRAEAuditLevel) &gt;= 0">element "auc:ASHRAEAuditLevel" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditDates) &gt;= 0">element "auc:AuditDates" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Qualifications) &gt;= 0">element "auc:Qualifications" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:RetrocommissioningAudit) &gt;= 0">element "auc:RetrocommissioningAudit" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Utilities) &gt;= 0">element "auc:Utilities" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates">
      <sch:assert test="count(auc:AuditDate) &gt;= 0">element "auc:AuditDate" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditDate[auc:DateType/text() != 'Custom']) &gt;= 0">element "auc:AuditDate[auc:DateType/text() != 'Custom']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditDate[auc:DateType/text() = 'Custom']) &gt;= 0">element "auc:AuditDate[auc:DateType/text() = 'Custom']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates/auc:AuditDate">
      <sch:assert test="count(auc:Date) &gt;= 1">element "auc:Date" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DateType) &gt;= 1">element "auc:DateType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates/auc:AuditDate/auc:DateType">
      <sch:assert test="contains('_Custom_ _Site Visit_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Custom" or "Site Visit"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates/auc:AuditDate[auc:DateType/text() != 'Custom']">
      <sch:assert test="not(auc:CustomDateType)">element "auc:CustomDateType" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates/auc:AuditDate[auc:DateType/text() = 'Custom']">
      <sch:assert test="count(auc:CustomDateType) &gt;= 1">element "auc:CustomDateType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:AuditDates/auc:AuditDate[auc:DateType/text() = 'Custom']/auc:CustomDateType">
      <sch:assert test="contains('_Level 1: Walk-through_ _Level 2: Energy Survey and Analysis_ _Level 3: Detailed Survey and Analysis_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Level 1: Walk-through", "Level 2: Energy Survey and Analysis", or "Level 3: Detailed Survey and Analysis"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Qualifications">
      <sch:assert test="count(auc:Qualification) &gt;= 0">element "auc:Qualification" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Qualifications/auc:Qualification">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:AuditTeamMemberCertificationType) &gt;= 0">element "auc:AuditTeamMemberCertificationType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditorQualificationNumber) &gt;= 0">element "auc:AuditorQualificationNumber" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditorQualificationState) &gt;= 0">element "auc:AuditorQualificationState" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AuditorQualificationType) &gt;= 0">element "auc:AuditorQualificationType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CertificationExpirationDate) &gt;= 0">element "auc:CertificationExpirationDate" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CertifiedAuditTeamMemberContactID) &gt;= 0">element "auc:CertifiedAuditTeamMemberContactID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Qualifications/auc:Qualification/auc:AuditTeamMemberCertificationType">
      <sch:assert test="contains('_ASHRAE Building Commissioning Professional (BCxP)_ _ASHRAE Building Energy Assessment Professional (BEAP)_ _ASHRAE Building Energy Modeling Professional (BEMP)_ _Accredited Commissioning Process Authority Professional (CxAP)_ _Associate Commissioning Professional (ACP)_ _Associated Air Balance Council (AABC) Certified Member Agency_ _Associated Air Balance Council (AABC) Test and Balance Technician_ _Association of Energy Engineers Certified Building Commissioning Firm Program (CBCF)_ _Association of Energy Engineers Certified Building Commissioning Professional (CBCP)_ _Association of Energy Engineers Certified Building Energy Simulation Analyst (BESA)_ _Association of Energy Engineers Certified Business Energy Professional (BEP)_ _Association of Energy Engineers Certified Carbon Reduction Manager (CRM)_ _Association of Energy Engineers Certified Demand Side Manager (CDSM)_ _Association of Energy Engineers Certified Energy Auditor (CEA)_ _Association of Energy Engineers Certified Energy Manager (CEM)_ _Association of Energy Engineers Certified Energy Procurement Professional (CEP)_ _Association of Energy Engineers Certified GeoExchange Designer Program (CGD)_ _Association of Energy Engineers Certified Green Building Engineer (GBE)_ _Association of Energy Engineers Certified Industrial Energy Professional (CIEP)_ _Association of Energy Engineers Certified Lighting Efficiency Professional (CLEP)_ _Association of Energy Engineers Certified Measurement &amp;#38; Verification Professional (CMVP)_ _Association of Energy Engineers Certified Power Quality Professional (CPQ)_ _Association of Energy Engineers Certified Residential Energy Auditor (REA)_ _Association of Energy Engineers Certified Sustainable Development Professional (CSDP)_ _Association of Energy Engineers Certified Water Efficiency Professional (CWEP)_ _Association of Energy Engineers Distributed Generation Certified Professional (DGCP)_ _Association of Energy Engineers Energy Efficiency Practitioner (EEP)_ _Association of Energy Engineers Performance Contracting and Funding Professional (PCF)_ _Association of Energy Engineers Renewable Energy Professional (REP)_ _Building Operator Certification (BOC): Level 1_ _Building Operator Certification (BOC): Level 2_ _Building Performance Institute (BPI) Certification_ _Building Performance Institute (BPI): Advanced Home Energy Professional (HEP)_ _Building Performance Institute (BPI): Advanced Home Energy Professional - Crew Leader (HEP-CL)_ _Building Performance Institute (BPI): Advanced Home Energy Professional - Energy Auditor (HEP-EA)_ _Building Performance Institute (BPI): Advanced Home Energy Professional - Quality Control Inspector (HEP-QCI)_ _Building Performance Institute (BPI): Advanced Home Energy Professional - Retrofit Installer (HEP-RI)_ _Building Performance Institute (BPI): Building Analyst (BA)_ _Building Performance Institute (BPI): Multifamily Building Analyst_ _Commissioning Process Management Professional (CPMP)_ _Department of Buildings (DOB) Approved Agent_ _Existing Building Commissioning Professional (EBCP)_ _GreenPoint Rater Existing Home Multifamily Rater_ _HERS Whole House (HERS II) Rater_ _High Pressure Boiler Operating Engineer_ _High-Performance Building Design Professional (HBDP)_ _International Union of Operating Engineers Certified Energy Specialist_ _NYSERDA FlexTech Consultant_ _Northwest Energy Education Institute Energy Management Certification_ _Other_ _PhD in Mechanical Engineering_ _Professional Engineer (PE)_ _Refrigerating System Operating Engineer_ _Registered Architect (RA)_ _Residential Energy Services Network (RESNET) - Home Partner_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "ASHRAE Building Commissioning Professional (BCxP)", "ASHRAE Building Energy Assessment Professional (BEAP)", "ASHRAE Building Energy Modeling Professional (BEMP)", "Accredited Commissioning Process Authority Professional (CxAP)", "Associate Commissioning Professional (ACP)", "Associated Air Balance Council (AABC) Certified Member Agency", "Associated Air Balance Council (AABC) Test and Balance Technician", "Association of Energy Engineers Certified Building Commissioning Firm Program (CBCF)", "Association of Energy Engineers Certified Building Commissioning Professional (CBCP)", "Association of Energy Engineers Certified Building Energy Simulation Analyst (BESA)", "Association of Energy Engineers Certified Business Energy Professional (BEP)", "Association of Energy Engineers Certified Carbon Reduction Manager (CRM)", "Association of Energy Engineers Certified Demand Side Manager (CDSM)", "Association of Energy Engineers Certified Energy Auditor (CEA)", "Association of Energy Engineers Certified Energy Manager (CEM)", "Association of Energy Engineers Certified Energy Procurement Professional (CEP)", "Association of Energy Engineers Certified GeoExchange Designer Program (CGD)", "Association of Energy Engineers Certified Green Building Engineer (GBE)", "Association of Energy Engineers Certified Industrial Energy Professional (CIEP)", "Association of Energy Engineers Certified Lighting Efficiency Professional (CLEP)", "Association of Energy Engineers Certified Measurement &amp;#38; Verification Professional (CMVP)", "Association of Energy Engineers Certified Power Quality Professional (CPQ)", "Association of Energy Engineers Certified Residential Energy Auditor (REA)", "Association of Energy Engineers Certified Sustainable Development Professional (CSDP)", "Association of Energy Engineers Certified Water Efficiency Professional (CWEP)", "Association of Energy Engineers Distributed Generation Certified Professional (DGCP)", "Association of Energy Engineers Energy Efficiency Practitioner (EEP)", "Association of Energy Engineers Performance Contracting and Funding Professional (PCF)", "Association of Energy Engineers Renewable Energy Professional (REP)", "Building Operator Certification (BOC): Level 1", "Building Operator Certification (BOC): Level 2", "Building Performance Institute (BPI) Certification", "Building Performance Institute (BPI): Advanced Home Energy Professional (HEP)", "Building Performance Institute (BPI): Advanced Home Energy Professional - Crew Leader (HEP-CL)", "Building Performance Institute (BPI): Advanced Home Energy Professional - Energy Auditor (HEP-EA)", "Building Performance Institute (BPI): Advanced Home Energy Professional - Quality Control Inspector (HEP-QCI)", "Building Performance Institute (BPI): Advanced Home Energy Professional - Retrofit Installer (HEP-RI)", "Building Performance Institute (BPI): Building Analyst (BA)", "Building Performance Institute (BPI): Multifamily Building Analyst", "Commissioning Process Management Professional (CPMP)", "Department of Buildings (DOB) Approved Agent", "Existing Building Commissioning Professional (EBCP)", "GreenPoint Rater Existing Home Multifamily Rater", "HERS Whole House (HERS II) Rater", "High Pressure Boiler Operating Engineer", "High-Performance Building Design Professional (HBDP)", "International Union of Operating Engineers Certified Energy Specialist", "NYSERDA FlexTech Consultant", "Northwest Energy Education Institute Energy Management Certification", "Other", "PhD in Mechanical Engineering", "Professional Engineer (PE)", "Refrigerating System Operating Engineer", "Registered Architect (RA)", or "Residential Energy Services Network (RESNET) - Home Partner"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Qualifications/auc:Qualification/auc:CertifiedAuditTeamMemberContactID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 1: Walk-through Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 1: Walk-through Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 2: Energy Survey and Analysis Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 2: Energy Survey and Analysis Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 3: Detailed Survey and Analysis Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 3: Detailed Survey and Analysis Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Notes For Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Notes For Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Team Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Team Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']/auc:FieldValue" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Auditor Years Of Experience']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Auditor Years Of Experience']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Audit Date For Level 1: Walk-through Is Not Applicable_ _Audit Date For Level 2: Energy Survey and Analysis Is Not Applicable_ _Audit Date For Level 3: Detailed Survey and Analysis Is Not Applicable_ _Audit Filing Status_ _Audit Filing Status Is Not Applicable_ _Audit Notes_ _Audit Notes For Not Applicable_ _Audit Notes Is Not Applicable_ _Audit Team Notes_ _Audit Team Notes Is Not Applicable_ _Audit Template Report Type_ _Auditor Years Of Experience_ _Early Compliance_ _Early Compliance Is Not Applicable_ _Required Audit Year_ _Required Audit Year Is Not Applicable_ _San Francisco Affidavit Whole Audit Signature_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Audit Date For Level 1: Walk-through Is Not Applicable", "Audit Date For Level 2: Energy Survey and Analysis Is Not Applicable", "Audit Date For Level 3: Detailed Survey and Analysis Is Not Applicable", "Audit Filing Status", "Audit Filing Status Is Not Applicable", "Audit Notes", "Audit Notes For Not Applicable", "Audit Notes Is Not Applicable", "Audit Team Notes", "Audit Team Notes Is Not Applicable", "Audit Template Report Type", "Auditor Years Of Experience", "Early Compliance", "Early Compliance Is Not Applicable", "Required Audit Year", "Required Audit Year Is Not Applicable", or "San Francisco Affidavit Whole Audit Signature"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 1: Walk-through Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 2: Energy Survey and Analysis Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Date For Level 3: Detailed Survey and Analysis Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Filing Status']/auc:FieldValue">
      <sch:assert test="contains('_Amended Filing_ _Initial Filing_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Amended Filing" or "Initial Filing"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Team Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Audit Template Report Type']/auc:FieldValue">
      <sch:assert test="contains('_New York City Energy Efficiency Report_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "New York City Energy Efficiency Report"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Auditor Years Of Experience']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Early Compliance']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Required Audit Year']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Utilities">
      <sch:assert test="count(auc:Utility) &gt;= 0">element "auc:Utility" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Utilities/auc:Utility">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ElectricDistributionUtility)">element "auc:ElectricDistributionUtility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FuelInterruptibility)">element "auc:FuelInterruptibility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:MeteringConfiguration) &gt;= 0">element "auc:MeteringConfiguration" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PowerPlant)">element "auc:PowerPlant" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RateSchedules) &gt;= 0">element "auc:RateSchedules" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SourceSiteRatio)">element "auc:SourceSiteRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TypeOfResourceMeter)">element "auc:TypeOfResourceMeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UtilityAccountNumber) &gt;= 0">element "auc:UtilityAccountNumber" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:UtilityBillpayer)">element "auc:UtilityBillpayer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UtilityMeterNumbers)">element "auc:UtilityMeterNumbers" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UtilityName)">element "auc:UtilityName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Utilities/auc:Utility/auc:MeteringConfiguration">
      <sch:assert test="contains('_Direct metering_ _Master meter with sub metering_ _Master meter without sub metering_ _Other_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Direct metering", "Master meter with sub metering", "Master meter without sub metering", "Other", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Utilities/auc:Utility/auc:RateSchedules">
      <sch:assert test="count(auc:RateSchedule) &gt;= 0">element "auc:RateSchedule" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Building/auc:LinkedBuildingID]/auc:Utilities/auc:Utility/auc:RateSchedules/auc:RateSchedule">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:AverageMarginalCostRate)">element "auc:AverageMarginalCostRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FixedMonthlyCharge)">element "auc:FixedMonthlyCharge" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MinimumPowerFactorWithoutPenalty)">element "auc:MinimumPowerFactorWithoutPenalty" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NetMetering)">element "auc:NetMetering" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RateStructureEffectiveDate)">element "auc:RateStructureEffectiveDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RateStructureEndDate)">element "auc:RateStructureEndDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RateStructureName) &gt;= 0">element "auc:RateStructureName" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RateStructureSector)">element "auc:RateStructureSector" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ReactivePowerCharge)">element "auc:ReactivePowerCharge" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ReferenceForRateStructure)">element "auc:ReferenceForRateStructure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TypeOfRateStructure)">element "auc:TypeOfRateStructure" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Reports/auc:Report[auc:LinkedPremisesOrSystem/auc:Site/auc:LinkedSiteID]">
      <sch:assert test="not(auc:ASHRAEAuditLevel)">element "auc:ASHRAEAuditLevel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AuditDates)">element "auc:AuditDates" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Qualifications)">element "auc:Qualifications" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RetrocommissioningAudit)">element "auc:RetrocommissioningAudit" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Utilities)">element "auc:Utilities" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules">
      <sch:assert test="count(auc:Schedule) &gt;= 0">element "auc:Schedule" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ScheduleDetails) &gt;= 0">element "auc:ScheduleDetails" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SchedulePeriodBeginDate)">element "auc:SchedulePeriodBeginDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SchedulePeriodEndDate)">element "auc:SchedulePeriodEndDate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails">
      <sch:assert test="count(auc:ScheduleDetail) &gt;= 0">element "auc:ScheduleDetail" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail">
      <sch:assert test="count(auc:DayEndTime) &gt;= 1">element "auc:DayEndTime" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DayStartTime) &gt;= 1">element "auc:DayStartTime" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DayType) &gt;= 1">element "auc:DayType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PartialOperationPercentage)">element "auc:PartialOperationPercentage" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ScheduleCategory)">element "auc:ScheduleCategory" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Schedules/auc:Schedule/auc:ScheduleDetails/auc:ScheduleDetail/auc:DayType">
      <sch:assert test="contains('_Saturday_ _Sunday_ _Weekday_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Saturday", "Sunday", or "Weekday"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites">
      <sch:assert test="count(auc:Site) &gt;= 1">element "auc:Site" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]) &gt;= 0">element "auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Site[not(auc:Buildings/auc:Building)]) &gt;= 0">element "auc:Site[not(auc:Buildings/auc:Building)]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Address) &gt;= 1">element "auc:Address" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Buildings) &gt;= 0">element "auc:Buildings" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ClimateZoneType)">element "auc:ClimateZoneType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EGRIDRegionCode)">element "auc:EGRIDRegionCode" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Latitude)">element "auc:Latitude" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Longitude)">element "auc:Longitude" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OccupancyClassification)">element "auc:OccupancyClassification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Ownership)">element "auc:Ownership" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OwnershipStatus)">element "auc:OwnershipStatus" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PremisesIdentifiers) &gt;= 1">element "auc:PremisesIdentifiers" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PremisesNotes)">element "auc:PremisesNotes" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryContactID)">element "auc:PrimaryContactID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeatherDataStationID)">element "auc:WeatherDataStationID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeatherStationCategory)">element "auc:WeatherStationCategory" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeatherStationName)">element "auc:WeatherStationName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Address">
      <sch:assert test="count(auc:City) &gt;= 1">element "auc:City" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Country)">element "auc:Country" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:County)">element "auc:County" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PostalCode)">element "auc:PostalCode" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PostalCodePlus4)">element "auc:PostalCodePlus4" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:State) &gt;= 1">element "auc:State" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:StreetAddressDetail)">element "auc:StreetAddressDetail" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Address/auc:City">
      <sch:assert test="contains('_New York_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "New York"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Address/auc:State">
      <sch:assert test="contains('_NY_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "NY"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings">
      <sch:assert test="count(auc:Building) &gt;= 0">element "auc:Building" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Address) &gt;= 1">element "auc:Address" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:AspectRatio) &gt;= 0">element "auc:AspectRatio" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Assessments)">element "auc:Assessments" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BuildingAutomationSystem) &gt;= 0">element "auc:BuildingAutomationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BuildingClassification)">element "auc:BuildingClassification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ClimateZone) &gt;= 0">element "auc:ClimateZone" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ConditionedFloorsAboveGrade) &gt;= 0">element "auc:ConditionedFloorsAboveGrade" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ConditionedFloorsBelowGrade) &gt;= 0">element "auc:ConditionedFloorsBelowGrade" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:EGRIDRegionCode)">element "auc:EGRIDRegionCode" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FederalBuilding)">element "auc:FederalBuilding" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreas) &gt;= 0">element "auc:FloorAreas" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FloorsAboveGrade)">element "auc:FloorsAboveGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorsBelowGrade)">element "auc:FloorsBelowGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeightDistribution)">element "auc:HeightDistribution" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:HistoricalLandmark) &gt;= 0">element "auc:HistoricalLandmark" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HorizontalSurroundings)">element "auc:HorizontalSurroundings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Latitude) &gt;= 0">element "auc:Latitude" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Longitude) &gt;= 0">element "auc:Longitude" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:NAICSCode)">element "auc:NAICSCode" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfBusinesses)">element "auc:NumberOfBusinesses" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:NumberOfFacilitiesOnSite) &gt;= 0">element "auc:NumberOfFacilitiesOnSite" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OccupancyClassification)">element "auc:OccupancyClassification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OccupancyLevels)">element "auc:OccupancyLevels" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OperatorType)">element "auc:OperatorType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OverallWindowToWallRatio) &gt;= 0">element "auc:OverallWindowToWallRatio" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Ownership) &gt;= 0">element "auc:Ownership" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OwnershipStatus)">element "auc:OwnershipStatus" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PercentLeasedByOwner) &gt;= 0">element "auc:PercentLeasedByOwner" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PercentOccupiedByOwner) &gt;= 0">element "auc:PercentOccupiedByOwner" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Perimeter) &gt;= 0">element "auc:Perimeter" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PortfolioManager)">element "auc:PortfolioManager" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PremisesIdentifiers) &gt;= 0">element "auc:PremisesIdentifiers" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PremisesName) &gt;= 0">element "auc:PremisesName" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PremisesNotes) &gt;= 0">element "auc:PremisesNotes" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PrimaryContactID)">element "auc:PrimaryContactID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PubliclySubsidized)">element "auc:PubliclySubsidized" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RetrocommissioningDate) &gt;= 0">element "auc:RetrocommissioningDate" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Sections) &gt;= 0">element "auc:Sections" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SpatialUnits)">element "auc:SpatialUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TenantIDs)">element "auc:TenantIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:TotalExteriorAboveGradeWallArea) &gt;= 0">element "auc:TotalExteriorAboveGradeWallArea" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:TotalExteriorBelowGradeWallArea) &gt;= 0">element "auc:TotalExteriorBelowGradeWallArea" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:TypicalOccupantUsages)">element "auc:TypicalOccupantUsages" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UnconditionedFloorsAboveGrade) &gt;= 0">element "auc:UnconditionedFloorsAboveGrade" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UnconditionedFloorsBelowGrade) &gt;= 0">element "auc:UnconditionedFloorsBelowGrade" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:VerticalSurroundings)">element "auc:VerticalSurroundings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WeatherDataStationID) &gt;= 0">element "auc:WeatherDataStationID" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WeatherStationCategory)">element "auc:WeatherStationCategory" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WeatherStationName) &gt;= 0">element "auc:WeatherStationName" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearOccupied)">element "auc:YearOccupied" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:YearOfConstruction) &gt;= 1">element "auc:YearOfConstruction" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:YearOfLastEnergyAudit) &gt;= 0">element "auc:YearOfLastEnergyAudit" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearOfLastMajorRemodel) &gt;= 0">element "auc:YearOfLastMajorRemodel" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearOfLatestRetrofit)">element "auc:YearOfLatestRetrofit" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Address">
      <sch:assert test="count(auc:City) &gt;= 1">element "auc:City" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Country)">element "auc:Country" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:County)">element "auc:County" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PostalCode) &gt;= 1">element "auc:PostalCode" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PostalCodePlus4)">element "auc:PostalCodePlus4" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:State) &gt;= 1">element "auc:State" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:StreetAddressDetail) &gt;= 0">element "auc:StreetAddressDetail" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Address/auc:City">
      <sch:assert test="contains('_New York_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "New York"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Address/auc:State">
      <sch:assert test="contains('_NY_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "NY"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Address/auc:StreetAddressDetail">
      <sch:assert test="not(auc:Complex)">element "auc:Complex" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Simplified) &gt;= 1">element "auc:Simplified" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Address/auc:StreetAddressDetail/auc:Simplified">
      <sch:assert test="count(auc:StreetAddress) &gt;= 0">element "auc:StreetAddress" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:AspectRatio">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ClimateZone">
      <sch:assert test="count(auc:ASHRAE) &gt;= 0">element "auc:ASHRAE" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BuildingAmerica)">element "auc:BuildingAmerica" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CBECSType)">element "auc:CBECSType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CaliforniaTitle24) &gt;= 0">element "auc:CaliforniaTitle24" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DOE)">element "auc:DOE" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EnergyStar)">element "auc:EnergyStar" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:IECC)">element "auc:IECC" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ClimateZone/auc:ASHRAE">
      <sch:assert test="count(auc:ClimateZone) &gt;= 0">element "auc:ClimateZone" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ClimateZone/auc:ASHRAE/auc:ClimateZone">
      <sch:assert test="contains('_1A_ _2A_ _2B_ _3A_ _3B_ _3C_ _4A_ _4B_ _4C_ _5A_ _5B_ _6A_ _6B_ _7_ _8_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "1A", "2A", "2B", "3A", "3B", "3C", "4A", "4B", "4C", "5A", "5B", "6A", "6B", "7", or "8"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ClimateZone/auc:CaliforniaTitle24">
      <sch:assert test="count(auc:ClimateZone) &gt;= 0">element "auc:ClimateZone" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ClimateZone/auc:CaliforniaTitle24/auc:ClimateZone">
      <sch:assert test="contains('_Climate Zone 1_ _Climate Zone 10_ _Climate Zone 11_ _Climate Zone 12_ _Climate Zone 13_ _Climate Zone 14_ _Climate Zone 15_ _Climate Zone 16_ _Climate Zone 2_ _Climate Zone 3_ _Climate Zone 4_ _Climate Zone 5_ _Climate Zone 6_ _Climate Zone 7_ _Climate Zone 8_ _Climate Zone 9_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Climate Zone 1", "Climate Zone 10", "Climate Zone 11", "Climate Zone 12", "Climate Zone 13", "Climate Zone 14", "Climate Zone 15", "Climate Zone 16", "Climate Zone 2", "Climate Zone 3", "Climate Zone 4", "Climate Zone 5", "Climate Zone 6", "Climate Zone 7", "Climate Zone 8", or "Climate Zone 9"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ConditionedFloorsAboveGrade">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:ConditionedFloorsBelowGrade">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:FloorAreas">
      <sch:assert test="count(auc:FloorArea) &gt;= 0">element "auc:FloorArea" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:FloorAreas/auc:FloorArea">
      <sch:assert test="not(auc:FloorAreaCustomName)">element "auc:FloorAreaCustomName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorAreaPercentage)">element "auc:FloorAreaPercentage" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreaType) &gt;= 1">element "auc:FloorAreaType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreaValue) &gt;= 1">element "auc:FloorAreaValue" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:FloorAreas/auc:FloorArea/auc:FloorAreaType">
      <sch:assert test="contains('_Cooled only_ _Footprint_ _Gross_ _Heated and Cooled_ _Heated only_ _Net_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Cooled only", "Footprint", "Gross", "Heated and Cooled", "Heated only", or "Net"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:FloorAreas/auc:FloorArea/auc:FloorAreaValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Latitude">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= -90) and (number() &lt;= 90)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to -90, and MUST be less than or equal to 90</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Longitude">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= -180) and (number() &lt;= 180)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to -180, and MUST be less than or equal to 180</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:NumberOfFacilitiesOnSite">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:OverallWindowToWallRatio">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Ownership">
      <sch:assert test="contains('_Corporation/partnership/LLC_ _Individual_ _Non-profit organization_ _Other_ _Privately owned_ _Property management company_ _Religious organization_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Corporation/partnership/LLC", "Individual", "Non-profit organization", "Other", "Privately owned", "Property management company", or "Religious organization"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PercentLeasedByOwner">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PercentOccupiedByOwner">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Perimeter">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PremisesIdentifiers">
      <sch:assert test="count(auc:PremisesIdentifier) &gt;= 0">element "auc:PremisesIdentifier" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PremisesIdentifiers/auc:PremisesIdentifier">
      <sch:assert test="count(auc:IdentifierCustomName) &gt;= 1">element "auc:IdentifierCustomName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:IdentifierLabel) &gt;= 1">element "auc:IdentifierLabel" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:IdentifierValue) &gt;= 1">element "auc:IdentifierValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PremisesIdentifiers/auc:PremisesIdentifier/auc:IdentifierCustomName">
      <sch:assert test="contains('_Atlanta Building ID_ _BIN_ _City Custom Building ID_ _Custom ID 1_ _Custom ID 2_ _EER_ _Portfolio Manager Building ID_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Atlanta Building ID", "BIN", "City Custom Building ID", "Custom ID 1", "Custom ID 2", "EER", or "Portfolio Manager Building ID"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:PremisesIdentifiers/auc:PremisesIdentifier/auc:IdentifierLabel">
      <sch:assert test="contains('_Custom_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Custom"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections">
      <sch:assert test="count(auc:Section) &gt;= 0">element "auc:Section" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Section[auc:SectionType = 'Space function']) &gt;= 0">element "auc:Section[auc:SectionType = 'Space function']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Section[auc:SectionType = 'Whole building']) &gt;= 0">element "auc:Section[auc:SectionType = 'Whole building']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Ceilings)">element "auc:Ceilings" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorToCeilingHeight)">element "auc:FloorToCeilingHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorToFloorHeight)">element "auc:FloorToFloorHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorsAboveGrade)">element "auc:FloorsAboveGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorsBelowGrade)">element "auc:FloorsBelowGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorsPartiallyBelowGrade)">element "auc:FloorsPartiallyBelowGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Latitude)">element "auc:Latitude" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Longitude)">element "auc:Longitude" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PerimeterZoneDepth)">element "auc:PerimeterZoneDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PremisesIdentifiers)">element "auc:PremisesIdentifiers" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PremisesName)">element "auc:PremisesName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PremisesNotes)">element "auc:PremisesNotes" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryContactID)">element "auc:PrimaryContactID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SectionType) &gt;= 1">element "auc:SectionType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:SideA1Orientation)">element "auc:SideA1Orientation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TenantIDs)">element "auc:TenantIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZoneLayout)">element "auc:ThermalZoneLayout" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeatherDataStationID)">element "auc:WeatherDataStationID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeatherStationName)">element "auc:WeatherStationName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:XOffset)">element "auc:XOffset" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YOffset)">element "auc:YOffset" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfConstruction)">element "auc:YearOfConstruction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ZOffset)">element "auc:ZOffset" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section/auc:SectionType">
      <sch:assert test="contains('_Space function_ _Whole building_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Space function" or "Whole building"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']">
      <sch:assert test="not(auc:ExteriorFloors)">element "auc:ExteriorFloors" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreas) &gt;= 0">element "auc:FloorAreas" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FootprintShape)">element "auc:FootprintShape" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Foundations)">element "auc:Foundations" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OccupancyClassification) &gt;= 0">element "auc:OccupancyClassification" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OccupancyLevels) &gt;= 0">element "auc:OccupancyLevels" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Roofs)">element "auc:Roofs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Sides)">element "auc:Sides" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ThermalZones) &gt;= 0">element "auc:ThermalZones" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:TypicalOccupantUsages) &gt;= 0">element "auc:TypicalOccupantUsages" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:FloorAreas">
      <sch:assert test="count(auc:FloorArea) &gt;= 0">element "auc:FloorArea" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:FloorAreas/auc:FloorArea">
      <sch:assert test="not(auc:FloorAreaCustomName)">element "auc:FloorAreaCustomName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorAreaPercentage)">element "auc:FloorAreaPercentage" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreaType) &gt;= 1">element "auc:FloorAreaType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreaValue) &gt;= 1">element "auc:FloorAreaValue" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:FloorAreas/auc:FloorArea/auc:FloorAreaType">
      <sch:assert test="contains('_Common_ _Conditioned_ _Gross_ _Tenant_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Common", "Conditioned", "Gross", or "Tenant"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:FloorAreas/auc:FloorArea/auc:FloorAreaValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:OccupancyClassification">
      <sch:assert test="contains('_Assembly-Arcade or casino without lodging_ _Assembly-Convention center_ _Assembly-Cultural entertainment_ _Assembly-Indoor arena_ _Assembly-Public_ _Assembly-Race track_ _Assembly-Religious_ _Assembly-Social entertainment_ _Assembly-Stadium_ _Assembly-Stadium (closed)_ _Assembly-Stadium (open)_ _Bank_ _Bar_ _Bar-Nightclub_ _Convenience store_ _Courthouse_ _Data center_ _Education_ _Education-Adult_ _Education-Higher_ _Education-Preschool or daycare_ _Education-Primary_ _Education-Vocational_ _Energy generation plant_ _Food sales_ _Food sales-Grocery store_ _Food service_ _Food service-Fast_ _Food service-Full_ _Gas station_ _Health care_ _Health care-Inpatient hospital_ _Health care-Outpatient facility_ _Health care-Outpatient non-diagnostic_ _Health care-Outpatient rehabilitation_ _Health care-Outpatient surgical_ _Health care-Skilled nursing facility_ _Health care-Veterinary_ _Industrial manufacturing plant_ _Laboratory_ _Lodging_ _Lodging with extended amenities_ _Lodging-Barracks_ _Lodging-Institutional_ _Media center_ _Mixed-use commercial_ _Multifamily_ _Non-office work area_ _Office_ _Office-Financial_ _Other_ _Parking_ _Public safety station_ _Public safety station-Fire_ _Public safety station-Police_ _Public safety-Correctional facility_ _Recreation_ _Recreation-Bowling alley_ _Recreation-Fitness center_ _Recreation-Ice rink_ _Recreation-Pool_ _Recreation-Roller rink_ _Residential_ _Retail_ _Retail-Automobile dealership_ _Retail-Enclosed mall_ _Retail-Hypermarket_ _Retail-Mall_ _Retail-Strip mall_ _Science park_ _Service_ _Service-Beauty and health_ _Service-Postal_ _Service-Repair_ _Shipping and receiving_ _Sport play area_ _Stage_ _Transportation terminal_ _Utility_ _Vivarium_ _Warehouse-Refrigerated_ _Warehouse-Self-storage_ _Warehouse-Unrefrigerated_ _Water treatment-Drinking water and distribution_ _Water treatment-Wastewater_ _Zoo_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Assembly-Arcade or casino without lodging", "Assembly-Convention center", "Assembly-Cultural entertainment", "Assembly-Indoor arena", "Assembly-Public", "Assembly-Race track", "Assembly-Religious", "Assembly-Social entertainment", "Assembly-Stadium", "Assembly-Stadium (closed)", "Assembly-Stadium (open)", "Bank", "Bar", "Bar-Nightclub", "Convenience store", "Courthouse", "Data center", "Education", "Education-Adult", "Education-Higher", "Education-Preschool or daycare", "Education-Primary", "Education-Vocational", "Energy generation plant", "Food sales", "Food sales-Grocery store", "Food service", "Food service-Fast", "Food service-Full", "Gas station", "Health care", "Health care-Inpatient hospital", "Health care-Outpatient facility", "Health care-Outpatient non-diagnostic", "Health care-Outpatient rehabilitation", "Health care-Outpatient surgical", "Health care-Skilled nursing facility", "Health care-Veterinary", "Industrial manufacturing plant", "Laboratory", "Lodging", "Lodging with extended amenities", "Lodging-Barracks", "Lodging-Institutional", "Media center", "Mixed-use commercial", "Multifamily", "Non-office work area", "Office", "Office-Financial", "Other", "Parking", "Public safety station", "Public safety station-Fire", "Public safety station-Police", "Public safety-Correctional facility", "Recreation", "Recreation-Bowling alley", "Recreation-Fitness center", "Recreation-Ice rink", "Recreation-Pool", "Recreation-Roller rink", "Residential", "Retail", "Retail-Automobile dealership", "Retail-Enclosed mall", "Retail-Hypermarket", "Retail-Mall", "Retail-Strip mall", "Science park", "Service", "Service-Beauty and health", "Service-Postal", "Service-Repair", "Shipping and receiving", "Sport play area", "Stage", "Transportation terminal", "Utility", "Vivarium", "Warehouse-Refrigerated", "Warehouse-Self-storage", "Warehouse-Unrefrigerated", "Water treatment-Drinking water and distribution", "Water treatment-Wastewater", or "Zoo"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:OccupancyLevels">
      <sch:assert test="count(auc:OccupancyLevel) &gt;= 0">element "auc:OccupancyLevel" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:OccupancyLevels/auc:OccupancyLevel">
      <sch:assert test="count(auc:OccupantQuantity) &gt;= 1">element "auc:OccupantQuantity" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:OccupantQuantityType) &gt;= 1">element "auc:OccupantQuantityType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:OccupantType)">element "auc:OccupantType" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:OccupancyLevels/auc:OccupancyLevel/auc:OccupantQuantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:OccupancyLevels/auc:OccupancyLevel/auc:OccupantQuantityType">
      <sch:assert test="contains('_Peak total occupants_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Peak total occupants"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones">
      <sch:assert test="count(auc:ThermalZone) &gt;= 0">element "auc:ThermalZone" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones/auc:ThermalZone">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ACAdjusted)">element "auc:ACAdjusted" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DeliveryIDs)">element "auc:DeliveryIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:HVACScheduleIDs) &gt;= 0">element "auc:HVACScheduleIDs" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatLowered)">element "auc:HeatLowered" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PremisesName)">element "auc:PremisesName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SetbackTemperatureHeating)">element "auc:SetbackTemperatureHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SetpointTemperatureCooling) &gt;= 0">element "auc:SetpointTemperatureCooling" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:SetpointTemperatureHeating) &gt;= 0">element "auc:SetpointTemperatureHeating" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SetupTemperatureCooling)">element "auc:SetupTemperatureCooling" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Spaces)">element "auc:Spaces" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones/auc:ThermalZone/auc:HVACScheduleIDs">
      <sch:assert test="count(auc:HVACScheduleID) &gt;= 0">element "auc:HVACScheduleID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones/auc:ThermalZone/auc:HVACScheduleIDs/auc:HVACScheduleID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones/auc:ThermalZone/auc:SetpointTemperatureCooling">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text())">text "<sch:value-of select="text()"/>": element "text()" MUST be a number</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:ThermalZones/auc:ThermalZone/auc:SetpointTemperatureHeating">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text())">text "<sch:value-of select="text()"/>": element "text()" MUST be a number</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:TypicalOccupantUsages">
      <sch:assert test="count(auc:TypicalOccupantUsage) &gt;= 0">element "auc:TypicalOccupantUsage" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:TypicalOccupantUsages/auc:TypicalOccupantUsage">
      <sch:assert test="count(auc:TypicalOccupantUsageUnits) &gt;= 1">element "auc:TypicalOccupantUsageUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:TypicalOccupantUsageValue) &gt;= 1">element "auc:TypicalOccupantUsageValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:TypicalOccupantUsages/auc:TypicalOccupantUsage/auc:TypicalOccupantUsageUnits">
      <sch:assert test="contains('_Hours per week_ _Weeks per year_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Hours per week" or "Weeks per year"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:TypicalOccupantUsages/auc:TypicalOccupantUsage/auc:TypicalOccupantUsageValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Original Occupancy Classification']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Original Occupancy Classification']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Principal HVAC System Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Principal HVAC System Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Principal Lighting System Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Principal Lighting System Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Computers']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Computers']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Dwellings']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Dwellings']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity of Dwellings Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity of Dwellings Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Section Notes For Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Section Notes For Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Miscellaneous Electric Load_ _Miscellaneous Electric Load Is Not Applicable_ _Occupancy Classification Is Not Applicable_ _Original Occupancy Classification_ _Percentage Dwellings Occupied_ _Percentage Dwellings Occupied Is Not Applicable_ _Principal HVAC System Type_ _Principal Lighting System Type_ _Quantity Of Computers_ _Quantity Of Dwellings_ _Quantity Of Dwellings Is Not Applicable_ _Section Notes For Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Miscellaneous Electric Load", "Miscellaneous Electric Load Is Not Applicable", "Occupancy Classification Is Not Applicable", "Original Occupancy Classification", "Percentage Dwellings Occupied", "Percentage Dwellings Occupied Is Not Applicable", "Principal HVAC System Type", "Principal Lighting System Type", "Quantity Of Computers", "Quantity Of Dwellings", "Quantity Of Dwellings Is Not Applicable", or "Section Notes For Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Miscellaneous Electric Load']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Original Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_Assembly-Arcade or casino without lodging_ _Assembly-Convention center_ _Assembly-Cultural entertainment_ _Assembly-Indoor arena_ _Assembly-Public_ _Assembly-Race track_ _Assembly-Religious_ _Assembly-Social entertainment_ _Assembly-Stadium_ _Assembly-Stadium (closed)_ _Assembly-Stadium (open)_ _Bank_ _Bar_ _Bar-Nightclub_ _Convenience store_ _Courthouse_ _Data center_ _Education_ _Education-Adult_ _Education-Higher_ _Education-Preschool or daycare_ _Education-Primary_ _Education-Vocational_ _Energy generation plant_ _Food sales_ _Food sales-Grocery store_ _Food service_ _Food service-Fast_ _Food service-Full_ _Gas station_ _Health care_ _Health care-Inpatient hospital_ _Health care-Outpatient facility_ _Health care-Outpatient non-diagnostic_ _Health care-Outpatient rehabilitation_ _Health care-Outpatient surgical_ _Health care-Skilled nursing facility_ _Health care-Veterinary_ _Industrial manufacturing plant_ _Laboratory_ _Lodging_ _Lodging with extended amenities_ _Lodging-Barracks_ _Lodging-Institutional_ _Media center_ _Mixed-use commercial_ _Multifamily_ _Non-office work area_ _Office_ _Office-Financial_ _Other_ _Parking_ _Public safety station_ _Public safety station-Fire_ _Public safety station-Police_ _Public safety-Correctional facility_ _Recreation_ _Recreation-Bowling alley_ _Recreation-Fitness center_ _Recreation-Ice rink_ _Recreation-Pool_ _Recreation-Roller rink_ _Residential_ _Retail_ _Retail-Automobile dealership_ _Retail-Enclosed mall_ _Retail-Hypermarket_ _Retail-Mall_ _Retail-Strip mall_ _Science park_ _Service_ _Service-Beauty and health_ _Service-Postal_ _Service-Repair_ _Shipping and receiving_ _Sport play area_ _Stage_ _Transportation terminal_ _Utility_ _Vivarium_ _Warehouse-Refrigerated_ _Warehouse-Self-storage_ _Warehouse-Unrefrigerated_ _Water treatment-Drinking water and distribution_ _Water treatment-Wastewater_ _Zoo_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Assembly-Arcade or casino without lodging", "Assembly-Convention center", "Assembly-Cultural entertainment", "Assembly-Indoor arena", "Assembly-Public", "Assembly-Race track", "Assembly-Religious", "Assembly-Social entertainment", "Assembly-Stadium", "Assembly-Stadium (closed)", "Assembly-Stadium (open)", "Bank", "Bar", "Bar-Nightclub", "Convenience store", "Courthouse", "Data center", "Education", "Education-Adult", "Education-Higher", "Education-Preschool or daycare", "Education-Primary", "Education-Vocational", "Energy generation plant", "Food sales", "Food sales-Grocery store", "Food service", "Food service-Fast", "Food service-Full", "Gas station", "Health care", "Health care-Inpatient hospital", "Health care-Outpatient facility", "Health care-Outpatient non-diagnostic", "Health care-Outpatient rehabilitation", "Health care-Outpatient surgical", "Health care-Skilled nursing facility", "Health care-Veterinary", "Industrial manufacturing plant", "Laboratory", "Lodging", "Lodging with extended amenities", "Lodging-Barracks", "Lodging-Institutional", "Media center", "Mixed-use commercial", "Multifamily", "Non-office work area", "Office", "Office-Financial", "Other", "Parking", "Public safety station", "Public safety station-Fire", "Public safety station-Police", "Public safety-Correctional facility", "Recreation", "Recreation-Bowling alley", "Recreation-Fitness center", "Recreation-Ice rink", "Recreation-Pool", "Recreation-Roller rink", "Residential", "Retail", "Retail-Automobile dealership", "Retail-Enclosed mall", "Retail-Hypermarket", "Retail-Mall", "Retail-Strip mall", "Science park", "Service", "Service-Beauty and health", "Service-Postal", "Service-Repair", "Shipping and receiving", "Sport play area", "Stage", "Transportation terminal", "Utility", "Vivarium", "Warehouse-Refrigerated", "Warehouse-Self-storage", "Warehouse-Unrefrigerated", "Water treatment-Drinking water and distribution", "Water treatment-Wastewater", or "Zoo"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Dwellings Occupied']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Principal HVAC System Type']/auc:FieldValue">
      <sch:assert test="contains('_Dedicated Outdoor Air System_ _Four Pipe Fan Coil Unit_ _Ground Source Heat Pump_ _Packaged Rooftop Air Conditioner_ _Packaged Rooftop Heat Pump_ _Packaged Rooftop VAV with Electric Reheat_ _Packaged Rooftop VAV with Hot Water Reheat_ _Packaged Terminal Air Conditioner_ _Packaged Terminal Heat Pump_ _VAV with Electric Reheat_ _VAV with Hot Water Reheat_ _Ventilation Only_ _Warm Air Furnace_ _Water Loop Heat Pump_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Dedicated Outdoor Air System", "Four Pipe Fan Coil Unit", "Ground Source Heat Pump", "Packaged Rooftop Air Conditioner", "Packaged Rooftop Heat Pump", "Packaged Rooftop VAV with Electric Reheat", "Packaged Rooftop VAV with Hot Water Reheat", "Packaged Terminal Air Conditioner", "Packaged Terminal Heat Pump", "VAV with Electric Reheat", "VAV with Hot Water Reheat", "Ventilation Only", "Warm Air Furnace", or "Water Loop Heat Pump"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Principal Lighting System Type']/auc:FieldValue">
      <sch:assert test="contains('_Compact Fluorescent_ _T5_ _T5HO_ _T8_ _Super T8_ _T12_ _T12HO_ _Halogen_ _Sodium Vapor High Pressure_ _Incandescent_ _LED_ _Mercury Vapor_ _Metal Halide_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Compact Fluorescent", "T5", "T5HO", "T8", "Super T8", "T12", "T12HO", "Halogen", "Sodium Vapor High Pressure", "Incandescent", "LED", "Mercury Vapor", or "Metal Halide"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Computers']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Of Dwellings']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Space function']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity of Dwellings Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']">
      <sch:assert test="count(auc:ExteriorFloors) &gt;= 0">element "auc:ExteriorFloors" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FootprintShape) &gt;= 0">element "auc:FootprintShape" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Foundations) &gt;= 0">element "auc:Foundations" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OccupancyClassification)">element "auc:OccupancyClassification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OccupancyLevels)">element "auc:OccupancyLevels" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Roofs) &gt;= 0">element "auc:Roofs" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Sides) &gt;= 0">element "auc:Sides" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ThermalZones)">element "auc:ThermalZones" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TypicalOccupantUsages)">element "auc:TypicalOccupantUsages" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:ExteriorFloors">
      <sch:assert test="count(auc:ExteriorFloor) &gt;= 0">element "auc:ExteriorFloor" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:ExteriorFloors/auc:ExteriorFloor">
      <sch:assert test="count(auc:ExteriorFloorID) &gt;= 0">element "auc:ExteriorFloorID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:ExteriorFloors/auc:ExteriorFloor/auc:ExteriorFloorID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorArea)">element "auc:ExteriorFloorArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SpaceIDs)">element "auc:SpaceIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZoneIDs)">element "auc:ThermalZoneIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:FootprintShape">
      <sch:assert test="contains('_L-Shape_ _O-Shape_ _Rectangular_ _T-Shape_ _U-Shape_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "L-Shape", "O-Shape", "Rectangular", "T-Shape", or "U-Shape"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Foundations">
      <sch:assert test="count(auc:Foundation) &gt;= 0">element "auc:Foundation" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Foundations/auc:Foundation">
      <sch:assert test="count(auc:FoundationID) &gt;= 0">element "auc:FoundationID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Foundations/auc:Foundation/auc:FoundationID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FoundationArea)">element "auc:FoundationArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SpaceIDs)">element "auc:SpaceIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZoneIDs)">element "auc:ThermalZoneIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs">
      <sch:assert test="count(auc:Roof) &gt;= 0">element "auc:Roof" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs/auc:Roof">
      <sch:assert test="count(auc:RoofID) &gt;= 0">element "auc:RoofID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs/auc:Roof/auc:RoofID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:RoofArea)">element "auc:RoofArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofCondition) &gt;= 0">element "auc:RoofCondition" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofInsulatedArea)">element "auc:RoofInsulatedArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SkylightIDs) &gt;= 0">element "auc:SkylightIDs" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs/auc:Roof/auc:RoofID/auc:RoofCondition">
      <sch:assert test="contains('_Average_ _Excellent_ _Good_ _Poor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Excellent", "Good", or "Poor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs/auc:Roof/auc:RoofID/auc:SkylightIDs">
      <sch:assert test="count(auc:SkylightID) &gt;= 0">element "auc:SkylightID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Roofs/auc:Roof/auc:RoofID/auc:SkylightIDs/auc:SkylightID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PercentSkylightArea)">element "auc:PercentSkylightArea" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Sides">
      <sch:assert test="count(auc:Side) &gt;= 0">element "auc:Side" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Sides/auc:Side">
      <sch:assert test="count(auc:DoorID) &gt;= 0">element "auc:DoorID" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SideLength)">element "auc:SideLength" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SideNumber)">element "auc:SideNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZoneIDs)">element "auc:ThermalZoneIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WallID) &gt;= 0">element "auc:WallID" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WindowID) &gt;= 0">element "auc:WindowID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Sides/auc:Side/auc:DoorID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FenestrationArea)">element "auc:FenestrationArea" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Sides/auc:Side/auc:WallID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:WallArea)">element "auc:WallArea" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:Sections/auc:Section[auc:SectionType = 'Whole building']/auc:Sides/auc:Side/auc:WindowID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FenestrationArea)">element "auc:FenestrationArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PercentOfWindowAreaShaded)">element "auc:PercentOfWindowAreaShaded" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowToWallRatio)">element "auc:WindowToWallRatio" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:TotalExteriorAboveGradeWallArea">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:TotalExteriorBelowGradeWallArea">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UnconditionedFloorsAboveGrade">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UnconditionedFloorsBelowGrade">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Building Status Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Building Status Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Calculate Annual Energy Use Summary']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Calculate Annual Energy Use Summary']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Above Grade Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Above Grade Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Below Grade Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Below Grade Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Demising Above Grade Wall Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Demising Above Grade Wall Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Cooled only Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Cooled only Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Gross Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Gross Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated and Cooled Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated and Cooled Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated only Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated only Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Number Of Facilities On Site Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Number Of Facilities On Site Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Capacity']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Capacity']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Fuel cell Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Fuel cell Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Microturbine Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Microturbine Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For PV Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For PV Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Reciprocating engine Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Reciprocating engine Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Turbine Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Turbine Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Wind Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Wind Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System For Solar Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System For Solar Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Skylight Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Skylight Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Percentage Terrace Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Percentage Terrace Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Atlanta Building ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Atlanta Building ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For City Custom Building ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For City Custom Building ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Portfolio Manager Building ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Portfolio Manager Building ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Shared Metering Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Shared Metering Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Space functions For Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Space functions For Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Tenant Metering Configurations For Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes For Tenant Metering Configurations For Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Retrocommissioning Date Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Retrocommissioning Date Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Roof Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Roof Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Spaces Excluded From Gross Floor Area Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Spaces Excluded From Gross Floor Area Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Energy Audit Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Energy Audit Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Major Remodel Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Major Remodel Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Alternative Roof Surface Construction Method_ _Alternative Roof Surface Construction Method Is Not Applicable_ _Building Status Type_ _Calculate Annual Energy Use Summary_ _Commercial Tenant Metering Configuration For Electricity Is Direct metering_ _Commercial Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable_ _Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering_ _Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable_ _Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering_ _Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable_ _Commercial Tenant Metering Configuration For Natural gas Is Direct metering_ _Commercial Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable_ _Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering_ _Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable_ _Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering_ _Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable_ _Conditioned Floors Above Grade Is Not Applicable_ _Conditioned Floors Below Grade Is Not Applicable_ _Floor Area For Cooled only Is Not Applicable_ _Floor Area For Gross Is Not Applicable_ _Floor Area For Heated only Is Not Applicable_ _Floor Area For Heated and Cooled Is Not Applicable_ _Demising Above Grade Wall Area_ _Metering Year Start Dates_ _Multi Tenant_ _Multi Tenant Is Not Applicable_ _Number Of Facilities On Site Is Not Applicable_ _Onsite Generation Operation Average Annual Hours_ _Onsite Generation Operation Average Annual Hours Is Not Applicable_ _Onsite Generation System_ _Onsite Generation System Capacity_ _Onsite Generation System For Fuel cell Is Not Applicable_ _Onsite Generation System For Microturbine Is Not Applicable_ _Onsite Generation System For PV Is Not Applicable_ _Onsite Generation System For Reciprocating engine Is Not Applicable_ _Onsite Generation System For Turbine Is Not Applicable_ _Onsite Generation System For Wind Is Not Applicable_ _Onsite Generation System Is Not Applicable_ _Onsite Renewable Peak Generating Capacity_ _Onsite Renewable Peak Generating Capacity Is Not Applicable_ _Onsite Renewable System_ _Onsite Renewable System For Solar Is Not Applicable_ _Onsite Renewable System Is Not Applicable_ _Other Energy Generation Technology Is Not Applicable_ _Percentage Onsite Generation Peak Generating Capacity_ _Percentage Onsite Generation Peak Generating Capacity Is Not Applicable_ _Percentage Skylight Area_ _Percentage Terrace Area_ _Premises Identifier For Atlanta Building ID Is Not Applicable_ _Premises Identifier For City Custom Building ID Is Not Applicable_ _Premises Identifier For Portfolio Manager Building ID Is Not Applicable_ _Premises Notes For Not Applicable_ _Premises Notes For Shared Metering Not Applicable_ _Premises Notes For Space Functions For Not Applicable_ _Premises Notes For Tenant Metering Configuration For Not Applicable_ _Premises Notes Is Not Applicable_ _Residential Tenant Metering Configuration For Electricity Is Direct metering_ _Residential Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable_ _Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering_ _Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable_ _Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering_ _Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable_ _Residential Tenant Metering Configuration For Natural gas Is Direct metering_ _Residential Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable_ _Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering_ _Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable_ _Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering_ _Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable_ _Retrocommissioning Date Is Not Applicable_ _Roof Area_ _Shared Chilled water_ _Shared Chilled water Is Not Applicable_ _Shared Fuel oil_ _Shared Fuel oil Is Not Applicable_ _Shared Heating_ _Shared Heating Is Not Applicable_ _Shared Meter For District steam_ _Shared Meter For District steam Is Not Applicable_ _Shared Meter For Electricity_ _Shared Meter For Electricity Is Not Applicable_ _Shared Meters For Multiple buildings on a single lot_ _Shared Meters For Multiple buildings on a single lot Is Not Applicable_ _Shared Meters For Multiple buildings on multiple lots_ _Shared Meters For Multiple buildings on multiple lots Is Not Applicable_ _Shared Meter For Natural gas_ _Shared Meter For Natural gas Is Not Applicable_ _Spaces Excluded From Gross Floor Area_ _Spaces Excluded From Gross Floor Area Is Not Applicable_ _Terrace R Value_ _Terrace R Value Is Not Applicable_ _Validate 100% Lighting Status_ _Validate 100% Lighting Status Is Not Applicable_ _Year Of Last Energy Audit Is Not Applicable_ _Year Of Last Major Remodel Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Alternative Roof Surface Construction Method", "Alternative Roof Surface Construction Method Is Not Applicable", "Building Status Type", "Calculate Annual Energy Use Summary", "Commercial Tenant Metering Configuration For Electricity Is Direct metering", "Commercial Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable", "Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering", "Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable", "Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering", "Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable", "Commercial Tenant Metering Configuration For Natural gas Is Direct metering", "Commercial Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable", "Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering", "Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable", "Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering", "Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable", "Conditioned Floors Above Grade Is Not Applicable", "Conditioned Floors Below Grade Is Not Applicable", "Floor Area For Cooled only Is Not Applicable", "Floor Area For Gross Is Not Applicable", "Floor Area For Heated only Is Not Applicable", "Floor Area For Heated and Cooled Is Not Applicable", "Demising Above Grade Wall Area", "Metering Year Start Dates", "Multi Tenant", "Multi Tenant Is Not Applicable", "Number Of Facilities On Site Is Not Applicable", "Onsite Generation Operation Average Annual Hours", "Onsite Generation Operation Average Annual Hours Is Not Applicable", "Onsite Generation System", "Onsite Generation System Capacity", "Onsite Generation System For Fuel cell Is Not Applicable", "Onsite Generation System For Microturbine Is Not Applicable", "Onsite Generation System For PV Is Not Applicable", "Onsite Generation System For Reciprocating engine Is Not Applicable", "Onsite Generation System For Turbine Is Not Applicable", "Onsite Generation System For Wind Is Not Applicable", "Onsite Generation System Is Not Applicable", "Onsite Renewable Peak Generating Capacity", "Onsite Renewable Peak Generating Capacity Is Not Applicable", "Onsite Renewable System", "Onsite Renewable System For Solar Is Not Applicable", "Onsite Renewable System Is Not Applicable", "Other Energy Generation Technology Is Not Applicable", "Percentage Onsite Generation Peak Generating Capacity", "Percentage Onsite Generation Peak Generating Capacity Is Not Applicable", "Percentage Skylight Area", "Percentage Terrace Area", "Premises Identifier For Atlanta Building ID Is Not Applicable", "Premises Identifier For City Custom Building ID Is Not Applicable", "Premises Identifier For Portfolio Manager Building ID Is Not Applicable", "Premises Notes For Not Applicable", "Premises Notes For Shared Metering Not Applicable", "Premises Notes For Space Functions For Not Applicable", "Premises Notes For Tenant Metering Configuration For Not Applicable", "Premises Notes Is Not Applicable", "Residential Tenant Metering Configuration For Electricity Is Direct metering", "Residential Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable", "Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering", "Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable", "Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering", "Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable", "Residential Tenant Metering Configuration For Natural gas Is Direct metering", "Residential Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable", "Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering", "Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable", "Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering", "Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable", "Retrocommissioning Date Is Not Applicable", "Roof Area", "Shared Chilled water", "Shared Chilled water Is Not Applicable", "Shared Fuel oil", "Shared Fuel oil Is Not Applicable", "Shared Heating", "Shared Heating Is Not Applicable", "Shared Meter For District steam", "Shared Meter For District steam Is Not Applicable", "Shared Meter For Electricity", "Shared Meter For Electricity Is Not Applicable", "Shared Meters For Multiple buildings on a single lot", "Shared Meters For Multiple buildings on a single lot Is Not Applicable", "Shared Meters For Multiple buildings on multiple lots", "Shared Meters For Multiple buildings on multiple lots Is Not Applicable", "Shared Meter For Natural gas", "Shared Meter For Natural gas Is Not Applicable", "Spaces Excluded From Gross Floor Area", "Spaces Excluded From Gross Floor Area Is Not Applicable", "Terrace R Value", "Terrace R Value Is Not Applicable", "Validate 100% Lighting Status", "Validate 100% Lighting Status Is Not Applicable", "Year Of Last Energy Audit Is Not Applicable", or "Year Of Last Major Remodel Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Alternative Roof Surface Construction Method']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Building Status Type']/auc:FieldValue">
      <sch:assert test="contains('_Editing_ _Rated_ _Running_ _Submitted_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Editing", "Rated", "Running", or "Submitted"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Calculate Annual Energy Use Summary']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Commercial Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Above Grade Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Conditioned Floors Below Grade Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Demising Above Grade Wall Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Cooled only Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Gross Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated and Cooled Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Floor Area For Heated only Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Multi Tenant']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Number Of Facilities On Site Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation Operation Average Annual Hours']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Capacity']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Fuel cell Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Microturbine Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For PV Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Reciprocating engine Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Turbine Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System For Wind Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Generation System']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable Peak Generating Capacity']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System For Solar Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Onsite Renewable System']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Onsite Generation Peak Generating Capacity']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Skylight Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Percentage Terrace Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Atlanta Building ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For City Custom Building ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Premises Identifier For Portfolio Manager Building ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Premises Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Direct metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter with sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Electricity Is Master meter without sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Direct metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter with sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Residential Tenant Metering Configuration For Natural gas Is Master meter without sub metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Retrocommissioning Date Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Roof Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Chilled water']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Fuel oil']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Heating']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For District steam']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Electricity']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meter For Natural gas']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on a single lot']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Shared Meters For Multiple buildings on multiple lots']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Spaces Excluded From Gross Floor Area Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Terrace R Value']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Validate 100% Lighting Status']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Energy Audit Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Of Last Major Remodel Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:YearOfConstruction">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:YearOfLastEnergyAudit">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:Buildings/auc:Building/auc:YearOfLastMajorRemodel">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:PremisesIdentifiers">
      <sch:assert test="count(auc:PremisesIdentifier) &gt;= 1">element "auc:PremisesIdentifier" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Borough')]/auc:IdentifierValue) &gt;= 1">element "auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Borough')]/auc:IdentifierValue" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Tax Block')]/auc:IdentifierValue) &gt;= 1">element "auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Tax Block')]/auc:IdentifierValue" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Tax Lot')]/auc:IdentifierValue) &gt;= 1">element "auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Tax Lot')]/auc:IdentifierValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:PremisesIdentifiers/auc:PremisesIdentifier">
      <sch:assert test="count(auc:IdentifierCustomName) &gt;= 1">element "auc:IdentifierCustomName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:IdentifierLabel) &gt;= 1">element "auc:IdentifierLabel" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:IdentifierValue) &gt;= 1">element "auc:IdentifierValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:PremisesIdentifiers/auc:PremisesIdentifier/auc:IdentifierCustomName">
      <sch:assert test="contains('_Borough_ _Tax Block_ _Tax Lot_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Borough", "Tax Block", or "Tax Lot"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:PremisesIdentifiers/auc:PremisesIdentifier/auc:IdentifierLabel">
      <sch:assert test="contains('_Custom_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Custom"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site/auc:PremisesIdentifiers/auc:PremisesIdentifier[(auc:IdentifierLabel/text() = 'Custom') and (auc:IdentifierCustomName/text() = 'Borough')]/auc:IdentifierValue">
      <sch:assert test="contains('_Bronx_ _Brooklyn_ _Manhattan_ _Staten Island_ _Queens_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Bronx", "Brooklyn", "Manhattan", "Staten Island", or "Queens"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site[count(auc:Buildings/auc:Building) &gt;= 1]">
      <sch:assert test="count(auc:PremisesName) &gt;= 0">element "auc:PremisesName" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Sites/auc:Site[not(auc:Buildings/auc:Building)]">
      <sch:assert test="not(auc:PremisesName)">element "auc:PremisesName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems">
      <sch:assert test="count(auc:AirInfiltrationSystems) &gt;= 0">element "auc:AirInfiltrationSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CeilingSystems)">element "auc:CeilingSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ConveyanceSystems) &gt;= 0">element "auc:ConveyanceSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CookingSystems)">element "auc:CookingSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CriticalITSystems) &gt;= 0">element "auc:CriticalITSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DishwasherSystems)">element "auc:DishwasherSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DomesticHotWaterSystems) &gt;= 0">element "auc:DomesticHotWaterSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ExteriorFloorSystems) &gt;= 0">element "auc:ExteriorFloorSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FanSystems) &gt;= 0">element "auc:FanSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationSystems) &gt;= 0">element "auc:FenestrationSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FoundationSystems) &gt;= 0">element "auc:FoundationSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HVACSystems) &gt;= 0">element "auc:HVACSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatRecoverySystems)">element "auc:HeatRecoverySystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LaundrySystems)">element "auc:LaundrySystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LightingSystems) &gt;= 0">element "auc:LightingSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:MotorSystems) &gt;= 0">element "auc:MotorSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystems) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoads) &gt;= 0">element "auc:PlugLoads" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Pools)">element "auc:Pools" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ProcessLoads) &gt;= 0">element "auc:ProcessLoads" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PumpSystems) &gt;= 0">element "auc:PumpSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RefrigerationSystems)">element "auc:RefrigerationSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofSystems) &gt;= 0">element "auc:RoofSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WallSystems) &gt;= 0">element "auc:WallSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WaterInfiltrationSystems)">element "auc:WaterInfiltrationSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WaterUses)">element "auc:WaterUses" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems">
      <sch:assert test="count(auc:AirInfiltrationSystem) &gt;= 0">element "auc:AirInfiltrationSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:AirInfiltrationValue)">element "auc:AirInfiltrationValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:AirInfiltrationValueUnits)">element "auc:AirInfiltrationValueUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Tightness) &gt;= 0">element "auc:Tightness" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:AirInfiltrationSystems/auc:AirInfiltrationSystem/auc:Tightness">
      <sch:assert test="contains('_Average_ _Leaky_ _Tight_ _Very Leaky_ _Very Tight_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Leaky", "Tight", "Very Leaky", or "Very Tight"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems">
      <sch:assert test="count(auc:ConveyanceSystem) &gt;= 0">element "auc:ConveyanceSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']) &gt;= 0">element "auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ConveyanceLoadType)">element "auc:ConveyanceLoadType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ConveyancePeakPower)">element "auc:ConveyancePeakPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ConveyanceStandbyPower)">element "auc:ConveyanceStandbyPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ConveyanceSystemType) &gt;= 1">element "auc:ConveyanceSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:ConveyanceSystemType">
      <sch:assert test="contains('_Elevator_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Elevator"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 0">element "auc:Section" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']">
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearOfManufacture) &gt;= 0">element "auc:YearOfManufacture" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Elevator Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Elevator Type']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Elevator Type_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Elevator Type"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Elevator Type']/auc:FieldValue">
      <sch:assert test="contains('_Hydraulic_ _Traction_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Hydraulic" or "Traction"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ConveyanceSystems/auc:ConveyanceSystem[auc:ConveyanceSystemType = 'Elevator']/auc:YearOfManufacture">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems">
      <sch:assert test="count(auc:CriticalITSystem) &gt;= 0">element "auc:CriticalITSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]) &gt;= 0">element "auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]) &gt;= 0">element "auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']) &gt;= 0">element "auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']) &gt;= 0">element "auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ITNominalPower)">element "auc:ITNominalPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ITStandbyPower)">element "auc:ITStandbyPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ITSystemType) &gt;= 1">element "auc:ITSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:ITSystemType">
      <sch:assert test="contains('_Other_ _Server_ _UPS_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other", "Server", or "UPS"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Occupancy Classification_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Occupancy Classification"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_Data center_ _TV studio_ _Trading floor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Data center", "TV studio", or "Trading floor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]">
      <sch:assert test="count(auc:ITPeakPower) &gt;= 0">element "auc:ITPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ITSystemType) &gt;= 1">element "auc:ITSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:ITPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:ITSystemType">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Gross Floor Area_ _Gross Floor Area Is Not Applicable_ _IT Peak Power Is Not Applicable_ _Occupancy Classification_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Gross Floor Area", "Gross Floor Area Is Not Applicable", "IT Peak Power Is Not Applicable", or "Occupancy Classification"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'TV studio')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_TV studio_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "TV studio"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]">
      <sch:assert test="count(auc:ITPeakPower) &gt;= 0">element "auc:ITPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ITSystemType) &gt;= 1">element "auc:ITSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:ITPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:ITSystemType">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Gross Floor Area_ _Gross Floor Area Is Not Applicable_ _IT Peak Power Is Not Applicable_ _Occupancy Classification_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Gross Floor Area", "Gross Floor Area Is Not Applicable", "IT Peak Power Is Not Applicable", or "Occupancy Classification"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[(auc:ITSystemType/text() = 'Other') and (auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue/text() = 'Trading floor')]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_Trading floor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Trading floor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']">
      <sch:assert test="count(auc:ITPeakPower) &gt;= 0">element "auc:ITPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ITSystemType) &gt;= 1">element "auc:ITSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:ITPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:ITSystemType">
      <sch:assert test="contains('_Server_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Server"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Metering Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Metering Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Metering']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Metering']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Gross Floor Area_ _Gross Floor Area Is Not Applicable_ _IT Peak Power Is Not Applicable_ _Metering_ _Metering Is Not Applicable_ _Occupancy Classification_ _Power Usage Effectiveness_ _Power Usage Effectiveness Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Gross Floor Area", "Gross Floor Area Is Not Applicable", "IT Peak Power Is Not Applicable", "Metering", "Metering Is Not Applicable", "Occupancy Classification", "Power Usage Effectiveness", or "Power Usage Effectiveness Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Metering Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Metering']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_Data center_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Data center"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'Server']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Power Usage Effectiveness']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']">
      <sch:assert test="count(auc:ITPeakPower) &gt;= 0">element "auc:ITPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ITSystemType) &gt;= 1">element "auc:ITSystemType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 1">element "auc:UserDefinedFields" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:ITPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:ITSystemType">
      <sch:assert test="contains('_UPS_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "UPS"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue) &gt;= 1">element "auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_IT Peak Power Is Not Applicable_ _Occupancy Classification_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "IT Peak Power Is Not Applicable" or "Occupancy Classification"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'IT Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:CriticalITSystems/auc:CriticalITSystem[auc:ITSystemType/text() = 'UPS']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Occupancy Classification']/auc:FieldValue">
      <sch:assert test="contains('_Data center_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Data center"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems">
      <sch:assert test="count(auc:DomesticHotWaterSystem) &gt;= 0">element "auc:DomesticHotWaterSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Controls) &gt;= 0">element "auc:Controls" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DailyHotWaterDraw)">element "auc:DailyHotWaterDraw" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DomesticHotWaterType) &gt;= 1">element "auc:DomesticHotWaterType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:HotWaterDistributionType) &gt;= 0">element "auc:HotWaterDistributionType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HotWaterSetpointTemperature)">element "auc:HotWaterSetpointTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Location) &gt;= 0">element "auc:Location" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ParasiticFuelConsumptionRate)">element "auc:ParasiticFuelConsumptionRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Recirculation)">element "auc:Recirculation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WaterHeaterEfficiency) &gt;= 0">element "auc:WaterHeaterEfficiency" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WaterHeaterEfficiencyType) &gt;= 0">element "auc:WaterHeaterEfficiencyType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls">
      <sch:assert test="count(auc:Control) &gt;= 0">element "auc:Control" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control">
      <sch:assert test="not(auc:AdvancedPowerStrip)">element "auc:AdvancedPowerStrip" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manual)">element "auc:Manual" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Occupancy)">element "auc:Occupancy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OtherControlTechnology) &gt;= 0">element "auc:OtherControlTechnology" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Thermostat) &gt;= 0">element "auc:Thermostat" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Timer) &gt;= 0">element "auc:Timer" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:OtherControlTechnology">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlTechnologyName)">element "auc:OtherControlTechnologyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:OtherControlTechnology/auc:ControlStrategy">
      <sch:assert test="contains('_Demand_ _EMCS_ _None_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Demand", "EMCS", "None", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:Thermostat">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:Thermostat/auc:ControlStrategy">
      <sch:assert test="contains('_Aquastat_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Aquastat"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:Timer">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Controls/auc:Control/auc:Timer/auc:ControlStrategy">
      <sch:assert test="contains('_Chronological_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Chronological"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType">
      <sch:assert test="not(auc:HeatExchanger)">element "auc:HeatExchanger" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Instantaneous) &gt;= 0">element "auc:Instantaneous" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Other) &gt;= 0">element "auc:Other" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:StorageTank) &gt;= 0">element "auc:StorageTank" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous">
      <sch:assert test="count(auc:InstantaneousWaterHeatingSource) &gt;= 0">element "auc:InstantaneousWaterHeatingSource" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous/auc:InstantaneousWaterHeatingSource">
      <sch:assert test="count(auc:Combustion) &gt;= 0">element "auc:Combustion" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ElectricResistanceType)">element "auc:ElectricResistanceType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous/auc:InstantaneousWaterHeatingSource/auc:Combustion">
      <sch:assert test="count(auc:CondensingOperation) &gt;= 0">element "auc:CondensingOperation" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DraftBoundary) &gt;= 0">element "auc:DraftBoundary" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DraftType) &gt;= 0">element "auc:DraftType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous/auc:InstantaneousWaterHeatingSource/auc:Combustion/auc:CondensingOperation">
      <sch:assert test="contains('_Condensing_ _Near-Condensing_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Condensing", "Near-Condensing", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous/auc:InstantaneousWaterHeatingSource/auc:Combustion/auc:DraftBoundary">
      <sch:assert test="contains('_Direct_ _Indirect_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Direct" or "Indirect"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:Instantaneous/auc:InstantaneousWaterHeatingSource/auc:Combustion/auc:DraftType">
      <sch:assert test="contains('_Mechanical forced_ _Natural_ _Other_ _Unknown_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Mechanical forced", "Natural", "Other", "Unknown", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank">
      <sch:assert test="not(auc:OffCycleHeatLossCoefficient)">element "auc:OffCycleHeatLossCoefficient" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RecoveryEfficiency)">element "auc:RecoveryEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:StorageTankInsulationRValue) &gt;= 0">element "auc:StorageTankInsulationRValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:StorageTankInsulationThickness) &gt;= 0">element "auc:StorageTankInsulationThickness" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:TankHeatingType) &gt;= 0">element "auc:TankHeatingType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:TankHeight)">element "auc:TankHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TankPerimeter)">element "auc:TankPerimeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:TankVolume) &gt;= 0">element "auc:TankVolume" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:StorageTankInsulationRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:StorageTankInsulationThickness">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType">
      <sch:assert test="count(auc:Direct) &gt;= 0">element "auc:Direct" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Indirect) &gt;= 0">element "auc:Indirect" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Direct">
      <sch:assert test="count(auc:DirectTankHeatingSource) &gt;= 0">element "auc:DirectTankHeatingSource" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Direct/auc:DirectTankHeatingSource">
      <sch:assert test="count(auc:Combustion) &gt;= 0">element "auc:Combustion" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ElectricResistance)">element "auc:ElectricResistance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Direct/auc:DirectTankHeatingSource/auc:Combustion">
      <sch:assert test="count(auc:CondensingOperation) &gt;= 0">element "auc:CondensingOperation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DraftBoundary)">element "auc:DraftBoundary" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DraftType) &gt;= 0">element "auc:DraftType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Direct/auc:DirectTankHeatingSource/auc:Combustion/auc:CondensingOperation">
      <sch:assert test="contains('_Condensing_ _Near-Condensing_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Condensing", "Near-Condensing", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Direct/auc:DirectTankHeatingSource/auc:Combustion/auc:DraftType">
      <sch:assert test="contains('_Mechanical forced_ _Natural_ _Other_ _Unknown_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Mechanical forced", "Natural", "Other", "Unknown", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect">
      <sch:assert test="count(auc:IndirectTankHeatingSource) &gt;= 0">element "auc:IndirectTankHeatingSource" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource">
      <sch:assert test="count(auc:HeatPump) &gt;= 0">element "auc:HeatPump" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Solar) &gt;= 0">element "auc:Solar" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:SpaceHeatingSystem) &gt;= 0">element "auc:SpaceHeatingSystem" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:HeatPump">
      <sch:assert test="not(auc:HPWHMinimumAirTemperature)">element "auc:HPWHMinimumAirTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RatedHeatPumpSensibleHeatRatio)">element "auc:RatedHeatPumpSensibleHeatRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Refrigerant)">element "auc:Refrigerant" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:Solar">
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemCollectorArea)">element "auc:SolarThermalSystemCollectorArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemCollectorAzimuth)">element "auc:SolarThermalSystemCollectorAzimuth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemCollectorLoopType)">element "auc:SolarThermalSystemCollectorLoopType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemCollectorTilt)">element "auc:SolarThermalSystemCollectorTilt" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemCollectorType)">element "auc:SolarThermalSystemCollectorType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarThermalSystemStorageVolume)">element "auc:SolarThermalSystemStorageVolume" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SolarThermalSystemType) &gt;= 1">element "auc:SolarThermalSystemType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:Solar/auc:SolarThermalSystemType">
      <sch:assert test="contains('_Hot water_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Hot water"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:SpaceHeatingSystem">
      <sch:assert test="count(auc:HeatingPlantID) &gt;= 0">element "auc:HeatingPlantID" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankHeatingType/auc:Indirect/auc:IndirectTankHeatingSource/auc:SpaceHeatingSystem/auc:HeatingPlantID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:DomesticHotWaterType/auc:StorageTank/auc:TankVolume">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:HotWaterDistributionType">
      <sch:assert test="contains('_Distributed_ _Looped_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Distributed" or "Looped"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 0">element "auc:Section" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreas) &gt;= 0">element "auc:FloorAreas" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas">
      <sch:assert test="count(auc:FloorArea) &gt;= 0">element "auc:FloorArea" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea">
      <sch:assert test="not(auc:FloorAreaCustomName)">element "auc:FloorAreaCustomName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreaPercentage) &gt;= 1">element "auc:FloorAreaPercentage" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreaType) &gt;= 1">element "auc:FloorAreaType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreaValue)">element "auc:FloorAreaValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaPercentage">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaType">
      <sch:assert test="contains('_Common_ _Gross_ _Tenant_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Common", "Gross", or "Tenant"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:Location">
      <sch:assert test="contains('_Attic_ _Closet_ _Exterior_ _Garage_ _Interior_ _Mechanical Floor_ _Mechanical Room_ _Other_ _Penthouse_ _Roof_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Attic", "Closet", "Exterior", "Garage", "Interior", "Mechanical Floor", "Mechanical Room", "Other", "Penthouse", "Roof", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:PrimaryFuel">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Hot Water Distribution Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Hot Water Distribution Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation R Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation R Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation Thickness Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation Thickness Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Tank Volume Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Tank Volume Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Draft Type Is Not Applicable_ _Heating Plant ID Is Not Applicable_ _Hot Water Distribution Type Is Not Applicable_ _Location Is Not Applicable_ _Primary Fuel Is Not Applicable_ _Storage Tank Insulation R Value Is Not Applicable_ _Storage Tank Insulation Thickness Is Not Applicable_ _Tank Volume Is Not Applicable_ _Water Heater Efficiency Is Not Applicable_ _Water Heater Efficiency Type Is Not Applicable_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Draft Type Is Not Applicable", "Heating Plant ID Is Not Applicable", "Hot Water Distribution Type Is Not Applicable", "Location Is Not Applicable", "Primary Fuel Is Not Applicable", "Storage Tank Insulation R Value Is Not Applicable", "Storage Tank Insulation Thickness Is Not Applicable", "Tank Volume Is Not Applicable", "Water Heater Efficiency Is Not Applicable", "Water Heater Efficiency Type Is Not Applicable", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Hot Water Distribution Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation R Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Storage Tank Insulation Thickness Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Tank Volume Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Water Heater Efficiency Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:WaterHeaterEfficiency">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:WaterHeaterEfficiencyType">
      <sch:assert test="contains('_AFUE_ _COP_ _Energy Factor_ _Thermal Efficiency_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "AFUE", "COP", "Energy Factor", or "Thermal Efficiency"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ExteriorFloorSystems">
      <sch:assert test="count(auc:ExteriorFloorSystem) &gt;= 0">element "auc:ExteriorFloorSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ExteriorFloorSystems/auc:ExteriorFloorSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorColor)">element "auc:ExteriorFloorColor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorConstruction)">element "auc:ExteriorFloorConstruction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorExteriorSolarAbsorptance)">element "auc:ExteriorFloorExteriorSolarAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorExteriorThermalAbsorptance)">element "auc:ExteriorFloorExteriorThermalAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorFinish)">element "auc:ExteriorFloorFinish" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorFramingDepth)">element "auc:ExteriorFloorFramingDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorFramingFactor)">element "auc:ExteriorFloorFramingFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ExteriorFloorFramingMaterial) &gt;= 0">element "auc:ExteriorFloorFramingMaterial" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorFramingSpacing)">element "auc:ExteriorFloorFramingSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ExteriorFloorRValue) &gt;= 0">element "auc:ExteriorFloorRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ExteriorFloorUFactor)">element "auc:ExteriorFloorUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorRoughness)">element "auc:ExteriorRoughness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InteriorVisibleAbsorptance)">element "auc:InteriorVisibleAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ExteriorFloorSystems/auc:ExteriorFloorSystem/auc:ExteriorFloorFramingMaterial">
      <sch:assert test="contains('_Concrete_ _Steel_ _Wood_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Concrete", "Steel", or "Wood"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ExteriorFloorSystems/auc:ExteriorFloorSystem/auc:ExteriorFloorRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems">
      <sch:assert test="count(auc:FanSystem) &gt;= 0">element "auc:FanSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems/auc:FanSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BeltType)">element "auc:BeltType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DesignStaticPressure)">element "auc:DesignStaticPressure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FanApplication)">element "auc:FanApplication" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FanControlType) &gt;= 0">element "auc:FanControlType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FanEfficiency) &gt;= 0">element "auc:FanEfficiency" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FanPlacement)">element "auc:FanPlacement" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FanPowerMinimumRatio)">element "auc:FanPowerMinimumRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FanSize)">element "auc:FanSize" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FanType)">element "auc:FanType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InstalledFlowRate)">element "auc:InstalledFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedSystemIDs) &gt;= 1">element "auc:LinkedSystemIDs" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MaximumFanPower)">element "auc:MaximumFanPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MinimumFlowRate)">element "auc:MinimumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorLocationRelativeToAirStream)">element "auc:MotorLocationRelativeToAirStream" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfDiscreteFanSpeedsCooling)">element "auc:NumberOfDiscreteFanSpeedsCooling" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfDiscreteFanSpeedsHeating)">element "auc:NumberOfDiscreteFanSpeedsHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems/auc:FanSystem/auc:FanControlType">
      <sch:assert test="contains('_Constant Volume_ _Variable Volume_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Constant Volume" or "Variable Volume"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems/auc:FanSystem/auc:FanEfficiency">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems/auc:FanSystem/auc:LinkedSystemIDs">
      <sch:assert test="count(auc:LinkedSystemID) &gt;= 1">element "auc:LinkedSystemID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FanSystems/auc:FanSystem/auc:LinkedSystemIDs/auc:LinkedSystemID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems">
      <sch:assert test="count(auc:FenestrationSystem) &gt;= 0">element "auc:FenestrationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationSystem[auc:FenestrationType/auc:Door]) &gt;= 0">element "auc:FenestrationSystem[auc:FenestrationType/auc:Door]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]) &gt;= 0">element "auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationSystem[auc:FenestrationType/auc:Window]) &gt;= 0">element "auc:FenestrationSystem[auc:FenestrationType/auc:Window]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FenestrationType) &gt;= 1">element "auc:FenestrationType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem/auc:FenestrationType">
      <sch:assert test="count(auc:Door) &gt;= 0">element "auc:Door" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Skylight) &gt;= 0">element "auc:Skylight" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Window) &gt;= 0">element "auc:Window" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]">
      <sch:assert test="not(auc:FenestrationFrameMaterial)">element "auc:FenestrationFrameMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationGasFill)">element "auc:FenestrationGasFill" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationGlassLayers)">element "auc:FenestrationGlassLayers" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationOperation)">element "auc:FenestrationOperation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationRValue)">element "auc:FenestrationRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FenestrationType) &gt;= 1">element "auc:FenestrationType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FenestrationUFactor)">element "auc:FenestrationUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:GlassType)">element "auc:GlassType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SolarHeatGainCoefficient)">element "auc:SolarHeatGainCoefficient" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TightnessFitCondition)">element "auc:TightnessFitCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:VisibleTransmittance)">element "auc:VisibleTransmittance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Weatherstripped)">element "auc:Weatherstripped" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:FenestrationType">
      <sch:assert test="count(auc:Door) &gt;= 1">element "auc:Door" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:FenestrationType/auc:Door">
      <sch:assert test="not(auc:DoorGlazedAreaFraction)">element "auc:DoorGlazedAreaFraction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DoorOperation)">element "auc:DoorOperation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ExteriorDoorType) &gt;= 0">element "auc:ExteriorDoorType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Vestibule)">element "auc:Vestibule" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:FenestrationType/auc:Door/auc:ExteriorDoorType">
      <sch:assert test="contains('_Hollow wood_ _Insulated metal_ _Other_ _Solid wood_ _Uninsulated metal_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Hollow wood", "Insulated metal", "Other", "Solid wood", or "Uninsulated metal"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Exterior Door Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Exterior Door Type']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Door]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Other Exterior Door Type_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other Exterior Door Type"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]">
      <sch:assert test="not(auc:FenestrationFrameMaterial)">element "auc:FenestrationFrameMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationGasFill)">element "auc:FenestrationGasFill" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationGlassLayers)">element "auc:FenestrationGlassLayers" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationOperation)">element "auc:FenestrationOperation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FenestrationRValue)">element "auc:FenestrationRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FenestrationType) &gt;= 1">element "auc:FenestrationType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FenestrationUFactor) &gt;= 0">element "auc:FenestrationUFactor" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:GlassType) &gt;= 0">element "auc:GlassType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SolarHeatGainCoefficient) &gt;= 0">element "auc:SolarHeatGainCoefficient" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:TightnessFitCondition)">element "auc:TightnessFitCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:VisibleTransmittance) &gt;= 0">element "auc:VisibleTransmittance" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Weatherstripped)">element "auc:Weatherstripped" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:FenestrationType">
      <sch:assert test="count(auc:Skylight) &gt;= 1">element "auc:Skylight" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:FenestrationType/auc:Skylight">
      <sch:assert test="not(auc:AssemblyPitch)">element "auc:AssemblyPitch" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SkylightLayout)">element "auc:SkylightLayout" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SkylightPitch)">element "auc:SkylightPitch" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SkylightSolarTube)">element "auc:SkylightSolarTube" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SkylightWindowTreatments)">element "auc:SkylightWindowTreatments" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:FenestrationUFactor">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:GlassType">
      <sch:assert test="contains('_Other_ _Plastic_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other" or "Plastic"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:SolarHeatGainCoefficient">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Skylight]/auc:VisibleTransmittance">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]">
      <sch:assert test="count(auc:FenestrationFrameMaterial) &gt;= 0">element "auc:FenestrationFrameMaterial" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationGasFill) &gt;= 0">element "auc:FenestrationGasFill" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationGlassLayers) &gt;= 0">element "auc:FenestrationGlassLayers" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FenestrationOperation) &gt;= 0">element "auc:FenestrationOperation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FenestrationRValue)">element "auc:FenestrationRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FenestrationType) &gt;= 1">element "auc:FenestrationType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FenestrationUFactor) &gt;= 0">element "auc:FenestrationUFactor" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:GlassType) &gt;= 0">element "auc:GlassType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SolarHeatGainCoefficient) &gt;= 0">element "auc:SolarHeatGainCoefficient" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:TightnessFitCondition) &gt;= 0">element "auc:TightnessFitCondition" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:VisibleTransmittance) &gt;= 0">element "auc:VisibleTransmittance" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Weatherstripped)">element "auc:Weatherstripped" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationFrameMaterial">
      <sch:assert test="contains('_Aluminum no thermal break_ _Aluminum thermal break_ _Other_ _Vinyl_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Aluminum no thermal break", "Aluminum thermal break", "Other", or "Vinyl"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationGasFill">
      <sch:assert test="contains('_Air_ _Other Insulating Gas_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Air" or "Other Insulating Gas"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationGlassLayers">
      <sch:assert test="contains('_Double pane_ _Single pane_ _Triple pane_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Double pane", "Single pane", or "Triple pane"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationType">
      <sch:assert test="count(auc:Window) &gt;= 1">element "auc:Window" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationType/auc:Window">
      <sch:assert test="not(auc:AssemblyType)">element "auc:AssemblyType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DistanceBetweenVerticalFins)">element "auc:DistanceBetweenVerticalFins" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorShadingType)">element "auc:ExteriorShadingType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InteriorShadingType)">element "auc:InteriorShadingType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LightShelves)">element "auc:LightShelves" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OverhangHeightAboveWindow)">element "auc:OverhangHeightAboveWindow" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OverhangProjection)">element "auc:OverhangProjection" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:VerticalEdgeFinOnly)">element "auc:VerticalEdgeFinOnly" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:VerticalFinDepth)">element "auc:VerticalFinDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowHeight)">element "auc:WindowHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowHorizontalSpacing)">element "auc:WindowHorizontalSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowLayout)">element "auc:WindowLayout" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowOrientation)">element "auc:WindowOrientation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowSillHeight)">element "auc:WindowSillHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WindowWidth)">element "auc:WindowWidth" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:FenestrationUFactor">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:GlassType">
      <sch:assert test="contains('_Clear uncoated_ _Low e_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Clear uncoated" or "Low e"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:SolarHeatGainCoefficient">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:TightnessFitCondition">
      <sch:assert test="contains('_Average_ _Leaky_ _Tight_ _Very Leaky_ _Very Tight_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Leaky", "Tight", "Very Leaky", or "Very Tight"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FenestrationSystems/auc:FenestrationSystem[auc:FenestrationType/auc:Window]/auc:VisibleTransmittance">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems">
      <sch:assert test="count(auc:FoundationSystem) &gt;= 0">element "auc:FoundationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]) &gt;= 0">element "auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]) &gt;= 0">element "auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorConstructionType)">element "auc:FloorConstructionType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorCovering)">element "auc:FloorCovering" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PlumbingPenetrationSealing)">element "auc:PlumbingPenetrationSealing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]">
      <sch:assert test="count(auc:GroundCouplings) &gt;= 0">element "auc:GroundCouplings" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:GroundCouplings">
      <sch:assert test="count(auc:GroundCoupling) &gt;= 0">element "auc:GroundCoupling" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:GroundCouplings/auc:GroundCoupling">
      <sch:assert test="count(auc:Basement) &gt;= 0">element "auc:Basement" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Crawlspace)">element "auc:Crawlspace" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabOnGrade)">element "auc:SlabOnGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:GroundCouplings/auc:GroundCoupling/auc:Basement">
      <sch:assert test="not(auc:BasementConditioning)">element "auc:BasementConditioning" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationHeightAboveGrade)">element "auc:FoundationHeightAboveGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallConstruction)">element "auc:FoundationWallConstruction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationCondition)">element "auc:FoundationWallInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationContinuity)">element "auc:FoundationWallInsulationContinuity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationThickness)">element "auc:FoundationWallInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FoundationWallRValue) &gt;= 0">element "auc:FoundationWallRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FoundationWallUFactor)">element "auc:FoundationWallUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabArea)">element "auc:SlabArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabExposedPerimeter)">element "auc:SlabExposedPerimeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabHeating)">element "auc:SlabHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationCondition)">element "auc:SlabInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationOrientation)">element "auc:SlabInsulationOrientation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationThickness)">element "auc:SlabInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabPerimeter)">element "auc:SlabPerimeter" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:GroundCouplings/auc:GroundCoupling/auc:Basement/auc:FoundationWallRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Foundation Wall R Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Foundation Wall R Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Foundation Wall R Value Is Not Applicable_ _Linked Wall ID_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Foundation Wall R Value Is Not Applicable" or "Linked Wall ID"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID']]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Foundation Wall R Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]">
      <sch:assert test="count(auc:GroundCouplings) &gt;= 0">element "auc:GroundCouplings" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings">
      <sch:assert test="count(auc:GroundCoupling) &gt;= 0">element "auc:GroundCoupling" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling">
      <sch:assert test="count(auc:Basement) &gt;= 0">element "auc:Basement" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Crawlspace) &gt;= 0">element "auc:Crawlspace" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Other) &gt;= 0">element "auc:Other" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:SlabOnGrade) &gt;= 0">element "auc:SlabOnGrade" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Basement">
      <sch:assert test="not(auc:BasementConditioning)">element "auc:BasementConditioning" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationHeightAboveGrade)">element "auc:FoundationHeightAboveGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallConstruction)">element "auc:FoundationWallConstruction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationCondition)">element "auc:FoundationWallInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationContinuity)">element "auc:FoundationWallInsulationContinuity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationThickness)">element "auc:FoundationWallInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FoundationWallRValue) &gt;= 0">element "auc:FoundationWallRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FoundationWallUFactor)">element "auc:FoundationWallUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabArea)">element "auc:SlabArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabExposedPerimeter)">element "auc:SlabExposedPerimeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabHeating)">element "auc:SlabHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationCondition)">element "auc:SlabInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationOrientation)">element "auc:SlabInsulationOrientation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationThickness)">element "auc:SlabInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabPerimeter)">element "auc:SlabPerimeter" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Basement/auc:FoundationWallRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace">
      <sch:assert test="count(auc:CrawlspaceVenting) &gt;= 0">element "auc:CrawlspaceVenting" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace/auc:CrawlspaceVenting">
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Unventilated) &gt;= 0">element "auc:Unventilated" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Ventilated) &gt;= 0">element "auc:Ventilated" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace/auc:CrawlspaceVenting/auc:Unventilated">
      <sch:assert test="not(auc:FoundationHeightAboveGrade)">element "auc:FoundationHeightAboveGrade" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallConstruction)">element "auc:FoundationWallConstruction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationCondition)">element "auc:FoundationWallInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationContinuity)">element "auc:FoundationWallInsulationContinuity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FoundationWallInsulationThickness)">element "auc:FoundationWallInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FoundationWallRValue) &gt;= 0">element "auc:FoundationWallRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FoundationWallUFactor)">element "auc:FoundationWallUFactor" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace/auc:CrawlspaceVenting/auc:Unventilated/auc:FoundationWallRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace/auc:CrawlspaceVenting/auc:Ventilated">
      <sch:assert test="not(auc:FloorFramingDepth)">element "auc:FloorFramingDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorFramingFactor)">element "auc:FloorFramingFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorFramingSpacing)">element "auc:FloorFramingSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorInsulationCondition)">element "auc:FloorInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FloorInsulationThickness)">element "auc:FloorInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorRValue) &gt;= 0">element "auc:FloorRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FloorUFactor)">element "auc:FloorUFactor" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:Crawlspace/auc:CrawlspaceVenting/auc:Ventilated/auc:FloorRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:SlabOnGrade">
      <sch:assert test="not(auc:SlabArea)">element "auc:SlabArea" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabExposedPerimeter)">element "auc:SlabExposedPerimeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabHeating)">element "auc:SlabHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationCondition)">element "auc:SlabInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SlabInsulationOrientation)">element "auc:SlabInsulationOrientation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SlabInsulationThickness) &gt;= 0">element "auc:SlabInsulationThickness" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SlabPerimeter)">element "auc:SlabPerimeter" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SlabRValue) &gt;= 0">element "auc:SlabRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SlabUFactor)">element "auc:SlabUFactor" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:SlabOnGrade/auc:SlabInsulationThickness">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:GroundCouplings/auc:GroundCoupling/auc:SlabOnGrade/auc:SlabRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Foundation Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Foundation Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Slab Insulation Thickness Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Slab Insulation Thickness Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Other Foundation Type_ _Slab Insulation Thickness Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other Foundation Type" or "Slab Insulation Thickness Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:FoundationSystems/auc:FoundationSystem[not(auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Linked Wall ID'])]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Slab Insulation Thickness Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems">
      <sch:assert test="count(auc:HVACSystem) &gt;= 0">element "auc:HVACSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HVACSystem[auc:Plants]) &gt;= 0">element "auc:HVACSystem[auc:Plants]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HVACSystem[not(auc:Plants)]) &gt;= 0">element "auc:HVACSystem[not(auc:Plants)]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DuctSystems)">element "auc:DuctSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FrequencyOfMaintenance)">element "auc:FrequencyOfMaintenance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Priority)">element "auc:Priority" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]">
      <sch:assert test="not(auc:HVACControlSystemTypes)">element "auc:HVACControlSystemTypes" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatingAndCoolingSystems)">element "auc:HeatingAndCoolingSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 0">element "auc:LinkedPremises" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherHVACSystems)">element "auc:OtherHVACSystems" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Plants) &gt;= 0">element "auc:Plants" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PrimaryHVACSystemType)">element "auc:PrimaryHVACSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 0">element "auc:Building" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Site) &gt;= 0">element "auc:Site" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:LinkedPremises/auc:Site">
      <sch:assert test="count(auc:LinkedSiteID) &gt;= 1">element "auc:LinkedSiteID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:LinkedPremises/auc:Site/auc:LinkedSiteID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants">
      <sch:assert test="count(auc:CondenserPlants) &gt;= 0">element "auc:CondenserPlants" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CoolingPlants) &gt;= 0">element "auc:CoolingPlants" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingPlants) &gt;= 0">element "auc:HeatingPlants" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants">
      <sch:assert test="count(auc:CondenserPlant) &gt;= 0">element "auc:CondenserPlant" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:AirCooled)">element "auc:AirCooled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BuildingAutomationSystem)">element "auc:BuildingAutomationSystem" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CondenserPlantCondition)">element "auc:CondenserPlantCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:GlycolCooledDryCooler)">element "auc:GlycolCooledDryCooler" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:GroundSource) &gt;= 0">element "auc:GroundSource" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Unknown)">element "auc:Unknown" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WaterCooled) &gt;= 0">element "auc:WaterCooled" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:GroundSource">
      <sch:assert test="not(auc:CondenserWaterTemperature)">element "auc:CondenserWaterTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CondensingTemperature)">element "auc:CondensingTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:GroundSourceType) &gt;= 0">element "auc:GroundSourceType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WaterCooledCondenserFlowControl)">element "auc:WaterCooledCondenserFlowControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WaterSideEconomizer)">element "auc:WaterSideEconomizer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WellCount)">element "auc:WellCount" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:GroundSource/auc:GroundSourceType">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Condenser Plant Name']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Condenser Plant Name']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Tower Fan Control Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Tower Fan Control Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Water Cooled Condenser Flow Control Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Water Cooled Condenser Flow Control Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Condenser Plant Name_ _Cooling Tower Fan Control Is Not Applicable_ _Shared Resource Site ID_ _Water Cooled Condenser Flow Control Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Condenser Plant Name", "Cooling Tower Fan Control Is Not Applicable", "Shared Resource Site ID", or "Water Cooled Condenser Flow Control Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Tower Fan Control Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Water Cooled Condenser Flow Control Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:WaterCooled">
      <sch:assert test="not(auc:CellCount)">element "auc:CellCount" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CondenserWaterTemperature)">element "auc:CondenserWaterTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CondensingTemperature)">element "auc:CondensingTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CoolingTowerCellControl)">element "auc:CoolingTowerCellControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CoolingTowerFanControl) &gt;= 0">element "auc:CoolingTowerFanControl" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CoolingTowerTemperatureControl)">element "auc:CoolingTowerTemperatureControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WaterCooledCondenserFlowControl) &gt;= 0">element "auc:WaterCooledCondenserFlowControl" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:WaterCooledCondenserType) &gt;= 0">element "auc:WaterCooledCondenserType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WaterSideEconomizer)">element "auc:WaterSideEconomizer" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:WaterCooled/auc:CoolingTowerFanControl">
      <sch:assert test="contains('_Single Speed_ _Variable Speed_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Single Speed" or "Variable Speed"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:WaterCooled/auc:WaterCooledCondenserFlowControl">
      <sch:assert test="contains('_Fixed Flow_ _Variable Flow_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Fixed Flow" or "Variable Flow"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CondenserPlants/auc:CondenserPlant/auc:WaterCooled/auc:WaterCooledCondenserType">
      <sch:assert test="contains('_Cooling tower_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Cooling tower"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants">
      <sch:assert test="count(auc:CoolingPlant) &gt;= 0">element "auc:CoolingPlant" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BuildingAutomationSystem) &gt;= 0">element "auc:BuildingAutomationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Chiller) &gt;= 0">element "auc:Chiller" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ControlSystemType) &gt;= 0">element "auc:ControlSystemType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CoolingPlantCondition) &gt;= 0">element "auc:CoolingPlantCondition" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DistrictChilledWater) &gt;= 0">element "auc:DistrictChilledWater" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Location) &gt;= 0">element "auc:Location" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:NoCooling)">element "auc:NoCooling" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller">
      <sch:assert test="not(auc:AbsorptionHeatSource)">element "auc:AbsorptionHeatSource" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AbsorptionStages) &gt;= 0">element "auc:AbsorptionStages" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ActiveDehumidification)">element "auc:ActiveDehumidification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyUnits) &gt;= 0">element "auc:AnnualCoolingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyValue) &gt;= 0">element "auc:AnnualCoolingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Capacity) &gt;= 0">element "auc:Capacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:ChilledWaterResetControl) &gt;= 0">element "auc:ChilledWaterResetControl" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ChilledWaterSupplyTemperature)">element "auc:ChilledWaterSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ChillerCompressorDriver) &gt;= 0">element "auc:ChillerCompressorDriver" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ChillerCompressorType) &gt;= 0">element "auc:ChillerCompressorType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ChillerType) &gt;= 0">element "auc:ChillerType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CompressorStaging)">element "auc:CompressorStaging" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CondenserPlantIDs) &gt;= 0">element "auc:CondenserPlantIDs" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CoolingStageCapacity)">element "auc:CoolingStageCapacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MinimumPartLoadRatio)">element "auc:MinimumPartLoadRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:NumberOfDiscreteCoolingStages) &gt;= 0">element "auc:NumberOfDiscreteCoolingStages" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PartLoadRatioBelowWhichHotGasBypassOperates)">element "auc:PartLoadRatioBelowWhichHotGasBypassOperates" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RatedCoolingSensibleHeatRatio)">element "auc:RatedCoolingSensibleHeatRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Refrigerant)">element "auc:Refrigerant" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RefrigerantChargeFactor)">element "auc:RefrigerantChargeFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:AbsorptionStages">
      <sch:assert test="contains('_Double effect_ _Single effect_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Double effect" or "Single effect"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:AnnualCoolingEfficiencyUnits">
      <sch:assert test="contains('_COP_ _EER_ _kW/ton_ _SEER_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "COP", "EER", "kW/ton", or "SEER"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:AnnualCoolingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:Capacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:ChilledWaterResetControl">
      <sch:assert test="contains('_None_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "None" or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:ChillerCompressorDriver">
      <sch:assert test="contains('_Electric Motor_ _Gas Turbine_ _Steam_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Electric Motor", "Gas Turbine", or "Steam"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:ChillerCompressorType">
      <sch:assert test="contains('_Centrifugal_ _Reciprocating_ _Screw_ _Scroll_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Centrifugal", "Reciprocating", "Screw", or "Scroll"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:ChillerType">
      <sch:assert test="contains('_Absorption_ _Vapor compression_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Absorption" or "Vapor compression"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:CondenserPlantIDs">
      <sch:assert test="count(CondenserPlantID) &gt;= 1">element "CondenserPlantID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:CondenserPlantIDs/CondenserPlantID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:NumberOfDiscreteCoolingStages">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1) and (number() &lt;= 2)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 1, and MUST be less than or equal to 2</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Chiller/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:ControlSystemType">
      <sch:assert test="not(auc:Analog)">element "auc:Analog" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Digital) &gt;= 0">element "auc:Digital" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Pneumatic) &gt;= 0">element "auc:Pneumatic" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:ControlSystemType/auc:Digital">
      <sch:assert test="not(auc:CommunicationProtocol)">element "auc:CommunicationProtocol" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:CoolingPlantCondition">
      <sch:assert test="contains('_Average_ _Excellent_ _Good_ _Poor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Excellent", "Good", or "Poor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:DistrictChilledWater">
      <sch:assert test="not(auc:ActiveDehumidification)">element "auc:ActiveDehumidification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyUnits) &gt;= 0">element "auc:AnnualCoolingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyValue) &gt;= 0">element "auc:AnnualCoolingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Capacity) &gt;= 0">element "auc:Capacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ChilledWaterSupplyTemperature)">element "auc:ChilledWaterSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RatedCoolingSensibleHeatRatio)">element "auc:RatedCoolingSensibleHeatRatio" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:DistrictChilledWater/auc:AnnualCoolingEfficiencyUnits">
      <sch:assert test="contains('_COP_ _EER_ _kW/ton_ _SEER_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "COP", "EER", "kW/ton", or "SEER"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:DistrictChilledWater/auc:AnnualCoolingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:DistrictChilledWater/auc:Capacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:DistrictChilledWater/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:Location">
      <sch:assert test="contains('_Attic_ _Closet_ _Exterior_ _Garage_ _Interior_ _Mechanical Floor_ _Mechanical Room_ _Other_ _Penthouse_ _Roof_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Attic", "Closet", "Exterior", "Garage", "Interior", "Mechanical Floor", "Mechanical Room", "Other", "Penthouse", "Roof", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:PrimaryFuel">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Chilled Water Reset Control Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Chilled Water Reset Control Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Chiller Compressor Driver Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Chiller Compressor Driver Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Condenser Plant ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Condenser Plant ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Condition Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Condition Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Name']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Name']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Notes']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Notes']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Annual Cooling Efficiency Units Is Not Applicable_ _Annual Cooling Efficiency Value Is Not Applicable_ _Building Automation System Is Not Applicable_ _Capacity Is Not Applicable_ _Chilled Water Reset Control Is Not Applicable_ _Chiller Compressor Driver Is Not Applicable_ _Cooling Plant Condition Is Not Applicable_ _Cooling Plant Name_ _Cooling Plant Notes_ _Cooling Plant Notes Is Not Applicable_ _Condenser Plant ID Is Not Applicable_ _Condenser Type_ _Condenser Type Is Not Applicable_ _Control System Type For Digital Is Not Applicable_ _Control System Type For Pneumatic Is Not Applicable_ _Location Is Not Applicable_ _Quantity Is Not Applicable_ _Shared Resource Site ID_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Annual Cooling Efficiency Units Is Not Applicable", "Annual Cooling Efficiency Value Is Not Applicable", "Building Automation System Is Not Applicable", "Capacity Is Not Applicable", "Chilled Water Reset Control Is Not Applicable", "Chiller Compressor Driver Is Not Applicable", "Cooling Plant Condition Is Not Applicable", "Cooling Plant Name", "Cooling Plant Notes", "Cooling Plant Notes Is Not Applicable", "Condenser Plant ID Is Not Applicable", "Condenser Type", "Condenser Type Is Not Applicable", "Control System Type For Digital Is Not Applicable", "Control System Type For Pneumatic Is Not Applicable", "Location Is Not Applicable", "Quantity Is Not Applicable", "Shared Resource Site ID", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Chilled Water Reset Control Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Chiller Compressor Driver Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Condenser Plant ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Condenser Type']/auc:FieldValue">
      <sch:assert test="contains('_Air Cooled_ _Water Cooled_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Air Cooled" or "Water Cooled"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Condition Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:CoolingPlants/auc:CoolingPlant/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants">
      <sch:assert test="count(auc:HeatingPlant) &gt;= 0">element "auc:HeatingPlant" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Boiler) &gt;= 0">element "auc:Boiler" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BuildingAutomationSystem) &gt;= 0">element "auc:BuildingAutomationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ControlSystemType) &gt;= 0">element "auc:ControlSystemType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DistrictHeating) &gt;= 0">element "auc:DistrictHeating" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingPlantCondition) &gt;= 0">element "auc:HeatingPlantCondition" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Location) &gt;= 0">element "auc:Location" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:NoHeating)">element "auc:NoHeating" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SolarThermal)">element "auc:SolarThermal" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler">
      <sch:assert test="count(auc:AnnualHeatingEfficiencyUnits) &gt;= 0">element "auc:AnnualHeatingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualHeatingEfficiencyValue) &gt;= 0">element "auc:AnnualHeatingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BoilerEWT)">element "auc:BoilerEWT" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BoilerInsulationRValue)">element "auc:BoilerInsulationRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BoilerInsulationThickness)">element "auc:BoilerInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BoilerLWT)">element "auc:BoilerLWT" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BoilerPercentCondensateReturn)">element "auc:BoilerPercentCondensateReturn" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BoilerType) &gt;= 0">element "auc:BoilerType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BurnerControlType) &gt;= 0">element "auc:BurnerControlType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BurnerQuantity) &gt;= 0">element "auc:BurnerQuantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BurnerTurndownRatio)">element "auc:BurnerTurndownRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BurnerType)">element "auc:BurnerType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BurnerYearInstalled) &gt;= 0">element "auc:BurnerYearInstalled" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:CombustionEfficiency)">element "auc:CombustionEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CondensingOperation) &gt;= 0">element "auc:CondensingOperation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DraftBoundary)">element "auc:DraftBoundary" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DraftType) &gt;= 0">element "auc:DraftType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatingStageCapacityFraction)">element "auc:HeatingStageCapacityFraction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatingStaging)">element "auc:HeatingStaging" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HotWaterBoilerMaximumFlowRate)">element "auc:HotWaterBoilerMaximumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HotWaterBoilerMinimumFlowRate)">element "auc:HotWaterBoilerMinimumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HotWaterResetControl)">element "auc:HotWaterResetControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:IgnitionType)">element "auc:IgnitionType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:InputCapacity) &gt;= 0">element "auc:InputCapacity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:NumberOfHeatingStages)">element "auc:NumberOfHeatingStages" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OutputCapacity) &gt;= 0">element "auc:OutputCapacity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Priority)">element "auc:Priority" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SteamBoilerMaximumOperatingPressure)">element "auc:SteamBoilerMaximumOperatingPressure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SteamBoilerMinimumOperatingPressure)">element "auc:SteamBoilerMinimumOperatingPressure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalEfficiency)">element "auc:ThermalEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:AnnualHeatingEfficiencyUnits">
      <sch:assert test="contains('_AFUE_ _COP_ _HSPF_ _Thermal Efficiency_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "AFUE", "COP", "HSPF", or "Thermal Efficiency"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:AnnualHeatingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:BoilerType">
      <sch:assert test="contains('_Hot water_ _Steam_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Hot water" or "Steam"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:BurnerControlType">
      <sch:assert test="contains('_Full Modulation Automatic_ _Full Modulation Manual_ _High Low_ _On Off_ _Step Modulation_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Full Modulation Automatic", "Full Modulation Manual", "High Low", "On Off", "Step Modulation", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:BurnerQuantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:BurnerYearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:CondensingOperation">
      <sch:assert test="contains('_Condensing_ _Near-Condensing_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Condensing", "Near-Condensing", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:DraftType">
      <sch:assert test="contains('_Mechanical forced_ _Natural_ _Other_ _Unknown_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Mechanical forced", "Natural", "Other", "Unknown", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:InputCapacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:OutputCapacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Boiler/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:ControlSystemType">
      <sch:assert test="not(auc:Analog)">element "auc:Analog" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Digital) &gt;= 0">element "auc:Digital" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Pneumatic) &gt;= 0">element "auc:Pneumatic" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:ControlSystemType/auc:Digital">
      <sch:assert test="not(auc:CommunicationProtocol)">element "auc:CommunicationProtocol" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating">
      <sch:assert test="count(auc:AnnualHeatingEfficiencyUnits) &gt;= 0">element "auc:AnnualHeatingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualHeatingEfficiencyValue) &gt;= 0">element "auc:AnnualHeatingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BoilerLWT)">element "auc:BoilerLWT" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DistrictHeatingType) &gt;= 0">element "auc:DistrictHeatingType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HotWaterBoilerMaximumFlowRate)">element "auc:HotWaterBoilerMaximumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OutputCapacity) &gt;= 0">element "auc:OutputCapacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:SteamBoilerMaximumOperatingPressure)">element "auc:SteamBoilerMaximumOperatingPressure" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SteamBoilerMinimumOperatingPressure)">element "auc:SteamBoilerMinimumOperatingPressure" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:AnnualHeatingEfficiencyUnits">
      <sch:assert test="contains('_AFUE_ _COP_ _HSPF_ _Thermal Efficiency_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "AFUE", "COP", "HSPF", or "Thermal Efficiency"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:AnnualHeatingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:DistrictHeatingType">
      <sch:assert test="contains('_Direct steam_ _Hot water_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Direct steam" or "Hot water"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:OutputCapacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:DistrictHeating/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:HeatingPlantCondition">
      <sch:assert test="contains('_Average_ _Excellent_ _Good_ _Poor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Excellent", "Good", or "Poor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:Location">
      <sch:assert test="contains('_Attic_ _Closet_ _Exterior_ _Garage_ _Interior_ _Mechanical Floor_ _Mechanical Room_ _Other_ _Penthouse_ _Roof_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Attic", "Closet", "Exterior", "Garage", "Interior", "Mechanical Floor", "Mechanical Room", "Other", "Penthouse", "Roof", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:PrimaryFuel">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Condition Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Condition Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Name']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Name']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Notes']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Notes']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Input Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Input Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Shared Resource Site ID']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Annual Heating Efficiency Units Is Not Applicable_ _Annual Heating Efficiency Value Is Not Applicable_ _Building Automation System Is Not Applicable_ _Burner Control Type Is Not Applicable_ _Burner Quantity Is Not Applicable_ _Burner Year Installed Is Not Applicable_ _Control System Type For Digital Is Not Applicable_ _Control System Type For Pneumatic Is Not Applicable_ _Draft Type Is Not Applicable_ _Heating Plant Condition Is Not Applicable_ _Heating Plant Name_ _Heating Plant Notes_ _Heating Plant Notes Is Not Applicable_ _Input Capacity Is Not Applicable_ _Location Is Not Applicable_ _Output Capacity Is Not Applicable_ _Quantity Is Not Applicable_ _Shared Resource Site ID_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Annual Heating Efficiency Units Is Not Applicable", "Annual Heating Efficiency Value Is Not Applicable", "Building Automation System Is Not Applicable", "Burner Control Type Is Not Applicable", "Burner Quantity Is Not Applicable", "Burner Year Installed Is Not Applicable", "Control System Type For Digital Is Not Applicable", "Control System Type For Pneumatic Is Not Applicable", "Draft Type Is Not Applicable", "Heating Plant Condition Is Not Applicable", "Heating Plant Name", "Heating Plant Notes", "Heating Plant Notes Is Not Applicable", "Input Capacity Is Not Applicable", "Location Is Not Applicable", "Output Capacity Is Not Applicable", "Quantity Is Not Applicable", "Shared Resource Site ID", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Building Automation System Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Digital Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Control System Type For Pneumatic Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Condition Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heating Plant Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Input Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[auc:Plants]/auc:Plants/auc:HeatingPlants/auc:HeatingPlant/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]">
      <sch:assert test="count(auc:HVACControlSystemTypes) &gt;= 0">element "auc:HVACControlSystemTypes" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingAndCoolingSystems) &gt;= 0">element "auc:HeatingAndCoolingSystems" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 0">element "auc:LinkedPremises" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OtherHVACSystems) &gt;= 0">element "auc:OtherHVACSystems" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Plants)">element "auc:Plants" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PrimaryHVACSystemType) &gt;= 0">element "auc:PrimaryHVACSystemType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HVACControlSystemTypes">
      <sch:assert test="count(auc:HVACControlSystemType) &gt;= 0">element "auc:HVACControlSystemType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HVACControlSystemTypes/auc:HVACControlSystemType">
      <sch:assert test="contains('_Digital_ _Pneumatic_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Digital" or "Pneumatic"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems">
      <sch:assert test="count(auc:CoolingSources) &gt;= 0">element "auc:CoolingSources" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Deliveries) &gt;= 0">element "auc:Deliveries" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingSources) &gt;= 0">element "auc:HeatingSources" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ZoningSystemType) &gt;= 0">element "auc:ZoningSystemType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyUnits) &gt;= 0">element "auc:AnnualCoolingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualCoolingEfficiencyValue) &gt;= 0">element "auc:AnnualCoolingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Capacity) &gt;= 0">element "auc:Capacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Controls) &gt;= 0">element "auc:Controls" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CoolingMedium)">element "auc:CoolingMedium" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CoolingSourceCondition) &gt;= 0">element "auc:CoolingSourceCondition" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CoolingSourceType) &gt;= 1">element "auc:CoolingSourceType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:CoolingStageCapacity)">element "auc:CoolingStageCapacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Location) &gt;= 0">element "auc:Location" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MinimumPartLoadRatio)">element "auc:MinimumPartLoadRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfDiscreteCoolingStages)">element "auc:NumberOfDiscreteCoolingStages" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RatedCoolingSensibleHeatRatio)">element "auc:RatedCoolingSensibleHeatRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:AnnualCoolingEfficiencyUnits">
      <sch:assert test="contains('_COP_ _EER_ _kW/ton_ _SEER_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "COP", "EER", "kW/ton", or "SEER"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:AnnualCoolingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Capacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls">
      <sch:assert test="count(auc:Control) &gt;= 0">element "auc:Control" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls/auc:Control">
      <sch:assert test="not(auc:AdvancedPowerStrip)">element "auc:AdvancedPowerStrip" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manual)">element "auc:Manual" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Occupancy)">element "auc:Occupancy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OtherControlTechnology) &gt;= 0">element "auc:OtherControlTechnology" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Thermostat) &gt;= 0">element "auc:Thermostat" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Timer)">element "auc:Timer" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls/auc:Control/auc:OtherControlTechnology">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlTechnologyName)">element "auc:OtherControlTechnologyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls/auc:Control/auc:OtherControlTechnology/auc:ControlStrategy">
      <sch:assert test="contains('_None_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "None"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls/auc:Control/auc:Thermostat">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Controls/auc:Control/auc:Thermostat/auc:ControlStrategy">
      <sch:assert test="contains('_Manual_ _Programmable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Manual" or "Programmable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSourceCondition">
      <sch:assert test="contains('_Average_ _Excellent_ _Good_ _Poor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Excellent", "Good", or "Poor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSourceType">
      <sch:assert test="count(auc:CoolingPlantID) &gt;= 0">element "auc:CoolingPlantID" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DX) &gt;= 0">element "auc:DX" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:EvaporativeCooler)">element "auc:EvaporativeCooler" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:NoCooling) &gt;= 0">element "auc:NoCooling" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSourceType/auc:CoolingPlantID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSourceType/auc:DX">
      <sch:assert test="not(auc:ActiveDehumidification)">element "auc:ActiveDehumidification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CompressorStaging)">element "auc:CompressorStaging" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CompressorType)">element "auc:CompressorType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CondenserPlantIDs)">element "auc:CondenserPlantIDs" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DXSystemType) &gt;= 1">element "auc:DXSystemType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Refrigerant)">element "auc:Refrigerant" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RefrigerantChargeFactor)">element "auc:RefrigerantChargeFactor" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:CoolingSourceType/auc:DX/auc:DXSystemType">
      <sch:assert test="contains('_Packaged terminal heat pump (PTHP)_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Packaged terminal heat pump (PTHP)"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Location">
      <sch:assert test="contains('_Attic_ _Closet_ _Exterior_ _Garage_ _Interior_ _Mechanical Floor_ _Mechanical Room_ _Other_ _Penthouse_ _Roof_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Attic", "Closet", "Exterior", "Garage", "Interior", "Mechanical Floor", "Mechanical Room", "Other", "Penthouse", "Roof", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:PrimaryFuel">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Condition Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Condition Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Notes']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Notes']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Annual Cooling Efficiency Units Is Not Applicable_ _Annual Cooling Efficiency Value Is Not Applicable_ _Capacity Is Not Applicable_ _Cooling Plant ID Is Not Applicable_ _Cooling Source Condition Is Not Applicable_ _Cooling Source Notes_ _Cooling Source Notes Is Not Applicable_ _Location Is Not Applicable_ _Primary Fuel Is Not Applicable_ _Quantity Is Not Applicable_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Annual Cooling Efficiency Units Is Not Applicable", "Annual Cooling Efficiency Value Is Not Applicable", "Capacity Is Not Applicable", "Cooling Plant ID Is Not Applicable", "Cooling Source Condition Is Not Applicable", "Cooling Source Notes", "Cooling Source Notes Is Not Applicable", "Location Is Not Applicable", "Primary Fuel Is Not Applicable", "Quantity Is Not Applicable", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Units Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Cooling Efficiency Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Plant ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Condition Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cooling Source Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:CoolingSources/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries">
      <sch:assert test="count(auc:Delivery) &gt;= 0">element "auc:Delivery" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]) &gt;= 0">element "auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Delivery[auc:DeliveryType/auc:Other]) &gt;= 0">element "auc:Delivery[auc:DeliveryType/auc:Other]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]) &gt;= 0">element "auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CoolingSourceID) &gt;= 0">element "auc:CoolingSourceID" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingSourceID) &gt;= 0">element "auc:HeatingSourceID" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:CoolingSourceID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery/auc:HeatingSourceID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]">
      <sch:assert test="count(auc:DeliveryType) &gt;= 1">element "auc:DeliveryType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType">
      <sch:assert test="count(auc:CentralAirDistribution) &gt;= 0">element "auc:CentralAirDistribution" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ZoneEquipment)">element "auc:ZoneEquipment" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType/auc:CentralAirDistribution">
      <sch:assert test="count(auc:AirDeliveryType) &gt;= 0">element "auc:AirDeliveryType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FanBased)">element "auc:FanBased" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ReheatControlMethod)">element "auc:ReheatControlMethod" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ReheatPlantID) &gt;= 0">element "auc:ReheatPlantID" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ReheatSource) &gt;= 0">element "auc:ReheatSource" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:TerminalUnit) &gt;= 0">element "auc:TerminalUnit" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType/auc:CentralAirDistribution/auc:AirDeliveryType">
      <sch:assert test="contains('_Central fan_ _Local fan_ _Low pressure under floor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Central fan", "Local fan", or "Low pressure under floor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType/auc:CentralAirDistribution/auc:ReheatPlantID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType/auc:CentralAirDistribution/auc:ReheatSource">
      <sch:assert test="contains('_Local electric resistance_ _Local gas_ _Heating plant_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Local electric resistance", "Local gas", or "Heating plant"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:CentralAirDistribution]/auc:DeliveryType/auc:CentralAirDistribution/auc:TerminalUnit">
      <sch:assert test="contains('_CAV terminal box no reheat_ _CAV terminal box with reheat_ _Powered induction unit_ _Uncontrolled register_ _VAV terminal box not fan powered no reheat_ _VAV terminal box not fan powered with reheat_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "CAV terminal box no reheat", "CAV terminal box with reheat", "Powered induction unit", "Uncontrolled register", "VAV terminal box not fan powered no reheat", or "VAV terminal box not fan powered with reheat"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:Other]">
      <sch:assert test="count(auc:DeliveryType) &gt;= 1">element "auc:DeliveryType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:Other]/auc:DeliveryType">
      <sch:assert test="not(auc:CentralAirDistribution)">element "auc:CentralAirDistribution" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Other) &gt;= 0">element "auc:Other" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:ZoneEquipment)">element "auc:ZoneEquipment" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]">
      <sch:assert test="count(auc:DeliveryType) &gt;= 1">element "auc:DeliveryType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType">
      <sch:assert test="not(auc:CentralAirDistribution)">element "auc:CentralAirDistribution" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ZoneEquipment) &gt;= 0">element "auc:ZoneEquipment" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment">
      <sch:assert test="count(auc:Convection) &gt;= 0">element "auc:Convection" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FanBased) &gt;= 0">element "auc:FanBased" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Other) &gt;= 0">element "auc:Other" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Radiant) &gt;= 0">element "auc:Radiant" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:Convection">
      <sch:assert test="count(auc:ConvectionType) &gt;= 1">element "auc:ConvectionType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PipeInsulationThickness)">element "auc:PipeInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PipeLocation)">element "auc:PipeLocation" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:Convection/auc:ConvectionType">
      <sch:assert test="contains('_Chilled beam_ _Other_ _Perimeter baseboard_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Chilled beam", "Other", or "Perimeter baseboard"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased">
      <sch:assert test="count(auc:FanBasedDistributionTypeType) &gt;= 0">element "auc:FanBasedDistributionTypeType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatingSupplyAirTemperature)">element "auc:HeatingSupplyAirTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatingSupplyAirTemperatureControl)">element "auc:HeatingSupplyAirTemperatureControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirResetMaximumCoolingSupplyTemperature)">element "auc:OutsideAirResetMaximumCoolingSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirResetMaximumHeatingSupplyTemperature)">element "auc:OutsideAirResetMaximumHeatingSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirResetMinimumCoolingSupplyTemperature)">element "auc:OutsideAirResetMinimumCoolingSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirResetMinimumHeatingSupplyTemperature)">element "auc:OutsideAirResetMinimumHeatingSupplyTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirTemperatureLowerLimitCoolingResetControl)">element "auc:OutsideAirTemperatureLowerLimitCoolingResetControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirTemperatureLowerLimitHeatingResetControl)">element "auc:OutsideAirTemperatureLowerLimitHeatingResetControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirTemperatureUpperLimitCoolingResetControl)">element "auc:OutsideAirTemperatureUpperLimitCoolingResetControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OutsideAirTemperatureUpperLimitHeatingResetControl)">element "auc:OutsideAirTemperatureUpperLimitHeatingResetControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:StaticPressureResetControl) &gt;= 0">element "auc:StaticPressureResetControl" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:SupplyAirTemperatureResetControl) &gt;= 0">element "auc:SupplyAirTemperatureResetControl" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased/auc:FanBasedDistributionTypeType">
      <sch:assert test="count(auc:AirSideEconomizer) &gt;= 0">element "auc:AirSideEconomizer" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CoolingSupplyAirTemperature)">element "auc:CoolingSupplyAirTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CoolingSupplyAirTemperatureControlType)">element "auc:CoolingSupplyAirTemperatureControlType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FanCoil) &gt;= 0">element "auc:FanCoil" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased/auc:FanBasedDistributionTypeType/auc:AirSideEconomizer">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AirSideEconomizerType) &gt;= 1">element "auc:AirSideEconomizerType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:EconomizerControl)">element "auc:EconomizerControl" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EconomizerDryBulbControlPoint)">element "auc:EconomizerDryBulbControlPoint" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EconomizerEnthalpyControlPoint)">element "auc:EconomizerEnthalpyControlPoint" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:EconomizerLowTemperatureLockout)">element "auc:EconomizerLowTemperatureLockout" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased/auc:FanBasedDistributionTypeType/auc:AirSideEconomizer/auc:AirSideEconomizerType">
      <sch:assert test="contains('_Dry bulb temperature_ _Enthalpy_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Dry bulb temperature" or "Enthalpy"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased/auc:FanBasedDistributionTypeType/auc:FanCoil">
      <sch:assert test="count(auc:FanCoilType) &gt;= 1">element "auc:FanCoilType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:HVACPipeConfiguration)">element "auc:HVACPipeConfiguration" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PipeInsulationThickness)">element "auc:PipeInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PipeLocation)">element "auc:PipeLocation" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:FanBased/auc:FanBasedDistributionTypeType/auc:FanCoil/auc:FanCoilType">
      <sch:assert test="contains('_Fan coil 2 pipe_ _Fan coil 4 pipe_ _Mini-split_ _Other_ _VRF terminal units_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Fan coil 2 pipe", "Fan coil 4 pipe", "Mini-split", "Other", or "VRF terminal units"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:Radiant">
      <sch:assert test="not(auc:PipeInsulationThickness)">element "auc:PipeInsulationThickness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PipeLocation)">element "auc:PipeLocation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RadiantType) &gt;= 1">element "auc:RadiantType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:DeliveryType/auc:ZoneEquipment/auc:Radiant/auc:RadiantType">
      <sch:assert test="contains('_Radiant floor or ceiling_ _Radiator_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Radiant floor or ceiling" or "Radiator"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:Deliveries/auc:Delivery[auc:DeliveryType/auc:ZoneEquipment]/auc:PrimaryFuel">
      <sch:assert test="contains('_District hot water_ _Electricity_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "District hot water", "Electricity", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:AnnualHeatingEfficiencyUnits) &gt;= 0">element "auc:AnnualHeatingEfficiencyUnits" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:AnnualHeatingEfficiencyValue) &gt;= 0">element "auc:AnnualHeatingEfficiencyValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Controls) &gt;= 0">element "auc:Controls" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatingMedium)">element "auc:HeatingMedium" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:HeatingSourceCondition) &gt;= 0">element "auc:HeatingSourceCondition" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatingSourceType) &gt;= 0">element "auc:HeatingSourceType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:HeatingStageCapacityFraction)">element "auc:HeatingStageCapacityFraction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatingStaging)">element "auc:HeatingStaging" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InputCapacity)">element "auc:InputCapacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Location) &gt;= 0">element "auc:Location" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfHeatingStages)">element "auc:NumberOfHeatingStages" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OutputCapacity) &gt;= 0">element "auc:OutputCapacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PrimaryFuel) &gt;= 0">element "auc:PrimaryFuel" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Quantity) &gt;= 0">element "auc:Quantity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:AnnualHeatingEfficiencyUnits">
      <sch:assert test="contains('_AFUE_ _COP_ _HSPF_ _Thermal Efficiency_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "AFUE", "COP", "HSPF", or "Thermal Efficiency"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:AnnualHeatingEfficiencyValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls">
      <sch:assert test="count(auc:Control) &gt;= 0">element "auc:Control" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls/auc:Control">
      <sch:assert test="not(auc:AdvancedPowerStrip)">element "auc:AdvancedPowerStrip" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manual)">element "auc:Manual" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Occupancy)">element "auc:Occupancy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OtherControlTechnology) &gt;= 0">element "auc:OtherControlTechnology" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Thermostat) &gt;= 0">element "auc:Thermostat" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Timer)">element "auc:Timer" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls/auc:Control/auc:OtherControlTechnology">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlTechnologyName)">element "auc:OtherControlTechnologyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls/auc:Control/auc:OtherControlTechnology/auc:ControlStrategy">
      <sch:assert test="contains('_None_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "None"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls/auc:Control/auc:Thermostat">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Controls/auc:Control/auc:Thermostat/auc:ControlStrategy">
      <sch:assert test="contains('_Manual_ _Programmable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Manual" or "Programmable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceCondition">
      <sch:assert test="contains('_Average_ _Excellent_ _Good_ _Poor_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Average", "Excellent", "Good", or "Poor"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType">
      <sch:assert test="count(auc:ElectricResistance) &gt;= 0">element "auc:ElectricResistance" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Furnace) &gt;= 0">element "auc:Furnace" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HeatPump) &gt;= 0">element "auc:HeatPump" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:NoHeating) &gt;= 0">element "auc:NoHeating" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SourceHeatingPlantID) &gt;= 0">element "auc:SourceHeatingPlantID" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace">
      <sch:assert test="count(auc:BurnerControlType) &gt;= 0">element "auc:BurnerControlType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:BurnerQuantity) &gt;= 0">element "auc:BurnerQuantity" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:BurnerTurndownRatio)">element "auc:BurnerTurndownRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:BurnerType)">element "auc:BurnerType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BurnerYearInstalled) &gt;= 0">element "auc:BurnerYearInstalled" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:CombustionEfficiency)">element "auc:CombustionEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:CondensingOperation) &gt;= 0">element "auc:CondensingOperation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DraftBoundary)">element "auc:DraftBoundary" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DraftType) &gt;= 0">element "auc:DraftType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:FurnaceType)">element "auc:FurnaceType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:IgnitionType)">element "auc:IgnitionType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalEfficiency)">element "auc:ThermalEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace/auc:BurnerControlType">
      <sch:assert test="contains('_Full Modulation Automatic_ _Full Modulation Manual_ _High Low_ _On Off_ _Step Modulation_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Full Modulation Automatic", "Full Modulation Manual", "High Low", "On Off", "Step Modulation", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace/auc:BurnerQuantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace/auc:BurnerYearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace/auc:CondensingOperation">
      <sch:assert test="contains('_Condensing_ _Near-Condensing_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Condensing", "Near-Condensing", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:Furnace/auc:DraftType">
      <sch:assert test="contains('_Mechanical forced_ _Natural_ _Other_ _Unknown_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Mechanical forced", "Natural", "Other", "Unknown", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:HeatPump">
      <sch:assert test="not(auc:CoolingSourceID)">element "auc:CoolingSourceID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatPumpBackupAFUE)">element "auc:HeatPumpBackupAFUE" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatPumpBackupHeatingSwitchoverTemperature)">element "auc:HeatPumpBackupHeatingSwitchoverTemperature" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatPumpBackupSystemFuel)">element "auc:HeatPumpBackupSystemFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatPumpType)">element "auc:HeatPumpType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedHeatingPlantID)">element "auc:LinkedHeatingPlantID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:HeatingSourceType/auc:SourceHeatingPlantID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Location">
      <sch:assert test="contains('_Attic_ _Closet_ _Exterior_ _Garage_ _Interior_ _Mechanical Floor_ _Mechanical Room_ _Other_ _Penthouse_ _Roof_ _Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Attic", "Closet", "Exterior", "Garage", "Interior", "Mechanical Floor", "Mechanical Room", "Other", "Penthouse", "Roof", or "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:OutputCapacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:PrimaryFuel">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:Quantity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Condition Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Condition Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Notes Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Notes Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Notes']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Notes']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Source Heating Plant ID Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Source Heating Plant ID Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Annual Heating Efficiency Units Is Not Applicable_ _Annual Heating Efficiency Value Is Not Applicable_ _Burner Control Type Is Not Applicable_ _Burner Quantity Is Not Applicable_ _Burner Year Installed Is Not Applicable_ _Draft Type Is Not Applicable_ _Heat Pump Sink Source Type_ _Heat Pump Sink Source Type Is Not Applicable_ _Heating Source Condition Is Not Applicable_ _Heating Source Notes_ _Heating Source Notes Is Not Applicable_ _Location Is Not Applicable_ _Output Capacity Is Not Applicable_ _Primary Fuel Is Not Applicable_ _Quantity Is Not Applicable_ _Source Heating Plant ID Is Not Applicable_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Annual Heating Efficiency Units Is Not Applicable", "Annual Heating Efficiency Value Is Not Applicable", "Burner Control Type Is Not Applicable", "Burner Quantity Is Not Applicable", "Burner Year Installed Is Not Applicable", "Draft Type Is Not Applicable", "Heat Pump Sink Source Type", "Heat Pump Sink Source Type Is Not Applicable", "Heating Source Condition Is Not Applicable", "Heating Source Notes", "Heating Source Notes Is Not Applicable", "Location Is Not Applicable", "Output Capacity Is Not Applicable", "Primary Fuel Is Not Applicable", "Quantity Is Not Applicable", "Source Heating Plant ID Is Not Applicable", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Units Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Annual Heating Efficiency Value Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Control Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Burner Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Draft Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heat Pump Sink Source Type']/auc:FieldValue">
      <sch:assert test="contains('_Air_ _Ground_ _Water_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Air", "Ground", or "Water"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Condition Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Heating Source Notes Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Location Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Output Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Primary Fuel Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Quantity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Source Heating Plant ID Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:HeatingSources/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:HeatingAndCoolingSystems/auc:ZoningSystemType">
      <sch:assert test="contains('_Multi zone_ _Single zone_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Multi zone" or "Single zone"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 0">element "auc:Section" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreas) &gt;= 0">element "auc:FloorAreas" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas">
      <sch:assert test="count(auc:FloorArea) &gt;= 0">element "auc:FloorArea" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea">
      <sch:assert test="not(auc:FloorAreaCustomName)">element "auc:FloorAreaCustomName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreaPercentage) &gt;= 1">element "auc:FloorAreaPercentage" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreaType) &gt;= 1">element "auc:FloorAreaType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreaValue)">element "auc:FloorAreaValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaPercentage">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaType">
      <sch:assert test="contains('_Common_ _Gross_ _Tenant_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Common", "Gross", or "Tenant"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems">
      <sch:assert test="count(auc:OtherHVACSystem) &gt;= 0">element "auc:OtherHVACSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Integration)">element "auc:Integration" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedDeliveryIDs) &gt;= 0">element "auc:LinkedDeliveryIDs" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:LinkedPremises)">element "auc:LinkedPremises" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherHVACSystemCondition)">element "auc:OtherHVACSystemCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OtherHVACType) &gt;= 0">element "auc:OtherHVACType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:LinkedDeliveryIDs">
      <sch:assert test="count(auc:LinkedDeliveryID) &gt;= 1">element "auc:LinkedDeliveryID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:LinkedDeliveryIDs/auc:LinkedDeliveryID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:OtherHVACType">
      <sch:assert test="not(auc:AirCleaner)">element "auc:AirCleaner" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Dehumidifier)">element "auc:Dehumidifier" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Humidifier)">element "auc:Humidifier" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:MechanicalVentilation) &gt;= 0">element "auc:MechanicalVentilation" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:NaturalVentilation) &gt;= 0">element "auc:NaturalVentilation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SpotExhaust)">element "auc:SpotExhaust" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:OtherHVACType/auc:MechanicalVentilation">
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:DemandControlVentilation) &gt;= 0">element "auc:DemandControlVentilation" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DutyCycle)">element "auc:DutyCycle" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MakeupAirSourceID)">element "auc:MakeupAirSourceID" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RequiredVentilationRate)">element "auc:RequiredVentilationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SystemPerformanceRatio)">element "auc:SystemPerformanceRatio" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:VentilationControlMethods)">element "auc:VentilationControlMethods" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:VentilationRate)">element "auc:VentilationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:VentilationType) &gt;= 0">element "auc:VentilationType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:VentilationZoneControl)">element "auc:VentilationZoneControl" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:OtherHVACType/auc:MechanicalVentilation/auc:VentilationType">
      <sch:assert test="contains('_Energy recovery ventilator_ _Heat recovery ventilator_ _None_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Energy recovery ventilator", "Heat recovery ventilator", or "None"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:OtherHVACSystems/auc:OtherHVACSystem/auc:OtherHVACType/auc:NaturalVentilation">
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DutyCycle)">element "auc:DutyCycle" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NaturalVentilationMethod)">element "auc:NaturalVentilationMethod" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NaturalVentilationRate)">element "auc:NaturalVentilationRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:VentilationControlMethods)">element "auc:VentilationControlMethods" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:PrimaryHVACSystemType">
      <sch:assert test="contains('_Dedicated Outdoor Air System_ _Four Pipe Fan Coil Unit_ _Ground Source Heat Pump_ _Packaged Rooftop Air Conditioner_ _Packaged Rooftop Heat Pump_ _Packaged Rooftop VAV with Electric Reheat_ _Packaged Rooftop VAV with Hot Water Reheat_ _Packaged Terminal Air Conditioner_ _Packaged Terminal Heat Pump_ _VAV with Electric Reheat_ _VAV with Hot Water Reheat_ _Ventilation Only_ _Warm Air Furnace_ _Water Loop Heat Pump_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Dedicated Outdoor Air System", "Four Pipe Fan Coil Unit", "Ground Source Heat Pump", "Packaged Rooftop Air Conditioner", "Packaged Rooftop Heat Pump", "Packaged Rooftop VAV with Electric Reheat", "Packaged Rooftop VAV with Hot Water Reheat", "Packaged Terminal Air Conditioner", "Packaged Terminal Heat Pump", "VAV with Electric Reheat", "VAV with Hot Water Reheat", "Ventilation Only", "Warm Air Furnace", or "Water Loop Heat Pump"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Central Distribution Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Central Distribution Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Demand Control Ventilation Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Demand Control Ventilation Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Central Distribution Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Central Distribution Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Central Distribution Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Central Distribution Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Distribution Equipment Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Distribution Equipment Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Distribution Equipment Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Distribution Equipment Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Static Pressure Reset Control Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Static Pressure Reset Control Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Air Temperature Reset Control Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Air Temperature Reset Control Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Terminal Unit Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Terminal Unit Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Ventilation System &gt; 5 hp']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Ventilation System &gt; 5 hp']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Ventilation Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Ventilation Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Central Distribution Type_ _Demand Control Ventilation Is Not Applicable_ _Exhaust Ventilation For Corridor_ _Exhaust Ventilation For Corridor Is Not Applicable_ _Exhaust Ventilation For Kitchen_ _Exhaust Ventilation For Kitchen Is Not Applicable_ _Exhaust Ventilation For Other_ _Exhaust Ventilation For Other Is Not Applicable_ _Exhaust Ventilation For Parking_ _Exhaust Ventilation For Parking Is Not Applicable_ _Exhaust Ventilation For Restroom_ _Exhaust Ventilation For Restroom Is Not Applicable_ _Minimum Air Flow Fraction_ _Minimum Air Flow Fraction Is Not Applicable_ _Other Central Distribution Type_ _Other Central Distribution Type Is Not Applicable_ _Other Distribution Equipment Type_ _Other Distribution Equipment Type Is Not Applicable_ _Outdoor Air Type_ _Outdoor Air Type Is Not Applicable_ _Packaged Terminal Equipment Type_ _Packaged Terminal Equipment Type Is Not Applicable_ _Static Pressure Reset Control Is Not Applicable_ _Supply Air Temperature Reset Control Is Not Applicable_ _Supply Ventilation For Common area_ _Supply Ventilation For Common area Is Not Applicable_ _Supply Ventilation For Corridor_ _Supply Ventilation For Corridor Is Not Applicable_ _Supply Ventilation For Other_ _Supply Ventilation For Other Is Not Applicable_ _Supply Ventilation For Tenant Spaces_ _Supply Ventilation For Tenant Spaces Is Not Applicable_ _Terminal Unit Is Not Applicable_ _Ventilation System &gt; 5 hp_ _Ventilation Type Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Central Distribution Type", "Demand Control Ventilation Is Not Applicable", "Exhaust Ventilation For Corridor", "Exhaust Ventilation For Corridor Is Not Applicable", "Exhaust Ventilation For Kitchen", "Exhaust Ventilation For Kitchen Is Not Applicable", "Exhaust Ventilation For Other", "Exhaust Ventilation For Other Is Not Applicable", "Exhaust Ventilation For Parking", "Exhaust Ventilation For Parking Is Not Applicable", "Exhaust Ventilation For Restroom", "Exhaust Ventilation For Restroom Is Not Applicable", "Minimum Air Flow Fraction", "Minimum Air Flow Fraction Is Not Applicable", "Other Central Distribution Type", "Other Central Distribution Type Is Not Applicable", "Other Distribution Equipment Type", "Other Distribution Equipment Type Is Not Applicable", "Outdoor Air Type", "Outdoor Air Type Is Not Applicable", "Packaged Terminal Equipment Type", "Packaged Terminal Equipment Type Is Not Applicable", "Static Pressure Reset Control Is Not Applicable", "Supply Air Temperature Reset Control Is Not Applicable", "Supply Ventilation For Common area", "Supply Ventilation For Common area Is Not Applicable", "Supply Ventilation For Corridor", "Supply Ventilation For Corridor Is Not Applicable", "Supply Ventilation For Other", "Supply Ventilation For Other Is Not Applicable", "Supply Ventilation For Tenant Spaces", "Supply Ventilation For Tenant Spaces Is Not Applicable", "Terminal Unit Is Not Applicable", "Ventilation System &gt; 5 hp", or "Ventilation Type Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Central Distribution Type']/auc:FieldValue">
      <sch:assert test="contains('_Forced Air_ _Hydronic_ _None (unitized heating/cooling)_ _One Pipe Steam_ _Other (Please Specify)_ _Refrigerant (VRF)_ _Two Pipe Steam_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Forced Air", "Hydronic", "None (unitized heating/cooling)", "One Pipe Steam", "Other (Please Specify)", "Refrigerant (VRF)", or "Two Pipe Steam"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Demand Control Ventilation Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Corridor']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Kitchen']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Other']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Parking']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Exhaust Ventilation For Restroom']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Minimum Air Flow Fraction']/auc:FieldValue">
      <sch:assert test="contains('_0.3_ _0.4_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "0.3" or "0.4"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Other Central Distribution Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Other Distribution Equipment Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Outdoor Air Type']/auc:FieldValue">
      <sch:assert test="contains('_Dedicated outdoor air system_ _None_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Dedicated outdoor air system" or "None"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Packaged Terminal Equipment Type']/auc:FieldValue">
      <sch:assert test="contains('_PTAC/PTHP_ _Through the Wall AC_ _Window AC_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "PTAC/PTHP", "Through the Wall AC", or "Window AC"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Static Pressure Reset Control Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Air Temperature Reset Control Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Common area']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Corridor']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Other']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Supply Ventilation For Tenant Spaces']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Terminal Unit Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Ventilation System &gt; 5 hp']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:HVACSystems/auc:HVACSystem[not(auc:Plants)]/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Ventilation Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems">
      <sch:assert test="count(auc:LightingSystem) &gt;= 0">element "auc:LightingSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BallastType) &gt;= 0">element "auc:BallastType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Controls) &gt;= 0">element "auc:Controls" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:DimmingCapability)">element "auc:DimmingCapability" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FixtureSpacing)">element "auc:FixtureSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:InputVoltage)">element "auc:InputVoltage" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:InstallationType) &gt;= 0">element "auc:InstallationType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:InstalledPower)">element "auc:InstalledPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LampPower) &gt;= 0">element "auc:LampPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:LampType) &gt;= 0">element "auc:LampType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:LightingDirection)">element "auc:LightingDirection" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LightingEfficacy)">element "auc:LightingEfficacy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LuminaireHeight)">element "auc:LuminaireHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfBallastsPerLuminaire)">element "auc:NumberOfBallastsPerLuminaire" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:NumberOfLampsPerBallast)">element "auc:NumberOfLampsPerBallast" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:NumberOfLampsPerLuminaire) &gt;= 0">element "auc:NumberOfLampsPerLuminaire" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:NumberOfLuminaires)">element "auc:NumberOfLuminaires" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OutsideLighting) &gt;= 0">element "auc:OutsideLighting" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PercentPremisesServed)">element "auc:PercentPremisesServed" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RatedLampLife)">element "auc:RatedLampLife" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ReflectorType)">element "auc:ReflectorType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WorkPlaneHeight)">element "auc:WorkPlaneHeight" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:BallastType">
      <sch:assert test="contains('_Electromagnetic_ _No Ballast_ _Premium Electronic_ _Standard Electronic_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Electromagnetic", "No Ballast", "Premium Electronic", or "Standard Electronic"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls">
      <sch:assert test="count(auc:Control) &gt;= 0">element "auc:Control" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control">
      <sch:assert test="count(auc:AdvancedPowerStrip) &gt;= 0">element "auc:AdvancedPowerStrip" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Daylighting) &gt;= 0">element "auc:Daylighting" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Manual) &gt;= 0">element "auc:Manual" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Occupancy) &gt;= 0">element "auc:Occupancy" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OtherControlTechnology) &gt;= 0">element "auc:OtherControlTechnology" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Timer) &gt;= 0">element "auc:Timer" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:AdvancedPowerStrip">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:AdvancedPowerStrip/auc:ControlStrategy">
      <sch:assert test="contains('_Advanced_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Advanced"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Daylighting">
      <sch:assert test="count(auc:ControlSensor) &gt;= 1">element "auc:ControlSensor" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSteps)">element "auc:ControlSteps" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ControlStrategy)">element "auc:ControlStrategy" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Daylighting/auc:ControlSensor">
      <sch:assert test="contains('_Photocell_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Photocell"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Manual">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Manual/auc:ControlStrategy">
      <sch:assert test="contains('_Manual On/Off_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Manual On/Off"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Occupancy">
      <sch:assert test="not(auc:ControlSensor)">element "auc:ControlSensor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Occupancy/auc:ControlStrategy">
      <sch:assert test="contains('_Occupancy Sensors_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Occupancy Sensors"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:OtherControlTechnology">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlTechnologyName)">element "auc:OtherControlTechnologyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:OtherControlTechnology/auc:ControlStrategy">
      <sch:assert test="contains('_EMCS_ _None_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "EMCS", "None", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Timer">
      <sch:assert test="count(auc:ControlStrategy) &gt;= 1">element "auc:ControlStrategy" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:ControlSystemType)">element "auc:ControlSystemType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherControlStrategyName)">element "auc:OtherControlStrategyName" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:Controls/auc:Control/auc:Timer/auc:ControlStrategy">
      <sch:assert test="contains('_Chronological_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Chronological"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:InstallationType">
      <sch:assert test="contains('_Plug-in_ _Recessed_ _Surface_ _Suspended_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Plug-in", "Recessed", "Surface", or "Suspended"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType">
      <sch:assert test="count(auc:CompactFluorescent) &gt;= 0">element "auc:CompactFluorescent" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Halogen) &gt;= 0">element "auc:Halogen" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HighIntensityDischarge) &gt;= 0">element "auc:HighIntensityDischarge" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HighIntensityDischarge[auc:LampLabel/text() != 'Metal Halide']) &gt;= 0">element "auc:HighIntensityDischarge[auc:LampLabel/text() != 'Metal Halide']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:HighIntensityDischarge[auc:LampLabel/text() = 'Metal Halide']) &gt;= 0">element "auc:HighIntensityDischarge[auc:LampLabel/text() = 'Metal Halide']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Incandescent) &gt;= 0">element "auc:Incandescent" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Induction)">element "auc:Induction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinearFluorescent) &gt;= 0">element "auc:LinearFluorescent" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Neon)">element "auc:Neon" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:OtherCombination)">element "auc:OtherCombination" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Photoluminescent)">element "auc:Photoluminescent" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Plasma)">element "auc:Plasma" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:SelfLuminous)">element "auc:SelfLuminous" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:SolidStateLighting) &gt;= 0">element "auc:SolidStateLighting" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:Unknown) &gt;= 0">element "auc:Unknown" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:CompactFluorescent">
      <sch:assert test="count(auc:FluorescentStartType) &gt;= 0">element "auc:FluorescentStartType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:LampLabel) &gt;= 0">element "auc:LampLabel" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:CompactFluorescent/auc:FluorescentStartType">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:CompactFluorescent/auc:LampLabel">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:Halogen">
      <sch:assert test="count(auc:LampLabel) &gt;= 0">element "auc:LampLabel" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:TransformerNeeded)">element "auc:TransformerNeeded" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:Halogen/auc:LampLabel">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:HighIntensityDischarge">
      <sch:assert test="count(auc:LampLabel) &gt;= 1">element "auc:LampLabel" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:HighIntensityDischarge/auc:LampLabel">
      <sch:assert test="contains('_Metal Halide_ _Mercury Vapor_ _Sodium Vapor High Pressure_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Metal Halide", "Mercury Vapor", or "Sodium Vapor High Pressure"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:HighIntensityDischarge[auc:LampLabel/text() != 'Metal Halide']">
      <sch:assert test="not(auc:MetalHalideStartType)">element "auc:MetalHalideStartType" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:HighIntensityDischarge[auc:LampLabel/text() = 'Metal Halide']">
      <sch:assert test="count(auc:MetalHalideStartType) &gt;= 0">element "auc:MetalHalideStartType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:HighIntensityDischarge[auc:LampLabel/text() = 'Metal Halide']/auc:MetalHalideStartType">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:Incandescent">
      <sch:assert test="count(auc:LampLabel) &gt;= 0">element "auc:LampLabel" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:Incandescent/auc:LampLabel">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:LinearFluorescent">
      <sch:assert test="count(auc:LampLabel) &gt;= 1">element "auc:LampLabel" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:lampLength) &gt;= 0">element "auc:lampLength" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:LinearFluorescent/auc:LampLabel">
      <sch:assert test="contains('_T5_ _T5HO_ _T8_ _Super T8_ _T12_ _T12HO_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "T5", "T5HO", "T8", "Super T8", "T12", or "T12HO"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:LinearFluorescent/auc:lampLength">
      <sch:assert test="contains('_Unknown_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Unknown"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:SolidStateLighting">
      <sch:assert test="count(auc:LampLabel) &gt;= 1">element "auc:LampLabel" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:TransformerNeeded)">element "auc:TransformerNeeded" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LampType/auc:SolidStateLighting/auc:LampLabel">
      <sch:assert test="contains('_LED_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "LED"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 0">element "auc:Section" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreas) &gt;= 0">element "auc:FloorAreas" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas">
      <sch:assert test="count(auc:FloorArea) &gt;= 0">element "auc:FloorArea" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea">
      <sch:assert test="not(auc:FloorAreaCustomName)">element "auc:FloorAreaCustomName" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:FloorAreaPercentage) &gt;= 0">element "auc:FloorAreaPercentage" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:FloorAreaType) &gt;= 1">element "auc:FloorAreaType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FloorAreaValue) &gt;= 0">element "auc:FloorAreaValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Story)">element "auc:Story" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaPercentage">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0) and (number() &lt;= 100)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number, MUST be greater than or equal to 0, and MUST be less than or equal to 100</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaType">
      <sch:assert test="contains('_Common_ _Gross_ _Tenant_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Common", "Gross", or "Tenant"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:LinkedPremises/auc:Section/auc:LinkedSectionID/auc:FloorAreas/auc:FloorArea/auc:FloorAreaValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:NumberOfLampsPerLuminaire">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Lighting System Name']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Lighting System Name']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Lighting System Name_ _LED Application Type_ _LED Application Type Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Lighting System Name", "LED Application Type", or "LED Application Type Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:LightingSystems/auc:LightingSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'LED Application Type']/auc:FieldValue">
      <sch:assert test="contains('_A Lamp_ _Candelabras_ _Floodlight_ _Outdoor_ _PAR_ _Replacement for Fluorescent Tube_ _Spotlight_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "A Lamp", "Candelabras", "Floodlight", "Outdoor", "PAR", "Replacement for Fluorescent Tube", or "Spotlight"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:MotorSystems">
      <sch:assert test="count(auc:MotorSystem) &gt;= 0">element "auc:MotorSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:MotorSystems/auc:MotorSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DriveEfficiency)">element "auc:DriveEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:FullLoadAmps)">element "auc:FullLoadAmps" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedSystemIDs) &gt;= 1">element "auc:LinkedSystemIDs" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorApplication)">element "auc:MotorApplication" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorBrakeHP)">element "auc:MotorBrakeHP" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:MotorEfficiency) &gt;= 0">element "auc:MotorEfficiency" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:MotorEnclosureType)">element "auc:MotorEnclosureType" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorHP)">element "auc:MotorHP" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorPoleCount)">element "auc:MotorPoleCount" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:MotorRPM)">element "auc:MotorRPM" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:MotorSystems/auc:MotorSystem/auc:LinkedSystemIDs">
      <sch:assert test="count(auc:LinkedSystemID) &gt;= 1">element "auc:LinkedSystemID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:MotorSystems/auc:MotorSystem/auc:LinkedSystemIDs/auc:LinkedSystemID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:MotorSystems/auc:MotorSystem/auc:MotorEfficiency">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems">
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystem) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystem" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]) &gt;= 0">element "auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']">
      <sch:assert test="count(auc:BackupGenerator) &gt;= 1">element "auc:BackupGenerator" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Capacity) &gt;= 0">element "auc:Capacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DemandReduction) &gt;= 0">element "auc:DemandReduction" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:EnergyConversionType) &gt;= 1">element "auc:EnergyConversionType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:BackupGenerator">
      <sch:assert test="contains('_false_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:Capacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:EnergyConversionType">
      <sch:assert test="count(auc:Generation) &gt;= 1">element "auc:Generation" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Storage)">element "auc:Storage" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:EnergyConversionType/auc:Generation">
      <sch:assert test="not(auc:ExternalPowerSupply)">element "auc:ExternalPowerSupply" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OnsiteGenerationType) &gt;= 1">element "auc:OnsiteGenerationType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType">
      <sch:assert test="count(auc:Other) &gt;= 1">element "auc:Other" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PV)">element "auc:PV" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other">
      <sch:assert test="not(auc:OtherEnergyGenerationTechnology)">element "auc:OtherEnergyGenerationTechnology" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OutputResourceType) &gt;= 0">element "auc:OutputResourceType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other/auc:OutputResourceType">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Capacity Is Not Applicable_ _Demand Reduction Is Not Applicable_ _Output Resource Type Is Not Applicable_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Capacity Is Not Applicable", "Demand Reduction Is Not Applicable", "Output Resource Type Is Not Applicable", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'false']/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']">
      <sch:assert test="count(auc:BackupGenerator) &gt;= 1">element "auc:BackupGenerator" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:Capacity) &gt;= 0">element "auc:Capacity" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CapacityUnits) &gt;= 1">element "auc:CapacityUnits" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:DemandReduction) &gt;= 0">element "auc:DemandReduction" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:EnergyConversionType) &gt;= 1">element "auc:EnergyConversionType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:YearInstalled) &gt;= 0">element "auc:YearInstalled" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:BackupGenerator">
      <sch:assert test="contains('_true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:Capacity">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:CapacityUnits">
      <sch:assert test="contains('_kBtu/hr_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "kBtu/hr"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType">
      <sch:assert test="count(auc:Generation) &gt;= 1">element "auc:Generation" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Storage)">element "auc:Storage" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType/auc:Generation">
      <sch:assert test="not(auc:ExternalPowerSupply)">element "auc:ExternalPowerSupply" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OnsiteGenerationType) &gt;= 1">element "auc:OnsiteGenerationType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType">
      <sch:assert test="count(auc:Other) &gt;= 1">element "auc:Other" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PV)">element "auc:PV" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other">
      <sch:assert test="count(auc:OtherEnergyGenerationTechnology) &gt;= 0">element "auc:OtherEnergyGenerationTechnology" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:OutputResourceType) &gt;= 0">element "auc:OutputResourceType" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other/auc:OtherEnergyGenerationTechnology">
      <sch:assert test="contains('_Anaerobic biodigester_ _Binary Cycle_ _Fuel cell_ _Gasification_ _Hydrokinetic_ _Microturbine_ _Other_ _Reciprocating engine_ _Solar parabolic trough_ _Solar power tower_ _Standby generator_ _Turbine_ _Wind_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Anaerobic biodigester", "Binary Cycle", "Fuel cell", "Gasification", "Hydrokinetic", "Microturbine", "Other", "Reciprocating engine", "Solar parabolic trough", "Solar power tower", "Standby generator", "Turbine", or "Wind"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other/auc:OutputResourceType">
      <sch:assert test="contains('_Biofuel B10_ _Biofuel B20_ _Biofuel B5_ _Diesel_ _District chilled water_ _District hot water_ _District steam_ _Dual fuel_ _Electricity_ _Electricity-Exported_ _Electricity-Onsite generated_ _Fuel oil_ _Fuel oil no 1_ _Fuel oil no 2_ _Fuel oil no 4_ _Fuel oil no 5 (heavy)_ _Fuel oil no 5 (light)_ _Fuel oil no 6_ _Gasoline_ _Kerosene_ _Liquid propane_ _Natural gas_ _Other_ _Other delivered-Exported_ _Other delivered-Onsite generated_ _Other metered-Exported_ _Other metered-Onsite generated_ _Propane_ _Thermal-Exported_ _Thermal-Onsite generated_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Biofuel B10", "Biofuel B20", "Biofuel B5", "Diesel", "District chilled water", "District hot water", "District steam", "Dual fuel", "Electricity", "Electricity-Exported", "Electricity-Onsite generated", "Fuel oil", "Fuel oil no 1", "Fuel oil no 2", "Fuel oil no 4", "Fuel oil no 5 (heavy)", "Fuel oil no 5 (light)", "Fuel oil no 6", "Gasoline", "Kerosene", "Liquid propane", "Natural gas", "Other", "Other delivered-Exported", "Other delivered-Onsite generated", "Other metered-Exported", "Other metered-Onsite generated", "Propane", "Thermal-Exported", or "Thermal-Onsite generated"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Capacity Is Not Applicable_ _Demand Reduction Is Not Applicable_ _Output Resource Type Is Not Applicable_ _Other Energy Generation Technology Is Not Applicable_ _Year Installed Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Capacity Is Not Applicable", "Demand Reduction Is Not Applicable", "Output Resource Type Is Not Applicable", "Other Energy Generation Technology Is Not Applicable", or "Year Installed Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Capacity Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Demand Reduction Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Other Energy Generation Technology Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Output Resource Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Year Installed Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[auc:BackupGenerator/text() = 'true']/auc:YearInstalled">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 1800)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 1800</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]">
      <sch:assert test="not(auc:BackupGenerator)">element "auc:BackupGenerator" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DemandReduction)">element "auc:DemandReduction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:EnergyConversionType) &gt;= 1">element "auc:EnergyConversionType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]/auc:EnergyConversionType">
      <sch:assert test="count(auc:Generation) &gt;= 1">element "auc:Generation" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Storage)">element "auc:Storage" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]/auc:EnergyConversionType/auc:Generation">
      <sch:assert test="not(auc:ExternalPowerSupply)">element "auc:ExternalPowerSupply" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OnsiteGenerationType) &gt;= 1">element "auc:OnsiteGenerationType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType">
      <sch:assert test="count(auc:Other) &gt;= 1">element "auc:Other" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PV)">element "auc:PV" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other">
      <sch:assert test="count(auc:OtherEnergyGenerationTechnology) &gt;= 1">element "auc:OtherEnergyGenerationTechnology" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:OutputResourceType)">element "auc:OutputResourceType" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:Other/auc:OtherEnergyGenerationTechnology">
      <sch:assert test="contains('_Fuel cell_ _Microturbine_ _Reciprocating engine_ _Turbine_ _Wind_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Fuel cell", "Microturbine", "Reciprocating engine", "Turbine", or "Wind"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]">
      <sch:assert test="not(auc:BackupGenerator)">element "auc:BackupGenerator" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Capacity)">element "auc:Capacity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CapacityUnits)">element "auc:CapacityUnits" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DemandReduction)">element "auc:DemandReduction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:EnergyConversionType) &gt;= 1">element "auc:EnergyConversionType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]/auc:EnergyConversionType">
      <sch:assert test="count(auc:Generation) &gt;= 1">element "auc:Generation" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Storage)">element "auc:Storage" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]/auc:EnergyConversionType/auc:Generation">
      <sch:assert test="not(auc:ExternalPowerSupply)">element "auc:ExternalPowerSupply" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:OnsiteGenerationType) &gt;= 1">element "auc:OnsiteGenerationType" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType">
      <sch:assert test="not(auc:Other)">element "auc:Other" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PV) &gt;= 1">element "auc:PV" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV">
      <sch:assert test="not(auc:PhotovoltaicModuleLength)">element "auc:PhotovoltaicModuleLength" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicModuleRatedPower)">element "auc:PhotovoltaicModuleRatedPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicModuleWidth)">element "auc:PhotovoltaicModuleWidth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemArrayAzimuth)">element "auc:PhotovoltaicSystemArrayAzimuth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemInverterEfficiency)">element "auc:PhotovoltaicSystemInverterEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PhotovoltaicSystemLocation) &gt;= 1">element "auc:PhotovoltaicSystemLocation" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemMaximumPowerOutput)">element "auc:PhotovoltaicSystemMaximumPowerOutput" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemNumberOfArrays)">element "auc:PhotovoltaicSystemNumberOfArrays" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemNumberOfModulesPerArray)">element "auc:PhotovoltaicSystemNumberOfModulesPerArray" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemRackingSystemTiltAngleMax)">element "auc:PhotovoltaicSystemRackingSystemTiltAngleMax" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PhotovoltaicSystemRackingSystemTiltAngleMin)">element "auc:PhotovoltaicSystemRackingSystemTiltAngleMin" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem[not(auc:BackupGenerator) and (count(auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV) &gt;= 1)]/auc:EnergyConversionType/auc:Generation/auc:OnsiteGenerationType/auc:PV/auc:PhotovoltaicSystemLocation">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads">
      <sch:assert test="count(auc:PlugLoad) &gt;= 0">element "auc:PlugLoad" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']) &gt;= 0">element "auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']) &gt;= 0">element "auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']) &gt;= 0">element "auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoad[auc:PlugLoadType/text() = 'Other']) &gt;= 0">element "auc:PlugLoad[auc:PlugLoadType/text() = 'Other']" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']) &gt;= 0">element "auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PlugLoadStandbyPower)">element "auc:PlugLoadStandbyPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PlugLoadType) &gt;= 0">element "auc:PlugLoadType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WeightedAverageLoad)">element "auc:WeightedAverageLoad" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad/auc:PlugLoadType">
      <sch:assert test="contains('_Broadcast Antenna_ _Kitchen Equipment_ _Miscellaneous Electric Load_ _Other_ _Signage Display_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Broadcast Antenna", "Kitchen Equipment", "Miscellaneous Electric Load", "Other", or "Signage Display"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']">
      <sch:assert test="count(PlugLoadType) &gt;= 1">element "PlugLoadType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PlugLoadNominalPower)">element "auc:PlugLoadNominalPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PlugLoadPeakPower) &gt;= 0">element "auc:PlugLoadPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/PlugLoadType">
      <sch:assert test="contains('_Broadcast Antenna_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Broadcast Antenna"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:PlugLoadPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Plug Load Peak Power Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Plug Load Peak Power Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Broadcast Antenna']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']">
      <sch:assert test="count(PlugLoadType) &gt;= 1">element "PlugLoadType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PlugLoadNominalPower)">element "auc:PlugLoadNominalPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PlugLoadPeakPower) &gt;= 0">element "auc:PlugLoadPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/PlugLoadType">
      <sch:assert test="contains('_Kitchen Equipment_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Kitchen Equipment"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:PlugLoadPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Gross Floor Area_ _Plug Load Peak Power Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Gross Floor Area" or "Plug Load Peak Power Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Gross Floor Area']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Kitchen Equipment']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']">
      <sch:assert test="count(PlugLoadType) &gt;= 1">element "PlugLoadType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:PlugLoadNominalPower) &gt;= 0">element "auc:PlugLoadNominalPower" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PlugLoadPeakPower)">element "auc:PlugLoadPeakPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/PlugLoadType">
      <sch:assert test="contains('_Miscellaneous Electric Load_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Miscellaneous Electric Load"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:LinkedPremises">
      <sch:assert test="not(auc:Building)">element "auc:Building" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 1">element "auc:Section" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Miscellaneous Electric Load']/auc:PlugLoadNominalPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']">
      <sch:assert test="count(PlugLoadType) &gt;= 1">element "PlugLoadType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PlugLoadNominalPower)">element "auc:PlugLoadNominalPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PlugLoadPeakPower) &gt;= 0">element "auc:PlugLoadPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/PlugLoadType">
      <sch:assert test="contains('_Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:PlugLoadPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Plug Load Peak Power Is Not Applicable_ _Plug Load Total Power_ _Plug Load Total Power Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Plug Load Peak Power Is Not Applicable", "Plug Load Total Power", or "Plug Load Total Power Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Other']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Total Power']/auc:FieldValue">
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']">
      <sch:assert test="count(PlugLoadType) &gt;= 1">element "PlugLoadType" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:PlugLoadNominalPower)">element "auc:PlugLoadNominalPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PlugLoadPeakPower) &gt;= 0">element "auc:PlugLoadPeakPower" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/PlugLoadType">
      <sch:assert test="contains('_Signage Display_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Signage Display"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:LinkedPremises">
      <sch:assert test="count(auc:Building) &gt;= 1">element "auc:Building" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Section)">element "auc:Section" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:LinkedPremises/auc:Building">
      <sch:assert test="count(auc:LinkedBuildingID) &gt;= 1">element "auc:LinkedBuildingID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:LinkedPremises/auc:Building/auc:LinkedBuildingID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:PlugLoadPeakPower">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Plug Load Peak Power Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Plug Load Peak Power Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PlugLoads/auc:PlugLoad[auc:PlugLoadType/text() = 'Signage Display']/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Plug Load Peak Power Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads">
      <sch:assert test="count(auc:ProcessLoad) &gt;= 0">element "auc:ProcessLoad" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']) &gt;= 0">element "auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:DutyCycle)">element "auc:DutyCycle" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:HeatGainFraction)">element "auc:HeatGainFraction" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ProcessLoadPeakPower)">element "auc:ProcessLoadPeakPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ProcessLoadStandbyPower)">element "auc:ProcessLoadStandbyPower" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ProcessLoadType) &gt;= 1">element "auc:ProcessLoadType" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad/auc:ProcessLoadType">
      <sch:assert test="contains('_Miscellaneous Gas Load_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Miscellaneous Gas Load"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']">
      <sch:assert test="count(auc:LinkedPremises) &gt;= 1">element "auc:LinkedPremises" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:WeightedAverageLoad) &gt;= 1">element "auc:WeightedAverageLoad" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:LinkedPremises">
      <sch:assert test="not(auc:Building)">element "auc:Building" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Facility)">element "auc:Facility" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:Section) &gt;= 1">element "auc:Section" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:Site)">element "auc:Site" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Space)">element "auc:Space" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThermalZone)">element "auc:ThermalZone" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:LinkedPremises/auc:Section">
      <sch:assert test="count(auc:LinkedSectionID) &gt;= 1">element "auc:LinkedSectionID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:LinkedPremises/auc:Section/auc:LinkedSectionID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
      <sch:assert test="not(auc:FloorAreas)">element "auc:FloorAreas" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:LinkedScheduleIDs)">element "auc:LinkedScheduleIDs" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:ProcessLoads/auc:ProcessLoad[auc:ProcessLoadType/text() = 'Miscellaneous Gas Load']/auc:WeightedAverageLoad">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems">
      <sch:assert test="count(auc:PumpSystem) &gt;= 0">element "auc:PumpSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Controls)">element "auc:Controls" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:LinkedSystemIDs) &gt;= 0">element "auc:LinkedSystemIDs" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Location)">element "auc:Location" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Manufacturer)">element "auc:Manufacturer" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ModelNumber)">element "auc:ModelNumber" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PrimaryFuel)">element "auc:PrimaryFuel" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpApplication)">element "auc:PumpApplication" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:PumpControlType) &gt;= 0">element "auc:PumpControlType" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:PumpEfficiency)">element "auc:PumpEfficiency" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpInstalledFlowRate)">element "auc:PumpInstalledFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpMaximumFlowRate)">element "auc:PumpMaximumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpMinimumFlowRate)">element "auc:PumpMinimumFlowRate" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpOperation)">element "auc:PumpOperation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpPowerDemand)">element "auc:PumpPowerDemand" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:PumpingConfiguration)">element "auc:PumpingConfiguration" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ThirdPartyCertification)">element "auc:ThirdPartyCertification" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearOfManufacture)">element "auc:YearOfManufacture" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:LinkedSystemIDs">
      <sch:assert test="count(auc:LinkedSystemID) &gt;= 1">element "auc:LinkedSystemID" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:LinkedSystemIDs/auc:LinkedSystemID">
      <sch:assert test="count(@IDref) &gt;= 1">element "@IDref" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:PumpControlType">
      <sch:assert test="contains('_Constant Volume_ _Variable Volume_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Constant Volume" or "Variable Volume"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Pump Control Type Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Pump Control Type Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Pump Control Type Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Pump Control Type Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:PumpSystems/auc:PumpSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Pump Control Type Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems">
      <sch:assert test="count(auc:RoofSystem) &gt;= 0">element "auc:RoofSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:BlueRoof) &gt;= 0">element "auc:BlueRoof" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:CoolRoof) &gt;= 0">element "auc:CoolRoof" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:DeckType) &gt;= 0">element "auc:DeckType" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:GreenRoof) &gt;= 0">element "auc:GreenRoof" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RadiantBarrier)">element "auc:RadiantBarrier" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofColor)">element "auc:RoofColor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofConstruction) &gt;= 0">element "auc:RoofConstruction" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofExteriorSolarAbsorptance)">element "auc:RoofExteriorSolarAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofExteriorSolarReflectanceIndex)">element "auc:RoofExteriorSolarReflectanceIndex" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofExteriorThermalAbsorptance)">element "auc:RoofExteriorThermalAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofFinish) &gt;= 0">element "auc:RoofFinish" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofFramingDepth)">element "auc:RoofFramingDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofFramingFactor)">element "auc:RoofFramingFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofFramingMaterial)">element "auc:RoofFramingMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofFramingSpacing)">element "auc:RoofFramingSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofInsulations) &gt;= 0">element "auc:RoofInsulations" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofRValue)">element "auc:RoofRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofSlope) &gt;= 0">element "auc:RoofSlope" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofUFactor)">element "auc:RoofUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:UserDefinedFields) &gt;= 0">element "auc:UserDefinedFields" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:DeckType">
      <sch:assert test="contains('_Concrete_ _Steel_ _Wood_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Concrete", "Steel", or "Wood"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofConstruction">
      <sch:assert test="contains('_Built up_ _Steel frame_ _Wood frame_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Built up", "Steel frame", or "Wood frame"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofFinish">
      <sch:assert test="contains('_Sheet metal_ _Shingles slate or tile_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Sheet metal" or "Shingles slate or tile"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofInsulations">
      <sch:assert test="count(auc:RoofInsulation) &gt;= 0">element "auc:RoofInsulation" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofInsulations/auc:RoofInsulation">
      <sch:assert test="not(auc:RoofInsulationApplication)">element "auc:RoofInsulationApplication" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofInsulationCondition)">element "auc:RoofInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofInsulationContinuity)">element "auc:RoofInsulationContinuity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:RoofInsulationMaterial)">element "auc:RoofInsulationMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:RoofInsulationRValue) &gt;= 0">element "auc:RoofInsulationRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:RoofInsulationThickness)">element "auc:RoofInsulationThickness" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofInsulations/auc:RoofInsulation/auc:RoofInsulationRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:RoofSlope">
      <sch:assert test="contains('_Flat_ _Greater than 2 to 12_ _Less than 2 to 12_ _Sloped_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Flat", "Greater than 2 to 12", "Less than 2 to 12", or "Sloped"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields">
      <sch:assert test="count(auc:UserDefinedField) &gt;= 0">element "auc:UserDefinedField" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Blue Roof Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Blue Roof Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Cool Roof Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Cool Roof Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:UserDefinedField[auc:FieldName/text() = 'Green Roof Is Not Applicable']/auc:FieldValue) &gt;= 0">element "auc:UserDefinedField[auc:FieldName/text() = 'Green Roof Is Not Applicable']/auc:FieldValue" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields/auc:UserDefinedField">
      <sch:assert test="count(auc:FieldName) &gt;= 1">element "auc:FieldName" is REQUIRED</sch:assert>
      <sch:assert test="count(auc:FieldValue) &gt;= 1">element "auc:FieldValue" is REQUIRED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields/auc:UserDefinedField/auc:FieldName">
      <sch:assert test="contains('_Blue Roof Is Not Applicable_ _Cool Roof Is Not Applicable_ _Green Roof Is Not Applicable_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Blue Roof Is Not Applicable", "Cool Roof Is Not Applicable", or "Green Roof Is Not Applicable"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Blue Roof Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Cool Roof Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:RoofSystems/auc:RoofSystem/auc:UserDefinedFields/auc:UserDefinedField[auc:FieldName/text() = 'Green Roof Is Not Applicable']/auc:FieldValue">
      <sch:assert test="contains('_false_ _true_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "false" or "true"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems">
      <sch:assert test="count(auc:WallSystem) &gt;= 0">element "auc:WallSystem" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem">
      <sch:assert test="count(@ID) &gt;= 1">element "@ID" is REQUIRED</sch:assert>
      <sch:assert test="not(@Status)">element "@Status" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:CMUFill)">element "auc:CMUFill" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorRoughness)">element "auc:ExteriorRoughness" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:ExteriorWallColor)">element "auc:ExteriorWallColor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:ExteriorWallConstruction) &gt;= 0">element "auc:ExteriorWallConstruction" is OPTIONAL</sch:assert>
      <sch:assert test="count(auc:ExteriorWallFinish) &gt;= 0">element "auc:ExteriorWallFinish" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:InteriorVisibleAbsorptance)">element "auc:InteriorVisibleAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:Quantity)">element "auc:Quantity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:UserDefinedFields)">element "auc:UserDefinedFields" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallExteriorSolarAbsorptance)">element "auc:WallExteriorSolarAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallExteriorThermalAbsorptance)">element "auc:WallExteriorThermalAbsorptance" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallFramingDepth)">element "auc:WallFramingDepth" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallFramingFactor)">element "auc:WallFramingFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallFramingMaterial)">element "auc:WallFramingMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallFramingSpacing)">element "auc:WallFramingSpacing" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WallInsulations) &gt;= 0">element "auc:WallInsulations" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WallRValue)">element "auc:WallRValue" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallUFactor)">element "auc:WallUFactor" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:YearInstalled)">element "auc:YearInstalled" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem/auc:ExteriorWallConstruction">
      <sch:assert test="contains('_Masonry_ _Steel frame_ _Wood frame_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Masonry", "Steel frame", or "Wood frame"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem/auc:ExteriorWallFinish">
      <sch:assert test="contains('_Brick_ _Metal panel_ _Other_', concat('_', text(), '_'))">text "<sch:value-of select="text()"/>": element "text()" MUST be "Brick", "Metal panel", or "Other"</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem/auc:WallInsulations">
      <sch:assert test="count(auc:WallInsulation) &gt;= 0">element "auc:WallInsulation" is OPTIONAL</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem/auc:WallInsulations/auc:WallInsulation">
      <sch:assert test="not(auc:WallInsulationApplication)">element "auc:WallInsulationApplication" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallInsulationCondition)">element "auc:WallInsulationCondition" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallInsulationContinuity)">element "auc:WallInsulationContinuity" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallInsulationLocation)">element "auc:WallInsulationLocation" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="not(auc:WallInsulationMaterial)">element "auc:WallInsulationMaterial" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="count(auc:WallInsulationRValue) &gt;= 0">element "auc:WallInsulationRValue" is OPTIONAL</sch:assert>
      <sch:assert test="not(auc:WallInsulationThickness)">element "auc:WallInsulationThickness" is NOT RECOMMENDED</sch:assert>
    </sch:rule>
    <sch:rule context="/auc:BuildingSync/auc:Facilities/auc:Facility/auc:Systems/auc:WallSystems/auc:WallSystem/auc:WallInsulations/auc:WallInsulation/auc:WallInsulationRValue">
      <sch:assert test="not(@Source)">element "@Source" is NOT RECOMMENDED</sch:assert>
      <sch:assert test="(number(text()) = text()) and (number() &gt;= 0)">text "<sch:value-of select="text()"/>": element "text()" MUST be a number and MUST be greater than or equal to 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
