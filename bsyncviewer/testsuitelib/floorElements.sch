<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="auc" uri="http://buildingsync.net/schemas/bedes-auc/2019"/>
  <!--
    For logic pertaining to FloorArea elements.
-->
  <!--
    Each FloorAreaType enumeration can occur AT MOST one time in a set of FloorArea elements.
    <severity> error
    <param> parent - an auc:FloorAreas element
-->
  <pattern abstract="true" id="fa.maxOneOfEachType">
    <rule context="$parent">
      <let name="tenant" value="count(auc:FloorArea[auc:FloorAreaType = 'Tenant'])"/>
      <let name="common" value="count(auc:FloorArea[auc:FloorAreaType = 'Common'])"/>
      <let name="gross" value="count(auc:FloorArea[auc:FloorAreaType = 'Gross'])"/>
      <let name="net" value="count(auc:FloorArea[auc:FloorAreaType = 'Net'])"/>
      <let name="finished" value="count(auc:FloorArea[auc:FloorAreaType = 'Finished'])"/>
      <let name="footprint" value="count(auc:FloorArea[auc:FloorAreaType = 'Footprint'])"/>
      <let name="rentable" value="count(auc:FloorArea[auc:FloorAreaType = 'Rentable'])"/>
      <let name="occupied" value="count(auc:FloorArea[auc:FloorAreaType = 'Occupied'])"/>
      <let name="lighted" value="count(auc:FloorArea[auc:FloorAreaType = 'Lighted'])"/>
      <let name="daylit" value="count(auc:FloorArea[auc:FloorAreaType = 'Daylit'])"/>
      <let name="heated" value="count(auc:FloorArea[auc:FloorAreaType = 'Heated'])"/>
      <let name="cooled" value="count(auc:FloorArea[auc:FloorAreaType = 'Cooled'])"/>
      <let name="conditioned" value="count(auc:FloorArea[auc:FloorAreaType = 'Conditioned'])"/>
      <let name="unconditioned" value="count(auc:FloorArea[auc:FloorAreaType = 'Unconditioned'])"/>
      <let name="semiConditioned" value="count(auc:FloorArea[auc:FloorAreaType = 'Semi-conditioned'])"/>
      <let name="heatedCooled" value="count(auc:FloorArea[auc:FloorAreaType = 'Heated and Cooled'])"/>
      <let name="heatedOnly" value="count(auc:FloorArea[auc:FloorAreaType = 'Heated only'])"/>
      <let name="cooledOnly" value="count(auc:FloorArea[auc:FloorAreaType = 'Cooled only'])"/>
      <let name="ventilated" value="count(auc:FloorArea[auc:FloorAreaType = 'Ventilated'])"/>
      <let name="enclosed" value="count(auc:FloorArea[auc:FloorAreaType = 'Enclosed'])"/>
      <let name="nonEnclosed" value="count(auc:FloorArea[auc:FloorAreaType = 'Non-Enclosed'])"/>
      <let name="open" value="count(auc:FloorArea[auc:FloorAreaType = 'Open'])"/>
      <let name="lot" value="count(auc:FloorArea[auc:FloorAreaType = 'Lot'])"/>
      <let name="custom" value="count(auc:FloorArea[auc:FloorAreaType = 'Custom'])"/>
      <assert test="1 &gt;= $tenant">
        [ERROR] element 'auc:FloorAreaType' with value 'Tenant' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $common">
        [ERROR] element 'auc:FloorAreaType' with value 'Common' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $gross">
        [ERROR] element 'auc:FloorAreaType' with value 'Gross' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $net">
        [ERROR] element 'auc:FloorAreaType' with value 'Net' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $finished">
        [ERROR] element 'auc:FloorAreaType' with value 'Finished' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $footprint">
        [ERROR] element 'auc:FloorAreaType' with value 'Footprint' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $rentable">
        [ERROR] element 'auc:FloorAreaType' with value 'Rentable' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $occupied">
        [ERROR] element 'auc:FloorAreaType' with value 'Occupied' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $lighted">
        [ERROR] element 'auc:FloorAreaType' with value 'Lighted' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $daylit">
        [ERROR] element 'auc:FloorAreaType' with value 'Daylit' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $heated">
        [ERROR] element 'auc:FloorAreaType' with value 'Heated' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $cooled">
        [ERROR] element 'auc:FloorAreaType' with value 'Cooled' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $conditioned">
        [ERROR] element 'auc:FloorAreaType' with value 'Conditioned' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $unconditioned">
        [ERROR] element 'auc:FloorAreaType' with value 'Unconditioned' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $semiConditioned">
        [ERROR] element 'auc:FloorAreaType' with value 'Semi-conditioned' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $heatedCooled">
        [ERROR] element 'auc:FloorAreaType' with value 'Heated and Cooled' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $heatedOnly">
        [ERROR] element 'auc:FloorAreaType' with value 'Heated only' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $cooledOnly">
        [ERROR] element 'auc:FloorAreaType' with value 'Cooled only' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $ventilated">
        [ERROR] element 'auc:FloorAreaType' with value 'Ventilated' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $enclosed">
        [ERROR] element 'auc:FloorAreaType' with value 'Enclosed' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $nonEnclosed">
        [ERROR] element 'auc:FloorAreaType' with value 'Non-Enclosed' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $open">
        [ERROR] element 'auc:FloorAreaType' with value 'Open' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $lot">
        [ERROR] element 'auc:FloorAreaType' with value 'Lot' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
      <assert test="1 &gt;= $custom">
        [ERROR] element 'auc:FloorAreaType' with value 'Custom' is ALLOWED NO MORE THAN ONCE for '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that the auc:FloorArea elements have the auc:FloorAreaType and auc:FloorAreaValue.
    <severity> error
    <param> parent - an auc:FloorArea element
