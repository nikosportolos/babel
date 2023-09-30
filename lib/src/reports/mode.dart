enum ReportDisplayMode {
  grid('Data Grid'),
  tree('Tree View'),
  json('JSON');

  const ReportDisplayMode(this.title);
  final String title;
}

enum ReportMode {
  all,
  missing,
  unused;
}
