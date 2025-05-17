import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ConvertUsdToEthCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConvertUsdToEth',
      apiUrl: 'https://api.coingecko.com/api/v3/simple/price',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'ids': "usd",
        'vs_currencies': "eth",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic usdInEth(dynamic response) => getJsonField(
        response,
        r'''$.usd.eth''',
      );
}

class NewsListCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsList',
      apiUrl:
          'https://api.rss2json.com/v1/api.json?rss_url=https://cointelegraph.com/editors_pick_rss',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? link(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.feed.link''',
      ));
  static List<String>? pubDate(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].pubDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? articles(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TogetherAIChatCall {
  static Future<ApiCallResponse> call({
    String? userMessage = 'Hello, how are you?',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "Qwen/Qwen3-235B-A22B-fp8-tput",
  "messages": [
    {
      "role": "user",
      "content": "${escapeStringForJson(userMessage)}"
    }
  ],
  "max_tokens": 512,
  "temperature": 0.7
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TogetherAIChat',
      apiUrl: 'https://api.together.xyz/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 6ebd0616869fed5cfafa5d88659aa3375dad452df1ffa1dba6ca5fbb0caa168f',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? aiResponseContent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[0].message.content''',
      ));
}

class CryptoPricesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CryptoPrices',
      apiUrl:
          'rest.coincap.io/v3/assets?apiKey=312723c86e41e4cac9b9d536a4869d6c934b4240c24ed84d6f42e998a65ee3a0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? coins(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].priceUsd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? symbol(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].symbol''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DogBreedsListCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'DogBreedsList',
      apiUrl: 'https://dog.ceo/api/breeds/list/all',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? message(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SendTwilioSMSCall {
  static Future<ApiCallResponse> call({
    String? toNumber = '',
    String? fromNumber = '',
    String? messageBody = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SendTwilioSMS',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/ACb369143b8fb4995f16f4b9a08365f9ac/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUNiMzY5MTQzYjhmYjQ5OTVmMTZmNGI5YTA4MzY1ZjlhYzowMjZhNGYzN2U3ZGQxNjE2Y2VlYTlhYTU0ZmMzNTYxMA==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'To': toNumber,
        'From': fromNumber,
        'Body': messageBody,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateTitleCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'generateTitle',
      apiUrl: 'https://random-word-api.herokuapp.com/word?number=2',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
