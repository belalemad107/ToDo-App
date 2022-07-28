import 'package:flutter/material.dart';
import 'package:to_do/features/add_task/presentation/pages/add_task_page.dart';
import 'package:to_do/features/board_screen/presentation/widgets/board_button.dart';
import 'package:to_do/features/schedule/presentation/pages/home.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: 15, left: 15),
              child: Text(
                'Board',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.calendar_month,
                  ),
                ),
              )
            ],
            bottom: TabBar(isScrollable: true, tabs: [
              Tab(
                child: Container(
                    child: const Text(
                  'All',
                )),
              ),
              Tab(
                child: Container(child: Text('Completed')),
              ),
              Tab(
                child: Container(child: Text('Incomplete')),
              ),
              Tab(
                child: Container(child: Text('Favourites')),
              ),
            ]),
          ),
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .75,
                child: TabBarView(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          'All Tasks',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Incompleted Tasks',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Favorite Tasks',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BoardButton(
                label: 'Add Task',
                onTab: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTaskPage()));
                },
              )
            ],
          )),
    );
  }
}

// class BoardScreen extends StatefulWidget {
//   const BoardScreen({super.key});

//   @override
//   State<BoardScreen> createState() => _BoardScreenState();
// }

// class _BoardScreenState extends State<BoardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(50.0),
//         child: CustomAppbar(
//           title: 'Board',
//           actions: Icons.calendar_month,
          
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   const Divider(
//                     color: Colors.grey,
//                     thickness: 1 / 2,
//                   ),
//                   const TabBarView(
//                     controller: _tabBarController,
//                     children: [
//                     Center(child: Text('All Tasks')),
//                     Center(
//                       child: Text('Completed Tasks'),
//                     ),
//                     Center(
//                       child: Text('Icompleted Tasks'),
//                     ),
//                     Center(child: Text('Favourite Tasks')),
//                   ]),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
