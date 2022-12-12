import 'package:chat_app/shared/controllers/base_controller.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class WidgetState<T extends BaseController> extends HookWidget {
  final T controller = KiwiContainer().resolve<T>();

  WidgetState({super.key});
}
