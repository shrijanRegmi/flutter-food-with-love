import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/viewmodels/app_vm.dart';

class VMProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T vm;
  final Widget Function(BuildContext, T, AppVm, FoodWithLoveUser) builder;
  final Function(T)? onInit;
  final Function(T)? onDispose;
  const VMProvider({
    required this.vm,
    required this.builder,
    this.onInit,
    this.onDispose,
    Key? key,
  }) : super(key: key);

  @override
  _VMProviderState<T> createState() => _VMProviderState<T>();
}

class _VMProviderState<T extends ChangeNotifier> extends State<VMProvider<T>> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call(widget.vm);
  }

  @override
  void dispose() {
    widget.onDispose?.call(widget.vm);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _appUser = Provider.of<FoodWithLoveUser>(context);
    final _appVm = Provider.of<AppVm>(context);
    return ChangeNotifierProvider<T>(
      create: (context) => widget.vm,
      child: Consumer<T>(
        builder: (context, vm, child) {
          return widget.builder(context, vm, _appVm, _appUser);
        },
      ),
    );
  }
}
