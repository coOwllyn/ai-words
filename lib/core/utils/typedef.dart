import 'package:dartz/dartz.dart';
import 'package:flutter_words/core/errors/failure.dart';


typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;