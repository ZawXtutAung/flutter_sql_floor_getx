// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMyDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder databaseBuilder(String name) =>
      _$MyDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MyDatabaseBuilder(null);
}

class _$MyDatabaseBuilder {
  _$MyDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MyDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MyDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MyDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MyDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MyDatabase extends MyDatabase {
  _$MyDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MyDatabaseDao? _dbdaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `mydb` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `job` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MyDatabaseDao get dbdao {
    return _dbdaoInstance ??= _$MyDatabaseDao(database, changeListener);
  }
}

class _$MyDatabaseDao extends MyDatabaseDao {
  _$MyDatabaseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _myDBTableInsertionAdapter = InsertionAdapter(
            database,
            'mydb',
            (MyDBTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'job': item.job
                },
            changeListener),
        _myDBTableUpdateAdapter = UpdateAdapter(
            database,
            'mydb',
            ['id'],
            (MyDBTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'job': item.job
                },
            changeListener),
        _myDBTableDeletionAdapter = DeletionAdapter(
            database,
            'mydb',
            ['id'],
            (MyDBTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'job': item.job
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MyDBTable> _myDBTableInsertionAdapter;

  final UpdateAdapter<MyDBTable> _myDBTableUpdateAdapter;

  final DeletionAdapter<MyDBTable> _myDBTableDeletionAdapter;

  @override
  Stream<List<MyDBTable>> getAlldb() {
    return _queryAdapter.queryListStream('SELECT * FROM mydb',
        mapper: (Map<String, Object?> row) => MyDBTable(
            row['name'] as String?, row['job'] as String?,
            id: row['id'] as int?),
        queryableName: 'mydb',
        isView: false);
  }

  @override
  Future<void> addDb(MyDBTable myDBTable) async {
    await _myDBTableInsertionAdapter.insert(
        myDBTable, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(MyDBTable myDBTable) async {
    await _myDBTableUpdateAdapter.update(myDBTable, OnConflictStrategy.abort);
  }

  @override
  Future<void> delData(MyDBTable myDBTable) async {
    await _myDBTableDeletionAdapter.delete(myDBTable);
  }
}
