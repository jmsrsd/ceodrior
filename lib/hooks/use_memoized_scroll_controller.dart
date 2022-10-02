import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useMemoizedScrollController() {
  final scrollOffset = useState(0.0);

  final scrollController = useScrollController(
    initialScrollOffset: scrollOffset.value,
    keys: [scrollOffset.value],
  );

  useEffect(() {
    void listener() => scrollOffset.value = scrollController.offset;
    scrollController.addListener(listener);
    return () => scrollController.removeListener(listener);
  }, [scrollController, scrollOffset.value]);

  return scrollController;
}
