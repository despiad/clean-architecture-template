import 'package:clean_architecture_template/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('COUNTER'),
        ),
        body: BlocConsumer<CounterBloc, CounterState>(
          listener: (blocContext, state) {
            if (state is CounterErrorState) {
              _scaffoldMessengerKey.currentState!
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (blocContext, state) {
            if (state is CounterLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CounterChangedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current counter value:',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '${state.value}',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              heroTag: 'inc',
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              heroTag: 'dec',
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
