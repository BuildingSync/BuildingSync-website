<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--
    For logic that pertains to Occupancy
-->
  <!--
    Check that both the auc:TypicalOccupantUsageValue and auc:TypicalOccupantUsageUnits are specified.
    <severity> error
    <param> parent - an auc:TypicalOccupantUsage element
-->
  <pattern abstract="true" id="occ.typUsage.haveUnitsAndValue">
    <rule context="$parent">
      <assert test="auc:TypicalOccupantUsageUnits/text() and auc:TypicalOccupantUsageValue/text()">
        [ERROR] elements 'auc:TypicalOccupantUsageValue' and 'auc:TypicalOccupantUsageUnits' are REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that, within an auc:TypicalOccupantUsages element, there is exactly one auc:TypicalOccupantUsage element
    with the auc:TypicalOccupantUsageUnits = $typUsageUnits passed in as a parameter.
    <severity> error
    <param> parent - an auc:TypicalOccupantUsages element
    <param> typUsageUnits - one of the standard enums for auc:TypicalOccupantUsageUnits, such as 'Hours per week'
-->
  <pattern abstract="true" id="occ.oneOfType.typicalUsageUnits">
    <rule context="$parent">
      <assert test="count(auc:TypicalOccupantUsage/auc:TypicalOccupantUsageUnits[text()=$typUsageUnits]) = 1">
        [ERROR] element 'auc:TypicalOccupantUsage' with child element 'auc:TypicalOccupantUsageUnits' having value '<value-of select="$typUsageUnits"/>' is REQUIRED EXACTLY ONCE for '<name/>'. Current number of occurrences: <value-of select="count(auc:TypicalOccupantUsage/auc:TypicalOccupantUsageUnits[text()=$typUsageUnits])"/>
      </assert>
    </rule>
  </pattern>
  <!--
    Check that all auc:OccupancyLevel elements have the auc:OccupantQuantityType and auc:OccupantQuantity child elements defined.
    <severity> error
    <param> parent - an auc:OccupancyLevel element
-->
  <pattern abstract="true" id="occ.levels.haveQuantityAndType">
    <rule context="$parent">
      <assert test="auc:OccupantQuantityType/text() and auc:OccupantQuantity/text()">
        [ERROR] elements 'auc:OccupancyQuantityType' and 'auc:OccupantQuantity' are REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that, within an auc:OccupancyLevels element, there is exactly one auc:OccupancyLevel element
    with the auc:OccupantQuantityType = $occLevelType passed in as a parameter
    <severity> error
    <param> parent - an auc:OccupancyLevels element
    <param> occLevelType - one of the standard enum values for auc:OccupancyQuantityType, such as 'Peak total occupants'
-->
  <pattern abstract="true" id="occ.levels.oneOfType">
    <rule context="$parent">
      <assert test="count(auc:OccupancyLevel/auc:OccupantQuantityType[text()=$occLevelType]) = 1">
        [ERROR] element 'auc:OccupancyLevel' with child element 'auc:OccupantQuantityType' having value '<value-of select="$occLevelType"/>' is REQUIRED EXACTLY ONCE for '<name/>'. Current number of occurrences: <value-of select="count(auc:OccupancyLevel/auc:OccupantQuantityType[text()=$occLevelType])"/>
      </assert>
    </rule>
  </pattern>
</schema>
