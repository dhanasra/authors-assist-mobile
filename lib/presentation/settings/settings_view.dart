import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/presentation/settings/settings_viewmodel.dart';
import 'package:mobile/presentation/settings/widgets/settings_option.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  late SettingsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SettingsViewModel(context)..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            Text('ACCOUNT', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 16),
            SettingsOption(
              icon: Icons.person_outline, 
              text: 'Update Profile', 
              onPressed: (){}
            ),
            const SizedBox(height: 16),
            SettingsOption(
              icon: Icons.alternate_email, 
              text: 'Verify Email', 
              onPressed: (){}
            ),
            const SizedBox(height: 16),
            SettingsOption(
              icon: FontAwesomeIcons.crown, 
              text: 'Upgrade Plan', 
              onPressed: (){},
              iconSize: 18,
              highlight: true,
            ),
            const SizedBox(height: 24),
    
            Text('INTEGRATIONS', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 16),
    
            SettingsOption(
              icon: FontAwesomeIcons.bloggerB, 
              text: 'Bloggers', 
              iconSize: 18,
              subtext: 'Publish your blogger post with single click.',
              onPressed: (){}
            ),
    
            const SizedBox(height: 24),
    
            Text('PREFERENCE', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 16),
    
            SettingsOption(
              icon: Icons.brightness_2_outlined,
              text: 'App Theme', 
              switchValue: _viewModel.getTheme(),
              switchValueChanged: (v)=>_viewModel.changeTheme(v),
            ),
            const SizedBox(height: 8),
            SettingsOption(
              icon: Icons.language, 
              trailingText: 'ENGLISH',
              text: 'App Language', 
              onPressed: (){}
            ),
    
            const SizedBox(height: 24),
    
            Text('ABOUT', style: Theme.of(context).textTheme.bodySmall,),
    
            const SizedBox(height: 16),
    
            SettingsOption(
              icon: Icons.mail_outline_rounded, 
              text: 'Contact Us', 
              onPressed: (){}
            ),
            const SizedBox(height: 8),
            SettingsOption(
              icon: Icons.privacy_tip_outlined, 
              text: 'Privacy Policy', 
              onPressed: (){}
            ),
            const SizedBox(height: 8),
            SettingsOption(
              icon: Icons.insert_drive_file_outlined, 
              text: 'Terms Of Use', 
              onPressed: (){}
            ),
    
            const SizedBox(height: 54),
    
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('From', style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: 4),
                Text('Spiderlingz', style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
    
            const SizedBox(height: 24)
    
          ],
        ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}