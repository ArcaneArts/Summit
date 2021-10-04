import 'package:app/util/l.dart';

typedef Future<T?> NullReplacer<T>();

class SummitRepository
{
  final String name;

  SummitRepository(this.name);

  Future<T?> offline<T>(Future<T?> f, {NullReplacer<T>? replacer}) async
  {
    if(replacer != null)
      {
        return f.then((value) {
          if(value == null)
            {
              return replacer();
            }

          return value;
        });
      }

    return f;
  }
}