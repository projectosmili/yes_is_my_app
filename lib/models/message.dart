enum FromWho { me, her, hers }

class message {
  final String text;
  final FromWho fromWho;

  const message({required this.text, required this.fromWho});
}
