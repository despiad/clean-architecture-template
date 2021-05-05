import 'dart:developer';

import 'package:clean_architecture_template/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:clean_architecture_template/features/counter/presentation/widgets/counter_view.dart';
import 'package:clean_architecture_template/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CounterBloc>()..add(FetchCounterEvent()),
      child: CounterView(),
    );
  }
}
