import '../../../domain/entities/user.dart';
import '../i_local_auth_source.dart';
import 'local_preferences.dart';

class SharedPrefLocalAuthSource implements ILocalAuthSource {
  final _sharedPreferences = LocalPreferences();

  @override
  Future<String> getLoggedUser() async {
    return await _sharedPreferences.retrieveData<String>('user') ?? "noUser";
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.storeData('logged', false);
  }

  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail, return a User object
    // if no user is found, throw "User not found"
    String? storedEmail = await _sharedPreferences.retrieveData<String>('user');
    String? storedPassword = await _sharedPreferences.retrieveData<String>('password');
    if (storedEmail == email) {
        return User(email: storedEmail!, password: storedPassword! );
    } else {
      throw Exception("User not found");
    }
  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged, return a boolean, default is false
    return await _sharedPreferences.retrieveData<bool>('logged') ?? false;
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup, stroe the email and pass on shared preferences
    await _sharedPreferences.storeData('user', email);
    await _sharedPreferences.storeData('password', password);
    await setLoggedIn();
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn, store a boolean on shared preferences
    await _sharedPreferences.storeData('logged', true);
  }
}
