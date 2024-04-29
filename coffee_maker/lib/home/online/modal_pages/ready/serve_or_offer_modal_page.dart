import 'package:coffee_maker/home/online/view_model/store_online_view_model.dart';
import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ServeOrOfferModalPage {
  ServeOrOfferModalPage._();

  static WoltModalSheetPage build({required String coffeeOrderId}) {
    return WoltModalSheetPage(
      heroImage: const Image(
        image: AssetImage('lib/assets/images/coffee_is_ready.png'),
        fit: BoxFit.cover,
      ),
      stickyActionBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          children: [
            Builder(builder: (context) {
              final model = context.read<StoreOnlineViewModel>();
              return WoltElevatedButton(
                onPressed: () {
                  model.onCoffeeOrderStatusChange(coffeeOrderId);
                  Navigator.pop(context);
                },
                theme: WoltElevatedButtonTheme.secondary,
                child: const Text('Serve coffee'),
              );
            }),
            const SizedBox(height: 8),
            Builder(builder: (context) {
              return WoltElevatedButton(
                onPressed: () => WoltModalSheet.showNext(context),
                child: const Text('Offer recommendations'),
              );
            }),
          ],
        ),
      ),
      pageTitle: const ModalSheetTitle('The coffee is ready!'),
      trailingNavBarWidget: const WoltModalSheetCloseButton(),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 150),
        child: ModalSheetContentText(
          'Before serving, consider offering the customer some recommended additions',
        ),
      ),
    );
  }
}
