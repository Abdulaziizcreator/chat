import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'dart:io';

class AudioUploadService {
  final Dio _dio = Dio();
  final String _uploadUrl = 'http://176.221.29.220/main/audio-question/'; // Replace with your API URL

  Future<Map<String, dynamic>> uploadAudio(File audioFile) async {
    try {
      String fileName = basename(audioFile.path);

      FormData formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(audioFile.path, filename: fileName),
      });

      Response response = await _dio.post(
        _uploadUrl,
        //41564
        data: formData,
        options: Options(
          headers: {
            "Authorization": "token ea3597009544508fc0a05bbe5e0ccdb5b58c3622",
          },
        ),
      );
      Logger().i(response);

      return response.data; // Contains 'uz_answer', 'audio_answer'
    } catch (e) {
      print('Error uploading audio: $e');
      throw Exception('Failed to upload audio');
    }
  }
}
