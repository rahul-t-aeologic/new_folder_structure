import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state_manager/state_manager.dart';
import 'ps_widgets_binding_observer.dart';

class BaseView<T extends StateManager<S>, S> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.setupViewModel,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, S state, T viewModel) builder;
  final Function(T viewModel) setupViewModel;

  static T of<T extends StateManager>(BuildContext context) {
    return BlocProvider.of<T>(context);
  }

  @override
  _BaseViewState<T, S> createState() => _BaseViewState<T, S>();
}

class _BaseViewState<T extends StateManager<S>, S> extends State<BaseView<T, S>>
    with WidgetsBindingObserver {
  late T _viewModel;

  @override
  void initState() {
    //_viewModel = DI.instance.get<T>();
    widget.setupViewModel(_viewModel);
    super.initState();
    if (_viewModel is WidgetsBindingObserver) {
      WidgetsBinding.instance?.addObserver(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: BlocBuilder<T, S>(
        bloc: _viewModel,
        key: const Key('BaseView_BlocBuilder'),
        builder: (BuildContext context, S state) {
          return widget.builder(context, state, _viewModel);
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_viewModel is PSWidgetsBindingObserver) {
      WidgetsBinding.instance?.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    PSWidgetsBindingObserver? listener =
        _viewModel as PSWidgetsBindingObserver?;
    listener?.psDidChangeAppLifecycleState(state);
  }
}
