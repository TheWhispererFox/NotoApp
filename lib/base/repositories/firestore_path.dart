class FirestorePath {
  FirestorePath({
    required this.folderPath,
    required this.collectionName,
    this.versionNumber = 1,
  });

  final String collectionName;
  final String folderPath;
  final int versionNumber;

  String get version => "v$versionNumber";

  String get fullPath => [folderPath, collectionName, version].join("/");
}
