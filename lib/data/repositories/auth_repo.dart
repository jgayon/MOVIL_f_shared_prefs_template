import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repo.dart';
import '../datasources/i_local_auth_source.dart';

class AuthRepo implements IAuthRepo {
  final ILocalAuthSource localAuthSource;

  AuthRepo(this.localAuthSource);

  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail
    try {
      return await localAuthSource.getUserFromEmail(email);
    } catch (e) {
      throw Exception("Error obtaining user: $e");
    }
  }

  @override
  Future<void> logout() async {
    //TODO: implement logout
   localAuthSource.logout;
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup
    await localAuthSource.signup(email, password);
  }

  @override
  Future<String> getLoggedUser() async {
    //TODO: implement getLoggedUser
    return await localAuthSource.getLoggedUser();
  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged
    return await localAuthSource.isLogged();
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn
    await localAuthSource.setLoggedIn();
  }
}
