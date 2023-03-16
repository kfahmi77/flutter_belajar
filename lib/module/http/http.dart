import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';
import 'package:flutter_belajar/module/http/services.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';
import 'http_model.dart';

class HttpWidget extends StatefulWidget {
  const HttpWidget({super.key});

  @override
  State<HttpWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HttpWidget> {
  final List<Galleries> _photos = [];
  int _offset = 0;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return AppbarSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter http'),
        ),
        drawer: const NavigationAppDrawer(),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
            itemCount: _photos.length + 1,
            itemBuilder: (context, index) {
              if (index == _photos.length) {
                return _buildLoadMoreButton();
              }
              Galleries photo = _photos[index];
              return ListTile(
                leading: Image.network(photo.thumbnailUrl!),
                title: Text(photo.title!),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      _offset = 0;
      _photos.clear();
      _hasMore = true;
    });
    _loadMore();
  }

  Widget _buildLoadMoreButton() {
    if (!_hasMore) {
      return Container();
    }
    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 40.0,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: _loadMore,
          child: const Text('Load more'),
        ),
      ),
    );
  }

  Future<void> _loadMore() async {
    if (!_hasMore) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final newPhotos = await fetchPhotos(offset: _offset, limit: 5);
      setState(() {
        _isLoading = false;
        _offset += 5;
        _photos.addAll(newPhotos);
        if (newPhotos.length < 5) {
          _hasMore = false;
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Koneksi gagal")));
    }
  }
}
