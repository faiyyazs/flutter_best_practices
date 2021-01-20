
import 'package:bp_domain/model/error_info.dart';

abstract class BaseError implements Exception {
  final String message;
  ErrorInfo error;
  Exception cause;

  BaseError(this.message, {this.error, this.cause}) {
    //Log.d("ERROR", "Error: $message")
    //printstacktrace
  }

  String getFriendlyMessage();

  logError() {
    // TODO: Logging to crashlytics
  }
}
