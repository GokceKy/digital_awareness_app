import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatMessage {
  final String text;
  final bool sentByUser;

  ChatMessage({required this.text, required this.sentByUser});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final int _maxResponseLength = 400;

  bool _isSending = false;
  bool _geminiInitialized = false;
  String? _errorMessage;

  final String _apiKey =
      'AIzaSyDztn83phodTIO3HG3emXa93mcxW3X4Fj8'; // API anahtarınızı buraya ekleyin
  Gemini? _gemini;

  final String _systemPrompt =
      "Merhaba! Ben sizin Dijital Danışman Asistanınızım. Burada size dijital güvenlik, destek, ve kişisel güvenlik konularında yardımcı olmak için bulunuyorum.";

  @override
  void initState() {
    super.initState();
    _initializeGemini();
  }

  Future<void> _initializeGemini() async {
    final gemini = await Gemini.init(apiKey: _apiKey);
    setState(() {
      _gemini = gemini;
      _geminiInitialized = true;
      _messages.insert(
        0,
        ChatMessage(
          text:
              "Merhaba! Ben sizin Dijital Danışman Asistanınızım. Burada size dijital güvenlik, destek, ve kişisel güvenlik konularında yardımcı olmak için bulunuyorum.",
          sentByUser: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.sentByUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message.text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_geminiInitialized)
            Container(
              color: const Color(0xFFD3D3D3), // Açık gri arka plan
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(
                          color: Colors.black), // Siyah yazı rengi
                      decoration: const InputDecoration(
                        hintText: 'Mesajınızı yazın...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) => _sendMessage(value),
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isSending ? Icons.hourglass_empty : Icons.send,
                        color: Colors.black),
                    onPressed: _isSending
                        ? null
                        : () => _sendMessage(_textController.text),
                  ),
                ],
              ),
            ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(_errorMessage!,
                    style: const TextStyle(color: Colors.red)),
              ),
            ),
          if (!_geminiInitialized && _errorMessage == null)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  void _sendMessage(String text) async {
    if (text.trim().isNotEmpty && _gemini != null) {
      setState(() {
        _messages.insert(0, ChatMessage(text: text, sentByUser: true));
        _isSending = true;
        _errorMessage = null;
      });

      try {
        final response =
            await _gemini!.text(_systemPrompt + "\nKullanıcı: $text");

        if (response != null && response.output != null) {
          String geminiResponse = response.output!;

          if (geminiResponse.length > _maxResponseLength) {
            geminiResponse =
                geminiResponse.substring(0, _maxResponseLength) + "...";
          }

          setState(() {
            _messages.insert(
                0, ChatMessage(text: geminiResponse, sentByUser: false));
          });
        } else {
          throw Exception("Gemini'den geçerli bir yanıt alınamadı.");
        }
      } catch (e) {
        setState(() {
          _errorMessage = "Mesaj gönderilirken bir hata oluştu: $e";
          _isSending = false;
        });
        print(_errorMessage);
      } finally {
        setState(() => _isSending = false);
      }

      _textController.clear();
    }
  }
}
