import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String endpointToday = "today";
  static const String endpointEpisodes = "episodes";

  static Future<dynamic> _fetchData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network request failed: $e');
    }
  }

  static Future<List<WebtoonModel>> getTodayToons() async {
    final List<dynamic> webtoons = await _fetchData(endpointToday);
    return webtoons.map((webtoon) => WebtoonModel.fromJson(webtoon)).toList();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final webtoon = await _fetchData(id);
    return WebtoonDetailModel.fromJson(webtoon);
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
    String id,
  ) async {
    final List<dynamic> episodes = await _fetchData('$id/$endpointEpisodes');
    return episodes
        .map((episode) => WebtoonEpisodeModel.fromJson(episode))
        .toList();
  }
}
