class Batch {
  final String batchNumber;
  final DateTime expirationDate;
  late DateTime? dischargeDate;

  Batch(
      {required this.batchNumber,
      required this.expirationDate,
      this.dischargeDate});
}
