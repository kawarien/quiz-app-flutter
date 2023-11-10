import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Colors.green;
    const Color redColor = Colors.red;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            Color answerColor = isCorrect ? greenColor : redColor;
            return Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligner le texte au début
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: answerColor,
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style:
                            GoogleFonts.lato(color: answerColor, fontSize: 15),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style:
                            GoogleFonts.lato(color: Colors.green, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
