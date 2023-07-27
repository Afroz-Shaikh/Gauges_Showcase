import 'package:showcase_app/playgrounds/custom_curve_playground.dart';
import 'package:showcase_app/playgrounds/linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/pointer_playground.dart';
import 'package:showcase_app/playgrounds/radial_gauge_playground.dart';
import 'package:showcase_app/playgrounds/range_linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/ruler_playground.dart';
import 'package:showcase_app/radial_usecases/calories_tracker.dart';
import 'package:showcase_app/radial_usecases/temperature_controller.dart';
import 'package:showcase_app/radial_usecases/fancy_clock.dart';
import 'package:showcase_app/radial_usecases/radial_tracker.dart';
import 'package:showcase_app/radial_usecases/simple_gauge.dart';
import 'package:showcase_app/radial_usecases/tracker.dart';
import 'package:showcase_app/radial_usecases/value_slider.dart';
import 'package:showcase_app/usecase/blood_sugar_test.dart';
import 'package:showcase_app/usecase/disk_space.dart';
import 'package:showcase_app/usecase/height_indicator.dart';
import 'package:showcase_app/usecase/lemonade.dart';
import 'package:showcase_app/usecase/multiple_pointers.dart';
import 'package:showcase_app/usecase/progress_bar.dart';
import 'package:showcase_app/radial_usecases/gradient_radial_gauge.dart';
import 'package:showcase_app/usecase/rainfall.dart';
import 'package:showcase_app/usecase/separator.dart';
import 'package:showcase_app/usecase/server_utilization.dart';
import 'package:showcase_app/usecase/space.dart';
import 'package:showcase_app/usecase/speedometer.dart';
import 'package:showcase_app/usecase/steps_counter.dart';
import 'package:showcase_app/usecase/temperature_meter.dart';
import 'package:showcase_app/usecase/thermometer.dart';
import 'package:showcase_app/usecase/timeline_controller.dart';

import './model/menu_item.dart';

import '../../usecase/vaccination_graph.dart';
import '../../usecase/water_level.dart';
import 'playgrounds/valuebar_playground.dart';
import 'radial_usecases/air_purifier.dart';
import 'radial_usecases/direction_gauge.dart';
import 'usecase/multiple_valuebar.dart';
import 'usecase/radial_pointer.dart';
import 'radial_usecases/taskTracker.dart';

const String githubUrlPrefix =
    "https://github.com/Afroz-Shaikh/Gauges_Showcase/blob/main/lib/usecase/";
