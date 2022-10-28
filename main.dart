void main() {
  List<int> numLinesNQuerys = [4, 4];
  List<List<int>> coordsLine = [
    [0, 1, 3, 3],
    [1, 5, 6, 5],
    [5, 3, 2, 4],
    [7, 4, 10, 2],
  ];
  List<int> coordsBallons = [
    2,
    5,
    8,
    6,
  ];

  List<String> result = [];
  int coordYBaloon = 0;
  int i = 0;

  while (coordsBallons.length > i) {
    coordYBaloon++;
    // int coordXBallon = coordsBallons[i];

    for (int j = 0; j < coordsLine.length; j++) {
      int coordInitYLine = coordsLine[j][1];
      int coordFinalYLine = coordsLine[j][3];
      int coordInitXLine = coordsLine[j][0];
      int coordFinalXLine = coordsLine[j][2];
      int smallestCoordX =
          coordInitXLine < coordFinalXLine ? coordInitXLine : coordFinalXLine;
      int biggerCoordX =
          coordInitXLine < coordFinalXLine ? coordFinalXLine : coordInitXLine;

      if (((coordYBaloon == coordInitYLine) ||
              (coordYBaloon == coordFinalYLine)) &&
          ((coordsBallons[i] >= smallestCoordX) &&
              (coordsBallons[i] <= biggerCoordX))) {
        if (coordInitYLine == coordFinalYLine) {
          int coordX = coordsBallons[i];
          print("$coordX, $coordYBaloon");
          coordYBaloon = 0;
          i++;
          break;
        } else {
          coordsBallons[i] = coordFinalYLine < coordInitYLine
              ? coordInitXLine
              : coordFinalXLine;
          coordYBaloon = coordFinalYLine < coordInitYLine
              ? coordInitYLine
              : coordFinalYLine;
        }
      }
    }
  }
}
