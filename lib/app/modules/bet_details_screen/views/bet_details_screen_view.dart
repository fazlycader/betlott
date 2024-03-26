import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/model_item_cart.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:getx_skeleton/utils/default_dialogue_widget.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/bet_details_screen_controller.dart';

class BetDetailsScreenView extends GetView<BetDetailsScreenController> {
  const BetDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetDetailsScreenController>(
      builder: (logic) {
        return MyWidgetsAnimator(
          apiCallStatus: logic.apiCallStatus,
          loadingWidget: () {
            return Scaffold(
              body: Center(child: getLoadingIndicator(msg: 'Loading Data')),
            );
          },
          errorWidget: () {
            return Scaffold(
              body: Center(child: getLoadingIndicator(msg: 'Please Try Again')),
            );
          },
          successWidget: () {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: CircleAvatar(
                                backgroundColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                radius: 20.0,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: MyStyles.getIconTheme(isLightTheme: MyTheme().getThemeIsLight).color,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Game Name',
                                style: MyStyles.getTextTheme(isLightTheme: MyTheme().getThemeIsLight).titleLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.dialog(
                                    Dialog(
                                      insetPadding: const EdgeInsets.all(25),
                                      backgroundColor:
                                          MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style
                                    ?.copyWith(backgroundColor: const MaterialStatePropertyAll(Colors.green)),
                                child: const Text("Rules"),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Close Time"),
                                  Obx(
                                    () => Text(
                                      logic.timerController.durationString.value,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: MyStyles.getScaffoldColor(isLightTheme: MyTheme().getThemeIsLight),
                              ),
                              child: TabBar(
                                controller: logic.digitTypesTabController,
                                isScrollable: false,
                                indicator: BoxDecoration(
                                  color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelPadding: EdgeInsets.zero,
                                unselectedLabelColor: MyTheme().getThemeIsLight ? Colors.black : Colors.white70,
                                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                                tabs: [
                                  for (final option in const ['1D', '2D', '3D', '4D']) Text(option)
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TabBar(
                                controller: logic.betTypesTabController,
                                isScrollable: false,
                                indicator: BoxDecoration(
                                  color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelPadding: EdgeInsets.zero,
                                unselectedLabelColor: MyTheme().getThemeIsLight ? Colors.black : Colors.white70,
                                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                                tabs: [for (final option in logic.betTypesOptions) Text(option)],
                              ),
                            ),
                            const SizedBox(height: 30),
                            if (logic.digitTypesTabIndex.value == 2 || logic.digitTypesTabIndex.value == 3) ...[
                              Text(
                                "Select ticket price",
                                style: TextStyle(
                                  color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TabBar(
                                  controller: logic.priceTabController,
                                  indicator: BoxDecoration(
                                    color: MyStyles.getPrimaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  unselectedLabelColor: MyTheme().getThemeIsLight ? Colors.black : Colors.white70,
                                  tabs: [for (final option in logic.priceOptions) Text(option)],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Winning Amount",
                                style: TextStyle(
                                    color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                              ),
                              const SizedBox(height: 10),
                              Obx(() => Column(
                                    children: [
                                      ...getWinningAmountWidgets(
                                          logic.digitTypesTabIndex.value, logic.priceTabIndex.value),
                                    ],
                                  )),
                            ] else
                              Container(
                                decoration: BoxDecoration(
                                  color: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Ticket Price",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          "₹12",
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Winning Amount",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          logic.digitTypesTabIndex.value == 0 ? "₹100" : "₹1,000",
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            const SizedBox(height: 20),
                            Text(
                              "Enter your number",
                              style:
                                  TextStyle(color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [...getTextFields(logic, context)],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Quantity",
                              style:
                                  TextStyle(color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight)),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  SmallButton(onTap: logic.remove5Tickets, text: "-5"),
                                  const SizedBox(width: 10),
                                  SmallButton(onTap: logic.remove1Ticket, text: "-"),
                                  const SizedBox(width: 15),
                                  DigitTextField(
                                    logic.digitsControllers[4],
                                    enableMultipleLine: true,
                                  ),
                                  const SizedBox(width: 15),
                                  SmallButton(onTap: logic.add1Ticket, text: "+"),
                                  const SizedBox(width: 10),
                                  SmallButton(onTap: logic.add5Tickets, text: "+5"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "₹${logic.availableBalance}",
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                      ),
                                      Text(
                                        "Available Balance",
                                        style: TextStyle(
                                          color: MyStyles.getSubtitleColor(isLightTheme: MyTheme().getThemeIsLight),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: logic.addToCart,
                                  label: Text(
                                    "Add to Cart",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: const Icon(Icons.shopping_cart_outlined, size: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      if (logic.cartItems.isNotEmpty) ...[
                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                            border: Border.all(
                              color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: MyTheme().getThemeIsLight ? Colors.black : Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Game Name",
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      ("₹${logic.totalAmount.value}"),
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ItemCart(logic.cartItems[index], () {
                                    logic.deleteFromCart(logic.cartItems[index]);
                                  });
                                },
                                itemCount: logic.cartItems.length,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Total Tickets",
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      logic.totalTickets.value.toString(),
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                          child: ElevatedButton(
                            onPressed: () {
                              bool lowBalance = logic.availableBalance < logic.totalAmount.value;

                              showCustomDialogue(
                                  title: lowBalance ? "Insufficient Balance" : "Bet Placed",
                                  description: lowBalance
                                      ? "You don't have sufficient balance in your account to place this bet"
                                      : "Your bet has been placed successfully",
                                  icon: lowBalance ? Icons.account_balance_wallet : Icons.stars_rounded,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Get.toNamed(lowBalance ? Routes.DEPOSIT_SCREEN : Routes.MY_BET_SCREEN);
                                  },
                                  buttonText: lowBalance ? "Recharge" : "Ok");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Place Bet",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ItemCart extends StatelessWidget {
  final ModelItemCart item;
  final Function()? onDeleteTapped;

  const ItemCart(this.item, this.onDeleteTapped, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: MyStyles.getScaffoldColor(isLightTheme: MyTheme().getThemeIsLight),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyStyles.getContainerColor(isLightTheme: MyTheme().getThemeIsLight),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.digitsName} - ${item.digits}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "₹${item.priceString}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                item.ticketsCountString,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            IconButton(
              onPressed: onDeleteTapped,
              icon: const Icon(Icons.delete_outline_outlined),
              splashRadius: 20,
              visualDensity: VisualDensity.compact,
            )
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const SmallButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: const Size(35, 35),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size.zero,
        backgroundColor: MyStyles.getSmallButtonColor(isLightTheme: MyTheme().getThemeIsLight),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
      ),
    );
  }
}

getTextFields(BetDetailsScreenController logic, BuildContext context) {
  return [
    // Render it for every digit game
    DigitTextField(
      logic.digitsControllers[0],
      focusNode: logic.focusNodes[0],
      onChanged: (value) => value.isNotEmpty
          ? logic.digitTypesTabIndex.value > 0
              ? logic.focusNodes[1].requestFocus()
              : FocusScope.of(context).unfocus()
          : null,
    ),
    if (logic.digitTypesTabIndex.value >= 1) ...[
      // Render it for 2 digit and upward games
      const SizedBox(width: 10),
      DigitTextField(
        logic.digitsControllers[1],
        focusNode: logic.focusNodes[1],
        onChanged: (value) => value.isNotEmpty
            ? logic.digitTypesTabIndex.value > 1
                ? logic.focusNodes[2].requestFocus()
                : FocusScope.of(context).unfocus()
            : null,
      ),
    ],
    if (logic.digitTypesTabIndex.value >= 2) ...[
      // Render it for 3 digit and upward games
      const SizedBox(width: 10),
      DigitTextField(
        logic.digitsControllers[2],
        focusNode: logic.focusNodes[2],
        onChanged: (value) => value.isNotEmpty
            ? logic.digitTypesTabIndex.value > 2
                ? logic.focusNodes[3].requestFocus()
                : FocusScope.of(context).unfocus()
            : null,
      ),
    ],
    if (logic.digitTypesTabIndex.value >= 3) ...[
      // Render it for 4 digit and upward games
      const SizedBox(width: 10),
      DigitTextField(
        logic.digitsControllers[3],
        focusNode: logic.focusNodes[3],
        onChanged: (value) => value.isNotEmpty ? FocusScope.of(context).unfocus() : null,
      ),
    ]
  ];
}

class DigitTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enableMultipleDigit;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool isLast;

  const DigitTextField(this.controller,
      {this.focusNode, bool? enableMultipleLine, this.onChanged, Key? key, bool? isLast})
      : enableMultipleDigit = enableMultipleLine ?? false,
        isLast = isLast ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        style: Theme.of(context).textTheme.headlineSmall,
        keyboardType: TextInputType.number,
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(enableMultipleDigit ? null : 1)
        ],
        cursorHeight: 20,
        decoration: InputDecoration(
          fillColor: MyStyles.getScaffoldColor(isLightTheme: MyTheme().getThemeIsLight),
          isDense: true,
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(5),
          filled: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

List<Widget> getWinningAmountWidgets(int gameTypesTabIndex, int priceTabIndex) {
  if (gameTypesTabIndex == 2) {
    // 3 digit game is selected
    if (priceTabIndex == 0) {
      // Price 12 is selected in 3 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹5,000"),
            SizedBox(width: 10),
            WinningAmount("Last 2 digit - ₹100"),
          ],
        )
      ];
    } else if (priceTabIndex == 1) {
      // Price 25 is selected in 3 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹10,000"),
            SizedBox(width: 10),
            WinningAmount("Last 2 digit - ₹1000"),
          ],
        )
      ];
    } else if (priceTabIndex == 2) {
      // Price 30 is selected in 3 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹14,000"),
            SizedBox(width: 10),
            WinningAmount("Last 2 digit - ₹500"),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            WinningAmount("Last 1 Digit - ₹50"),
          ],
        )
      ];
    } else if (priceTabIndex == 3) {
      // Price 60 is selected in 3 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹28,000"),
            SizedBox(width: 10),
            WinningAmount("Last 2 digit - ₹1,000"),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            WinningAmount("Last 1 Digit - ₹100"),
          ],
        ),
      ];
    }
  } else {
    // 4 digit game is selected
    if (priceTabIndex == 0) {
      // Price 20 is selected in 4 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹100,000"),
          ],
        )
      ];
    } else if (priceTabIndex == 1) {
      // Price 95 is selected in 4 digit game
      return [
        const Row(
          children: [
            WinningAmount("Full - ₹500,000"),
            SizedBox(width: 10),
            WinningAmount("Last 3 digit - ₹9,500"),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            WinningAmount("Last 2 Digit - ₹1,000"),
            SizedBox(width: 10),
            WinningAmount("Last 1 digit - ₹100"),
          ],
        ),
      ];
    }
  }
  return [];
}

class WinningAmount extends StatelessWidget {
  final String text;

  const WinningAmount(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [Colors.green, LightThemeColors.gradientGreenColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