-->
  <pattern abstract="true" id="fa.haveTypeAndValue">
    <rule context="$parent">
      <assert test="auc:FloorAreaType and auc:FloorAreaValue">
        [ERROR] elements 'auc:FloorAreaType' and 'auc:FloorAreaValue' are REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that there is exactly one auc:FloorAreaType
    <severity> error
    <param> parent - an auc:FloorAreas element
    <param> floorAreaType - one of the standardized string enumerations of the auc:FloorAreaType element
-->
  <pattern abstract="true" id="fa.oneOfType">
    <rule context="$parent">
      <assert test="count(auc:FloorArea[auc:FloorAreaType = $floorAreaType]) = 1">
        [ERROR] element 'auc:FloorAreaType' with value '<value-of select="$floorAreaType"/>' is REQUIRED EXACTLY ONCE within element 'auc:FloorArea' for '<name/>'.  Currently occurs: <value-of select="count(auc:FloorArea[auc:FloorAreaType = $floorAreaType])"/>
      </assert>
    </rule>
  </pattern>
  <!--
    Check if an auc:FloorAreaType is declared.
    <severity> error
    <param> parent - an auc:FloorAreas element
    <param> floorAreaType - one of the standardized string enumerations of the auc:FloorAreaType element
-->
  <pattern abstract="true" id="fa.noneDefinedWarn">
    <rule context="$parent">
      <assert test="count(auc:FloorArea/auc:FloorAreaType[text() = $floorAreaType]) != 0">
        [WARNING] element 'auc:FloorAreaType' with value '<value-of select="$floorAreaType"/>' is RECOMMENDED for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check mechanical floor area types add up to the gross type.  The following values are assumed if the type is not declared,
    although these types are not inserted in the BSync document:
    - Cooled only -> 0.0
    - Heated only -> 0.0
    - Heated and Cooled -> 0.0
    - Ventilated -> 0.0
    - Conditioned -> Cooled only + Heated only + Heated and Cooled + Ventilated
    - Unconditioned -> Gross - Conditioned
    <severity> error
    <param> parent - an auc:FloorAreas element
