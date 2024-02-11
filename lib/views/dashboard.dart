import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:nse/models/AppTheme.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late final RxString selectedInstrument = 'NIFTY'.obs; // Use RxString

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: AppTheme.BACKGROUND_COLOR,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: FittedBox(
            child: Text(
              'National Stock Exchange of India',
              style: AppTheme.TITLE_STYLE,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
            ),
            child: FittedBox(
              child: Obx(
                () => CupertinoSlidingSegmentedControl(
                  groupValue: selectedInstrument.value,
                  thumbColor: AppTheme.COLOR_LIGHT,
                  backgroundColor: AppTheme.COLOR_DARK,
                  children: {
                    'NIFTY': Text(
                      'NIFTY',
                      style: selectedInstrument.value == 'NIFTY'
                          ? AppTheme.SEGMENTED_STYLE_ACTIVE
                          : AppTheme.SEGMENTED_STYLE_DISABLED,
                    ),
                    'FINNIFTY': Text(
                      'FINNIFTY',
                      style: selectedInstrument.value == 'FINNIFTY'
                          ? AppTheme.SEGMENTED_STYLE_ACTIVE
                          : AppTheme.SEGMENTED_STYLE_DISABLED,
                    ),
                    'BANKNIFTY': Text(
                      'BANKNIFTY',
                      style: selectedInstrument.value == 'BANKNIFTY'
                          ? AppTheme.SEGMENTED_STYLE_ACTIVE
                          : AppTheme.SEGMENTED_STYLE_DISABLED,
                    ),
                  },
                  onValueChanged: (String? instrument) =>
                      selectedInstrument.value = instrument ?? 'NIFTY',
                ),
              ),
            ),
          ),
          Slider(
            value: 0.0,
            min: 0.0,
            max: 100.0,
            onChanged: (double value) {},
            label: 'Strike Price',
          )
        ],
      ),
    );
  }
}
