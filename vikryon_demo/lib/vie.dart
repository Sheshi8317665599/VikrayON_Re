// import 'dart:ui';

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get.dart';

// class VonieScreen extends StatelessWidget {
//   const VonieScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text('Vonie - Future of Shopping'),
//         centerTitle: true,
//       ),
//       body: const VonieBody(),
//     );
//   }
// }

// class VonieBody extends StatelessWidget {
//   const VonieBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           buildAnimatedImageTile(
//             context,
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482447/V_Ie_Img_Small_juwvbz.png',
//             'ABOUT US',
//             'Virtual Shopping is a ground-breaking concept that blends virtual reality with physical and online worlds, creating immersive shopping experiences.',
//           ),
//           buildAnimatedImageTile(
//             context,
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482439/A_man_with_VR_headset_and_shopping_online._Small_vap2n1.png',
//             'ABOUT VR',
//             'Virtual Reality (VR) is a computer-generated environment that simulates physical presence in real or imagined worlds.',
//           ),
//           buildAnimatedImageTile(
//             context,
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/A_futuristic_virtual_reality_VR_scene_showcasing_fashion_and_clothing._Small_fq5bao.png',
//             'VR IN FASHION',
//             'The fashion industry is embracing immersive VR to create rich, personalized experiences.',
//           ),
//           buildAnimatedImageTile(
//             context,
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
//             'VR IN GROCERY',
//             'The grocery industry is undergoing a transformation using VR technology to make shopping engaging.',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Reusable widget with animations, read more, and tap popup
// Widget buildAnimatedImageTile(
//   BuildContext context,
//   String imagePath,
//   String title,
//   String content,
// ) {
//   final expanded = false.obs;

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       GestureDetector(
//         onTap: () {
//           showDialog(
//             context: context,
//             builder:
//                 (_) => AlertDialog(
//                   backgroundColor: Colors.deepPurple[900],
//                   title: Text(
//                     title,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.network(imagePath),
//                       const SizedBox(height: 12),
//                       Text(
//                         content,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text(
//                         "Close",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//           );
//         },
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.network(imagePath, fit: BoxFit.cover),
//         ),
//       ),
//       const SizedBox(height: 8),
//       Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 4),
//       Obx(() {
//         final displayText =
//             expanded.value
//                 ? content
//                 : (content.substring(
//                       0,
//                       content.length > 100 ? 100 : content.length,
//                     ) +
//                     '...');
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AnimatedOpacity(
//               opacity: 1.0,
//               duration: const Duration(milliseconds: 500),
//               child: Text(
//                 displayText,
//                 style: const TextStyle(color: Colors.white70, fontSize: 14),
//               ),
//             ),
//             GestureDetector(
//               onTap: () => expanded.toggle(),
//               child: Text(
//                 expanded.value ? 'Read Less' : 'Read More',
//                 style: const TextStyle(
//                   color: Colors.blueAccent,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         );
//       }),
//     ],
//   );
// }


// class VonieScreen1 extends StatelessWidget {
//   const VonieScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Vonie - Future of Shopping'),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: const VonieBody1(),
//     );
//   }
// }

// class VonieBody1 extends StatelessWidget {
//   const VonieBody1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sections = [
//       SectionData(
//         title: "ABOUT US",
//         content:
//             "Virtual Shopping is a groundbreaking concept blending virtual reality with the physical and digital worlds for immersive shopping.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482447/V_Ie_Img_Small_juwvbz.png',
//       ),
//       SectionData(
//         title: "ABOUT VR",
//         content:
//             "Virtual Reality (VR) creates computer-generated environments for immersive interaction, reshaping shopping with futuristic experiences.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482439/A_man_with_VR_headset_and_shopping_online._Small_vap2n1.png',
//       ),
//       SectionData(
//         title: "VR IN FASHION",
//         content:
//             "The fashion industry is revolutionized by VR tech, merging AI-driven avatars with digital shopping environments.",
//         image:
//             'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/A_futuristic_virtual_reality_VR_scene_showcasing_fashion_and_clothing._Small_fq5bao.png',
//       ),
//       SectionData(
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
//         return SectionTile(section: section);
//       },
//     );
//   }
// }

// class SectionData {
//   final String title;
//   final String content;
//   final String image;

//   SectionData({
//     required this.title,
//     required this.content,
//     required this.image,
//   });
// }

// class SectionTile extends StatelessWidget {
//   final SectionData section;
//   SectionTile({super.key, required this.section});

//   final RxBool expanded = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return FadeInUp(
//       duration: const Duration(milliseconds: 700),
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () => showGlassPopup(context, section),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.network(section.image, fit: BoxFit.cover),
//               ),
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
//             Obx(() {
//               final displayText =
//                   expanded.value
//                       ? section.content
//                       : section.content.substring(
//                             0,
//                             section.content.length > 80
//                                 ? 80
//                                 : section.content.length,
//                           ) +
//                           '...';
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     displayText,
//                     style: const TextStyle(color: Colors.white70, fontSize: 14),
//                   ),
//                   GestureDetector(
//                     onTap: () => expanded.toggle(),
//                     child: Text(
//                       expanded.value ? 'Read Less' : 'Read More',
//                       style: const TextStyle(
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void showGlassPopup(BuildContext context, SectionData section) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: 'GlassDialog',
//     barrierColor: Colors.black.withOpacity(0.4),
//     transitionDuration: const Duration(milliseconds: 500),
//     pageBuilder: (context, anim1, anim2) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Scaffold(
//           backgroundColor: Colors.black.withOpacity(0.3),
//           body: Center(
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white24),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       section.title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.network(section.image, fit: BoxFit.cover),
//                     ),
//                     const SizedBox(height: 12),
//                     Text(
//                       section.content,
//                       style: const TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 12),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurple,
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Close"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return FadeTransition(opacity: anim1, child: child);
//     },
//   );
// }

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
//   SectionTile3({super.key, required this.section});

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

// void showGlassPopupWithTTS(BuildContext context, SectionData3 section) {
//   final FlutterTts flutterTts = FlutterTts();
//   bool isSpeaking = false;

//   showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.4),
//     transitionDuration: const Duration(milliseconds: 400),
//     pageBuilder: (context, anim1, anim2) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           Future<void> toggleTTS() async {
//             if (isSpeaking) {
//               await flutterTts.stop();
//               setState(() => isSpeaking = false);
//             } else {
//               await flutterTts.setSpeechRate(0.5);
//               await flutterTts.setVolume(1.0);
//               await flutterTts.speak(section.content);
//               setState(() => isSpeaking = true);
//             }
//           }

//           return BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Scaffold(
//               backgroundColor: Colors.black.withOpacity(0.3),
//               body: Center(
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.white24),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           section.title,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.network(
//                             section.image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         Text(
//                           section.content,
//                           style: const TextStyle(color: Colors.white70),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ElevatedButton.icon(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple,
//                               ),
//                               icon: Icon(
//                                 isSpeaking ? Icons.pause : Icons.play_arrow,
//                               ),
//                               onPressed: toggleTTS,
//                               label: Text(isSpeaking ? "Pause" : "Play"),
//                             ),
//                             const SizedBox(width: 12),
//                             ElevatedButton.icon(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepOrange,
//                               ),
//                               icon: const Icon(Icons.close),
//                               onPressed: () async {
//                                 await flutterTts.stop();
//                                 Navigator.pop(context);
//                               },
//                               label: const Text("Close"),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return FadeTransition(opacity: anim1, child: child);
//     },
//   );
// }

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter_tts/flutter_tts.dart';



// class VonieScreen extends StatelessWidget {
//   const VonieScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Vonie - Future of Shopping'),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: const VonieBody(),
//     );
//   }
// }

// class VonieBody extends StatelessWidget {
//   const VonieBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sections = [
//       SectionData(
//         title: "ABOUT US",
//         content:
//             "Virtual Shopping is a groundbreaking concept blending virtual reality with the physical and digital worlds for immersive shopping.",
//         image: 'assets/vonie_vr.jpg',
//       ),
//       SectionData(
//         title: "ABOUT VR",
//         content:
//             "Virtual Reality (VR) creates computer-generated environments for immersive interaction, reshaping shopping with futuristic experiences.",
//         image: 'assets/vr_hand.jpg',
//       ),
//       SectionData(
//         title: "VR IN FASHION",
//         content:
//             "The fashion industry is revolutionized by VR tech, merging AI-driven avatars with digital shopping environments.",
//         image: 'assets/vr_fashion.jpg',
//       ),
//       SectionData(
//         title: "VR IN GROCERY",
//         content:
//             "VR transforms grocery shopping into personalized, interactive virtual store experiences blending online and offline convenience.",
//         image: 'assets/vr_grocery.jpg',
//       ),
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: sections.length,
//       itemBuilder: (context, index) {
//         final section = sections[index];
//         return SectionTile(section: section);
//       },
//     );
//   }
// }

// class SectionData {
//   final String title;
//   final String content;
//   final String image;

//   SectionData({required this.title, required this.content, required this.image});
// }

// class SectionTile extends StatelessWidget {
//   final SectionData section;
//   SectionTile({super.key, required this.section});

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
//               child: Image.asset(section.image, fit: BoxFit.cover),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               section.title,
//               style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               section.content.substring(0, section.content.length > 80 ? 80 : section.content.length) + '...',
//               style: const TextStyle(color: Colors.white70, fontSize: 14),
//             ),
//             GestureDetector(
//               onTap: () => showGlassPopupWithTTS(context, section),
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 4),
//                 child: Text('Read More', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void showGlassPopupWithTTS(BuildContext context, SectionData section) {
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
//   final SectionData section;

