import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DataProvider>(
    create: (_) => DataProvider(),
  ),
];
