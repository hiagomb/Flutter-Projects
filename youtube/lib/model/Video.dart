class Video{

  String _id;
  String _titulo;
  String _imagem;
  String _canal;

  Video(this._id, this._titulo, this._imagem, this._canal);


  String get canal => _canal;

  set canal(String value) {
    _canal = value;
  }

  String get imagem => _imagem;

  set imagem(String value) {
    _imagem = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}