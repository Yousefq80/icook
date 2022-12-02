import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook/widgets/recipe_detail_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context, builder: (context) => RecipeDetail());
          },
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.everydayhealth.com/images/diet-nutrition/34da4c4e-82c3-47d7-953d-121945eada1e00-giveitup-unhealthyfood.jpg?w=1110'),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Text(
                    'Recipe Name',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'By: Author Name',
                    style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'For over 200 years, we have been helping learners develop the skills and knowledge needed for their success. We are honored to be recognized as America’s MOST trusted company in 2022 by Newsweek. ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}
