String encrypt(String msg, int k) {
  String cipher = '';
  for (int i = 0; i < msg.length; i++) {
    cipher += a[(a.indexOf(msg[i]) + (i + 1) * k) % 27];
  }

  return cipher;
}

String decrypt(String msg, int k) {
  String plain = '';
  for (int i = 0; i < msg.length; i++) {
    plain += a[(a.indexOf(msg[i]) - (i + 1) * k) % 27];
  }

  return plain;
}

int key(String msg) {
  int k = 0;
  for (int i = 0; i < msg.length; i++) {
    k += a.indexOf(msg[i]);
  }
  return k;
}

List<String> a = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
  ' ',
];
