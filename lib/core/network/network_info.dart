import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dokan/main.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;
  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}

class NoInternetFailure extends Failure {
  NoInternetFailure(String message) : super(message);
}

class NoLocalDataFailure extends Failure {
  NoLocalDataFailure(String message) : super(message);
}

class NoRemoteDataFailure extends Failure {
  NoRemoteDataFailure(String message) : super(message);
}

class NoCachedDataFailure extends Failure {
  NoCachedDataFailure(String message) : super(message);
}

class NoDataFailure extends Failure {
  NoDataFailure(String message) : super(message);
}

class NoDataFoundFailure extends Failure {
  NoDataFoundFailure(String message) : super(message);
}

class NoDataAvailableFailure extends Failure {
  NoDataAvailableFailure(String message) : super(message);
}

class NoDataReceivedFailure extends Failure {
  NoDataReceivedFailure(String message) : super(message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => message;
}
