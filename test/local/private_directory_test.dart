import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/data/local/private_directory.dart';
import 'package:path/path.dart' as p;

void main() {
  test('a stored path keeps its place inside the account folder', () {
    // iOS moves the container on updates; the tail still names the file.
    final relative = accountRelativePath(
      '/var/mobile/Containers/Data/Application/OLD-ID/Library/'
      'Application Support/accounts/user-1/documents/report.pdf',
      context: p.posix,
    );
    expect(relative?.userId, 'user-1');
    expect(relative?.parts, ['documents', 'report.pdf']);
  });

  test('paths outside an account folder are not relocated', () {
    expect(accountRelativePath('/tmp/report.pdf', context: p.posix), isNull);
    expect(
      accountRelativePath('/data/accounts/user-1', context: p.posix),
      isNull,
    );
    expect(
      accountRelativePath(
        '/data/accounts/user-1/../other/report.pdf',
        context: p.posix,
      ),
      isNull,
    );
  });
}
