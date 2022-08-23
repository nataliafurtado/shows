import 'package:design_system/atom/card/link_card_widget.dart';
import 'package:entities/shows/alias.dart';
import 'package:flutter/material.dart';

class ListOfLinkCardsWidget extends StatelessWidget {
  const ListOfLinkCardsWidget({
    Key? key,
    required this.aliases,
  }) : super(key: key);
  final List<Alias> aliases;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: aliases.length,
        itemBuilder: (ctx, index) {
          return LinkCardWidget(
            title: aliases[index].originalURL,
            subTitle: aliases[index].shortURL,
          );
        },
      ),
    );
  }
}
