import 'package:mobile/constants/apis_const.dart';
import 'package:mobile/network/api_client.dart';


class ContentService {

  Future createContent({
    required String projectId,
    required String originalText,
    required String text,
    required String toolKey
  })async{
    var response = await ApiClient(ApisConst.content).post(
      data: {
        "text": text,
        "originalText": originalText,
        "projectId": projectId,
        "toolKey": toolKey
      }
    );
    return response;
  }

  Future getContent(String contentId)async{
    var response = await ApiClient(ApisConst.content).gets(
      query: {
        "id": contentId
      }
    );
    return response;
  }

  Future getAllContents(String projectId)async{
    var response = await ApiClient(ApisConst.contentList).gets(
      query: {
        "projectId": projectId
      }
    );
    return response;
  }

  Future updateContent({required String contentId,required String text})async{
    var response = await ApiClient(ApisConst.content).put(
      data: {
        "text": text
      },
      query: {
        "id": contentId
      }
    );
    return response;
  }

  Future deleteContent(String contentId)async{
    var response = await ApiClient(ApisConst.content).delete(query: {
      "id": contentId
    });
    return response;
  }

}