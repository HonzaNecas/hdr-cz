Instance: CZ-AdvanceDirectives-HDR-DNR
InstanceOf: Consent
Usage: #example
Title: "CZ-AdvanceDirectives-HDR Example"
Description: "Czech hdr - example od advance directive"


* dateTime = "2025-01-01T08:00:00+01:00"

* category.coding[0].system = "http://hl7.org/fhir/consent-category"
* category.coding[0].code = #dnr
* category.coding[0].display = "Do Not Resuscitate"

* scope.coding[0].system = "http://terminology.hl7.org/CodeSystem/consentscope"
* scope.coding[0].code = #adr
* scope.coding[0].display = "Advance Directive"

* text.status = #generated
* text.div = """
<div>
  <p>Podepsané prohlášení DNR</p>
  <p>Platné od 1.3.2025</p>
</div>
"""

* provision.type = #permit

* provision.code[0].coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* provision.code[0].coding[0].code = #I50
* provision.code[0].coding[0].display = "Heart failure"

* provision.code[1].coding[0].system = "http://www.orpha.net/ORDO"
* provision.code[1].coding[0].code = #ORPHA330
* provision.code[1].coding[0].display = "NYHA class IV"

* status = #active

* sourceAttachment.title = "Signed DNR statement"