import 'package:shop_app/user/User.dart';

class Authenticatable{

  Future<User> register( String email , String password ){}

  Future<bool> login( String email , String password ){}

  Future<bool> resetPassword( String email ){}

  Future<User> updateProfile( User user ){}

}