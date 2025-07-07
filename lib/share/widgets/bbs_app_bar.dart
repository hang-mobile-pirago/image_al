part of 'widgets.dart';

class BbsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canPop;
  final bool isCenterTitle;
  final Widget? actionWidget;
  final Widget? leaderWidget;
  final dynamic result;
  final TextStyle? textStyle;
  final Color? background;
  final double? leadingWidth;

  const BbsAppBar({
    super.key,
    this.title = '',
    this.isCenterTitle = true,
    this.actionWidget,
    this.leaderWidget,
    this.canPop = true,
    this.result,
    this.textStyle,
    this.background,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BBSTextView(
        content: title,
        textStyle: textStyle ?? context.style14(fontWeight: FontWeight.w500),
      ),
      elevation: 1,
      centerTitle: isCenterTitle,
      backgroundColor: background ?? Colors.white,
      surfaceTintColor: Colors.transparent,
      actions: actionWidget != null ? [actionWidget!] : null,
      leadingWidth: leadingWidth ?? (canPop ? 50 : 0),
      leading: canPop
          ? leaderWidget ??
              BBSGesture(
                onTap: () => Navigator.pop(context, result),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.pinkAccent,
                  ),
                ),
              )
          : Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
