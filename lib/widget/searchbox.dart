import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBox extends ConsumerStatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends ConsumerState<SearchBox> {
  final FocusNode _searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: const BoxDecoration(),
      child: TextField(
        focusNode: _searchFocusNode,
        controller: searchController,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: colorScheme.onBackground),
        onTap: () {
          FocusScope.of(context).requestFocus(_searchFocusNode);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          fillColor: colorScheme.onSurface,
          filled: true,
          hintText: 'search',
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: colorScheme.onBackground),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          suffixIcon: _searchFocusNode.hasFocus
              ? IconButton(
                  onPressed: searchController.clear,
                  icon: const Icon(Icons.clear_sharp),
                )
              : Icon(
                  Icons.search_sharp,
                  color: colorScheme.onBackground,
                ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 64,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.onPrimary),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textInputAction: TextInputAction.search,
        onChanged: (value) {},
      ),
    );
  }
}
