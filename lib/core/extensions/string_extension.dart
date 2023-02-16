extension StringExtension on String {
  truncateText(int limit) {
    if (length > limit) {
      return '${substring(0, limit)}...';
    }
    return this;
  }
}
