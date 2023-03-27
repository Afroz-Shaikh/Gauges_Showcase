import 'package:showcase_app/playgrounds/linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/pointer_playground.dart';
import 'package:showcase_app/playgrounds/range_linear_gauge_playground.dart';
import 'package:showcase_app/playgrounds/ruler_playground.dart';
import 'package:showcase_app/usecase/battery.dart';
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

List<LinearGaugeUseCase> menuItems = [
  LinearGaugeUseCase(
    title: "Speedometer",
    widget: const Speedometer(),
    index: 0,
    type: "UseCase",
    sourceCodePath: "lib/useCase/speedometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Height Indicator",
    widget: const HeightIndicator(),
    index: 1,
    type: "UseCase",
    sourceCodePath: "lib/useCase/height_indicator.dart",
  ),
  LinearGaugeUseCase(
    title: "Progress Bar",
    widget: const MyProgressBar(),
    index: 2,
    type: "UseCase",
    sourceCodePath: "lib/useCase/progress_bar.dart",
  ),
  LinearGaugeUseCase(
    title: "Server Utilization",
    widget: const MyServerUtilizationExample(),
    index: 3,
    type: "UseCase",
    sourceCodePath: "lib/useCase/server_utilization.dart",
  ),
  LinearGaugeUseCase(
    title: "Separator",
    widget: const Separator(),
    index: 4,
    type: "UseCase",
    sourceCodePath: "lib/useCase/separator.dart",
  ),
  LinearGaugeUseCase(
    title: "Thermometer",
    widget: const Thermometer(),
    index: 5,
    type: "UseCase",
    sourceCodePath: "lib/useCase/thermometer.dart",
  ),
  LinearGaugeUseCase(
    title: "Vaccination Graph",
    widget: const MyVaccinationGraph(),
    index: 6,
    type: "UseCase",
    sourceCodePath: "lib/useCase/vaccination_graph.dart",
  ),
  LinearGaugeUseCase(
    title: "Blood Sugar Level",
    widget: const BloodSugarTest(),
    index: 7,
    type: "UseCase",
    sourceCodePath: "lib/useCase/blood_sugar_test.dart",
  ),
  LinearGaugeUseCase(
    title: "Temperature Gauge",
    widget: const TemperatureMeter(),
    index: 8,
    type: "UseCase",
    sourceCodePath: "lib/useCase/temperature_meter.dart",
  ),
  LinearGaugeUseCase(
    title: "Water Level",
    widget: const WaterLevel(),
    index: 9,
    type: "UseCase",
    sourceCodePath: "lib/useCase/water_level.dart",
  ),
  LinearGaugeUseCase(
    title: "Disk Usage",
    widget: const DiskSpace(),
    index: 10,
    type: "UseCase",
    sourceCodePath: "lib/useCase/disk_space.dart",
  ),
  LinearGaugeUseCase(
    title: "Timeline",
    widget: const TimelineController(),
    index: 12,
    type: "UseCase",
    sourceCodePath: "lib/useCase/timeline_controller.dart",
  ),
  LinearGaugeUseCase(
    title: "Direction Gauge",
    widget: const DirectionGauge(),
    index: 13,
    type: "UseCase",
    sourceCodePath: "lib/useCase/direction_gauge.dart",
  ),
  LinearGaugeUseCase(
    title: "Rainfall Gauge",
    widget: const Rainfall(),
    index: 14,
    type: "UseCase",
    sourceCodePath: "lib/useCase/rainfall.dart",
  ),
  LinearGaugeUseCase(
    title: "Lemonade Gauge",
    widget: const LemonadeGauge(),
    index: 15,
    type: "UseCase",
    sourceCodePath: "lib/useCase/lemonade.dart",
  ),
  LinearGaugeUseCase(
    title: "API",
    widget: const LinearGaugePlayGround(),
    type: "API",
    index: 16,
  ),
  LinearGaugeUseCase(
    title: "Pointer API",
    widget: const PointerPlayGround(),
    type: "API",
    index: 17,
  ),
  LinearGaugeUseCase(
    title: "ValueBar API",
    widget: const ValueBarPlayGround(),
    type: "API",
    index: 18,
  ),
  LinearGaugeUseCase(
    title: "RangeLinearGauge API",
    widget: const RangeLinearGaugePlayGround(),
    type: "API",
    index: 19,
  ),
  LinearGaugeUseCase(
    title: "Ruler API",
    widget: const RulerPlayGround(),
    type: "API",
    index: 20,
  ),
];
