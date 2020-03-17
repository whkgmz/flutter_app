import 'package:flutter/material.dart';
import 'package:flutter_rush/provide/tree_model_provider.dart';
import 'package:flutter_rush/provide/type_artcle_provider.dart';
import 'package:flutter_rush/widgets/type_article_widget.dart';
import 'package:provider/provider.dart';

class TypePage extends StatefulWidget {
  @override
  _TypePageState createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() =>
        Provider.of<TreeModelProvider>(context, listen: false).requestTree());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TreeModelProvider>(
      builder: (BuildContext context, TreeModelProvider value, Widget child) {
        if (value.treeModel != null) {

          return DefaultTabController(
            child: Scaffold(
              appBar: AppBar(
                title: Container(
                  margin: const EdgeInsets.only(right: 25),
                  child: TabBar(
                    indicatorColor: Colors.red,
                      isScrollable: true,
                      tabs: List.generate(
                          value.treeModel.length,
                          (index) => Tab(
                                text: value.treeModel[index].name,
                              ))),
                ),
              ),
              body: TabBarView(
                children: List.generate(
                    value.treeModel.length,
                    (index) => ChangeNotifierProvider(
                          create: (BuildContext context) =>
                              TypeArticleProvider(),
                          child:
                              TypeArticleWidget(aid: value.treeModel[index].id),
                        )),
              ),
            ),
            length: value.treeModel.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
