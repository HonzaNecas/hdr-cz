Profile: CZ_BundleHdr
Parent: Bundle
Id: cz-bundle-hdr
Title: "Bundle (HDR CZ)"
Description: "Clinical document used to represent a Hospital Discharge Report for the scope of this guide."

* insert ImposeProfile($BundleEuHdr, 0)

* . ^short = "Hospital Discharge Report bundle"
* . ^definition = "Hospital Discharge Report bundle."
* obeys bdl-hdr-1

* identifier 1..
  * ^short = "Instance identifier"
* type = #document (exactly)
* timestamp 1..
  * ^short = "Instance identifier"
* link ..0
* entry 1..
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry ^short = "Entry resource in the Hospital Discharge Report bundle"
* entry ^definition = "An entry resource included in the Hospital Discharge Report document bundle resource."
* entry ^comment = "Must contain the HDR Composition as the first entry (only a single Composition resource instance may be included). Additional constraints are specified in the HDR Composition profile."
* entry.fullUrl 1..
* entry.search ..0
* entry.request ..0
* entry.response ..0

* entry.resource 1..
* entry contains
    composition 1..1 and
    patient 1..1 and
    allergyIntolerance 0..* and
    condition 0..* and
    device 0..* and
    deviceUseStatement 0..* and
    diagnosticReport 0..* and
    encounter 0..* and
    imagingStudy 0..* and
    immunization 0..* and
    media 0..* and
    medication 0..* and
    medicationRequest 0..* and
    medicationStatement 0..* and
    practitioner 0..* and
    practitionerRole 0..* and
    procedure 0..* and
    organization 0..* and
    observation 0..* and
    specimen 0..* and
    medicationDispense 0..* and
    medicationAdministration  0..* and
    familyMemberHistory 0..* and
    documentReference 0..* and
    flag 0..*

* entry[composition].resource only CZ_CompositionHdr
* entry[patient].resource only CZ_PatientCore
* entry[allergyIntolerance].resource only CZ_AllergyIntoleranceHdr
* entry[condition].resource only CZ_ConditionHdr
* entry[device].resource only CZ_MedicalDevice
* entry[deviceUseStatement].resource only DeviceUseStatementEuHdr
* entry[diagnosticReport].resource only $DiagnosticReport-uv-ips
* entry[encounter].resource only CZ_EncounterHdr
* entry[imagingStudy].resource only $ImagingStudy-uv-ips
* entry[immunization].resource only $Immunization-uv-ips
* entry[media].resource only Media // $Media-observation-uv-ips
* entry[medication].resource only CZ_Medication
* entry[medicationRequest].resource only CZ_MedicationRequestHdr
* entry[medicationStatement].resource only $MedicationStatement-uv-ips
* entry[medicationAdministration].resource only MedicationAdministration
* entry[medicationDispense].resource only MedicationDispense
* entry[practitioner].resource only CZ_PractitionerCore
* entry[practitionerRole].resource only CZ_PractitionerRoleCore
* entry[procedure].resource only CZ_ProcedureHdr
* entry[organization].resource only CZ_OrganizationCore
// HON TODO FIXME
//* entry[observation].resource only Reference(Observation or CZ_ObservationInfectiousContactHdr or CZ_ObservationSdohHdr or CZ_ObservationTravelHdr)
* entry[observation].resource only Observation // $Observation-results-uv-ips
* entry[specimen].resource only $Specimen-uv-ips
* entry[flag].resource only CZ_FlagHdr
* entry[familyMemberHistory].resource only FamilyMemberHistory
* entry[documentReference].resource only DocumentReference

* signature ^short = "Report Digital Signature"
  * type ^short = "Digital Signature Purposes"
  * when ^short = "When was signed"
  * who ^short = "Who signed."
  * data ^short = "Signature content"

Invariant: bdl-hdr-1
Description: "An IPS document must have no additional Composition (including Composition subclass) resources besides the first."
Severity: #error
Expression: "entry.tail().where(resource is Composition).empty()"
