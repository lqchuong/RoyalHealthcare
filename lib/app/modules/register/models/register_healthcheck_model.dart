class RegisterHealthCheckModel {
  final String code;
  final String created_at;
  final String created_by;
  final String order_date;
  final String status_id;
  final String updated_at;
  final String updated_by;
  final String user_id;

  const RegisterHealthCheckModel(
      {required this.code,
        required this.created_at,
        required this.created_by,
        required this.order_date,
        required this.status_id,
        required this.updated_at,
        required this.updated_by,
        required this.user_id,
    });
}

class RegisterHealthCheckDetailModel {
  final String code;
  final String created_at;
  final String created_by;
  final String exams_service_id;
  final String note;
  final String order_id;
  final String reciever_id;
  final String updated_at;
  final String updated_by;

  const RegisterHealthCheckDetailModel(
      {required this.code,
        required this.created_at,
        required this.created_by,
        required this.exams_service_id,
        required this.note,
        required this.order_id,
        required this.reciever_id,
        required this.updated_at,
        required this.updated_by,
      });
}
