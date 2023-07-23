import 'package:mobile/constants/apis_const.dart';
import 'package:mobile/db/local_db.dart';
import 'package:mobile/network/api_client.dart';


class CommonService {

  Future getTemplates()async{
    var response = await ApiClient(ApisConst.getTemplatesPath).gets();
    return response;
  }

  Future getToken()async{
    var response = await ApiClient(ApisConst.accessTokenPath).post(
      data: {
        "refreshToken": LocalDB.getRefreshToken()
      }
    );
    return response;
  }

}