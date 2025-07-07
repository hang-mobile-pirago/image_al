part of 'widgets.dart';

class BBSScaffold extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final EdgeInsets? padding;
  final bool safeArea;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final Color? background;
  final Future<bool> Function()? onWillPop;
  final Widget? child;

  const BBSScaffold({
    super.key,
    this.appBar,
    this.padding,
    this.safeArea = true,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset = false,
    this.background,
    this.onWillPop,
    this.child,
  });

  @override
  State<BBSScaffold> createState() => _BBSScaffoldState();
}

class _BBSScaffoldState extends State<BBSScaffold> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor:  Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: widget.onWillPop,
        child: Scaffold(
          appBar: widget.appBar,
          backgroundColor: widget.background ?? Colors.white,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          extendBody: true,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          body: SafeArea(
            top: widget.safeArea,
            bottom: widget.safeArea,
            minimum: widget.padding ?? EdgeInsets.zero,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => FocusScope.of(context).unfocus(),
                child: widget.child),
          ),
          floatingActionButton: widget.floatingActionButton,
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
        ),
      ),
    );
  }
}

class BBSBaseController extends ChangeNotifier {
  late BuildContext context;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void update(Function update) {
    update();
    notifyListeners();
  }
}
