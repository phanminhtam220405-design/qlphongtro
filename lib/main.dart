import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

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
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => MainDashboard(),
      },
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
                  const FeeEntryScreen(),
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
                  const BackupRestoreScreen(),
                ),
                _menuItem(
                  context,
                  Icons.undo,
                  "Liên hệ, góp ý",
                  const ContactScreen(),
                ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoomListScreen(),
                              ),
                            );
                          },
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

class RoomListScreen extends StatelessWidget {
  const RoomListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1976D2),
          title: const Text(
            "Danh sách phòng",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home, color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              onPressed: () {},
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Phòng trống"),
              Tab(text: "Phòng đã thuê"),
            ],
          ),
        ),
        body: const TabBarView(children: [RoomEmptyTab(), RoomRentedTab()]),
      ),
    );
  }
}

class RoomEmptyTab extends StatelessWidget {
  const RoomEmptyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _roomCard(
          roomName: "P.102",
          isRented: false,
          price: "3.000.000 đ/tháng",
        ),
      ],
    );
  }
}

class RoomRentedTab extends StatelessWidget {
  const RoomRentedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _roomCard(
          roomName: "P.101",
          isRented: true,
          price: "3.500.000 đ/tháng",
        ),
        _roomCard(
          roomName: "P.103",
          isRented: true,
          price: "3.500.000 đ/tháng",
        ),
      ],
    );
    ;
  }
}

Widget _roomCard({
  required String roomName,
  required bool isRented,
  required String price,
}) {
  final statusText = isRented ? "Đang thuê" : "Đang trống";
  final statusColor = isRented ? Colors.green : Colors.red;

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PHẦN TRÊN
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                roomName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: statusColor),
                        const SizedBox(width: 5),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(price),
                  ],
                ),
              ),

              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// PHẦN NÚT GÓC PHẢI
          Align(
            alignment: Alignment.centerRight,
            child: isRented
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Xem hợp đồng",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Tạo hợp đồng",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    ),
  );
}

