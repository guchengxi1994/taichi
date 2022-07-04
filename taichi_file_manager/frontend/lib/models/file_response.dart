class FileResponse {
  int? code;
  String? message;
  List<SavedFiles>? savedFiles;

  FileResponse({this.code, this.message, this.savedFiles});

  FileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['savedFiles'] != null) {
      savedFiles = <SavedFiles>[];
      json['savedFiles'].forEach((v) {
        savedFiles!.add(SavedFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (savedFiles != null) {
      data['savedFiles'] = savedFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavedFiles {
  String? name;
  String? savePath;
  int? depth;
  String? fatherPath;
  String? timestamp;
  List<String>? tags;

  SavedFiles(
      {this.name,
      this.savePath,
      this.depth,
      this.fatherPath,
      this.timestamp,
      this.tags});

  SavedFiles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    savePath = json['savePath'];
    depth = json['depth'];
    fatherPath = json['fatherPath'];
    timestamp = json['timestamp'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['savePath'] = savePath;
    data['depth'] = depth;
    data['fatherPath'] = fatherPath;
    data['timestamp'] = timestamp;
    data['tags'] = tags;
    return data;
  }
}
