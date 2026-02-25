import 'package:youtube_clone/features/helpers/handle_request.dart';

class VideoModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  final String viewCount;
  final String publishedTime;
  final String channelAvatarUrl;
  final String duration;
  final String channelId;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
    required this.viewCount,
    required this.publishedTime,
    required this.channelAvatarUrl,
    required this.duration,
    required this.channelId,
  });


  static Future<VideoModel?> fromJson(Map<String, dynamic> json) async {
    return await handleRequest<VideoModel>(
      () async {
        final snippet = json['snippet'] ?? {};
        final statistics = json['statistics'] ?? {};
        final contentDetails = json['contentDetails'] ?? {};

        String videoId = '';

        if(json['id'] is String) {

          videoId = json['id'];

        } else if (json['id'] is Map) {

          videoId = json['id']['videoId'] ?? '';

        }

        String viewCountString = '0 Views';

        if (statistics['viewCount'] != null) {
          int views = int.tryParse(
            statistics['viewCount'].toString()
          ) ?? 0;

          if(views > 1000000) {

            viewCountString = '${(views / 1000000).toStringAsFixed(1)}M Views';

          } else if (views > 1000) {

            viewCountString = '${(views / 1000).toStringAsFixed(1)}K Views';

          } else {

            viewCountString = '$views Views';

          }
        }


        String durationString = '0:00';

        if (contentDetails['duration'] != null) {

          final duration = contentDetails['duration'].toString();

          final regExp = RegExp(
            r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?' // regular expression to show H:M:S format duration
          );

          final match = regExp.firstMatch(duration);

          if(match != null) {

            final hours = match.group(1);
            final minutes = match.group(2);
            final seconds = match.group(3);

            if ( hours != null) {

              durationString = '$hours:${minutes?.padLeft(2, '0') ?? '00'}:${seconds?.padLeft(2, '0') ?? '00'}';

            } else if ( minutes != null ) {

              durationString = '$minutes:${seconds?.padLeft(2, '0') ?? '00'}';

            } else if ( seconds != null ) {

              durationString = '0:${seconds.padLeft(2, '0')}';

            }

          }
        }

        return VideoModel(
          id: videoId,
          title: snippet['title'] ?? '',
          thumbnailUrl: snippet['thumbnails'] ? ['high'] ? ['url'] ?? snippet['thumbnail'] ? ['default'] ? ['url'] ?? '',
          channelTitle: snippet['channelTitle'] ?? '',
          viewCount: viewCountString,
          publishedTime: await _getPublishedTime(snippet['publishedAt']) ?? '',
          channelAvatarUrl: 'https://picsum.photos/seed/${snippet['channelId']}/200/200',
          duration: durationString,
          channelId: snippet['channelId'] ?? ''
        );
      }
    );
  }

  static Future<String?> _getPublishedTime(String publishedAt) async {

    return await handleRequest<String>(
      () async {
        if (publishedAt.isEmpty) return '';

        final published = DateTime.parse(publishedAt);
        final now = DateTime.now();

        final difference = now.difference(published);

        if( difference.inDays > 365) {

          return '${(difference.inDays / 365).floor()} Years ago';

        } else if (difference.inDays > 30) {

          return '${(difference.inDays / 30).floor()} Month ago';

        } else if (difference.inDays > 7) {

          return '${(difference.inDays / 7).floor()} Weeks ago';

        } else if (difference.inDays > 0) {

          return '${difference.inDays} Days ago';

        } else if (difference.inHours > 0) {

          return '${difference.inHours} Hours ago';

        } else if (difference.inMinutes > 0) {

          return '${difference.inMinutes} Minutes ago';

        } else if (difference.inSeconds > 30) {

          return '${difference.inSeconds} Seconds ago';

        } else {

          return '$difference Just Now';

        }
      }
    );

  }
}
