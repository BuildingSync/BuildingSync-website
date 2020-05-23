<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
<!-- Require every element of the following type to have and ID:
    Premises:
     - Facility - T
     - Site - T
     - Building - T
     - Section - T
    Systems:
     - HVACSystem - T
     - HeatingPlant - T
     - CoolingPlant - T
     - CondensorPlant - T
     - HeatingSource - T
     - CoolingSource - T
     - Delivery - T
     - OtherHVACSystem - T
     - LightingSystem - T
     - DomesticHotWaterSystem - T
     - PumpSystem - T
     - FanSystem - T
     - MotorSystem - T
     - WallSystem - T
     - RoofSystem - T
     - FenestrationSystem - T
     - ExteriorFloorSystem - T
     - FoundationSystem - T
     - CriticalITSystem - T
     - PlugLoad - T
     - ProcessLoad - T
     - ConveyanceSystem - T
     - OnsiteStorageTransmissionGenerationSystem - T
     - AirInfiltrationSystem - T
    Schedules & Measures
     - Schedule - T
     - Measure - T
    Reports:
     - Report - T
     - Scenario - T
     - ResourceUse - T
     - Qualification - T
     - Utility - T
    Contacts
     - Contact - T
    Tenants
     - Tenant
     
-->
<!--  Premises -->
  <!--  
  Facility has ID
  <severity> error
    -->
  <pattern id="id.facility">
    <rule context="auc:Facilities/auc:Facility">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.
      </assert>
    </rule>
  </pattern>
  <!--  
  Site has ID
  <severity> error
    -->
  <pattern id="id.site">
    <rule context="auc:Sites/auc:Site">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Building has ID
  <severity> error
    -->
  <pattern id="id.building">
    <rule context="auc:Buildings/auc:Building">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Site' ID='<value-of select="ancestor::auc:Site/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Section has ID
  <severity> error
    -->
  <pattern id="id.section">
    <rule context="auc:Sections/auc:Section">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Building' ID='<value-of select="ancestor::auc:Building/@ID"/>'
      </assert>
    </rule>
  </pattern>
<!--  Systems -->
  <!--  
  HVACSystem has ID
  <severity> error
    -->
  <pattern id="id.hvacSystem">
    <rule context="auc:HVACSystems/auc:HVACSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  HeatingPlant has ID
  <severity> error
    -->
  <pattern id="id.heatingPlant">
    <rule context="auc:HeatingPlants/auc:HeatingPlant">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  CoolingPlant has ID
  <severity> error
    -->
  <pattern id="id.coolingPlant">
    <rule context="auc:CoolingPlants/auc:CoolingPlant">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  CondenserPlant has ID
  <severity> error
    -->
  <pattern id="id.condenserPlant">
    <rule context="auc:CondenserPlants/auc:CondenserPlant">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  HeatingSource has ID
  <severity> error
    -->
  <pattern id="id.heatingSource">
    <rule context="auc:HeatingSources/auc:HeatingSource">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  CoolingSource has ID
  <severity> error
    -->
  <pattern id="id.coolingSource">
    <rule context="auc:CoolingSources/auc:CoolingSource">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Delivery has ID
  <severity> error
    -->
  <pattern id="id.delivery">
    <rule context="auc:Deliveries/auc:Delivery">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  OtherHVACSystem has ID
  <severity> error
    -->
  <pattern id="id.otherHVACSystem">
    <rule context="auc:OtherHVACSystems/auc:OtherHVACSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:HVACSystem' ID='<value-of select="ancestor::auc:HVACSystem/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  LightingSystem has ID
  <severity> error
    -->
  <pattern id="id.lightingSystem">
    <rule context="auc:LightingSystems/auc:LightingSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  DomesticHotWaterSystem has ID
  <severity> error
    -->
  <pattern id="id.domesticHotWaterSystem">
    <rule context="auc:DomesticHotWaterSystems/auc:DomesticHotWaterSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  PumpSystem has ID
  <severity> error
    -->
  <pattern id="id.pumpSystem">
    <rule context="auc:PumpSystems/auc:PumpSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  FanSystem has ID
  <severity> error
    -->
  <pattern id="id.fanSystem">
    <rule context="auc:FanSystems/auc:FanSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  MotorSystem has ID
  <severity> error
    -->
  <pattern id="id.motorSystem">
    <rule context="auc:MotorSystems/auc:MotorSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  WallSystem has ID
  <severity> error
    -->
  <pattern id="id.wallSystem">
    <rule context="auc:WallSystems/auc:WallSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  RoofSystem has ID
  <severity> error
    -->
  <pattern id="id.roofSystem">
    <rule context="auc:RoofSystems/auc:RoofSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  FenestrationSystem has ID
  <severity> error
    -->
  <pattern id="id.fenestrationSystem">
    <rule context="auc:FenestrationSystems/auc:FenestrationSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  ExteriorFloorSystem has ID
  <severity> error
    -->
  <pattern id="id.exteriorFloorSystem">
    <rule context="auc:ExteriorFloorSystems/auc:ExteriorFloorSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  FoundationSystem has ID
  <severity> error
    -->
  <pattern id="id.foundationSystem">
    <rule context="auc:FoundationSystems/auc:FoundationSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  CriticalITSystem has ID
  <severity> error
    -->
  <pattern id="id.criticalITSystem">
    <rule context="auc:CriticalITSystems/auc:CriticalITSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  PlugLoad has ID
  <severity> error
    -->
  <pattern id="id.plugLoad">
    <rule context="auc:PlugLoads/auc:PlugLoad">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  ProcessLoad has ID
  <severity> error
    -->
  <pattern id="id.processLoad">
    <rule context="auc:ProcessLoads/auc:ProcessLoad">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  ConveyanceSystem has ID
  <severity> error
    -->
  <pattern id="id.conveyanceSystem">
    <rule context="auc:ConveyanceSystems/auc:ConveyanceSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  OnsiteStorageTransmissionGenerationSystem has ID
  <severity> error
    -->
  <pattern id="id.onsiteStorageTransmissionGenerationSystem">
    <rule context="auc:OnsiteStorageTransmissionGenerationSystems/auc:OnsiteStorageTransmissionGenerationSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  AirInfiltrationSystem has ID
  <severity> error
    -->
  <pattern id="id.airInfiltrationSystem">
    <rule context="auc:AirInfiltrationSystems/auc:AirInfiltrationSystem">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