// --- MÀN HÌNH QUẢN LÝ CHI (HÌNH 1) ---
// --- MÀN HÌNH QUẢN LÝ CHI ---
class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  // Biến lưu trữ căn nhà được chọn
  String selectedHouse = "Chọn căn nhà";
  List<Map<String, dynamic>> expenses = [];
  List<Map<String, dynamic>> categories = [];
  Map<String, dynamic>? selectedCategory;

  // Controllers cho form thêm/sửa chi
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Danh mục chi tiêu mặc định
    categories = [
      {'icon': Icons.water_drop, 'name': 'Tiền nước', 'color': Colors.blue},
      {'icon': Icons.bolt, 'name': 'Tiền điện', 'color': Colors.orange},
      {'icon': Icons.wifi, 'name': 'Internet', 'color': Colors.purple},
      {'icon': Icons.home, 'name': 'Tiền nhà', 'color': Colors.green},
      {'icon': Icons.build, 'name': 'Sửa chữa', 'color': Colors.brown},
      {'icon': Icons.more_horiz, 'name': 'Khác', 'color': Colors.teal},
    ];

    // Dữ liệu mẫu
    expenses = [
      {
        'house': '123 Nguyễn Đình Chiểu, P5, Q3',
        'date': '01/03/2026',
        'amount': '500000',
        'reason': 'Sửa chữa ống nước',
        'category': categories[4], // Sửa chữa
      },
      {
        'house': '123 Nguyễn Đình Chiểu, P5, Q3',
        'date': '05/03/2026',
        'amount': '1200000',
        'reason': 'Mua thiết bị điện',
        'category': categories[1], // Tiền điện
      },
      {
        'house': '456 Lê Văn Sỹ, P13, Q3',
        'date': '03/03/2026',
        'amount': '300000',
        'reason': 'Vệ sinh định kỳ',
        'category': categories[5], // Khác
      },
    ];
    dateController.text = _getCurrentDate();
    amountController.text = '0';
  }

  // Hàm lấy ngày hiện tại theo định dạng dd/MM/yyyy
  String _getCurrentDate() {
    final now = DateTime.now();
    return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  }

  // Lọc chi phí theo căn nhà được chọn
  List<Map<String, dynamic>> get filteredExpenses {
    if (selectedHouse == "Chọn căn nhà" || selectedHouse == "Tất cả các nhà") {
      return expenses; // Hiển thị tất cả
    }
    return expenses
        .where((expense) => expense['house'] == selectedHouse)
        .toList();
  }

  // Hiển thị bottom sheet để chọn danh mục chi
  void _showCategorySelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) => Container(
        padding: const EdgeInsets.all(20),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Chọn danh mục chi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      Navigator.pop(modalContext);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: category['color'].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selectedCategory == category
                                  ? category['color']
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            category['icon'],
                            size: 30,
                            color: category['color'],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm thêm khoản chi mới
  void _addExpense() {
    // Kiểm tra điều kiện trước khi thêm
    if (selectedHouse == "Chọn căn nhà") {
      _showMessage("Vui lòng chọn căn nhà!");
      return;
    }
    if (selectedHouse == "Tất cả các nhà") {
      _showMessage("Vui lòng chọn một căn nhà cụ thể để thêm chi!");
      return;
    }
    if (selectedCategory == null) {
      _showMessage("Vui lòng chọn danh mục chi!");
      return;
    }
    if (dateController.text.isEmpty ||
        amountController.text.isEmpty ||
        reasonController.text.isEmpty) {
      _showMessage("Vui lòng điền đầy đủ thông tin!");
      return;
    }

    // Thêm khoản chi mới vào danh sách
    setState(() {
      expenses.insert(0, {
        'house': selectedHouse, // Lưu thông tin căn nhà
        'date': dateController.text,
        'amount': amountController.text.replaceAll(
          RegExp(r'[^0-9]'),
          '',
        ), // Lưu số tiền dưới dạng chuỗi chỉ chứa số
        'reason': reasonController.text,
        'category': selectedCategory,
      });
      amountController.text = '0';
      reasonController.text = '';
      selectedCategory = null;
    });
    _showMessage("Đã thêm khoản chi!");
  }

  // Hàm sửa khoản chi
  void _editExpense(int index) {
    final tempDateController = TextEditingController(
      text: expenses[index]['date'],
    );
    final tempAmountController = TextEditingController(
      text: expenses[index]['amount'],
    );
    final tempReasonController = TextEditingController(
      text: expenses[index]['reason'],
    );
    Map<String, dynamic>? tempCategory = expenses[index]['category'];

    // Hiển thị dialog sửa khoản chi
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Sửa khoản chi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tempDateController,
                  readOnly: true, // Không cho phép gõ phím
                  decoration: const InputDecoration(
                    labelText: 'Ngày chi',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    // Mở DatePicker khi nhấn vào ô
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setDialogState(() {
                        // Cập nhật giá trị vào controller để hiển thị lên màn hình
                        tempDateController.text =
                            '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Hiển thị bottom sheet để chọn danh mục chi trong dialog sửa
                    showModalBottomSheet(
                      context: context,
                      builder: (innerContext) => Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Chọn danh mục',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: categories
                                  .map(
                                    (cat) => GestureDetector(
                                      onTap: () {
                                        setDialogState(() {
                                          tempCategory = cat;
                                        });
                                        Navigator.pop(innerContext);
                                      },
                                      // Hiển thị danh mục chi với trạng thái được chọn
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: cat['color'].withOpacity(
                                                0.2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: tempCategory == cat
                                                    ? cat['color']
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: Icon(
                                              cat['icon'],
                                              color: cat['color'],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            cat['name'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // Hiển thị danh mục chi đã chọn hoặc placeholder nếu chưa chọn
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        if (tempCategory != null) ...[
                          Icon(
                            tempCategory!['icon'],
                            color: tempCategory!['color'],
                          ),
                          const SizedBox(width: 10),
                          Text(tempCategory!['name']),
                        ] else
                          const Text('Chọn danh mục'),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                // Các trường thông tin khác
                const SizedBox(height: 10),
                TextField(
                  controller: tempAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Số tiền',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: tempReasonController,
                  decoration: const InputDecoration(
                    labelText: 'Lý do chi',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          // Nút Hủy và Lưu
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2),
              ),
              onPressed: () {
                if (tempCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng chọn danh mục!')),
                  );
                  return;
                }
                // Cập nhật thông tin khoản chi đã sửa
                setState(() {
                  expenses[index] = {
                    'house':
                        expenses[index]['house'], // Giữ nguyên căn nhà được chọn
                    'date': tempDateController.text,
                    'amount': tempAmountController.text.replaceAll(
                      RegExp(r'[^0-9]'),
                      '',
                    ),
                    'reason': tempReasonController.text,
                    'category': tempCategory,
                  };
                });
                Navigator.pop(context);
                _showMessage("Đã cập nhật!");
              },
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xóa khoản chi
  void _deleteExpense(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc muốn xóa khoản chi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                expenses.removeAt(index);
              });
              Navigator.pop(context);
              _showMessage("Đã xóa!");
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Hàm hiển thị thông báo
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  // Hàm định dạng số tiền
  String _formatCurrency(String amount) {
    try {
      final number = int.parse(amount.replaceAll(RegExp(r'[^0-9]'), ''));
      return '${number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), // Thêm dấu chấm sau mỗi nhóm 3 chữ số
        (Match m) => '${m[1]}.',
      )} đ';
    } catch (e) {
      return '0 đ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Quản lý chi", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chọn căn nhà để quản lý chi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Dropdown chọn căn nhà
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.home_work,
                            color: Color(0xFF1976D2),
                          ),
                          title: const Text(
                            'Tất cả các nhà',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: selectedHouse == 'Tất cả các nhà'
                              ? const Icon(
                                  Icons.check,
                                  color: Color(0xFF1976D2),
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedHouse = 'Tất cả các nhà';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        // Danh sách các căn nhà có thể chọn
                        const Divider(),
                        ListTile(
                          title: const Text('123 Nguyễn Đình Chiểu, P5, Q3'),
                          trailing:
                              selectedHouse == '123 Nguyễn Đình Chiểu, P5, Q3'
                              ? const Icon(
                                  Icons.check,
                                  color: Color(0xFF1976D2),
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedHouse = '123 Nguyễn Đình Chiểu, P5, Q3';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('456 Lê Văn Sỹ, P13, Q3'),
                          trailing: selectedHouse == '456 Lê Văn Sỹ, P13, Q3'
                              ? const Icon(
                                  Icons.check,
                                  color: Color(0xFF1976D2),
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedHouse = '456 Lê Văn Sỹ, P13, Q3';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: _fakeDropdown(selectedHouse),
            ),
            const SizedBox(height: 20),

            // Hàng 1: Ngày chi + Danh mục chi
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: 'Ngày chi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                    readOnly: true,
                    // Hiển thị DatePicker khi bấm vào TextField
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      // Cập nhật ngày đã chọn vào TextField
                      if (date != null) {
                        setState(() {
                          dateController.text =
                              '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
                        });
                      }
                    },
                  ),
                ),
                // Danh mục chi tiêu
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: _showCategorySelector,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          if (selectedCategory != null) ...[
                            Icon(
                              selectedCategory!['icon'],
                              color: selectedCategory!['color'],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                selectedCategory!['name'],
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ] else
                            const Expanded(
                              child: Text(
                                'Danh mục chi',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          const Icon(Icons.arrow_drop_down, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Hàng 2: Số tiền + Lý do + Nút Lưu
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Số tiền chi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onTap: () {
                      // Xóa số 0 khi bấm vào
                      if (amountController.text == '0') {
                        amountController.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: reasonController,
                    decoration: InputDecoration(
                      labelText: 'Lý do chi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  onPressed: _addExpense,
                  child: const Text(
                    "Lưu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            // Danh sách chi tiêu đã thêm
            const SizedBox(height: 20),
            const Text(
              "Danh sách phí đã chi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredExpenses.isEmpty
                  ? const EmptyDataWidget()
                  : ListView.builder(
                      itemCount: filteredExpenses.length,
                      itemBuilder: (context, index) {
                        final expense = filteredExpenses[index];
                        final category = expense['category'];
                        final houseName = expense['house'] ?? 'Không rõ';
                        // Tìm index thực trong expenses để sửa/xóa đúng
                        final actualIndex = expenses.indexOf(expense);
                        // Hiển thị thông tin khoản chi
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          elevation: 2,
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: category['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                category['icon'],
                                color: category['color'],
                                size: 24,
                              ),
                            ),
                            title: Text(
                              expense['reason'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${category['name']} • ${expense['date']}',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '🏠 $houseName',
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _formatCurrency(expense['amount']),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                PopupMenuButton(
                                  icon: const Icon(Icons.more_vert),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit, size: 18),
                                          SizedBox(width: 8),
                                          Text('Sửa'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Xóa',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      _editExpense(actualIndex);
                                    } else if (value == 'delete') {
                                      _deleteExpense(actualIndex);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
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
class FeeEntryScreen extends StatelessWidget {
  const FeeEntryScreen({super.key});

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
          "Lập hóa đơn / Báo phí",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fakeDropdown("Chọn căn nhà"),
            const SizedBox(height: 10),
            _fakeDropdown("Chọn phòng (Tất cả)"),
            const SizedBox(height: 20),
            const Text(
              "Chỉ số Điện (Kwh)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _fakeInput("Chỉ số cũ", "1.250")),
                const SizedBox(width: 10),
                Expanded(child: _fakeInput("Chỉ số mới", "0")),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Chỉ số Nước (Khối)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _fakeInput("Chỉ số cũ", "450")),
                const SizedBox(width: 10),
                Expanded(child: _fakeInput("Chỉ số mới", "0")),
              ],
            ),
            const SizedBox(height: 20),
            _fakeInput("Phí dịch vụ khác / Ghi chú", "Nhập nội dung..."),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "TÍNH TIỀN & XUẤT HÓA ĐƠN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeeEntryScreen(),
                  ),
                ),
                child: const Text(
                  "Xem Thống kê báo phí / Lịch sử",
                  style: TextStyle(
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// MÀN HÌNH SAO LƯU & PHỤC HỒI
// ==========================================
class BackupRestoreScreen extends StatelessWidget {
  const BackupRestoreScreen({super.key});

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
          "Sao lưu & Phục hồi",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SAO LƯU DỮ LIỆU",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 10),
            _backupCard(
              Icons.cloud_upload,
              "Sao lưu lên Google Drive",
              "An toàn, tự động đồng bộ qua email",
              Colors.blue,
            ),
            _backupCard(
              Icons.storage,
              "Lưu vào bộ nhớ máy",
              "Tạo file backup nội bộ trên điện thoại",
              Colors.blueGrey,
            ),
            const SizedBox(height: 30),
            const Text(
              "PHỤC HỒI DỮ LIỆU",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            _backupCard(
              Icons.settings_backup_restore,
              "Phục hồi từ Cloud",
              "Lấy lại dữ liệu từ Google Drive",
              Colors.orange,
            ),
            _backupCard(
              Icons.file_present,
              "Chọn file từ máy",
              "Chọn file backup có sẵn trong máy",
              Colors.green,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Lần sao lưu cuối cùng: 08:45 - 08/03/2026",
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backupCard(IconData icon, String title, String sub, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String selectedType = 'Góp ý';

  // Hàm xử lý khi người dùng bấm nút gửi góp ý
  void _submitFeedback() {
    if (nameController.text.isEmpty || messageController.text.isEmpty) {
      _showMessage('Vui lòng điền đầy đủ họ tên và nội dung!');
      return;
    }

    // Hiển thị dialog xác nhận
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30),
            SizedBox(width: 10),
            Text('Gửi thành công!'),
          ],
        ),
        content: const Text(
          'Cảm ơn bạn đã gửi phản hồi. Chúng tôi sẽ xem xét và phản hồi trong thời gian sớm nhất!',
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1976D2),
            ),
            onPressed: () {
              Navigator.pop(context);
              _clearForm();
            },
            child: const Text('Đóng', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Hàm xóa form sau khi gửi góp ý thành công
  void _clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
    setState(() {
      selectedType = 'Góp ý';
    });
  }

  // Hàm hiển thị thông báo
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  // Widget hiển thị thông tin liên hệ và form góp ý
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
          'Liên hệ, góp ý',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin liên hệ
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.info_outline, color: Color(0xFF1976D2)),
                        SizedBox(width: 10),
                        Text(
                          'Thông tin liên hệ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1976D2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _contactRow(Icons.business, 'Công ty', 'Quản lý trọ'),
                    const SizedBox(height: 10),
                    _contactRow(Icons.email, 'Email', 'support@quanlytro.vn'),
                    const SizedBox(height: 10),
                    _contactRow(Icons.phone, 'Hotline', '1900 xxxx'),
                    const SizedBox(height: 10),
                    _contactRow(
                      Icons.location_on,
                      'Địa chỉ',
                      'TP. Hồ Chí Minh, Việt Nam',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Form góp ý
            const Text(
              'Gửi góp ý của bạn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Loại phản hồi
            const Text(
              'Loại phản hồi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              // Dropdown chọn loại phản hồi
              child: DropdownButton<String>(
                value: selectedType,
                isExpanded: true,
                underline: const SizedBox(),
                items: ['Góp ý', 'Báo lỗi', 'Yêu cầu tính năng', 'Khác']
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),

            // Họ tên
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Họ và tên *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),

            // Số điện thoại
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),

            // Nội dung
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Nội dung góp ý *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),

            // Nút gửi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _submitFeedback,
                child: const Text(
                  'Gửi góp ý',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Mạng xã hội
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Theo dõi chúng tôi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialButton(Icons.facebook, 'Facebook'),
                        _socialButton(Icons.mark_email_read, 'Zalo'),
                        _socialButton(Icons.phone_android, 'App'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget hiển thị một hàng thông tin liên hệ
  Widget _contactRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade700),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget hiển thị nút mạng xã hội
  Widget _socialButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1976D2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF1976D2), size: 28),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
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