-->
  <pattern abstract="true" id="fa.mechTypeChecks">
    <rule context="$parent" role="error">
      <let name="grossAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Gross']/auc:FloorAreaValue)"/>
      <let name="grossArea" value="number(translate(string($grossAreaValue), 'NaN', '0'))"/>
      <let name="cooledOnlyAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Cooled only']/auc:FloorAreaValue)"/>
      <let name="cooledOnlyArea" value="number(translate(string($cooledOnlyAreaValue), 'NaN', '0'))"/>
      <let name="heatedOnlyAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Heated only']/auc:FloorAreaValue)"/>
      <let name="heatedOnlyArea" value="number(translate(string($heatedOnlyAreaValue), 'NaN', '0'))"/>
      <let name="heatedCooledAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Heated and Cooled']/auc:FloorAreaValue)"/>
      <let name="heatedCooledArea" value="number(translate(string($heatedCooledAreaValue), 'NaN', '0'))"/>
      <let name="ventilatedAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Ventilated']/auc:FloorAreaValue)"/>
      <let name="ventilatedArea" value="number(translate(string($ventilatedAreaValue), 'NaN', '0'))"/>

<!--      The following logic is based on Becker's method for if-else statements in XPath 1.0 -->
      <let name="conditionedAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Conditioned']/auc:FloorAreaValue)"/>
      <let name="conditionedAreaValueComputed" value="$cooledOnlyArea + $heatedOnlyArea + $heatedCooledArea + $ventilatedArea"/>
      <let name="endTextPosition1CA" value="number(not(string($conditionedAreaValue) != 'NaN')) * string-length(string($conditionedAreaValueComputed))"/>
      <let name="endTextPosition2CA" value="number(not(string($conditionedAreaValue) = 'NaN')) * string-length(string($conditionedAreaValue))"/>
      <let name="conditionedArea" value="number(concat(substring($conditionedAreaValueComputed, 1, $endTextPosition1CA),
                                                       substring($conditionedAreaValue, 1, $endTextPosition2CA)))"/>
      <let name="unconditionedAreaValue" value="number(auc:FloorArea[auc:FloorAreaType/text()='Unconditioned']/auc:FloorAreaValue)"/>
      <let name="unconditionedAreaValueComputed" value="$grossArea - $conditionedArea"/>
      <let name="endTextPosition1UCA" value="number(not(string($unconditionedAreaValue) != 'NaN')) * string-length(string($unconditionedAreaValueComputed))"/>
      <let name="endTextPosition2UCA" value="number(not(string($unconditionedAreaValue) = 'NaN')) * string-length(string($unconditionedAreaValue))"/>
      <let name="unconditionedArea" value="number(concat(substring($unconditionedAreaValueComputed, 1, $endTextPosition1UCA),
                                                         substring($unconditionedAreaValue, 1, $endTextPosition2UCA)))"/>
      <assert test="$conditionedArea &gt;= $cooledOnlyArea + $heatedOnlyArea + $heatedCooledArea + $ventilatedArea">
        [ERROR] Conditioned Floor Area (<value-of select="$conditionedArea"/>) must be greater than or equal to: Heated and Cooled (<value-of select="$heatedCooledArea"/>) + Heated only (<value-of select="$heatedOnlyArea"/>) + Cooled only (<value-of select="$cooledOnlyArea"/>) + Ventilated (<value-of select="$ventilatedArea"/>)
      </assert>
      <assert test="$grossArea &gt;= $conditionedArea + $unconditionedArea and $unconditionedArea >= 0">
        [ERROR] Gross Floor Area (<value-of select="$grossArea"/>) must be greater than or equal to: Conditioned (<value-of select="$conditionedArea"/>) + Unconditioned (<value-of select="$unconditionedArea"/>) AND Unconditioned Floor Area must be > 0
      </assert>
      <assert test="false()">
        [INFO] 'Gross' Floor Area: <value-of select="$grossArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Cooled only' Floor Area: <value-of select="$cooledOnlyArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Heated only' Floor Area: <value-of select="$heatedOnlyArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Heated and Cooled' Floor Area: <value-of select="$heatedCooledArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Ventilated' Floor Area: <value-of select="$ventilatedArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Conditioned' Floor Area: <value-of select="$conditionedArea"/>
      </assert>
      <assert test="false()">
        [INFO] 'Unconditioned' Floor Area: <value-of select="$unconditionedArea"/>
      </assert>
    </rule>
  </pattern>
  <!--
    Check that 'Heated' and 'Cooled' FloorAreaTypes are not defined.
    <severity> error
    <param> parent - an auc:FloorAreas element
