part of '../home_screen.dart';

class OverlaySearchIdeal extends StatefulWidget {
  const OverlaySearchIdeal({super.key});

  @override
  State<StatefulWidget> createState() => _OverlaySearchIdeal();
}

class _OverlaySearchIdeal extends State<OverlaySearchIdeal> {
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;

  List<String> _allSuggestions = [
    'realistic',
    'anime',
  ];
  List<String> _filteredSuggestions = [];

  void _showOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: _filteredSuggestions.map((suggestion) {
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    _controller.text = suggestion;
                    _removeOverlay();
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _updateSuggestions(String input) {
    if (input.isEmpty) {
      _filteredSuggestions = [];
      _removeOverlay();
      return;
    }

    _filteredSuggestions = _allSuggestions
        .where((item) => item.toLowerCase().contains(input.toLowerCase()))
        .toList();

    if (_filteredSuggestions.isNotEmpty && _focusNode.hasFocus) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText: 'Search style',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          _updateSuggestions(value);
          context.read<HomeController>().setStyle(value);
        },
        onEditingComplete: _removeOverlay,
      ),
    );
  }
}
