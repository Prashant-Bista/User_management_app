import 'package:async/async.dart';
import 'repository.dart';
import 'user_model.dart';

class UserService{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  saveUser(User user) async{
    return await _repository.insertData('users', user.userMap());
  }
  readAllUsersData() async{
    return await _repository.readData('users');
  }
  updateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }
  deleteUser(userId) async{
    return await _repository.deleteDataById('users', userId);
  }


}