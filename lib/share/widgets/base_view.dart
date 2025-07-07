part of 'widgets.dart';


abstract class BaseView<T extends BBSBaseController> extends StatelessWidget {
  const BaseView({
    super.key,
    this.controller,
  });

  final T? controller;

  @override
  Widget build(BuildContext context) {
    return controller == null
        ? builderChild(context)
        : ChangeNotifierProvider<T>(
      create: (ctx) {
        controller!.context = ctx;
        initState.call(ctx, controller as T);
        return controller!;
      },
      builder: (context, child) => Consumer<T>(
        builder: (ctx, controller, _) {
          return builderProvider(ctx, controller);
        },
      ),
    );
  }

  /// Build with a controller
  Widget builderProvider(BuildContext context, T controller);

  /// Build without Provider
  Widget builderChild(BuildContext context);

  void initState(BuildContext context, T? controller);
}
