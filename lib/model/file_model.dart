class FileModel {
  List<Files> files;
  String folderName;

  FileModel({this.files, this.folderName});

  FileModel.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = new List<Files>();
      json['files'].forEach((v) {
        files.add(new Files.fromJson(v));
      });
    }
    folderName = json['folderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.files != null) {
      data['files'] = this.files.map((v) => v.toJson()).toList();
    }
    data['folderName'] = this.folderName;
    return data;
  }
}

class Files {
  String mimeType;
  String size;
  String title;
  String path;

  Files({this.mimeType, this.size, this.title, this.path});

  Files.fromJson(Map<String, dynamic> json) {
    mimeType = json['mimeType'];
    size = json['size'];
    title = json['title'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mimeType'] = this.mimeType;
    data['size'] = this.size;
    data['title'] = this.title;
    data['path'] = this.path;
    return data;
  }
}
