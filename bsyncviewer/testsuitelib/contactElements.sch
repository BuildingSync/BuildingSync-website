<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <!--
    For logic pertaining to Contact elements.  Parent passed should be an auc:Contact.
-->
  <!--
    Check that the name, email, and phone number are specified for contacts.
    <severity> error
    <param> parent - an auc:Contact element
-->
  <pattern abstract="true" id="con.nameEmailPhone">
    <rule context="$parent">
      <assert test="auc:ContactName">
        [ERROR] element 'auc:ContactName' is REQUIRED EXACTLY ONCE for: '<name/>'
      </assert>
      <assert test="count(auc:ContactEmailAddresses//auc:EmailAddress[text()]) &gt;= 1">
        [ERROR] element 'auc:EmailAddress' within element 'auc:ContactEmailAddresses/auc:ContactEmailAddress' is REQUIRED AT LEAST ONCE for: '<name/>'
      </assert>
      <assert test="count(auc:ContactTelephoneNumbers//auc:TelephoneNumber[text()]) &gt;= 1">
        [ERROR] element 'auc:TelephoneNumber' within element 'auc:ContactTelephoneNumbers/auc:ContactTelephoneNumber' is REQUIRED AT LEAST ONCE for: '<name/>'
      </assert>
    </rule>
  </pattern>
  <!--
    Check that there are atleast two auc:Contact elements within an auc:Facility,
    and that there is atleast one Energy Auditor and one Owner.
    <severity> error
    <param> parent - an auc:Facility/auc:Contacts element
-->
  <pattern abstract="true" id="con.atleastOneAuditorAndOneOwner">
    <rule context="$parent">
      <let name="numContacts" value="count(auc:Contact)"/>
      <let name="numAuditors" value="count(auc:Contact/auc:ContactRoles/auc:ContactRole[text()='Energy Auditor'])"/>
      <let name="numOwners" value="count(auc:Contact/auc:ContactRoles/auc:ContactRole[text()='Owner'])"/>
      <assert test="$numContacts &gt;= 2">
        [ERROR] element 'auc:Contact' is REQUIRED AT LEAST TWICE for: '<name/>’. Current number of occurrences: <value-of select="$numContacts"/>
      </assert>
      <assert test="$numAuditors &gt;= 1">
        [ERROR] element 'auc:Contact' with child element 'auc:ContactRoles/auc:ContactRole' with value 'Energy Auditor' is REQUIRED AT LEAST ONCE for: '<name/>’. Current number of occurrences: <value-of select="$numAuditors"/>
      </assert>
      <assert test="$numOwners &gt;= 1">
        [ERROR] element 'auc:Contact' with child element 'auc:ContactRoles/auc:ContactRole' with value 'Owner' is REQUIRED AT LEAST ONCE for: '<name/>’. Current number of occurrences: <value-of select="$numOwners"/>
      </assert>
    </rule>
  </pattern>
  <!--
    Check that there are atleast two auc:Contact elements within an auc:Facility,
    and that there is atleast one Energy Auditor and one Owner.
    <severity> error
    <param> parent - an auc:Facility/auc:Contacts/auc:Contact element
-->
  <pattern abstract="true" id="con.notAuditorAndOwner">
    <rule context="$parent">
      <let name="numAuditors" value="count(auc:ContactRoles/auc:ContactRole[text()='Energy Auditor'])"/>
      <let name="numOwners" value="count(auc:ContactRoles/auc:ContactRole[text()='Owner'])"/>
      <assert test="$numOwners * $numAuditors = 0">
        [ERROR] element 'auc:ContactRole' MUST NOT HAVE values 'Energy Auditor' and 'Owner' within 'auc:ContactRoles' for: '<name/>'
      </assert>
    </rule>
  </pattern>
</schema>
