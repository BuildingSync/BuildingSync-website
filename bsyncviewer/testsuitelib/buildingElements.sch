<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--  For logic pertaining to a Building element. -->
  <!--    Required elements for L000 at the building level -->
  <pattern id="be.L000BuildingInfo">
    <rule context="auc:Buildings/auc:Building">
      <assert test="auc:PremisesName">
        [ERROR] element 'auc:PremisesName' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:BuildingClassification">
        [ERROR] element 'auc:BuildingClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:OccupancyClassification">
        [ERROR] element 'auc:OccupancyClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:YearOfConstruction">
        [ERROR] element 'auc:YearOfConstruction' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check the main details for the Building element as required by 211.
-->
  <pattern id="be.mainDetails">
    <rule context="auc:Buildings/auc:Building">
      <assert test="auc:PremisesName">
        [ERROR] element 'auc:PremisesName' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:BuildingClassification">
        [ERROR] element 'auc:BuildingClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:OccupancyClassification">
        [ERROR] element 'auc:OccupancyClassification' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:YearOfConstruction">
        [ERROR] element 'auc:YearOfConstruction' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:BuildingAutomationSystem">
        [ERROR] element 'auc:BuildingAutomationSystem' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:HistoricalLandmark">
        [ERROR] element 'auc:HistoricalLandmark' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:PercentOccupiedByOwner">
        [ERROR] element 'auc:PercentOccupiedByOwner' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:PercentLeasedByOwner">
        [ERROR] element 'auc:PercentLeasedByOwner' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:ConditionedFloorsAboveGrade">
        [ERROR] element 'auc:ConditionedFloorsAboveGrade' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:ConditionedFloorsBelowGrade">
        [ERROR] element 'auc:ConditionedFloorsBelowGrade' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:FloorsAboveGrade or auc:UnconditionedFloorsAboveGrade">
        [ERROR] element 'auc:FloorsAboveGrade' or 'auc:UnconditionedFloorsAboveGrade' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:FloorsBelowGrade or auc:UnconditionedFloorsBelowGrade">
        [ERROR] element 'auc:FloorsBelowGrade' or 'auc:UnconditionedFloorsBelowGrade' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:YearOfLastEnergyAudit">
        [WARNING] element 'auc:YearOfLastEnergyAudit' is RECOMMENDED for: '<name/>'
      </assert>
      <assert test="auc:RetrocommissioningDate">
        [WARNING] element 'auc:RetrocommissioningDate' is RECOMMENDED for: '<name/>'
      </assert>
      <assert test="auc:YearOfLastMajorRemodel">
        [WARNING] element 'auc:YearOfLastMajorRemodel' is RECOMMENDED for: '<name/>'
      </assert>
      <!--      <assert test="if (auc:ConditionedFloorsAboveGrade and auc:FloorsAboveGrade and auc:UnconditionedFloorsAboveGrade) then (auc:FloorsAboveGrade = auc:ConditionedFloorsAboveGrade + auc:UnconditionedFloorsAboveGrade) else (true())">
        The following statement must be true: auc:FloorsAboveGrade = auc:ConditionedFloorsAboveGrade + auc:UnconditionedFloorsAboveGrade
      </assert>-->
      <!--      <assert test="if (auc:ConditionedFloorsBelowGrade and auc:FloorsBelowGrade and auc:UnconditionedFloorsBelowGrade) then (auc:FloorsBelowGrade = auc:ConditionedFloorsBelowGrade + auc:UnconditionedFloorsBelowGrade) else (true())">
        The following statement must be true: auc:FloorsBelowGrade = auc:ConditionedFloorsBelowGrade + auc:UnconditionedFloorsBelowGrade
      </assert>-->
    </rule>
  </pattern>
  <!--
    Check the simple location details for the Building element as required by 211.
    This function doesn't handle complex address types, i.e auc:StreetAddressDetail/auc:Complex
    <severity> error
-->
  <pattern id="be.simpleLocationDetails">
    <rule context="auc:Buildings/auc:Building">
      <assert test="auc:Address/auc:City">
        [ERROR] element 'auc:City' within element 'auc:Address' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:Address/auc:State">
        [ERROR] element 'auc:State' within element 'auc:Address' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:Address/auc:PostalCode">
        [ERROR] element 'auc:PostalCode' within element 'auc:Address' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="auc:Address/auc:StreetAddressDetail/auc:Simplified/auc:StreetAddress">
        [ERROR] element 'auc:StreetAddress' within element 'auc:Address/auc:StreetAddressDetail/auc:Simplified' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
</schema>
