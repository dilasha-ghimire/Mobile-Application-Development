import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';

class CourseView extends StatelessWidget {
  CourseView({super.key});

  final courseNameController = TextEditingController();
  final _courseViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _courseViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: courseNameController,
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_courseViewFormKey.currentState!.validate()) {
                    context.read<CourseBloc>().add(
                      AddCourse(courseNameController.text.trim())
                    );
                  }
                },
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    return Text('Add Course');
                  },
                ),
              ),

              SizedBox(height: 8,),

              BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
                if(state.courses.isEmpty) {
                  return Text("No data found");
                }
                else if(state.isLoading) {
                  return CircularProgressIndicator();
                }
                else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.courses[index].courseName),
                        subtitle: Text(state.courses[index].courseId!),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<CourseBloc>().add(
                              DeleteCourse(state.courses[index].courseId!)
                            );
                          }, 
                          icon: Icon(Icons.delete)
                        ),
                      );
                    }
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}