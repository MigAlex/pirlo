import 'package:flutter/cupertino.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';

class AuthProvider extends InheritedWidget{
  AuthProvider({@required this.auth, @required this.child});
  final AuthBase auth;
  final Widget child;
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AuthBase of(BuildContext context){
    AuthProvider provider = context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider.auth;
  }

}