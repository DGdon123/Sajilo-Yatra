import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void sendMail() async {
  String username = 'mail@asbin.com.np';
  String password = 'Asbindulal1@';

  final smtpServer = SmtpServer(
    'asbin.com.np',
    port: 587,
    username: username,
    password: password,
  );

  //Create our Message
  final message = Message()
    ..from = Address(username, 'Sajilo Yatra')
    ..recipients.add('dipeshgurung797@gmail.com')
    ..subject = 'Flutter Mailer'
    ..text = 'Auto Mailing with Flutter with Custom Template';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
