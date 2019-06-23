import 'package:notes/ui/bootstrap.dart';
import 'package:catcher/catcher_plugin.dart';

void main() async {
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  CatcherOptions profileOptions = CatcherOptions(
    NotificationReportMode(),
    [ConsoleHandler(), ToastHandler()],
    handlerTimeout: 10000,
  );

  Catcher(await boostrap(),
      debugConfig: debugOptions, profileConfig: profileOptions);

  // Chain.capture(() => runZoned(() async => runApp(await boostrap())));
}
