import 'package:http/http.dart' as Http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE=   "AIzaSyD1NDAcawIemo1d_Y4Lf_sCC41HuFJVQ6M";
const URL_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3";


class Api{



  Future<List<Video>> pesquisar(String pesquisa) async{
    Http.Response response= await Http.get(Uri.parse(URL_BASE+"/search?part=snippet"
        "&type=video&maxResults=20&order=date&key="+CHAVE+"&channelId=$URL_CANAL&q="+pesquisa));

    List<Video> lista = [];

    if(response.statusCode == 200){
      var dados= json.decode(response.body);
      for(var i in dados["items"]){
        Video v = Video(i["id"]["videoId"], i["snippet"]["title"], i["snippet"]["thumbnails"]["high"]["url"],
        i["snippet"]["channelId"]);
        lista.add(v);
      }
    }else{

    }

    return lista;
  }

  Api();
}