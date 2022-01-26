import 'package:consulta_cep/models/cep_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'cep_controller.g.dart';

class CepController = CepControllerBase with _$CepController;

abstract class CepControllerBase with Store {
  @observable
  CepModel? _cepModel;

  @computed
  CepModel? get cepModel => _cepModel;

  @observable
  var _botaoPesquisar = false;

  @computed
  bool get botaoPesquisar => _botaoPesquisar;
  set botaoPesquisar(value) => _botaoPesquisar = value;

  @action
  Future<void> obterCep(String cep) async {
    var url = Uri.parse("https://viacep.com.br/ws/$cep/json/");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      _cepModel = CepModel.fromJson(response.body);
    } else if (kDebugMode) {
      print("Erro no request");
    }
  }

  @action
  Future<void> limparCampos() async {
    _botaoPesquisar = false;
    _cepModel = null;
  }
}
