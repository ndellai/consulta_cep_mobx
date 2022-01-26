// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepController on CepControllerBase, Store {
  Computed<CepModel?>? _$cepModelComputed;

  @override
  CepModel? get cepModel =>
      (_$cepModelComputed ??= Computed<CepModel?>(() => super.cepModel,
              name: 'CepControllerBase.cepModel'))
          .value;
  Computed<bool>? _$botaoPesquisarComputed;

  @override
  bool get botaoPesquisar =>
      (_$botaoPesquisarComputed ??= Computed<bool>(() => super.botaoPesquisar,
              name: 'CepControllerBase.botaoPesquisar'))
          .value;

  final _$_cepModelAtom = Atom(name: 'CepControllerBase._cepModel');

  @override
  CepModel? get _cepModel {
    _$_cepModelAtom.reportRead();
    return super._cepModel;
  }

  @override
  set _cepModel(CepModel? value) {
    _$_cepModelAtom.reportWrite(value, super._cepModel, () {
      super._cepModel = value;
    });
  }

  final _$_botaoPesquisarAtom = Atom(name: 'CepControllerBase._botaoPesquisar');

  @override
  bool get _botaoPesquisar {
    _$_botaoPesquisarAtom.reportRead();
    return super._botaoPesquisar;
  }

  @override
  set _botaoPesquisar(bool value) {
    _$_botaoPesquisarAtom.reportWrite(value, super._botaoPesquisar, () {
      super._botaoPesquisar = value;
    });
  }

  final _$obterCepAsyncAction = AsyncAction('CepControllerBase.obterCep');

  @override
  Future<void> obterCep(String cep) {
    return _$obterCepAsyncAction.run(() => super.obterCep(cep));
  }

  final _$limparCamposAsyncAction =
      AsyncAction('CepControllerBase.limparCampos');

  @override
  Future<void> limparCampos() {
    return _$limparCamposAsyncAction.run(() => super.limparCampos());
  }

  @override
  String toString() {
    return '''
cepModel: ${cepModel},
botaoPesquisar: ${botaoPesquisar}
    ''';
  }
}
