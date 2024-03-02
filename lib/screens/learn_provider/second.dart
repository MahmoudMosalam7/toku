import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
Future <String> fetchData()async{
  // to make delay
  var respose = await _dio.get('/posts');
  var data = respose.data;
  print(data[0]);
  return data[0]['body'];
}
//https://jsonplaceholder.typicode.com/posts
final dataPRovider = FutureProvider.autoDispose((ref) => fetchData());
class SecondView  extends ConsumerWidget {
  const SecondView ({super.key});

  @override
  Widget build(BuildContext context , ref) {
    final data = ref.watch(dataPRovider);
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
        child: data.when(data: (String value )=>Text(value), 
            error:(error,stack)=>Text('error') ,
            loading: ()=>CircularProgressIndicator()),
        ),
      ),
    );
  }
}
