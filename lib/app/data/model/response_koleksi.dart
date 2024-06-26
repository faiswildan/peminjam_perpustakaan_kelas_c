class ResponseKoleksi {
  ResponseKoleksi({
    num? status,
    String? message,
    List<DataKoleksi>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseKoleksi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(DataKoleksi.fromJson(v));
      });
    }
  }

  num? _status;
  String? _message;
  List<DataKoleksi>? _data;

  num? get status => _status;
  String? get message => _message;
  List<DataKoleksi>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataKoleksi {
  DataKoleksi({
    num? id,
    num? userId,
    num? bookId,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }) {
    _id = id;
    _userId = userId;
    _bookId = bookId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _book = book;
  }

  DataKoleksi.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  num? _id;
  num? _userId;
  num? _bookId;
  String? _createdAt;
  String? _updatedAt;
  Book? _book;

  num? get id => _id;
  num? get userId => _userId;
  num? get bookId => _bookId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_book != null) {
      map['book'] = _book!.toJson();
    }
    return map;
  }
}

class Book {
  Book({
    num? id,
    String? judul,
    String? image,
    String? penulis,
    String? penerbit,
    String? biografi,
    String? deskripsi,
    String? ebook,
    num? tahunTerbit,
    num? kategoriId,
    Kategori? kategori,
  }) {
    _id = id;
    _judul = judul;
    _image = image;
    _penulis = penulis;
    _penerbit = penerbit;
    _biografi = biografi;
    _deskripsi = deskripsi;
    _ebook = ebook;
    _tahunTerbit = tahunTerbit;
    _kategoriId = kategoriId;
    _kategori = kategori;
  }

  Book.fromJson(dynamic json) {
    _id = json['id'];
    _judul = json['judul'];
    _image = json['image'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _biografi = json['biografi'];
    _deskripsi = json['deskripsi'];
    _ebook = json['ebook'];
    _tahunTerbit = json['tahun_terbit'];
    _kategoriId = json['kategori_id'];
    _kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  num? _id;
  String? _judul;
  String? _image;
  String? _penulis;
  String? _penerbit;
  String? _biografi;
  String? _deskripsi;
  String? _ebook;
  num? _tahunTerbit;
  num? _kategoriId;
  Kategori? _kategori;

  num? get id => _id;
  String? get judul => _judul;
  String? get image => _image;
  String? get penulis => _penulis;
  String? get penerbit => _penerbit;
  String? get biografi => _biografi;
  String? get deskripsi => _deskripsi;
  String? get ebook => _ebook;
  num? get tahunTerbit => _tahunTerbit;
  num? get kategoriId => _kategoriId;
  Kategori? get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['judul'] = _judul;
    map['image'] = image;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['biografi'] = _biografi;
    map['deskripsi'] = _deskripsi;
    map['ebook'] = _ebook;
    map['tahun_terbit'] = _tahunTerbit;
    map['kategori_id'] = _kategoriId;
    if (_kategori != null) {
      map['kategori'] = _kategori!.toJson();
    }
    return map;
  }
}

class Kategori {
  Kategori({
    num? id,
    String? nama,
  }) {
    _id = id;
    _nama = nama;
  }

  Kategori.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
  }

  num? _id;
  String? _nama;

  num? get id => _id;
  String? get nama => _nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    return map;
  }
}
