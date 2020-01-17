class Prescription {
  final String id;
  final Map<String, String> name;
  final List<String> symptoms;
  final List<String> diagnosis;
  final List<String> prescriptions;
  final List<String> advice;

  Prescription({
    this.id,
    this.name,
    this.advice,
    this.diagnosis,
    this.prescriptions,
    this.symptoms,
  });
}
