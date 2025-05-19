import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:yaml/yaml.dart';
import 'models/commodity.dart';
import 'models/client.dart';
import 'models/shipment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商品管理系统',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Commodity> commodities = [];
  List<Client> clients = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      // 加载商品数据
      final String commodityData = await rootBundle.loadString('assets/_data/commodity_list.yaml');
      final dynamic commodityYaml = loadYaml(commodityData);
      final List<dynamic> commodityList = jsonDecode(jsonEncode(commodityYaml['commodities']));
      commodities = commodityList.map((item) => Commodity.fromJson(item)).toList();

      // 加载客户数据
      final String clientData = await rootBundle.loadString('assets/_data/clients.yaml');
      final dynamic clientYaml = loadYaml(clientData);
      final List<dynamic> clientList = jsonDecode(jsonEncode(clientYaml['clients']));
      clients = clientList.map((item) => Client.fromJson(item)).toList();

      setState(() {
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        isLoading = false;
        errorMessage = '加载数据失败: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('商品管理系统'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '商品列表'),
              Tab(text: '商品属性'),
              Tab(text: '客户信息'),
            ],
          ),
        ),
        body: errorMessage != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: loadData,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              )
            : isLoading
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                    children: [
                      // 商品列表页面
                      ListView.builder(
                        itemCount: commodities.length,
                        itemBuilder: (context, index) {
                          final commodity = commodities[index];
                          return ListTile(
                            leading: const Icon(Icons.shopping_bag),
                            title: Text(commodity.name),
                            subtitle: Text('¥${commodity.price}'),
                            trailing: Text('库存: ${commodity.stock}'),
                          );
                        },
                      ),
                      // 商品属性页面
                      ListView.builder(
                        itemCount: commodities.length,
                        itemBuilder: (context, index) {
                          final commodity = commodities[index];
                          return ExpansionTile(
                            title: Text(commodity.name),
                            children: [
                              ListTile(
                                title: const Text('商品描述'),
                                subtitle: Text(commodity.description),
                              ),
                              ListTile(
                                title: const Text('商品属性'),
                                subtitle: Text(commodity.attributes.toString()),
                              ),
                              ListTile(
                                title: const Text('分类'),
                                subtitle: Text(commodity.category),
                              ),
                            ],
                          );
                        },
                      ),
                      // 客户信息页面
                      ListView.builder(
                        itemCount: clients.length,
                        itemBuilder: (context, index) {
                          final client = clients[index];
                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(client.name),
                            subtitle: Text('${client.country} - ${client.contact}'),
                            trailing: Text('时区: UTC${client.timezone >= 0 ? '+' : ''}${client.timezone}'),
                          );
                        },
                      ),
                    ],
                  ),
      ),
    );
  }
} 