<!--  Schedules & Measures -->
  <!--  
  Schedule has ID
  <severity> error
    -->
  <pattern id="id.schedule">
    <rule context="auc:Schedules/auc:Schedule">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Measure has ID
  <severity> error
    -->
  <pattern id="id.measure">
    <rule context="auc:Measures/auc:Measure">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>  
<!--  Reports-->
  <!--  
  Report has ID
  <severity> error
    -->
  <pattern id="id.report">
    <rule context="auc:Reports/auc:Report">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Scenario has ID
  <severity> error
    -->
  <pattern id="id.scenario">
    <rule context="auc:Scenarios/auc:Scenario">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Report' ID='<value-of select="ancestor::auc:Report/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  ResourceUse has ID
  <severity> error
    -->
  <pattern id="id.resourceUse">
    <rule context="auc:ResourceUses/auc:ResourceUse">
      <let name="scID" value="ancestor::auc:Scenario/@ID"/>
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Scenario' ID='<value-of select="$scID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Qualification has ID
  <severity> error
    -->
  <pattern id="id.qualification">
    <rule context="auc:Qualifications/auc:Qualification">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Report' ID='<value-of select="ancestor::auc:Report/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  
  Utility has ID
  <severity> error
    -->
  <pattern id="id.utility">
    <rule context="auc:Utilities/auc:Utility">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Report' ID='<value-of select="ancestor::auc:Report/@ID"/>'
      </assert>
    </rule>
  </pattern>
<!--  Contacts -->
  <!--  
  Contact has ID
  <severity> error
    -->
  <pattern id="id.contact">
    <rule context="auc:Contacts/auc:Contact">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
  <!--  Tenants -->
  <!--  
  Tenant has ID
  <severity> error
    -->
  <pattern id="id.tenant">
    <rule context="auc:Tenants/auc:Tenant">
      <assert test="@ID">
        [ERROR] '<name/>' MUST HAVE an @ID attribute.  Refer to: 'auc:Facility' ID='<value-of select="ancestor::auc:Facility/@ID"/>'
      </assert>
    </rule>
  </pattern>
</schema>