import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/result_screen_controller.dart';

class ResultScreenView extends GetView<ResultScreenController> {
  ResultScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double tableHeight = screenHeight * 0.6; // 60% of screen height
    double dateColumnWidth = 100.0; // Fixed width for the date column

    // Get a list of all game names
    List<String> gameNames = controller.apiResponse.entries
        .map<List<String>>((entry) => entry.value
            .map<String>(
                (result) => result['game_details']['game_name'].toString())
            .toList())
        .expand((element) => element)
        .toSet()
        .toList();

    // List of digits from 0 to 9
    List<int> digits = List.generate(10, (index) => index);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: tableHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      dataRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      headingTextStyle: const TextStyle(
                        color: Colors.white,
                      ), // Set heading text color
                      columns: [
                        DataColumn(
                          label: SizedBox(
                            width: dateColumnWidth,
                            child: const Text(
                              'Date',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ), // Set heading text color
                        // Create a DataColumn for each game name
                        for (String gameName in gameNames)
                          DataColumn(
                            label: SizedBox(
                              width: dateColumnWidth,
                              child: Text(
                                gameName,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ), // Set heading text color
                      ],
                      rows: [
                        // Iterate over each date entry
                        for (var entry in controller.apiResponse.entries)
                          DataRow(
                            cells: [
                              // Display the date in the first cell
                              DataCell(
                                SizedBox(
                                  child: Text(
                                    entry.key,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ), // Set cell text color
                              // Iterate over each game name
                              for (String gameName in gameNames)
                                DataCell(
                                  // Display the winning numbers under each respective game column
                                  Text(
                                    entry.value
                                        .where((result) =>
                                            result['game_details']
                                                ['game_name'] ==
                                            gameName)
                                        .map<String>((result) =>
                                            result['winning_numbers']
                                                .toString()
                                                .replaceAll(
                                                    RegExp(r'[^\d\s]'), ' '))
                                        .join(', '),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: digits
                    .map(
                      (digit) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Call a function when a digit is tapped
                            controller.setSelectedDigit(digit);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$digit',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: gameNames
                    .map(
                      (gameName) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Call a function when a game name is tapped
                            // You can perform any action here, such as navigating to another screen
                            // or filtering the data based on the selected game name
                            // For example:
                            // controller.setSelectedGame(gameName);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                gameName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
