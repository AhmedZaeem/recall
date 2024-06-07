import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../l10n/l10n.dart';

class FlashcardItem extends StatelessWidget {
  const FlashcardItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 12.h),
                Text(
                  'Flashcard Title',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Flashcard Description',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: -4.h,
            end: -16.w,
            child: PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text(
                      l10n.edit,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      l10n.delete,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
