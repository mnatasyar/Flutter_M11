import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m10/pertemuan11/pertemuan11_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan11Screen extends StatefulWidget {
  const Pertemuan11Screen({super.key});

  @override
  State<Pertemuan11Screen> createState() => _Pertemuan11ScreenState();
}

class _Pertemuan11ScreenState extends State<Pertemuan11Screen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan11Provider>(context, listen: false).initialData();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 11'),
        actions: [
          menuList(context)
        ],
      ),
      body: body(context),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);
    if(prov.data != null && prov.data.isNotEmpty) {
      return ListView(
        children: 
          List.generate(prov.data['data']!.length, (index) {
            var item = prov.data['data']![index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(item['img']),),title: Text(item['model']),subtitle: Text('Developer : ${item['developer']}\nPrice : ${item['price']}\nRating : ${item['rating']}'),
                ),
                Divider()
              ],
            );
          })
      );
    }
    else {
            return Center(child: Text('Data tidak ditemukan'));
    }
  }

  menuList(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);

    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(child: ListTile(
            onTap: () {
              prov.ubahList('hp');
            },
            leading: const Icon(Icons.phone),
            title: Text('HP'),
          )),
          PopupMenuItem(child: ListTile(
            onTap: () {
              prov.ubahList('laptop');
            },
            leading: const Icon(Icons.laptop),
            title: Text('Laptop'),
          )),
          PopupMenuDivider(),
          PopupMenuItem(child: ListTile(
            onTap: () {
              prov.clearPage();
            },
            leading: const Icon(Icons.delete),
            title: Text('Clear'),
          )),
        ];
      }
      );
  }
}