-->
  <pattern abstract="true" id="fa.dontUse">
    <rule context="$parent">
      <assert test="not (auc:FloorArea/auc:FloorAreaType[text()='Heated'])">
        [ERROR] element 'auc:FloorAreaType' with value 'Heated' within element 'auc:FloorArea' SHOULD NOT BE USED for: '<name/>'
      </assert>
      <assert test="not (auc:FloorArea/auc:FloorAreaType[text()='Cooled'])">
        [ERROR] element 'auc:FloorAreaType' with value 'Cooled' within element 'auc:FloorArea' SHOULD NOT BE USED for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that at least one of the mechanical floor area types is defined.
    <severity> error
    <param> parent - an auc:FloorAreas element
-->
  <pattern abstract="true" id="fa.oneOfMechType">
    <rule context="$parent">
      <let name="conditioned" value="count(auc:FloorArea/auc:FloorAreaType[text()='Conditioned'])"/>
      <let name="heatedCooled" value="count(auc:FloorArea/auc:FloorAreaType[text()='Heated and Cooled'])"/>
      <let name="heated" value="count(auc:FloorArea/auc:FloorAreaType[text()='Heated only'])"/>
      <let name="cooled" value="count(auc:FloorArea/auc:FloorAreaType[text()='Cooled only'])"/>
      <let name="ventilated" value="count(auc:FloorArea/auc:FloorAreaType[text()='Ventilated'])"/>
      <assert test="$conditioned + $heatedCooled + $heated + $cooled + $ventilated > 0">
        [ERROR] element 'auc:FloorAreaType' with value 'Conditioned' or 'Heated and Cooled' or 'Heated only' or 'Cooled only' or 'Ventilated' is REQUIRED AT LEAST ONCE for '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that the Gross Area of the auc:Building is greater than or equal to the sum of the Gross Area from all auc:Section[auc:SectionType='Space function'] elements
    <severity> error
    <param> parent - an auc:Building
-->
  <pattern abstract="true" id="fa.buildingSectionGrossAreaChecks">
    <rule context="$parent">
      <let name="buildingGrossArea" value="number(auc:FloorAreas/auc:FloorArea[auc:FloorAreaType='Gross']/auc:FloorAreaValue)"/>
      <let name="allSpaceFunctionSectionsGrossArea" value="number(sum(//auc:Section[auc:SectionType/text()='Space function']/auc:FloorAreas/auc:FloorArea[auc:FloorAreaType='Gross']/auc:FloorAreaValue))"/>
      <assert test="$buildingGrossArea >= $allSpaceFunctionSectionsGrossArea">
        [ERROR] auc:Building Gross Floor (<value-of select="$buildingGrossArea"/>) Area MUST BE GREATER THAN OR EQUAL TO the sum of all Gross Floor areas from elements auc:Section[auc:SectionType='Space function'] (<value-of select="$allSpaceFunctionSectionsGrossArea"/>)
      </assert>
      <assert test="false()">
        [INFO] Building Gross Floor Area: <value-of select="$buildingGrossArea"/>
      </assert>
      <assert test="false()">
        [INFO] Sum of all auc:Section[auc:SectionType='Space function'] Gross Floor Area: <value-of select="$allSpaceFunctionSectionsGrossArea"/>
      </assert>
    </rule>
  </pattern>
<!--  Check that either a auc:FloorAreaValue or auc:FloorAreaPercentage is specifed, but not both
      <severity> error
      <param> parent - an auc:FloorArea element
  -->
  <pattern abstract="true" id="fa.type.valueOrPercent">
    <rule context="$parent">
      <let name="value" value="count(auc:FloorAreaValue)"/>
      <let name="percent" value="count(auc:FloorAreaPercentage)"/>
      <assert test="$value + $percent = 1">
        [ERROR] either element 'auc:FloorAreaValue' OR 'auc:FloorAreaPercentage' MUST BE SPECIFIED for: '<name/>'
      </assert>
    </rule>
  </pattern>

</schema>
