import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/user_model/user_model.dart';
import 'package:flutter_jsonplaceholder/providers/ptac_data_provider.dart';
import 'package:flutter_jsonplaceholder/widgets/user_detail_tabbar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailPage extends ConsumerWidget {
  const UserDetailPage({
    super.key,
    required this.user
  });

  final User user;

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(ptacDataProvider(user.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name}'),
      ),
      body: data.when(data: (data){
        PTACOfUser userData = data;
        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 155,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.inversePrimary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Контакты:',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Почта: ${user.email}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Телефон: ${user.phone}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Никнейм: ${user.username}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Сайт: ${user.website}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ExpansionTile(
                    title: Text('Адрес'),
                    children: <Widget>[
                      ListTile(title: Text('Город: ${user.address.city}')),
                      ListTile(title: Text('Улица: ${user.address.street}')),
                      ListTile(title: Text('Номер: ${user.address.suite}')),
                      ListTile(
                          title: Text('Индекс: ${user.address.zipcode}')),
                      ExpansionTile(title: Text('Координаты'), children: <Widget>[
                        ListTile(
                            title: Text('Широта: ${user.address.geo.lat}')),
                        ListTile(
                            title: Text('Долгота: ${user.address.geo.lng}')),
                      ])
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Компания'),
                    children: <Widget>[
                      ListTile(
                          title: Text('Название: ${user.company.name}')),
                      ListTile(
                          title:
                          Text('Слоган: ${user.company.catchPhrase}')),
                      ListTile(title: Text('Стратегия: ${user.company.bs}')),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  UserDetailTabsWidget(ptacOfUser: userData,),

                ],
              ),
            ),
          ),
        );
      }, error: (err, s) => Text(err.toString()),
          loading: () =>
          const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
