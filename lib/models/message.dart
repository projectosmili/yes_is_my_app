enum FromWho { me, her, hers }

class Message {
  final String text;
  final FromWho fromWho;

  const Message({required this.text, required this.fromWho});
}