List<LinearGaugeUseCase> linearMenuItems = [
  LinearGaugeUseCase(
    title: "Space",
    widget: const SpaceDemo(),
    index: 0,
    type: "UseCase",
  ),
  LinearGaugeUseCase(
    title: "Speedometer",
    widget: const Speedometer(),
    index: 1,
    type: "UseCase",
    sourceCodePath: "lib/usecase/speedometer.dart",
    sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Vaccination Graph",
    widget: const MyVaccinationGraph(),
    index: 2,
    type: "UseCase",
    sourceCodePath: "lib/usecase/vaccination_graph.dart",
    sourceCodeUrl: "${githubUrlPrefix}vaccination_graph.dart",
  ),
  LinearGaugeUseCase(
    title: "Temperature Gauge",
    widget: const TemperatureMeter(),
    index: 3,
    type: "UseCase",
    sourceCodePath: "lib/usecase/temperature_meter.dart",
    sourceCodeUrl: "${githubUrlPrefix}temperature_meter.dart",
  ),
  LinearGaugeUseCase(
    title: "Timeline",
    widget: const TimelineController(),
    index: 4,
    type: "UseCase",
    sourceCodePath: "lib/usecase/timeline_controller.dart",
    sourceCodeUrl: "${githubUrlPrefix}timeline_controller.dart",
  ),
  LinearGaugeUseCase(
    title: "Thermometer",
    widget: const Thermometer(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/usecase/thermometer.dart",
    sourceCodeUrl: "${githubUrlPrefix}thermometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Direction Gauge",
    widget: const DirectionGauge(),
    index: 6,
    type: "UseCase",
    sourceCodePath: "lib/usecase/direction_gauge.dart",
    sourceCodeUrl: "${githubUrlPrefix}direction_gauge.dart",
  ),
  LinearGaugeUseCase(
    title: "Lemonade Gauge",
    widget: const LemonadeGauge(),
    index: 7,
    type: "UseCase",
    sourceCodePath: "lib/usecase/lemonade.dart",
    sourceCodeUrl: "${githubUrlPrefix}lemonade.dart",
  ),
  LinearGaugeUseCase(
    title: "Water Level",
    widget: const WaterLevel(),
    index: 8,
    type: "UseCase",
    sourceCodePath: "lib/usecase/water_level.dart",
    sourceCodeUrl: "${githubUrlPrefix}water_level.dart",
  ),
  LinearGaugeUseCase(
    title: "Rainfall Gauge",
    widget: const Rainfall(),
    index: 9,
    type: "UseCase",
    sourceCodePath: "lib/usecase/rainfall.dart",
    sourceCodeUrl: "${githubUrlPrefix}rainfall.dart",
  ),
  LinearGaugeUseCase(
    title: "Height Indicator",
    widget: const HeightIndicator(),
    index: 10,
    type: "UseCase",
    sourceCodePath: "lib/usecase/height_indicator.dart",
    sourceCodeUrl: "${githubUrlPrefix}height_indicator.dart",
  ),
  LinearGaugeUseCase(
    title: "Progress Bar",
    widget: const MyProgressBar(),
    index: 11,
    type: "UseCase",
    sourceCodePath: "lib/usecase/progress_bar.dart",
    sourceCodeUrl: "${githubUrlPrefix}progress_bar.dart",
  ),
  LinearGaugeUseCase(
    title: "Server Utilization",
    widget: const MyServerUtilizationExample(),
    index: 12,
    type: "UseCase",
    sourceCodePath: "lib/usecase/server_utilization.dart",
    sourceCodeUrl: "${githubUrlPrefix}server_utilization.dart",
  ),
  LinearGaugeUseCase(
    title: "Separator",
    widget: const Separator(),
    index: 13,
    type: "UseCase",
    sourceCodePath: "lib/usecase/separator.dart",
    sourceCodeUrl: "${githubUrlPrefix}separator.dart",
  ),
  LinearGaugeUseCase(
    title: "Blood Sugar Level",
    widget: const BloodSugarTest(),
    index: 14,
    type: "UseCase",
    sourceCodePath: "lib/usecase/blood_sugar_test.dart",
    sourceCodeUrl: "${githubUrlPrefix}blood_sugar_test.dart",
  ),
  LinearGaugeUseCase(
    title: "Disk Usage",
    widget: const DiskSpace(),
    index: 15,
    type: "UseCase",
    sourceCodePath: "lib/usecase/disk_space.dart",
    sourceCodeUrl: "${githubUrlPrefix}disk_space.dart",
  ),
  LinearGaugeUseCase(
    title: "Multiple Pointers",
    widget: const MultiplePointer(),
    index: 16,
    type: "UseCase",
    sourceCodePath: "lib/usecase/multiple_pointers.dart",
    sourceCodeUrl: "${githubUrlPrefix}multiple_pointers.dart",
  ),
  LinearGaugeUseCase(
    title: "Multiple ValueBar",
    widget: const MultipleValueBar(),
    index: 17,
    type: "UseCase",
    sourceCodePath: "lib/usecase/multiple_valuebar.dart",
    sourceCodeUrl: "${githubUrlPrefix}multiple_valuebar.dart",
  ),

  // Playgrounds
  LinearGaugeUseCase(
    title: "API",
    widget: const LinearGaugePlayGround(),
    type: "API",
    index: 18,
  ),
  LinearGaugeUseCase(
    title: "Pointer API",
    widget: const PointerPlayGround(),
    type: "API",
    index: 19,
  ),
  LinearGaugeUseCase(
    title: "ValueBar API",
    widget: const ValueBarPlayGround(),
    type: "API",
    index: 20,
  ),
  LinearGaugeUseCase(
    title: "RangeLinearGauge API",
    widget: const RangeLinearGaugePlayGround(),
    type: "API",
    index: 21,
  ),
  LinearGaugeUseCase(
    title: "Ruler API",
    widget: const RulerPlayGround(),
    type: "API",
    index: 22,
  ),
  LinearGaugeUseCase(
    title: "CustomCurve API",
    widget: const CustomCurvePlayGround(),
    type: "API",
    index: 23,
  ),
];

List<LinearGaugeUseCase> radialMenuItems = [
  LinearGaugeUseCase(
    title: "Activity Tracker",
    widget: const ActivityTracker(),
    index: 0,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/calories_tracker.dart",
    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Temperature Controller",
    widget: const TemperatureController(),
    index: 2,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/temperature_controller.dart",
    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Speed Gauge",
    widget: const SpeedTest(),
    index: 0,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/gradient_radial_gauge.dart",

    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Bike Speedometer",
    widget: const BikeSpeedometer(),
    index: 1,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/simple_gauge.dart",

    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Task tracker",
    widget: const TaskTracker(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/taskTracker.dart",
  ),
  LinearGaugeUseCase(
    title: "Radial Compass",
    widget: const RadialCompass(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/tracker.dart",
  ),
  LinearGaugeUseCase(
    title: "Value Slider",
    widget: const ValueSlider(),
    index: 11,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/value_slider.dart",
  ),
  LinearGaugeUseCase(
    title: "Fancy Clock",
    widget: const FancyClock(),
    index: 3,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/fancy_clock.dart",
    // sourceCodePath: "lib/usecase/speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Radial tracker",
    widget: const RadialTracker(),
    index: 4,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/radial_tracker.dart",
    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Radial With Pointer",
    widget: const RadialPointer(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/radial_pointer.dart",
  ),
  LinearGaugeUseCase(
    title: "Steps Counter",
    widget: const RadialStepCounter(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/steps_counter.dart",
  ),
  LinearGaugeUseCase(
    title: "Air Purifier",
    widget: const AirPurifier(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/radial_usecases/air_purifier.dart",
  ),
  LinearGaugeUseCase(
    title: "Radial Gauge Playground",
    widget: const RadialGaugePlayground(),
    index: 9,
    type: "API",

    // sourceCodeUrl: "${githubUrlPrefix}speedometer.dart",
  ),
];
