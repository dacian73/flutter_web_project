import 'package:flutter/material.dart';

const largePadding = 20.0;
const smallPadding = 10.0;
const maxWidth = 1232.0;
const animateDuration = Duration(milliseconds: 200);
const alb = Color.fromRGBO(35, 142, 188, 1);
const negru = Color.fromARGB(255, 28, 16, 32);
const mov = Color.fromARGB(217, 45, 6, 79);
const albastru = Color.fromRGBO(150, 205, 251, 1);
const roz = Color.fromRGBO(245, 194, 231, 1);
const albastru_cer = Color.fromARGB(168, 225, 235, 245);
const turcoaz = Color.fromRGBO(50, 191, 191, 1);
const piersica = Color.fromRGBO(248, 189, 150, 1);
const galben = Color.fromARGB(235, 252, 246, 206);
const maro = Color.fromRGBO(190, 128, 92, 1);

//temporary hardcoded texts
const text1 = '22 ianuarie 2019';
const text2 = 'Atelier de terapie prin artă';
const text3 =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

final List<String> imgList = [
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/88248437_2924064707654454_2782504471203151872_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=xaa_1MoeqokAX-JGzwm&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT_kWfROcChC4a6z0zJHpqDrO2GM8Lv0QrjLY48KVfK-mw&oe=63516D7F',
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/184897481_4141167619277484_4118002369619974176_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=WdAEcA-ixHMAX9Y3RsO&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT_Crk4Pwj1c8TGf38uO2ZeQz7yRukXBZKbqLmACYhB1dQ&oe=6352432E',
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/204687100_4263918657002379_6247458336965572615_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=YHwDkRhQE_0AX_Kb1L3&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT-lDglZ-tPbB4QjTfVAlUWPhjwpNBil1qYZBiPfGYTWhg&oe=635220AA',
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/120363850_3496662050394714_5977762163326960923_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=i9IJ5mZeyB8AX-9-iz5&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT8zt42hFQopx1SeMPq5J09tCD3FohOUNzRRlS42nDtuwQ&oe=635061E8',
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/89611245_2945803298813928_8801626361719422976_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=hLtt02GZPp8AX_mlQgE&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT84XFKU2Reb0xjUryjadVDoqdZt7gQalQBjDg3BhCQkKQ&oe=635146FB',
  'https://scontent.ftgm1-1.fna.fbcdn.net/v/t1.6435-9/89377638_2935492659844992_5320877078541762560_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=DCf-gWX1BxcAX9fS56n&_nc_ht=scontent.ftgm1-1.fna&oh=00_AT8g6-22ZRGY0zmSIN6n2DX1kdbQFU_zr1-AGlUNA1cx4w&oe=6351002C'
];
