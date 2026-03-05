import 'package:flutter/material.dart';

void main() {
  runApp(const QuanLyTroApp());
}

class QuanLyTroApp extends StatelessWidget {
  const QuanLyTroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản Lý Trọ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1976D2),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
        useMaterial3: true,
      ),
      home: const MainDashboard(),
    );
  }
}

// --- MÀN HÌNH CHÍNH (DASHBOARD) ---
class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Row(
          children: [
            Icon(Icons.home_work, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "QUẢN LÝ TRỌ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              children: [
                _menuItem(
                  context,
                  Icons.home,
                  "Quản lý nhà,\nphòng, hợp đồng",
                  const HouseListScreen(),
                ),
                _menuItem(
                  context,
                  Icons.grid_view,
                  "Báo phí",
                  const FeeStatusScreen(),
                ),
                _menuItem(
                  context,
                  Icons.calculate,
                  "Quản lý chi",
                  const ExpenseScreen(),
                ),
                _menuItem(
                  context,
                  Icons.bar_chart,
                  "Báo cáo",
                  const ReportScreen(),
                ),
                _menuItem(
                  context,
                  Icons.sync,
                  "Sao lưu, phục\nhồi dữ liệu",
                  null,
                ),
                _menuItem(context, Icons.undo, "Liên hệ, góp ý", null),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Phiên bản 2.5.3",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget? page,
  ) {
    return GestureDetector(
      onTap: () => page != null
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : null,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF42A5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// --- MÀN HÌNH DANH SÁCH NHÀ (HÌNH 2) ---
class HouseListScreen extends StatelessWidget {
  const HouseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Các căn nhà của bạn",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  color: const Color(0xFF1976D2),
                  child: const Row(
                    children: [
                      Icon(Icons.home, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "123 Nguyễn Đình Chiểu, P5, Q3",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: null,
                        child: Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tâm - 0987654321",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _feeRow(
                        "Loại phí",
                        "Đơn vị tính",
                        "Giá tiền",
                        isHeader: true,
                      ),
                      _feeRow("Điện", "KWH", "4.000 đ"),
                      _feeRow("Nước", "phòng", "50.000 đ"),
                      _feeRow("Xe", "chiếc", "10.000 đ"),
                      _feeRow("Internet", "phòng", "100.000 đ"),
                      _feeRow("Giặt sấy", "phòng", "50.000 đ"),
                      _feeRow("Thang máy", "phòng", "0 đ"),
                      _feeRow("Rác", "phòng", "17.000 đ"),
                      _feeRow("Dịch vụ", "phòng", "0 đ"),
                      const SizedBox(height: 10),
                      const Text(
                        "Thông tin chuyển khoản",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Text("Chủ TK: Tâm"),
                      const Text("Ngân hàng Quân Đội - MB Bank"),
                      const Text("STK: 0987654321"),
                      const SizedBox(height: 15),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D32),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Xem danh sách phòng"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _feeRow(String c1, String c2, String c3, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              c1,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            child: Text(
              c2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            child: Text(
              c3,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- MÀN HÌNH QUẢN LÝ CHI (HÌNH 1) ---
class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Text(
          "Quản lý chi: tiền nhà, điện, nước...",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: _fakeDropdown("Chọn căn nhà")),
                const SizedBox(width: 8),
                Expanded(flex: 1, child: _fakeDropdown("Ngày chi")),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _fakeDropdown("Tiền nhà")),
                const SizedBox(width: 8),
                Expanded(child: _fakeInput("Số tiền chi", "0 đ")),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _fakeInput("Lý do chi", "")),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text("Lưu", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Danh sách phí đã chi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Expanded(child: EmptyDataWidget()),
          ],
        ),
      ),
    );
  }
}

// --- MÀN HÌNH BÁO CÁO (HÌNH 5) ---
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Text("Báo cáo", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Chọn căn nhà để xem báo cáo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _fakeDropdown("Chọn căn nhà"),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tabBtn("3 tháng", true),
              _tabBtn("6 tháng", false),
              _tabBtn("12 tháng", false),
              _tabBtn("Tùy chọn", false),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "THU",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text("CHI", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("LỢI NHUẬN", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Expanded(child: EmptyDataWidget()),
        ],
      ),
    );
  }

  Widget _tabBtn(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1976D2) : Colors.white,
        border: Border.all(color: const Color(0xFF1976D2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xFF1976D2),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// --- MÀN HÌNH THỐNG KÊ BÁO PHÍ (HÌNH 4) ---
class FeeStatusScreen extends StatelessWidget {
  const FeeStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Text(
          "Thống kê báo phí",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Chọn căn nhà để xem kết quả báo phí",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: _fakeDropdown("Chọn căn nhà"),
                ),
              ),
              _fakeDropdown("3/2026", icon: Icons.calendar_month),
              const SizedBox(width: 10),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Row(
              children: [
                _statusCell("Chưa báo", true),
                _statusCell("Đã báo", false),
                _statusCell("Đóng một phần", false),
                _statusCell("Đã đóng", false),
              ],
            ),
          ),
          const Expanded(child: EmptyDataWidget()),
        ],
      ),
    );
  }

  static Widget _statusCell(String label, bool active) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: active ? const Color(0xFF1976D2) : Colors.white,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          color: active ? Colors.white : Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// --- WIDGETS DÙNG CHUNG ---
Widget _fakeDropdown(
  String label, {
  IconData icon = Icons.keyboard_arrow_down,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade400),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Icon(icon, size: 20),
      ],
    ),
  );
}

Widget _fakeInput(String label, String hint) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade400),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Text(
          hint.isEmpty ? "..." : hint,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.face, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            "Chưa có dữ liệu!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
