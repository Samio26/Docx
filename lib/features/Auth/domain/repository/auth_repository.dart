import 'dart:async';

import 'package:testt/config/core/functional_prog.dart';

abstract class AuthRepository{
 Future <EitherOf<String,String>> Login(String pass,String email);
}