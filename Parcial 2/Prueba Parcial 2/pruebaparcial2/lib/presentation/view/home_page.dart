import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/index.dart';
import '../viewmodels/photo_viewmodel.dart';
import '../widgets/photo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.9) {
        context.read<PhotoViewmodel>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: FondoApp.degradoPrincipal,
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight + 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Buscar por autor...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) =>
                    context.read<PhotoViewmodel>().search(value),
              ),
            ),
            Expanded(
              child: Consumer<PhotoViewmodel>(
                builder: (context, vm, _) {
                  if (vm.items.isEmpty && vm.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: vm.refresh,
                    color: Colors.white,
                    backgroundColor: ColorApp.primario,
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: vm.filteredItems.length + (vm.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= vm.filteredItems.length) {
                          return const Center(child: CircularProgressIndicator(color: Colors.white70));
                        }
                        return PhotoCard(photo: vm.filteredItems[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}