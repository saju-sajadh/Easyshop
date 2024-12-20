import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../constants/providers.dart';
import '../constants/type_dart.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
  });
  FutureEither<model.Session> login({
    required String email,
    required String password,
  });
  Future<model.Account?> currentUserAccount();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  Future<model.Account?> currentUserAccount() async {
    try {
      final user = await _account.get();
      print('User fetched successfully: $user');
      return user;
    } on AppwriteException catch (e) {
      print('AppwriteException: ${e.message}');
      return null;
    } catch (e) {
      print('Generic Exception: ${e.runtimeType} | $e');
      return null;
    }
  }

  @override
  FutureEither<model.Account> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred!', stackTrace),
      );
    } catch (e, stackTrace) {
      print('Exception occurred due to: ${e.runtimeType} | $e | $stackTrace');
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<model.Session> login({
    required String email,
    required String password,
  }) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      print(e);
      return left(
        Failure(e.message ?? 'Some unexpected error occured!', stackTrace),
      );
    } catch (e, stackTrace) {
      print(e);
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
