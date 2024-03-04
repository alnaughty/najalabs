import 'package:najalabs/models/item_data.dart';
import 'package:najalabs/models/item_data_slider.dart';

mixin class LandingUIHelper {
  final List<ItemDataSlider> tcontent = [
    ItemDataSlider(
      name: "Treble",
      icon: "assets/icons/treble.svg",
      level: 0.0,
    ),
    ItemDataSlider(
      name: "Bass Boost",
      icon: "assets/icons/bass.svg",
      level: 0.0,
    ),
  ];

  final List<ItemData> eqcontent = [
    ItemData(
      name: "Outdoor",
      icon: "assets/icons/Outdoor.svg",
      isActive: false,
    ),
    ItemData(
      name: "Indoor",
      icon: "assets/icons/indoor.svg",
      isActive: false,
    ),
  ];
  final List<ItemData> micontent = [
    ItemData(
      name: "Public Address",
      icon: "assets/icons/Public Adress.svg",
      isActive: false,
    ),
    ItemData(
      name: "Karaoke",
      icon: "assets/icons/Karaoke.svg",
      isActive: false,
    ),
  ];
  final List<ItemData> micontent2 = [
    ItemData(
      name: "Mic 1",
      icon: "assets/icons/Mic.svg",
      isActive: false,
    ),
    ItemData(
      name: "Mic 2",
      icon: "assets/icons/Mic.svg",
      isActive: false,
    ),
  ];
  final List<ItemData> mscontent = [
    ItemData(
      name: "Streaming",
      icon: "assets/icons/Streaming.svg",
      isActive: false,
    ),
    ItemData(
      name: "Digital",
      icon: "assets/icons/Digital.svg",
      isActive: false,
    ),
    ItemData(
      name: "Analog",
      icon: "assets/icons/Analog.svg",
      isActive: false,
    ),
  ];
  final List<ItemDataSlider> miccontents = [
    ItemDataSlider(
      name: "Mic 1 & 2 Max Level",
      icon: "assets/icons/Mic.svg",
      level: .5,
    ),
    ItemDataSlider(
      name: "Balance",
      icon: "assets/icons/Balance.svg",
      level: .5,
    ),
  ];
  final List<ItemDataSlider> mscontent2 = [
    ItemDataSlider(
      name: "Streaming Max Level",
      icon: "assets/icons/Streaming.svg",
      level: 1.0,
    ),
    ItemDataSlider(
      name: "Digital Max Level",
      icon: "assets/icons/Digital.svg",
      level: 1.0,
    ),
    ItemDataSlider(
      name: "Analog Max Level",
      icon: "assets/icons/Analog.svg",
      level: 1.0,
    ),
  ];
}
