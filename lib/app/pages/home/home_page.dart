import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/config/routes/route_name.dart';
import 'package:riverpod_skeleton/app/core/utils/app_colors.dart';
import 'package:riverpod_skeleton/app/core/utils/constants.dart';
import 'package:riverpod_skeleton/app/pages/goRouterTopics/route_parameter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Go Router Topics',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          ...goRouterProps
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      tileColor: AppColors.white,
                      title: Text(e),
                      onTap: () {
                        context.pushNamed(RouteName.params,
                            extra: Params(title: "Route Parameters"));
                      },
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
