import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiddify/core/locale/locale.dart';
import 'package:hiddify/domain/failures.dart';

part 'core_service_failure.freezed.dart';

@freezed
sealed class CoreServiceFailure with _$CoreServiceFailure, Failure {
  const CoreServiceFailure._();

  const factory CoreServiceFailure.unexpected(
    Object error,
    StackTrace stackTrace,
  ) = UnexpectedCoreServiceFailure;

  const factory CoreServiceFailure.serviceNotRunning([String? message]) =
      CoreServiceNotRunning;

  const factory CoreServiceFailure.invalidConfig([
    String? message,
  ]) = InvalidConfig;

  const factory CoreServiceFailure.create([
    String? message,
  ]) = CoreServiceCreateFailure;

  const factory CoreServiceFailure.start([
    String? message,
  ]) = CoreServiceStartFailure;

  const factory CoreServiceFailure.other([
    String? message,
  ]) = CoreServiceOtherFailure;

  String? get msg => switch (this) {
        UnexpectedCoreServiceFailure() => null,
        CoreServiceNotRunning(:final message) => message,
        InvalidConfig(:final message) => message,
        CoreServiceCreateFailure(:final message) => message,
        CoreServiceStartFailure(:final message) => message,
        CoreServiceOtherFailure(:final message) => message,
      };

  @override
  ({String type, String? message}) present(TranslationsEn t) {
    return switch (this) {
      UnexpectedCoreServiceFailure() => (
          type: t.failure.singbox.unexpected,
          message: null
        ),
      CoreServiceNotRunning(:final message) => (
          type: t.failure.singbox.serviceNotRunning,
          message: message
        ),
      InvalidConfig(:final message) => (
          type: t.failure.singbox.invalidConfig,
          message: message
        ),
      CoreServiceCreateFailure(:final message) => (
          type: t.failure.singbox.create,
          message: message
        ),
      CoreServiceStartFailure(:final message) => (
          type: t.failure.singbox.start,
          message: message
        ),
      CoreServiceOtherFailure(:final message) => (
          type: t.failure.singbox.unexpected,
          message: message
        ),
    };
  }
}
