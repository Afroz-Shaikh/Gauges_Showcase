import 'package:showcase_app/playgrounds/linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/pointer_playground.dart';
import 'package:showcase_app/playgrounds/range_linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/ruler_playground.dart';
import 'package:showcase_app/usecase/blood_sugar_test.dart';
import 'package:showcase_app/usecase/disk_space.dart';
import 'package:showcase_app/usecase/height_indicator.dart';
import 'package:showcase_app/usecase/lemonade.dart';
import 'package:showcase_app/usecase/progress_bar.dart';
import 'package:showcase_app/usecase/rainfall.dart';
import 'package:showcase_app/usecase/separator.dart';
import 'package:showcase_app/usecase/server_utilization.dart';
import 'package:showcase_app/usecase/speedometer.dart';
import 'package:showcase_app/usecase/temperature_meter.dart';
import 'package:showcase_app/usecase/thermometer.dart';
import 'package:showcase_app/usecase/timeline_controller.dart';

import './model/menu_item.dart';

import '../../usecase/vaccination_graph.dart';
import '../../usecase/water_level.dart';
import 'playgrounds/valuebar_playground.dart';
import 'usecase/direction_gauge.dart';

List<LinearGaugeUseCase> menuItems = [
  LinearGaugeUseCase(
    title: "Speedometer",
    widget: const Speedometer(),
    index: 0,
    type: "UseCase",
    sourceCodePath: "lib/usecase/speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Vaccination Graph",
    widget: const MyVaccinationGraph(),
    index: 1,
    type: "UseCase",
    sourceCodePath: "lib/usecase/vaccination_graph.dart",
  ),
  LinearGaugeUseCase(
    title: "Temperature Gauge",
    widget: const TemperatureMeter(),
    index: 2,
    type: "UseCase",
    sourceCodePath: "lib/usecase/temperature_meter.dart",
  ),
  LinearGaugeUseCase(
    title: "Timeline",
    widget: const TimelineController(),
    index: 3,
    type: "UseCase",
    sourceCodePath: "lib/usecase/timeline_controller.dart",
  ),
  LinearGaugeUseCase(
    title: "Thermometer",
    widget: const Thermometer(),
    index: 4,
    type: "UseCase",
    sourceCodePath: "lib/usecase/thermometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Direction Gauge",
    widget: const DirectionGauge(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/usecase/direction_gauge.dart",
  ),
  LinearGaugeUseCase(
    title: "Lemonade Gauge",
    widget: const LemonadeGauge(),
    index: 6,
    type: "UseCase",
    sourceCodePath: "lib/usecase/lemonade.dart",
  ),
  LinearGaugeUseCase(
    title: "Water Level",
    widget: const WaterLevel(),
    index: 7,
    type: "UseCase",
    sourceCodePath: "lib/usecase/water_level.dart",
  ),
  LinearGaugeUseCase(
    title: "Rainfall Gauge",
    widget: const Rainfall(),
    index: 8,
    type: "UseCase",
    sourceCodePath: "lib/usecase/rainfall.dart",
  ),
  LinearGaugeUseCase(
    title: "Height Indicator",
    widget: const HeightIndicator(),
    index: 9,
    type: "UseCase",
    sourceCodePath: "lib/usecase/height_indicator.dart",
  ),
  LinearGaugeUseCase(
    title: "Progress Bar",
    widget: const MyProgressBar(),
    index: 10,
    type: "UseCase",
    sourceCodePath: "lib/usecase/progress_bar.dart",
  ),
  LinearGaugeUseCase(
    title: "Server Utilization",
    widget: const MyServerUtilizationExample(),
    index: 11,
    type: "UseCase",
    sourceCodePath: "lib/usecase/server_utilization.dart",
  ),
  LinearGaugeUseCase(
    title: "Separator",
    widget: const Separator(),
    index: 12,
    type: "UseCase",
    sourceCodePath: "lib/usecase/separator.dart",
  ),
  LinearGaugeUseCase(
    title: "Blood Sugar Level",
    widget: const BloodSugarTest(),
    index: 13,
    type: "UseCase",
    sourceCodePath: "lib/usecase/blood_sugar_test.dart",
  ),
  LinearGaugeUseCase(
    title: "Disk Usage",
    widget: const DiskSpace(),
    index: 14,
    type: "UseCase",
    sourceCodePath: "lib/usecase/disk_space.dart",
  ),
  LinearGaugeUseCase(
    title: "API",
    widget: const LinearGaugePlayGround(),
    type: "API",
    index: 15,
  ),
  LinearGaugeUseCase(
    title: "Pointer API",
    widget: const PointerPlayGround(),
    type: "API",
    index: 16,
  ),
  LinearGaugeUseCase(
    title: "ValueBar API",
    widget: const ValueBarPlayGround(),
    type: "API",
    index: 17,
  ),
  LinearGaugeUseCase(
    title: "RangeLinearGauge API",
    widget: const RangeLinearGaugePlayGround(),
    type: "API",
    index: 18,
  ),
  LinearGaugeUseCase(
    title: "Ruler API",
    widget: const RulerPlayGround(),
    type: "API",
    index: 19,
  ),
];
