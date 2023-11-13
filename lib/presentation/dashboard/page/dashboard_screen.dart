import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/config/app_typography.dart';
import 'package:weather_app/core/util/app_util.dart';
import 'package:weather_app/core/util/stretch_overscroll.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:weather_app/presentation/dashboard/widgets/header_item.dart';
import 'package:weather_app/presentation/dashboard/widgets/weather_item.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    context.read<DashboardBloc>().position = await AppUtil.getCurrentLocation();
    _getData();
  }

  void _getData() {
    context.read<DashboardBloc>().add(GetCurrentLocationName());
    context.read<DashboardBloc>().add(GetForecastData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const HeaderItem(),
          Expanded(
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                state.when(
                  onError: (message) => Fluttertoast.showToast(msg: message),
                );
                return state.buildWhen(
                  onInit: Center(
                    child: StretchOverScrollWidget(
                      child: SingleChildScrollView(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            height: MediaQuery.sizeOf(context).height/2,
                            enlargeFactor: 0.125,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                          ),
                          items: context.read<DashboardBloc>().list.map((e) {
                            return WeatherItem(data: e);
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
                );
              }
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 2),
                blurRadius: 4,
              )],
              borderRadius: BorderRadius.circular(64),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4),
                    state.buildWhen(
                      onInit: Text(
                        context.read<DashboardBloc>().location,
                        style: AppTypography.copyWith(
                          color: Colors.blue,
                          weight: FontWeight.w600,
                        ),
                      ),
                      onLoading: Text(
                        "Fetching Location...",
                        style: AppTypography.copyWith(
                          color: Colors.blue,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

