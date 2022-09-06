
//import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:simple_application/domain/entity/pagination_entity.dart';

import '../../../common/constants/app_constants.dart';

class ItemWidget extends StatelessWidget {
  final PaginationEntity data;
  final int index;
  const ItemWidget({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 66,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 18)),
                ),
              ),
            kSpacingWidth24,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kSpacingHeight4,
                Text(data.title??'',style: const TextStyle(fontSize: 18)),
                Text(data.content??''),
                kSpacingHeight4,
              ],
            ),
          ],
        ),
      ),
    );
  }
}