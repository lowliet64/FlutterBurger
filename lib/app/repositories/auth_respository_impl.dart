
import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth_repository.dart';



class AuthRespositoryImpl implements AuthRepository{
  final RestClient _restClient;

  AuthRespositoryImpl({
    required RestClient restClient,
  }):_restClient = restClient;

  @override
  Future<UserModel> register(String name, String email,String password) async {
      final result = await _restClient.post('/auth/register/',{
        'name':name,
        "password":password,
        "email":email
      });

      if (result.hasError){
        var message = 'Erro ao registrar usuário';
        if(result.statusCode==400){
            message = result.body['error'];
        }
        log(message,error:result.statusText,stackTrace:StackTrace.current);
        throw RestClientException(message);
      }
      return login(email,password);
  }


  @override
  Future<UserModel> login(String email,String password) async{
    final result = await _restClient.post('/auth/login/',{
      "email":email,
      "password":password
    });


    if(result.hasError){
      if(result.statusCode==403){
          log('Usuário ou senha inválidos',error:result.statusText,stackTrace:StackTrace.current);
          throw UserNotFoundException();
      }
         log('Erro ao autenticar usuário ${result.statusCode}',error:result.statusText,stackTrace:StackTrace.current);
    }
    return UserModel.fromMap(result.body);
  }
}