import 'package:flutter/material.dart';
import '../state_manager/state_manager.dart';

class BaseViewModel<S> extends StateManager<S> {
  @protected
  BaseViewModel(S state) : super(state);
}