//   const _GlassPopupWithTTS({required this.section});

//   @override
//   State<_GlassPopupWithTTS> createState() => _GlassPopupWithTTSState();
// }

// class _GlassPopupWithTTSState extends State<_GlassPopupWithTTS> {
//   final FlutterTts flutterTts = FlutterTts();
//   bool isSpeaking = false;

//   @override
//   void dispose() {
//     flutterTts.stop();
//     super.dispose();
//   }

//   Future<void> toggleTTS() async {
//     if (isSpeaking) {
//       await flutterTts.stop();
//       setState(() => isSpeaking = false);
//     } else {
//       await flutterTts.setSpeechRate(0.5);
//       await flutterTts.setVolume(1.0);
//       await flutterTts.setPitch(1.0);
//       await flutterTts.speak(widget.section.content);
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
//                   Text(widget.section.title,
//                       style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 12),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(widget.section.image, fit: BoxFit.cover),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(widget.section.content, style: const TextStyle(color: Colors.white70)),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
//                         icon: Icon(isSpeaking ? Icons.pause : Icons.play_arrow),
//                         onPressed: toggleTTS,
//                         label: Text(isSpeaking ? "Pause" : "Play"),
//                       ),
//                       const SizedBox(width: 12),
//                       ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
//                         icon: const Icon(Icons.close),
//                         onPressed: () async {
//                           await flutterTts.stop();
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



