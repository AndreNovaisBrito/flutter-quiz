import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final bool isCorrect =
                  data['user_answer'] == data['correct_answer'];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: isCorrect ? Colors.white : Colors.red,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 16, 18, 124),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 168, 173, 230),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 132, 132, 132),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
