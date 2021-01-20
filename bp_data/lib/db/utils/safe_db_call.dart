import 'package:bp_domain/error/database_error.dart';
import 'package:dartz/dartz.dart';

Future<Either<DatabaseError, T>> safeDbCall<T>(Future<T> dbCall) async {
  try {
    final originalResponse = await dbCall;
    return Right(originalResponse);
  } catch (throwable) {
    return Left(
      DatabaseError(
        message: throwable.toString(),
      ),
    );
  }
}
