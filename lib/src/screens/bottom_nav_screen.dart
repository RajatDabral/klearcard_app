import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klearcard_app/src/theme/styles.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  ValueNotifier<int> _selectedIndex;

  final List<Map<IconData, String>> _bottomItems = [
    {Icons.account_balance_wallet: "Wallet"},
    {Icons.group: "Teams"},
    {Icons.note_add: "Requests"},
    {Icons.sort: "More"}
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = ValueNotifier<int>(0);
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavHeight = MediaQuery.of(context).size.height * 0.08;
    return Container(
      color: Colors.white,
      height: bottomNavHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _bottomItems
                  .asMap()
                  .entries
                  .map(
                    (mE) => GestureDetector(
                      onTap: () => _selectedIndex.value = mE.key,
                      child: _buildBottomItem(mE.value, mE.key),
                    ),
                  )
                  .toList()),
          Container(
            height: 5.0,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2.5)),
          )
        ],
      ),
    );
  }

  Widget _buildBottomItem(Map<IconData, String> mE, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, selectedIndex, child) => Container(
        child: Column(
          children: <Widget>[
            Icon(
              mE.keys.first,
              color:
                  selectedIndex == index ? Colors.blue[800] : Colors.grey[400],
            ),
            Text(
              mE.values.first,
              style: selectedIndex == index
                  ? KStyles.bottomItem
                  : KStyles.bottomItem.copyWith(
                      color: Colors.grey[400],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