// class VoniEScreens extends StatelessWidget {
//   const VoniEScreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.black],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         leading: Padding(
//           padding: EdgeInsets.all(8.w),
//           child: Image.network(
//             "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482445/vr_main_logo_c_Small_fuecf5.png",
//             fit: BoxFit.contain,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Image.network(
//               'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/planet_9661612_Small_zz5xqo.png',
//               height: 24.h,
//               width: 24.w,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Experience The Future of\nImmersive Technology Now With ViE!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Inter",
//               ),
//             ),
//             SizedBox(height: 20.h),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//                 child: Container(
//                   width: 0.9.sw,
//                   height: 0.35.sh,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.1),
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                         "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             Text(
//               "About ViE",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Inter",
//               ),
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               "At ViE, we believe that the future belongs to those who explore, imagine, and build. Our mission is to explore the world through innovation...",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 14.sp,
//                 fontFamily: "Inter",
//               ),
//             ),
//             SizedBox(height: 16.h),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 _showAboutPopup(context);
//               },
//               child: Text(
//                 "Read More",
//                 style: TextStyle(fontSize: 14.sp),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAboutPopup(BuildContext context) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'AboutViEPopup',
//       barrierColor: Colors.black.withOpacity(0.4),
//       transitionDuration: const Duration(milliseconds: 400),
//       pageBuilder: (_, __, ___) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Scaffold(
//             backgroundColor: Colors.black.withOpacity(0.5),
//             body: Center(
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16.w),
//                 padding: EdgeInsets.all(16.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: Colors.white24),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Text(
//                         "About Us – VIE",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 12.h),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.network(
//                           "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 12.h),
//                       Text(
//                         '''
// At VIE, we believe that the future belongs to those who explore, imagine, and build. Our mission is to explore the world through innovation — using the power of Artificial Intelligence and Machine Learning to turn bold ideas into smart, impactful solutions.

