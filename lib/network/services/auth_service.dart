import 'package:mobile/constants/apis_const.dart';

import '../api_client.dart';

class AuthService {


  Future signupUser(String email, String password, String firstName, String lastName)async{

    dynamic response = await ApiClient(ApisConst.signupPath).post(
      data: {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      }
    );

    return response;
  }

  Future loginUser(String email, String password)async{

    dynamic response = await ApiClient(ApisConst.loginPath).post(
      data: {
        "email": email,
        "password": password
      }
    );

    return response;
  }

}