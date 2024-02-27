
import 'package:flutter/material.dart';
import 'package:social_app/shared/components/constaints.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class CustomCardItemBuilder extends StatelessWidget {
  const CustomCardItemBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/positive-brunet-man-with-crossed-arms_1187-5797.jpg?t=st=1708914652~exp=1708918252~hmac=65b2c05d41d0102327202f6886da50a80fb024cc487091c8df8623a56016be05&w=740',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                'Ahmed Mohamed',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: defaultColor,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        Text('january 21, 2021 at 11:00 pm',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                        size: 18,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 0.6,
                color: Colors.grey,
              ),
            ),
            const Text(
              'Hey guys! How busy have y\'all   been so far? Well, I just came to say hi and ask if you guys need some help with English. If you guys do, I highly recommend you to follow this page on Instagram. ',
              textScaler: TextScaler.linear(1),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '#software',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '#flutter',
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/surprised-young-man-with-gesture-approval_1459-18293.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                          size: 17,
                        ),
                        Text(
                          '120',
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconBroken.Chat,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '120 comment',
                        style: TextStyle(fontSize: 9),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Container(
                width: double.infinity,
                height: 0.6,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/positive-brunet-man-with-crossed-arms_1187-5797.jpg?t=st=1708914652~exp=1708918252~hmac=65b2c05d41d0102327202f6886da50a80fb024cc487091c8df8623a56016be05&w=740',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'write a comment ...',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'like',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

