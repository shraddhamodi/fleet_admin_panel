import 'package:fleet_admin_panel/utils/arch_utils/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import '../../app_themes.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {Key? key, required this.isLoading, required this.message, this.color})
      : super(key: key);

  final bool isLoading;
  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Material(
            color: color ?? AppThemes.black.withOpacity(0.2),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: color ?? AppThemes.black.withOpacity(0.2),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const CircularProgressIndicator(),
                          const VSpace(20),
                          Flexible(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
