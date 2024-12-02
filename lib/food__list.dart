import 'package:flutter/material.dart';
import 'package:tester/api_service.dart';
import 'package:tester/date_foodlist.dart';
import 'package:tester/service/post_model.dart';
import 'package:intl/intl.dart';

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final TextStyle _yaziStili = TextStyle(color: Colors.white);
  final String tarihSec = "Tarih seçin";
  final String sehirSec = "Şehir :";
  final String _turkishDate = DateFoodTurkish().dateTurkishReturn();
  final Service _service = Service();
  List<PostModel>? _items;
  bool _isLoading =
      false; // Seçilen öğün bilgisi ("Kahvaltı" veya "Akşam Yemeği")
  String _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String?
      _selectedMeal; // Seçilen öğün bilgisi ("Kahvaltı" veya "Akşam Yemeği")

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    _selectedMeal = _service.getCurrentMeal(); // Öğün bilgisini alıyoruz.

    final items = await _service.fetchPostItems(_selectedDate, _selectedMeal!);

    setState(() {
      _items = items;
      _isLoading = false;
    });
  }

  void _updateDate(int days) {
    setState(() {
      final currentDate = DateFormat('yyyy-MM-dd')
          .parse(_selectedDate); // String'i DateTime'a çevir.
      final newDate = currentDate.add(Duration(days: days)); // Gün ekle/çıkar.
      _selectedDate = DateFormat('yyyy-MM-dd')
          .format(newDate); // Güncellenen tarihi String'e çevir.
    });
    _fetchData(); // Tarih değiştiği anda API çağrısını tekrar tetikle.
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const String _il = "Muğla";

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            dateChangeArea(context, _turkishDate, _yaziStili, screenWidth),
            SizedBox(height: screenHeight * 0.02),
            sehirSecimi(
              context,
              sehirSec,
              _il,
              _yaziStili,
              screenWidth,
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                basitButon(context, "Kahvaltı", _yaziStili, screenWidth,
                    _selectedMeal),
                SizedBox(width: screenWidth * 0.04),
                basitButon(context, "Akşam Yemeği", _yaziStili, screenWidth,
                    _selectedMeal),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(child: yemek_listesi(screenWidth)),
          ],
        ),
      ),
    );
  }

  ClipRRect yemek_listesi(double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.03),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _items == null || _items!.isEmpty
              ? const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
                  itemCount: _items?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = _items![index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.02,
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.04),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              yemekDetaySatiri(
                                  Icons.restaurant_menu, "Yemek", item.food),
                              yemekDetaySatiri(Icons.soup_kitchen, "Çorba",
                                  item.soup ?? 'Belirtilmedi'),
                              yemekDetaySatiri(Icons.rice_bowl, "Pilav",
                                  item.rice ?? 'Belirtilmedi'),
                              yemekDetaySatiri(Icons.local_florist, "Salata",
                                  item.salad ?? 'Belirtilmedi'),
                              yemekDetaySatiri(Icons.breakfast_dining, "Ekmek",
                                  item.bread ?? 'Belirtilmedi'),
                              yemekDetaySatiri(Icons.water, "Su",
                                  item.water ?? 'Belirtilmedi'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Widget sehirSecimi(BuildContext context, String etiket, String deger,
      TextStyle yaziStili, double screenWidth) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.04,
          horizontal: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(etiket, style: textStyle),
            Text(deger, style: textStyle),
          ],
        ),
      ),
    );
  }

  Widget dateChangeArea(BuildContext context, String deger, TextStyle yaziStili,
      double screenWidth) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.04,
          horizontal: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => _updateDate(-1),
                icon: Icon(Icons.arrow_back_outlined)),
            Text(_selectedDate, style: textStyle),
            IconButton(
                onPressed: () => _updateDate(1),
                icon: Icon(Icons.arrow_forward_outlined))
          ],
        ),
      ),
    );
  }

  Widget basitButon(BuildContext context, String etiket, TextStyle yaziStili,
      double screenWidth, String? selectedMeal) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final isSelected = etiket == selectedMeal; // Seçili öğün kontrolü

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedMeal = etiket;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey[850],
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Center(
            child: Text(
              etiket,
              style: textStyle?.copyWith(
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget yemekDetaySatiri(IconData icon, String baslik, String? detay) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.orangeAccent,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            "$baslik:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              detay ?? "Belirtilmedi",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
