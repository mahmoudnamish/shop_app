import '../../../modeles/Shop_Modeles/Login_modeles.dart';

abstract class  CountStates {}

class InitialeStates extends CountStates{}

class LoadingStates extends CountStates{}
class SuccesStates extends CountStates{
 final Shopeloginmodels loginmodele;

  SuccesStates(this.loginmodele);


}
class ErrorStates extends CountStates{
  final String error;

  ErrorStates(this.error);

}
class EyeStates extends CountStates{}