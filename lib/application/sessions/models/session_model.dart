class SessionModel {
  final int? id;
  final String? meetingDate;
  final String? description;
  final String? number;
  final bool? exceptional;
  final String? sessionName;
  final AgendaStatus? agendaStatus;
  final AgendaTypes? agendaType;
  final int? count;

  SessionModel(
      {this.id,
      this.meetingDate,
      this.description,
      this.number,
      this.exceptional,
      this.sessionName,
      this.agendaStatus,
      this.agendaType,
      this.count});
}

class AgendaStatus {
  final int? id;
  final String? arabicName;
  final String? englishName;
  final int? code;
  final String? agendas;

  AgendaStatus(
      {this.id, this.arabicName, this.englishName, this.code, this.agendas});
}

class AgendaTypes {
  final int? id;
  final String? arabicName;
  final String? englishName;
  final String? code;

  AgendaTypes({this.id, this.arabicName, this.englishName, this.code});
}
