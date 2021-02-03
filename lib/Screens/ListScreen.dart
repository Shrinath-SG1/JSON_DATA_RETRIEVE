import 'package:flutter/material.dart';
import 'package:json2/Model/jsonToDart.dart';
import 'package:json2/Services/jsonData.dart';

class Json extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return JsonState();
  }

}
class JsonState extends State<Json>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView in Flutter'),
      ),
      body: FutureBuilder<List<Users>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) => ListTile(
              title: Text(user.name),
              onTap: (){ print(user.name); },
              subtitle: Text(user.address.city),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(user.name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            )
                .toList(),
          );
        },
      ),
    );
  }

}