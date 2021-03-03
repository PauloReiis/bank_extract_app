import 'package:bank_extract_app/model/dto/login_dto.dart';
import 'package:bank_extract_app/ui/login/store/login_store.dart';
import 'package:bank_extract_app/ui/login/veiwmodel/login_viewmodel.dart';
import 'package:bank_extract_app/util/constant/constant_image.dart';
import 'package:bank_extract_app/util/constant/constant_mensagen.dart';
import 'package:bank_extract_app/util/constant/constant_route.dart';
import 'package:bank_extract_app/util/constant/constant_string.dart';
import 'package:bank_extract_app/util/dialog_util.dart';
import 'package:bank_extract_app/util/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// **Conceito:** Tela de Login
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginViewModel _loginViewModel = LoginViewModel();
  final LoginDTO _logindto = LoginDTO();
  final LoginStore _loginController = LoginStore();

  /// **Conceito:** Montando a tela de login
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(WidgetUtil.widthPercentage(context, 5.0)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    insertImage(context),
                    SizedBox(height: WidgetUtil.widthPercentage(context, 3.0)),
                    Observer(builder: (_) {
                      return user(context, enable: !_loginController.busy);
                    }),
                    SizedBox(height: WidgetUtil.widthPercentage(context, 3.0)),
                    Observer(builder: (_) {
                      return password(context, enable: !_loginController.busy);
                    }),
                    SizedBox(height: WidgetUtil.widthPercentage(context, 3.0)),
                    Observer(
                      builder: (_) {
                        if (_loginController.busy) {
                          return circularProgress(context);
                        } else {
                          return buttonAccess(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  /// **Conceito:** Montando botão para realizar login
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  Container buttonAccess(BuildContext context) {
    return Container(
      height: WidgetUtil.widthPercentage(context, 13.0),
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          validateFields(context);
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffa71afd),
                Color(0xff726de1),
                Color(0xff1afea5),
              ],
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints:
                BoxConstraints(maxWidth: double.infinity, minHeight: 50),
            child: Text(
              ConstantString.enter,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  /// **Conceito:** Montando Circulo de Progresso
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  Center circularProgress(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).backgroundColor),
      ),
    );
  }

  /// **Conceito:** Montando Icone
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  Image insertImage(BuildContext context) {
    return Image.asset(
      ConstantImage.imageLogo,
      fit: BoxFit.contain,
      height: WidgetUtil.heightPercentage(context, 30.0),
      alignment: Alignment.center,
    );
  }

  /// **Conceito:** Montando campo para inserir usuário
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  TextFormField user(BuildContext context, {bool enable = true}) {
    return TextFormField(
      style: TextStyle(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      enabled: enable,
      //autofocus: true,
      decoration: decoracaoBorda(context, title: ConstantString.user),
      //Validando valor digitado
      validator: (value) {
        if (value.isEmpty) {
          debugPrint("Usuário invalido");
          return ConstantMenssage.invalidUser;
        } else {
          debugPrint("Usuário: $value");
          return null;
        }
      },
      //Salvando valor digitado
      onSaved: (value) {
        _logindto.userName = value;
      },
    );
  }

  /// **Conceito:** Montando campo para inserir senha
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  TextFormField password(BuildContext context, {bool enable}) {
    return TextFormField(
      style: TextStyle(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      enabled: enable,
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration: decoracaoBorda(context, title: ConstantString.password),
      validator: (value) {
        if (value.isEmpty) {
          debugPrint("Senha invalido");
          return ConstantMenssage.invalidPessword;
        } else {
          debugPrint("Senha: *******");
          return null;
        }
      },
      onSaved: (value) {
        _logindto.userPassword = value;
      },
    );
  }

  /// **Conceito:** Inserindo decoração da borda
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  InputDecoration decoracaoBorda(BuildContext context,
      {String title = "", String subTitle = ""}) {
    return InputDecoration(
      //Texto do titulo
      labelText: title,
      labelStyle: TextStyle(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),

      //Texto de sombra (placeHouder)
      hintText: subTitle,
      hintStyle: TextStyle(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),

      //Cor da borda sem foco
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),

      //Cor da borda quando o campo esta desabilitado
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),

      //Cor da borda quando esta com foco
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),

      //Cor da borda quando esta com erro e sem foco
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).errorColor)),

      //Cord da borda quando esta com erro e com foco
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).errorColor)),

      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
    );
  }

  /// **Conceito:** Validando campos de usuário, senha e abre a home.
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  void validateFields(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _loginController.changeState();
      _formKey.currentState.save();
      //Inicia o envio da solicitação de acesso
      try {
        bool isAutorization = await _loginViewModel.toDoLogin(_logindto);
        if (isAutorization) {
          Navigator.of(context).pushReplacementNamed(ConstantRoute.homeRota);
        }
      } catch (e) {
        DialogUtil.mountDialog(
            context: context,
            title: ConstantString.attention,
            msg: e.toString(),
            textButton: "OK");
        _loginController.changeState();
      }
    }
  }
}
