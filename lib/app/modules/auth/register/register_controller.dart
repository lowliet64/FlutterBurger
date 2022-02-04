import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin{


  final AuthRepository _authRepository;
  final loading = false.obs;

  RegisterController({required AuthRepository authRepository}):_authRepository=authRepository;

  @override
  void onInit(){
    loaderListener(loading);
    super.onInit();
  }

  void qualquer()async{
    loading.toggle();
    Future.delayed(const Duration(seconds:4),()=>{loading.toggle()
    
    });
  }
}