// We are a team of creators, thinkers, and engineers committed to solving real-world problems with next-generation technology. Whether it's automating processes, predicting outcomes, or building intelligent systems, our goal is to make life smarter, easier, and better.

// Vikrayon stands for vision, velocity, and value. We don’t just follow trends — we create them. Through continuous innovation and a passion for progress, we aim to redefine what’s possible, one breakthrough at a time.
//                         ''',
//                         style: TextStyle(color: Colors.white70, fontSize: 14.sp),
//                       ),
//                       SizedBox(height: 16.h),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Close"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim1, __, child) {
//         return FadeTransition(opacity: anim1, child: child);
//       },
//     );
//   }
// }



// class VoniEScreens extends StatefulWidget {
//   const VoniEScreens({super.key});

//   @override
//   State<VoniEScreens> createState() => _VoniEScreensState();
// }

// class _VoniEScreensState extends State<VoniEScreens> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _fadeAnimation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.black],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         leading: Padding(
//           padding: EdgeInsets.all(8.w),
//           child: Image.network(
//             "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482445/vr_main_logo_c_Small_fuecf5.png",
//             fit: BoxFit.contain,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Image.network(
//               'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/planet_9661612_Small_zz5xqo.png',
//               height: 24.h,
//               width: 24.w,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//         child: SlideTransition(
//           position: _slideAnimation,
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Experience The Future of\nImmersive Technology Now With ViE!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "Inter",
//                   ),
//                 ),
//                 SizedBox(height: 20.h),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//                     child: Container(
//                       width: 0.9.sw,
//                       height: 0.35.sh,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         image: const DecorationImage(
//                           image: NetworkImage(
//                             "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.h),
//                 _buildSectionTitle("About ViE"),
//                 _buildSectionDescription(
//                   "At ViE, we believe that the future belongs to those who explore, imagine, and build.",
//                 ),
//                 SizedBox(height: 16.h),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: () {
//                     _showAboutPopup(context);
//                   },
//                   child: Text("Read More", style: TextStyle(fontSize: 14.sp)),
//                 ),
//                 SizedBox(height: 20.h),

//                 // Additional Section 1
//                 _buildSectionTitle("Our Mission"),
//                 _buildSectionDescription(
//                   "To transform the world through innovation in AI, ML, and immersive technologies.",
//                 ),
//                 SizedBox(height: 20.h),

//                 // Additional Section 2
//                 _buildSectionTitle("Join Our Community"),
//                 _buildSectionDescription(
//                   "Be part of an ecosystem that drives technological innovation. Collaborate, build, and grow with ViE.",
//                 ),
//                 SizedBox(height: 16.h),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: () {
//                     _goToNextScreen(context);
//                   },
//                   child: Text("Get Started", style: TextStyle(fontSize: 14.sp)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String text) {
//     return Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 18.sp,
//         fontWeight: FontWeight.bold,
//         fontFamily: "Inter",
//       ),
//     );
//   }

