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
  late final RxDouble strikePrice = 0.0.obs; // Use RxString

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
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
            Text(
              'Strike Price',
              textAlign: TextAlign.center,
              style: AppTheme.SECONDARY_TITLE_STYLE,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box_rounded,
                    color: AppTheme.COLOR_LIGHT,
                    size: 36,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '19500',
                      hintStyle: AppTheme.SEGMENTED_STYLE_ACTIVE,
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: size.width * 0.05,
                        bottom: 12,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.indeterminate_check_box_rounded,
                    color: AppTheme.COLOR_LIGHT,
                    size: 36,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
