import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/constants/assets_const.dart';
import 'package:mobile/constants/colors_const.dart';
import 'package:mobile/presentation/textgen/bloc/text_gen_bloc.dart';
import 'package:mobile/presentation/textgen/pages/textgen_viewmodel.dart';
import 'package:mobile/presentation/textgen/widgets/content_footer.dart';
import 'package:mobile/resources/toast.dart';
import 'package:mobile/widgets/text_input.dart';

class TextGenView extends StatefulWidget {
  const TextGenView({super.key});

  @override
  State<TextGenView> createState() => _TextGenViewState();
}

class _TextGenViewState extends State<TextGenView> {
  late TextGenViewModel _viewModel;

  @override
  void initState() {
    _viewModel = TextGenViewModel(context)..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextGenBloc, TextGenState>(
      listener: (_, state){
        if(state is ProjectSaved){
          _viewModel.projectId = state.projectId;
          _viewModel.saveContent(_viewModel.saveString!);
        }else if(state is ContentSaved){
          toast('Saved successfully!', success: true);
        }
      },
      builder: (_, state) {

        if(state is ContentGenerated){
          _viewModel.contents.addAll(state.contents);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Blog Intro'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('What is your blog title ?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
              const SizedBox(
                height: 12,
              ),
              TextInput(
                  hintext: 'e.g. Five features of copywriter',
                  controller: _viewModel.titleController),
              const SizedBox(
                height: 16,
              ),
              Text('What is your blog about ?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
              const SizedBox(
                height: 12,
              ),
              TextInput(
                hintext: 'e.g. Blog about copywriter features',
                controller: _viewModel.descriptionController,
                maxLines: 4,
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Choose a tone',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
              const SizedBox(
                height: 12,
              ),
              TextInput(
                hintext: 'Try "Casual", "Friendly" or "Hardly"',
                controller: _viewModel.toneController,
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () => _viewModel.createContent(),
                  child: const Text('Create Content')),

              const SizedBox(height: 30),

              if(_viewModel.contents.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    const Expanded(child: Divider(
                      endIndent: 16,
                    )),
                    Text('RESULTS', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1
                    ),),
                    const Expanded(child: Divider(
                      indent: 16,
                    ))
                  ],
                ),
              ),

              ..._viewModel.contents.map(
                (e) => Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsConst.grey
                    )
                  ),
                  child: Column(
                    children: [
                      Text(e, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18,
                        color: ColorsConst.text
                      )),
                      const SizedBox(height: 8,),
                      ContentFooter(
                        content: e,
                        viewModel: _viewModel,  
                      )
                    ],
                  ),
                )),

              if(state is Loading)
              Column(
                children: [
                  SizedBox(
                      width: 100,
                      child: LottieBuilder.asset(AssetsConst.loader)),
                  Text('AI generating your content...',
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