//   Widget _buildSectionDescription(String text) {
//     return Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: Colors.white70,
//         fontSize: 14.sp,
//         fontFamily: "Inter",
//       ),
//     );
//   }

//   void _showAboutPopup(BuildContext context) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'AboutViEPopup',
//       barrierColor: Colors.black.withOpacity(0.4),
//       transitionDuration: const Duration(milliseconds: 400),
//       pageBuilder: (_, __, ___) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Scaffold(
//             backgroundColor: Colors.black.withOpacity(0.5),
//             body: Center(
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16.w),
//                 padding: EdgeInsets.all(16.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: Colors.white24),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Text(
//                         "About Us – VIE",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 12.h),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.network(
//                           "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 12.h),
//                       Text(
//                         '''
// At VIE, we believe that the future belongs to those who explore, imagine, and build. Our mission is to explore the world through innovation — using the power of Artificial Intelligence and Machine Learning to turn bold ideas into smart, impactful solutions.

// We are a team of creators, thinkers, and engineers committed to solving real-world problems with next-generation technology. Whether it's automating processes, predicting outcomes, or building intelligent systems, our goal is to make life smarter, easier, and better.

// Vikrayon stands for vision, velocity, and value. We don’t just follow trends — we create them. Through continuous innovation and a passion for progress, we aim to redefine what’s possible, one breakthrough at a time.
//                         ''',
//                         style: TextStyle(color: Colors.white70, fontSize: 14.sp),
//                       ),
//                       SizedBox(height: 16.h),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Close"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim1, __, child) {
//         return FadeTransition(opacity: anim1, child: child);
//       },
//     );
//   }

//   void _goToNextScreen(BuildContext context) {
//     Get.to(() => const NextScreen(), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 500));
//   }
// }

// class NextScreen extends StatelessWidget {
//   const NextScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(title: const Text("Next Screen")),
//       body: Center(
//         child: Text(
//           "Welcome to the Next Step!",
//           style: TextStyle(color: Colors.white, fontSize: 20.sp),
//         ),
//       ),
//     );
//   }
// }



// // class VoniEScreens extends StatefulWidget {
// //   const VoniEScreens({super.key});

// //   @override
// //   State<VoniEScreens> createState() => _VoniEScreensState();
// // }

// // class _VoniEScreensState extends State<VoniEScreens> with TickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<Offset> _slideAnimation;
// //   late Animation<double> _fadeAnimation;
// //   final FlutterTts flutterTts = FlutterTts();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
// //     _slideAnimation = Tween<Offset>(
// //       begin: const Offset(0, 1),
// //       end: const Offset(0, 0.2),
// //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
// //     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
// //     );
// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     flutterTts.stop();
// //     super.dispose();
// //   }

