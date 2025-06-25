import 'package:doppio_dev_site/components/index.dart';
import 'package:doppio_dev_site/service/context_service.dart';
import 'package:doppio_dev_site/service/translate_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doppio_dev_site/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required HomeBloc homeBloc}) : _homeBloc = homeBloc, super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();
  final PageController pageController = PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    if (widget._homeBloc.state is UnHomeState) {
      _load();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._homeBloc,
      builder: (BuildContext context, HomeState currentState) {
        if (currentState is UnHomeState) {
          return Center(child: CircularProgressIndicator());
        }
        if (currentState is ErrorHomeState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        return Colors.blue;
                      }),
                    ),
                    onPressed: _load,
                    child: Text(TranslateService().locale!.error_reload),
                  ),
                ),
              ],
            ),
          );
        }
        if (currentState is InHomeState) {
          var items = ['Meows.app', 'iXn'];
          final pages = [Meows(), Ixn()];
          return Column(
            children: [
              Row(
                children: items
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = items.indexOf(e);
                            pageController.animateToPage(_selectedIndex, curve: Curves.ease, duration: Duration(seconds: 1));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e, style: ContextService().textTheme.titleLarge),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: PageView(
                  scrollDirection: Axis.vertical,
                  allowImplicitScrolling: true,
                  controller: pageController,
                  onPageChanged: (int i) {
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                  children: pages,
                ),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  void _load() {
    widget._homeBloc.add(LoadHomeEvent());
  }
}
