import 'package:flutter/material.dart';
import '../../../data/model/drift_databse.dart';
import 'package:provider/provider.dart';

import '../../../data/constants.dart';
import '../../../domain/logicpart/logictable.dart';

class TableView extends StatelessWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userlist = Provider.of<AppDataBase>(context, listen: false);

    return FutureBuilder<List<UserTableData>>(
      future: userlist.getuserlist(),
      builder: (context, snapshot) {
        if (!userlist.loading) {
          return (userlist.data.isEmpty)
              ? const Center(
                  child: Text("NO Data"),
                )
              : Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TableGanrate.tableFetch(userlist.data, context, size),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Showing  1 of ${userlist.data.length}  Entries"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              child: const Text("Previous"),
                              style: TextButton.styleFrom(
                                  primary: kPrimaryColor,
                                  side: const BorderSide(color: kPrimaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {},
                              child: const Text(
                                "1",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              child: const Text("Next"),
                              style: TextButton.styleFrom(
                                  primary: kPrimaryColor,
                                  side: const BorderSide(color: kPrimaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                        ],
                      ),
                      sizebox5
                    ],
                  ),
                );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
