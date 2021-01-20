import 'package:bp_domain/model/error_info.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';

import 'app_error.dart';

abstract class BaseError
    with BaseLayerDataTransformer<BaseError, AppError>
    implements Exception {
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
