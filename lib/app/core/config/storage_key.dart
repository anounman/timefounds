enum StorageKey {
  userKey,
  tokenKey;

  String get key {
    switch (this) {
      case StorageKey.userKey:
        return 'USER';
      case StorageKey.tokenKey:
        return 'TOKEN';
    }
  }
}
