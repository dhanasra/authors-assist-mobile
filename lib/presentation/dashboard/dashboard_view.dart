import 'package:flutter/material.dart';
import 'package:mobile/global.dart';
import 'package:mobile/presentation/dashboard/widgets/template_item.dart';
import 'package:mobile/widgets/text_input.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
    
            Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text('Hi Dhana !', style: Theme.of(context).textTheme.headlineMedium,),
                        Text("Let's create with AI", style: Theme.of(context).textTheme.bodySmall,),
                        
                      ],
                    ),
                  ),
                
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ai-writer-44ea5.appspot.com/o/placeholders%2Falexander-hipp-iEEBWgY_6lA-unsplash.jpg?alt=media&token=0c9c5ae3-43dc-4cb2-a33e-2864ee907400'),
                  )
                
                ],
              ),

            const SizedBox(height: 32,),

            TextInput(hintext: 'Search templates', controller: TextEditingController()),

            const SizedBox(height: 16,),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Global.categories.length,
              itemBuilder: (_, index){

                var templates = Global.getTemplates(Global.categories[index]);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                      child: Text(Global.categories[index], style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor
                        )),
                    ),

                    ListView.separated(
                        itemCount: templates.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        itemBuilder: (_, index){
                          return TemplateItem(template: templates[index]);
                        },
                        separatorBuilder: (_, index){
                          return const SizedBox(height: 16,);
                        },
                    ),
                  ],
                );
              })
    
          ],
        ),
      ),
    );
  }
}