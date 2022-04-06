class Notas{

  int? _id;
  String _titulo;
  String _data;
  String _descricao;

  Notas(this._titulo, this._data, this._descricao);


  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  int get id => _id!;

  set id(int value) {
    _id = value;
  }
}