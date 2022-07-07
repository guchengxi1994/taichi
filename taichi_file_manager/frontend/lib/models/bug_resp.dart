class BugResp {
  int? code;
  String? message;
  List<Bugs>? bugs;

  BugResp({this.code, this.message, this.bugs});

  BugResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['bugs'] != null) {
      bugs = <Bugs>[];
      json['bugs'].forEach((v) {
        bugs!.add(Bugs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (bugs != null) {
      data['bugs'] = bugs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bugs {
  String? bugContent;
  int? bugFixed;
  int? bugId;
  String? bugReportedTime;
  String? bugSummary;

  Bugs(
      {this.bugContent,
      this.bugFixed,
      this.bugId,
      this.bugReportedTime,
      this.bugSummary});

  Bugs.fromJson(Map<String, dynamic> json) {
    bugContent = json['bugContent'];
    bugFixed = json['bugFixed'];
    bugId = json['bugId'];
    bugReportedTime = json['bugReportedTime'];
    bugSummary = json['bugSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bugContent'] = bugContent;
    data['bugFixed'] = bugFixed;
    data['bugId'] = bugId;
    data['bugReportedTime'] = bugReportedTime;
    data['bugSummary'] = bugSummary;
    return data;
  }
}
