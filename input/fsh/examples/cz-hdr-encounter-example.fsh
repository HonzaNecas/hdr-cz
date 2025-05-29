Instance: CZ-Encounter-HDR-Example
InstanceOf: CZ_EncounterHdr
Usage: #example
Title: "CZ-Encounter-HDR Example"
Description: "Czech HDR - example of an inpatient encounter"

// Encounter status and class
* status = #finished
* class = $v3-ActCode#IMP
* priority.coding[0].system = $v3-AdmissionUrgencyHDR
* priority.coding[0].code = #EM
* priority.coding[0].display = "Emergency"

// Encounter type and subject
* type[0].coding[0].system = $encounter-type
* type[0].coding[0].code = #DIS
* type[0].coding[0].display = "Discharge"
* subject = Reference(Mracena2)

// Note for the encounter
* extension[1].url = "http://hl7.org/fhir/StructureDefinition/encounter-note"
* extension[1].valueString = "This is a test of the encounter note field."

// Encounter period
* period.start = "2025-01-01T08:00:00+01:00"
* period.end = "2025-01-10T08:00:00+01:00"

// Reason for encounter
* reasonCode[0].coding[0].system = $icd10
* reasonCode[0].coding[0].code = #I50
* reasonCode[0].coding[0].display = "Heart failure"

// Legal status of the encounter
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/legal-reason-extension"
* extension[0].valueCodeableConcept.coding[0].system = $sct
* extension[0].valueCodeableConcept.coding[0].code = #135848002
* extension[0].valueCodeableConcept.coding[0].display = "Voluntary admission"

// Hospitalization details
* hospitalization.admitSource.coding[0].system = $admit-source
* hospitalization.admitSource.coding[0].code = #physician-referral
* hospitalization.admitSource.coding[0].display = "Physician Referral"
* hospitalization.dischargeDisposition.coding[0].system = $discharge-disposition
* hospitalization.dischargeDisposition.coding[0].code = #home
* hospitalization.dischargeDisposition.coding[0].display = "Home"

// Location details
* location[0].location = Reference(Location-2)
* location[0].period.start = "2025-01-01T08:00:00+01:00"
* location[0].period.end = "2025-01-03T08:00:00+01:00"

* location[1].location = Reference(Location-3)
* location[1].period.start = "2025-01-03T08:00:00+01:00"
* location[1].period.end = "2025-01-07T08:00:00+01:00"

* location[2].location = Reference(Location-4)
* location[2].period.start = "2025-01-07T08:00:00+01:00"
* location[2].period.end = "2025-01-10T08:00:00+01:00"

// Adminiting provider details
* serviceProvider = Reference(RegisteringProviderExample)

// Participant details
* participant[0].individual = Reference(Practitioner-2)
* participant[0].type.coding[0].system = $v3-ParticipationType
* participant[0].type.coding[0].code = #ADM
* participant[0].type.coding[0].display = "Admitter"

// Diagnosis details
* diagnosis[0].condition = Reference(CZ-Condition-HDR-Example)
* diagnosis[0].use.coding[0].system = $diagnosis-role
* diagnosis[0].use.coding[0].code = #AD
* diagnosis[0].use.coding[0].display = "Admission diagnosis"
