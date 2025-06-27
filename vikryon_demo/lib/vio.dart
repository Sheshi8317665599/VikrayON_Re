// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class VonieScreen3 extends StatelessWidget {
//   const VonieScreen3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Vonie - Future of Shopping'),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: const VonieBody3(),
//     );
//   }
// }

// class VonieBody3 extends StatelessWidget {
//   const VonieBody3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sections = [
//       SectionData3(
//         title: "ABOUT US",
//         content:
//             "Virtual Shopping is a groundbreaking concept blending virtual reality with the physical and digital worlds for immersive shopping.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482447/V_Ie_Img_Small_juwvbz.png',
//       ),
//       SectionData3(
//         title: "ABOUT VR",
//         content:
//             "Virtual Reality (VR) creates computer-generated environments for immersive interaction, reshaping shopping with futuristic experiences.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482439/A_man_with_VR_headset_and_shopping_online._Small_vap2n1.png',
//       ),
//       SectionData3(
//         title: "VR IN FASHION",
//         content:
//             "The fashion industry is revolutionized by VR tech, merging AI-driven avatars with digital shopping environments.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/A_futuristic_virtual_reality_VR_scene_showcasing_fashion_and_clothing._Small_fq5bao.png',
//       ),
//       SectionData3(
//         title: "VR IN GROCERY",
//         content:
//             "VR transforms grocery shopping into personalized, interactive virtual store experiences blending online and offline convenience.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
//       ),
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: sections.length,
//       itemBuilder: (context, index) {
//         final section = sections[index];
//         return SectionTile3(section: section);
//       },
//     );
//   }
// }

// class SectionData3 {
//   final String title;
//   final String content;
//   final String image;

//   SectionData3({
//     required this.title,
//     required this.content,
//     required this.image,
//   });
// }

// class SectionTile3 extends StatelessWidget {
//   final SectionData3 section;
//   const SectionTile3({super.key, required this.section});

//   @override
//   Widget build(BuildContext context) {
//     return FadeInUp(
//       duration: const Duration(milliseconds: 700),
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.network(section.image, fit: BoxFit.cover),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               section.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               section.content.substring(
//                     0,
//                     section.content.length > 80 ? 80 : section.content.length,
//                   ) +
//                   '...',
//               style: const TextStyle(color: Colors.white70, fontSize: 14),
//             ),
//             GestureDetector(
//               onTap: () => showGlassPopupWithTTS(context, section),
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 4),
//                 child: Text(
//                   'Read More',
//                   style: TextStyle(
//                     color: Colors.blueAccent,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ✅ Clean & fixed version of showGlassPopupWithTTS with Stateful Widget
// void showGlassPopupWithTTS(BuildContext context, SectionData3 section) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.4),
//     transitionDuration: const Duration(milliseconds: 400),
//     pageBuilder: (context, anim1, anim2) {
//       return _GlassPopupWithTTS(section: section);
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return FadeTransition(opacity: anim1, child: child);
//     },
//   );
// }

// class _GlassPopupWithTTS extends StatefulWidget {
//   final SectionData3 section;

//   const _GlassPopupWithTTS({required this.section});

//   @override
//   State<_GlassPopupWithTTS> createState() => _GlassPopupWithTTSState();
// }

// class _GlassPopupWithTTSState extends State<_GlassPopupWithTTS> {
//   final FlutterTts _flutterTts = FlutterTts();
//   bool isSpeaking = false;

//   @override
//   void dispose() {
//     _flutterTts.stop();
//     super.dispose();
//   }

//   Future<void> toggleTTS() async {
//     if (isSpeaking) {
//       await _flutterTts.stop();
//       setState(() => isSpeaking = false);
//     } else {
//       await _flutterTts.setSpeechRate(0.5);
//       await _flutterTts.setVolume(1.0);
//       await _flutterTts.setPitch(1.0);
//       await _flutterTts.setLanguage("en-US");
//       await _flutterTts.speak(widget.section.content);
//       setState(() => isSpeaking = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//       child: Scaffold(
//         backgroundColor: Colors.black.withOpacity(0.3),
//         body: Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.white24),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     widget.section.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(widget.section.image, fit: BoxFit.cover),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     widget.section.content,
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                         ),
//                         icon: Icon(isSpeaking ? Icons.pause : Icons.play_arrow),
//                         onPressed: toggleTTS,
//                         label: Text(isSpeaking ? "Pause" : "Play"),
//                       ),
//                       const SizedBox(width: 12),
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepOrange,
//                         ),
//                         icon: const Icon(Icons.close),
//                         onPressed: () async {
//                           await _flutterTts.stop();
//                           Navigator.pop(context);
//                         },
//                         label: const Text("Close"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
