import 'dart:io';

void getPositionBallon(List<int> coordsBallons, List<List<int>> coordsLine) {
  int coordYBaloon = 0;
  int i = 0;
  double minorDistance = 10000001;
  List<int> lineWithMinorDistance = [];

  while (coordsBallons.length > i) {
    for (int j = 0; j < coordsLine.length; j++) {
      int coordInitYLine = coordsLine[j][1];
      int coordFinalYLine = coordsLine[j][3];
      int coordInitXLine = coordsLine[j][0];
      int coordFinalXLine = coordsLine[j][2];
      int smallestCoordX =
          coordInitXLine < coordFinalXLine ? coordInitXLine : coordFinalXLine;
      int biggerCoordX =
          coordInitXLine < coordFinalXLine ? coordFinalXLine : coordInitXLine;

      double m = (coordInitYLine - coordFinalYLine) /
          (coordInitXLine - coordFinalXLine);
      double line = coordInitYLine + (m * (coordsBallons[i] - coordInitXLine));
      //print('coordX: ${coordsBallons[i]} ${i}');

      if (line - coordYBaloon > 0 &&
          minorDistance > (line - coordYBaloon) &&
          coordsBallons[i] >= smallestCoordX &&
          coordsBallons[i] <= biggerCoordX) {
        //print('ooi');
        minorDistance = line - coordYBaloon;
        lineWithMinorDistance = coordsLine[j];
      }
    }

    if (lineWithMinorDistance.isEmpty) {
      print(coordsBallons[i]);
      coordYBaloon = 0;
      i++;
      lineWithMinorDistance = [];
      minorDistance = 10000001;
      continue;
    }

    if (lineWithMinorDistance[1] == lineWithMinorDistance[3]) {
      int coordX = coordsBallons[i];
      int coordYLine = lineWithMinorDistance[1];

      print("$coordX $coordYLine");

      coordYBaloon = 0;
      i++;
      lineWithMinorDistance = [];
      minorDistance = 10000001;
      continue;
    }

    if (!lineWithMinorDistance.isEmpty) {
      coordsBallons[i] = lineWithMinorDistance[3] <= lineWithMinorDistance[1]
          ? lineWithMinorDistance[0]
          : lineWithMinorDistance[2];
      coordYBaloon = lineWithMinorDistance[3] <= lineWithMinorDistance[1]
          ? lineWithMinorDistance[1]
          : lineWithMinorDistance[3];
      // print('oi');
      lineWithMinorDistance = [];
      minorDistance = 10000001;
    }
  }
}

void main() {
  List<List<int>> coordsBallons = [];
  List<List<List<int>>> coordsLines = [];
  while (true) {
    String content = stdin.readLineSync()!;

    if (content == null || content == '') {
      break;
    }

    List<int> op = content.split(' ').map((e) => int.parse(e)).toList();

    List<List<int>> coordLines = [];
    List<int> coordBallons = [];

    for (int i = 0; i < op[0]; i++) {
      //print('op: ${op[0]} $i');
      List<int> coordLine =
          stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();
      coordLines.add(coordLine);
    }

    for (int j = 0; j < op[1]; j++) {
      //print('op: ${op[1]} $j');
      int aux = int.parse(stdin.readLineSync()!.replaceAll(' ', ''));
      coordBallons.add(aux);
      //print(coordBallons);
    }

    coordsBallons.add(coordBallons);
    coordsLines.add(coordLines);
  }

  for (int k = 0; k < coordsBallons.length; k++) {
    getPositionBallon(coordsBallons[k], coordsLines[k]);
  }
}
