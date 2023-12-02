import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ddjrypupxrdpzpuosdre.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkanJ5cHVweHJkcHpwdW9zZHJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyMzcwODcsImV4cCI6MjAxNjgxMzA4N30.0sJZZrv3ucrDtQ-oN1uebe193GAPoA8N9l4ilNbwvqU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Supabase Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter Demo'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return SimpleDialog(
                  title: const Text('Add a new task'),
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) async {
                        await Supabase.instance.client.from('notes').insert([
                          {'body': value}
                        ]);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
