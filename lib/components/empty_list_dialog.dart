import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyListDialog extends StatelessWidget {
  const EmptyListDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/empty_list.svg'),
          const SizedBox(height: 20),
          Text(
            'The list is empty',
            style: TextStyle(
                color: const Color(0xFF37474F).withOpacity(.65),
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 1.1),
          )
        ],
      ),
    );
  }
}
