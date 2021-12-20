import 'package:dio/dio.dart';
import 'package:home_works/homework2/message.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<Message>> getMessages();

  @POST("/chat")
  Future<void> sendMessage(@Body() Message message);
}