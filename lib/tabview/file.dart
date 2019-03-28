import 'package:flutter/material.dart';
import 'package:flutter_gallery/model/file_model.dart';
import 'dart:convert';
import 'package:storage_path/storage_path.dart';

class File extends StatefulWidget {
  @override
  _FileState createState() => _FileState();
}

class _FileState extends State<File> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoragePath.filePath,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> list = json.decode(snapshot.data);
          return Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                FileModel fileModel = FileModel.fromJson(list[index]);
                return Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Center(
                        child: _getFileTye(fileModel.files[0].mimeType),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.7),
                        height: 30,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            fileModel.folderName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Regular'),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _getFileTye(String fileType) {
    switch (fileType) {
      case 'application/pdf':
        return Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
          size: 68,
        );
        break;

      default:
        return Icon(
          Icons.image,
          color: Colors.blue,
          size: 68,
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
