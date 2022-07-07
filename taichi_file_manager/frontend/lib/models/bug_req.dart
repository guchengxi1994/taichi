class BugReq {
  String? bugSummary;
  String? bugContent;

  BugReq({this.bugSummary, this.bugContent});

  BugReq.fromJson(Map<String, dynamic> json) {
    bugSummary = json['bugSummary'];
    bugContent = json['bugContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bugSummary'] = bugSummary;
    data['bugContent'] = bugContent;
    return data;
  }
}
