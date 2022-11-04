// Mocks generated by Mockito 5.3.2 from annotations
// in desafio_flutter/test/modules/pull/domain/usecases/fetch_pull_request_repositorie_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart'
    as _i6;
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart' as _i5;
import 'package:desafio_flutter/modules/pull/domain/repositories/pull_repository_interface.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PullRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockPullRepositoryInterface extends _i1.Mock
    implements _i3.PullRepositoryInterface {
  @override
  _i4.Future<
      _i2.Either<_i5.FailurePullInterface?, List<_i6.PullRequest>?>> fetchPulls(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchPulls,
          [url],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.FailurePullInterface?,
                    List<_i6.PullRequest>?>>.value(
            _FakeEither_0<_i5.FailurePullInterface?, List<_i6.PullRequest>?>(
          this,
          Invocation.method(
            #fetchPulls,
            [url],
          ),
        )),
        returnValueForMissingStub: _i4.Future<
                _i2.Either<_i5.FailurePullInterface?,
                    List<_i6.PullRequest>?>>.value(
            _FakeEither_0<_i5.FailurePullInterface?, List<_i6.PullRequest>?>(
          this,
          Invocation.method(
            #fetchPulls,
            [url],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.FailurePullInterface?, List<_i6.PullRequest>?>>);
}
