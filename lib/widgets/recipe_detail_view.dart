import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Recipe Title',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle,
                    ),
                    Text(
                      'By: Author Name',
                      style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        'https://images.everydayhealth.com/images/diet-nutrition/34da4c4e-82c3-47d7-953d-121945eada1e00-giveitup-unhealthyfood.jpg?w=1110',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'For over 200 years, we have been helping learners develop the skills and knowledge needed for their success. We are honored to be recognized as America’s MOST trusted company in 2022 by Newsweek. ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Ingredients',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle
                          .copyWith(
                            fontSize: 25,
                          ),
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        child: Text('Go back'),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
