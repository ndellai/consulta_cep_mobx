import 'package:consulta_cep/controllers/cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  late CepController _cepMobx;
  late TextEditingController _textController;

  @override
  void initState() {
    _cepMobx = CepController();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _obterCep() async {
    String cep = _textController.text;
    await _cepMobx.obterCep(cep);
  }

  void _limparCampos() {
    _textController.clear();
    _cepMobx.limparCampos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Entre com o CEP:"),
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (value) =>
                        _cepMobx.botaoPesquisar = value.isNotEmpty,
                    controller: _textController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Observer(
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Logradouro:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_cepMobx.cepModel?.logradouro ?? ""),
                      const Text(
                        "Complemento:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_cepMobx.cepModel?.complemento ?? ""),
                      const Text(
                        "Bairro:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_cepMobx.cepModel?.bairro ?? ""),
                      const Text(
                        "Localidade:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_cepMobx.cepModel?.localidade ?? ""),
                      const Text(
                        "UF:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_cepMobx.cepModel?.uf ?? ""),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(
                builder: (context) => FloatingActionButton(
                      onPressed: () async =>
                          _cepMobx.botaoPesquisar ? _obterCep() : null,
                      backgroundColor:
                          _cepMobx.botaoPesquisar ? Colors.blue : Colors.grey,
                      tooltip: 'Pesquisar o CEP',
                      child: const Icon(Icons.search),
                    )),
            const SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () => _limparCampos(),
              tooltip: 'Pesquisar o CEP',
              child: const Icon(Icons.clear),
            ),
          ],
        ));
  }
}