// //   Future<void> _speak(String text) async {
// //     await flutterTts.setLanguage("en-US");
// //     await flutterTts.setPitch(1);
// //     await flutterTts.setSpeechRate(0.5);
// //     await flutterTts.speak(text);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.deepPurple, Colors.black],
// //               begin: Alignment.topCenter,
// //               end: Alignment.bottomCenter,
// //             ),
// //           ),
// //         ),
// //         automaticallyImplyLeading: false,
// //         leading: const Image(
// //           image: NetworkImage(
// //               "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482445/vr_main_logo_c_Small_fuecf5.png"),
// //         ),
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Image(
// //               image: NetworkImage(
// //                   'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/planet_9661612_Small_zz5xqo.png'),
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: SlideTransition(
// //           position: _slideAnimation,
// //           child: FadeTransition(
// //             opacity: _fadeAnimation,
// //             child: Column(
// //               children: [
// //                 SizedBox(height: 20.h),
// //                 Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
// //                   child: Text(
// //                     "Experience The Future of \n Immersive Technology Now With ViE!",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18.sp,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: "Inter",
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 20.h),
// //                 GlassCardWithMic(
// //                   imageUrl:
// //                       "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
// //                   textToRead: "Experience The Future of Immersive Technology Now With ViE!",
// //                   onMicTap: _speak,
// //                 ),
// //                 SizedBox(height: 20.h),
// //                 Text(
// //                   "About ViE!",
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 18.sp,
// //                     fontWeight: FontWeight.bold,
// //                     fontFamily: "Inter",
// //                   ),
// //                 ),
// //                 SizedBox(height: 20.h),
// //                 GlassCardWithMic(
// //                   imageUrl:
// //                       "https://res.cloudinary.com/ddlyhla10/image/upload/v1749538012/vie_e_vvkq0a.jpg",
// //                   textToRead: "ViE is a groundbreaking innovation in immersive technology...",
// //                   onMicTap: _speak,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ✅ Reusable Glass Card Widget with Mic Button
// // class GlassCardWithMic extends StatelessWidget {
// //   final String imageUrl;
// //   final String textToRead;
// //   final Future<void> Function(String) onMicTap;

// //   const GlassCardWithMic({
// //     super.key,
// //     required this.imageUrl,
// //     required this.textToRead,
// //     required this.onMicTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return ClipRect(
// //       child: BackdropFilter(
// //         filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
// //         child: Container(
// //           height: 0.35.sh,
// //           width: 0.9.sw,
// //           decoration: BoxDecoration(
// //             color: Colors.white.withOpacity(0.1),
// //             borderRadius: BorderRadius.circular(20),
// //             image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
// //           ),
// //           child: Align(
// //             alignment: Alignment.bottomRight,
// //             child: Padding(
// //               padding: EdgeInsets.all(12.w),
// //               child: GestureDetector(
// //                 onTap: () => onMicTap(textToRead),
// //                 child: Container(
// //                   padding: EdgeInsets.all(8.w),
// //                   decoration: BoxDecoration(
// //                     color: Colors.deepPurple.withOpacity(0.7),
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: const Icon(Icons.mic, color: Colors.white, size: 24),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoniEScreens extends StatefulWidget {
  const VoniEScreens({super.key});

  @override
  State<VoniEScreens> createState() => _VoniEScreensState();
}

class _VoniEScreensState extends State<VoniEScreens> {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil (only needed once, normally in main)
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482445/vr_main_logo_c_Small_fuecf5.png"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.network(
                  'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/planet_9661612_Small_zz5xqo.png')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Experience The Future of \n Immersive Technology Now With ViE!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
            ),
            SizedBox(height: 20.h),

            /// GlassCard Section - Add as many as you want
            GlassCardWithPopup(
              title: "About ViE",
              description:
                  "ViE is the next generation immersive experience platform. Join the revolution and explore the future today!",
              imageUrl:
                  "https://res.cloudinary.com/ddlyhla10/image/upload/v1749536855/About_Vie_1_od4h7b.png",
            ),
            SizedBox(height: 20.h),
            GlassCardWithPopup(
              title: "Future Vision",
              description:
                  "Explore cutting-edge immersive technology with ViE to unlock virtual realities and smarter living.",
              imageUrl:
                  "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png",
            ),
            SizedBox(height: 20.h),
            GlassCardWithPopup(
              title: "Beyond Limits",
              description:
                  "Step into boundless experiences, reimagining what's possible with our interactive ecosystems.",
              imageUrl:
                  "https://res.cloudinary.com/ddlyhla10/image/upload/v1749600000/sample_new_immersive_image.png",
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

/// Reusable glass card widget with popup and text-to-speech
class GlassCardWithPopup extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  const GlassCardWithPopup({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  State<GlassCardWithPopup> createState() => _GlassCardWithPopupState();
}

class _GlassCardWithPopupState extends State<GlassCardWithPopup> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(widget.description);
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                width: 0.9.sw,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    IconButton(
                      onPressed: _speak,
                      icon: const Icon(Icons.mic, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopup(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: 0.3.sh,
            width: 0.9.sw,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
