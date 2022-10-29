void main() {
  List<int> numLinesNQuerys = [4, 4];
  List<List<int>> coordsLine = [
    [1, 3, 4, 2],
    [10, 3, 7, 4],
    [2, 3, 8, 3],
    [3, 5, 5, 4],

    // [0, 1, 3, 3],
    // [1, 5, 6, 5],
    // [5, 3, 2, 4],
    // [7, 4, 10, 2],
  ];
  List<int> coordsBallons = [
    4,
    9,
    8,

    // 2,
    // 5,
    // 8,
    // 6,
  ];

  int coordYBaloon = 0;
  int i = 0;
  double jubileu = 7;
  List<int> jubileuLinha = [];

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

      if (line - coordYBaloon > 0 &&
          jubileu > (line - coordYBaloon) &&
          coordsBallons[i] >= smallestCoordX &&
          coordsBallons[i] <= biggerCoordX) {
        jubileu = line - coordYBaloon;
        jubileuLinha = coordsLine[j];
      }
    }

    if (jubileuLinha.isEmpty) {
      print(coordsBallons[i]);
      coordYBaloon = 0;
      i++;
      jubileuLinha = [];
      jubileu = 7;
      continue;
    }

    if (jubileuLinha[1] == jubileuLinha[3]) {
      int coordX = coordsBallons[i];
      int coordYLine = jubileuLinha[1];

      print("$coordX, $coordYLine");

      coordYBaloon = 0;
      i++;
      jubileuLinha = [];
      jubileu = 7;
      continue;
    }

    if (!jubileuLinha.isEmpty) {
      coordsBallons[i] =
          jubileuLinha[3] < jubileuLinha[1] ? jubileuLinha[0] : jubileuLinha[2];
      coordYBaloon =
          jubileuLinha[3] < jubileuLinha[1] ? jubileuLinha[1] : jubileuLinha[3];
      jubileuLinha = [];
      jubileu = 7;
    }
  }
}
