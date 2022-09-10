import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<String> fetchQuoteFromServer() async {
    String loadedQuote;
    try {
      var response =
          await http.get(Uri.parse("https://api.adviceslip.com/advice"));
      if (response.statusCode == 200) {
        loadedQuote = json.decode(response.body)["slip"]["advice"].toString();
      } else {
        loadedQuote = "error";
      }
      return loadedQuote;
    } catch (e) {
      loadedQuote = "error";
      return loadedQuote;
    }
  }
}
