import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ahlul_quran/controller.dart';
import 'package:test_ahlul_quran/second_page.dart';

class ChoicePage extends StatelessWidget {
  final controllers = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<Controller>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: Get.height * 0.05,
                width: Get.width,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor:
                      controllers.isChoose == 0 ? Colors.grey : Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: controllers.isChoose == 0
                      ? null
                      : () => Get.to(
                          SecondPage(price: controllers.isChoose.toString()),
                          transition: Transition.rightToLeft),
                  child: const Text("Next"),
                ),
              )),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Challenge Hilman",
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        backgroundColor: Colors.white,
        leading: const CloseButton(color: Colors.black54),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: controllers.listPoint.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                controllers.selected(controllers.listPoint[index]);
              },
              child: GetBuilder<Controller>(
                  builder: (controller) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: controllers.isChoose ==
                                        controllers.listPoint[index]
                                    ? Colors.green
                                    : Colors.grey.shade300)),
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://cdn-icons-png.flaticon.com/512/217/217853.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(controllers.listPoint[index].toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Rp. ${controllers.listPoint[index]}.000, 00",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )))),
    );
  }
}
