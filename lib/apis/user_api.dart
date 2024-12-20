import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../constants/appwrite.dart';
import '../constants/providers.dart';
import '../constants/type_dart.dart';
import '../models/user_model.dart';
import 'package:appwrite/appwrite.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appwriteDatabseProvider));
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;


  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppWrite.databaseId,
          collectionId: AppWrite.userCollection,
          documentId: userModel.uid,
          data: userModel.toMap());
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? 'Some Unexpected error occured!.', stackTrace));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
