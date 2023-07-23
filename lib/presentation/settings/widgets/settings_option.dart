import 'package:flutter/material.dart';


class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subtext;
  final String? trailingText;
  final VoidCallback? onPressed;
  final ValueChanged? switchValueChanged;
  final bool isTop;
  final bool isBottom;
  final bool circular;
  final bool? switchValue;
  final double iconSize;
  final bool highlight;

  const SettingsOption({
    super.key,
    required this.icon,
    required this.text,
    this.trailingText,
    this.switchValueChanged,
    this.subtext,
    this.switchValue,
    this.iconSize = 24,
    this.onPressed,
    this.isTop = false,
    this.isBottom = false, 
    this.circular = false,
    this.highlight = false
  });

  @override
  Widget build(BuildContext context) {

    ValueNotifier switchNotifier = ValueNotifier(switchValue);

    return ValueListenableBuilder(
      valueListenable: switchNotifier,
      builder: (_, val, __) {
        return ListTile(
          onTap: onPressed,
          minLeadingWidth: 30,
          leading: Icon(icon, size: iconSize,),
          title: Text(text, style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 16
          ),),
          trailing: switchValue !=null 
            ? Switch(value: val, onChanged: (v){
              switchNotifier.value = v;
              switchValueChanged!(v);
            }) 
            : trailingText != null 
            ? Text(trailingText!, style: Theme.of(context).textTheme.bodySmall,)
            : null,
          subtitle: subtext!=null ? Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(subtext!, style: const TextStyle(
              fontSize: 12
            )),  
          ) : null,
        );
      }
    );
  }
}