import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/controlller/comment_controller/comment_controller.dart';
import 'package:jewels_airport_transfers/models/comment_insert_model/comment_insert_model.dart';
import '../../constants/color.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final CommentController controller = Get.put(CommentController());

  @override
  void initState() {
    super.initState();
    controller.commentInsert(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isAvailableLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.commentInsertModel.value.data == null ||
            controller.commentInsertModel.value.data!.isEmpty) {
          return Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.comment_rounded, color: kBlackColor, size: 24),
                const Gap(6),
                Text(
                  'No Comments found',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          );
        }

        // Return the comments section if data is available
        return ListView.builder(
          itemCount: controller.commentInsertModel.value.data!.length,
          itemBuilder: (context, index) {
            // ignore: non_constant_identifier_names
            final Data = controller.commentInsertModel.value.data![index];
            return _buildCommentsSection(context, data: Data);
          },
        );
      }),
    );
  }

  /// Builds the comments section with RichText widgets
  Widget _buildCommentsSection(BuildContext context, {required Data data}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(3, (index) => _buildCommentItem(context, data)),
      ),
    );
  }

  /// Builds individual comment items
  Widget _buildCommentItem(BuildContext context, Data data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RichText(
        text: TextSpan(
          text: data.showAmendSummary ?? '',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.normal,
              ),
          children: [
            TextSpan(
              text: data.comments ?? '',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Add tap logic here if required
                },
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: kBlueColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
