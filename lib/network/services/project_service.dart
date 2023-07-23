import 'package:mobile/constants/apis_const.dart';
import 'package:mobile/network/api_client.dart';


class ProjectService {

  Future createProject({
    required String projectName,
    required String name,
    required String tone,
    required String toolKey,
    required String description,
    required bool fromTemplate,
    required String templateId
  })async{
    var response = await ApiClient(ApisConst.project).post(
      data: {
        "projectName": projectName,
        "name": name,
        "tone": tone,
        "toolKey": toolKey,
        "description": description,
        "fromTemplate": fromTemplate,
        "templateId": templateId
      }
    );
    return response;
  }

  Future getProject(String projectId)async{
    var response = await ApiClient(ApisConst.project).gets(
      query: {
        "id": projectId
      }
    );
    return response;
  }

  Future getAllProjects()async{
    var response = await ApiClient(ApisConst.projectList).gets();
    return response;
  }

  Future renameProject({required String projectId,required String projectName})async{
    var response = await ApiClient(ApisConst.project).put(
      data: {
        "name": projectName
      },
      query: {
        "id": projectId
      }
    );
    return response;
  }

  Future deleteProject(String projectId)async{
    var response = await ApiClient(ApisConst.project).delete(query: {
      "id": projectId
    });
    return response;
  }

}