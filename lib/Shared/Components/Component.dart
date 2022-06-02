
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Network/local/Cach_Helper.dart';
import '../../modules/LoginScreen/Login_Screen.dart';

Widget DefultTextFormField({
  required String text,
  required IconData prefux,
  required TextInputType type,
  required TextEditingController controle,
  required Function valaditor,
  Function? oncange,
  Function ?onsubmitted,
  Function ?suficepress,
  IconData ?sufex,
  bool textScure = false,
}) =>
    TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          labelText: text,
          prefixIcon: Icon(prefux, color: Colors.grey),
          suffixIcon: sufex != null
              ? IconButton(
                  onPressed: (){suficepress!();}, icon: Icon(sufex, color: Colors.grey))
              : null,
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(

                color: Colors.orangeAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
              borderRadius: BorderRadius.circular(20))),
      keyboardType: type,
      controller: controle,
      onChanged: (s){oncange!(s);},
      onFieldSubmitted: (s){onsubmitted!(s);},
      obscureText: textScure,
      validator: (s){valaditor(s);},
    );

Widget DefultBottom({
  required double width,
  required Color background,
  required Function onpresse,
  required String text,
  bool isUpperCase = true,
}) => Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: (){onpresse();},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );

Widget DefultTextButtom({
  required Function function,
  required String text,
}) =>
    TextButton(
        onPressed: (){function();},
        child: Text(
          text,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ));

void Showtoast({required String masage,
                required tostestate state}) =>
             Fluttertoast.showToast(
      msg: masage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: colorstste(state),
      textColor: Colors.black54,
      fontSize: 16.0,
    );

//كلة دة علشان لما تتبعت قيمة يحدد لون الرسالة قصة
enum tostestate { success, error, warning }
Color? color;
Color ?colorstste(tostestate state) {
  switch (state) {
    case tostestate.success:
      color = Colors.green;
      break;
    case tostestate.error:
      color = Colors.red;
      break;
    case tostestate.warning:
      color = Colors.amber;
      break;

  }
  return color;
}

void SignOut (context) {
  CachHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => true);
    }
  });
}
