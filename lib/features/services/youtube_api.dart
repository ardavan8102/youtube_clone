import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/api_url.dart';
import 'package:youtube_clone/features/helpers/handle_request.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_clone/features/models/video_model.dart';

class YoutubeApiService {

  // ignore: unused_field
  String? _nextPageToken;

  Future<List<VideoModel>> fetchVideos({
    String query = '',
    String? pageToken,
    int maxResults = 10,
  }) async {

    return await handleRequest(() async {

      final Uri uri = query.isEmpty
        ? Uri.parse(
          '${YoutubeApiUrls.youtubeApiBaseURL}videos?part=snippet,statistics,contentDetails&chart=mostPopular&maxResult=$maxResults&pageToken=${pageToken ?? ''}&key=${YoutubeApiUrls.apiKey}'
        )
        : Uri.parse(
          '${YoutubeApiUrls.youtubeApiBaseURL}search?part=snippet&q=$query&type=video&maxResult=$maxResults&pageToken=${pageToken ?? ''}&key=${YoutubeApiUrls.apiKey}'
        );

      final response = await http.get(uri);
      
      if(response.statusCode == 200) {

        final data = json.decode(response.body);

        _nextPageToken = data['nextPageToken'];

        final List<dynamic> items = data['items'];

        if(query.isNotEmpty) {

          final List<VideoModel> videos = [];

          for(var item in items) {

            final videoId = item['id']['videoId'];

            final details = await getVideoDetails(videoId);
            
            if(details.isNotEmpty) {

              final video = await VideoModel.fromJson(details);

              if ( video != null ) {

                videos.add(video);

              }

            }
          }

          return videos;

        }

        final List<VideoModel> videos = [];

        for(var item in items) {

          final video = await VideoModel.fromJson(item);

          if ( video != null) {

            videos.add(video);

          }

        }

        return videos;
        
      } else {

        debugPrint(
          'API Error : ${response.statusCode} - ${response.body}'
        );

      }

    }) ?? [];

  }


  Future<Map<String, dynamic>> getVideoDetails(String videoId) async {

    return await handleRequest(
      () async {
        final uri = Uri.parse(
          '${YoutubeApiUrls.youtubeApiBaseURL}videos?part=snippet,statistics,contentDetails&id=$videoId&key=${YoutubeApiUrls.apiKey}'
        );

        final response = await http.get(uri);

        if(response.statusCode == 200) {
          final data = json.decode(response.body);
          final List<dynamic> items = data['items'];
          return items.isNotEmpty ? items.first : null;
        }

        debugPrint('Video Details API error : ${response.statusCode} - ${response.body}');
        return null;
      }
    );

  }

}