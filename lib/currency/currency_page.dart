import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/currency/currency_model.dart';
import 'package:flutter_homework/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage(this._lictCurrency, this._topCur, this._bottomCur,
      {Key? key})
      : super(key: key);
  final List<CurrencyModel> _lictCurrency;
  final String? _topCur;
  final String? _bottomCur;
  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final List<CurrencyModel> _filterList = [];
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filterList.addAll(widget._lictCurrency);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2235),
      appBar: AppBar(
        backgroundColor: const Color(0xff1f2235),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: null,
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xff2d334d),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
              size: 20,
            ),
            hintText: 'Search',
            hintStyle: kTextStyle(
                color: Colors.white54, size: 16, fontWeight: FontWeight.w500),
            suffixIcon: IconButton(
              onPressed: () {
                _editingController.clear();
                setState(() {
                  _filterList.clear();
                  _filterList.addAll(widget._lictCurrency);
                });
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              _filterList.clear();
              for (final item in widget._lictCurrency) {
                if (item.ccy!.toLowerCase().contains(value.toLowerCase()) ||
                    item.ccyNmEn!.toLowerCase().contains(value.toLowerCase())) {
                  _filterList.add(item);
                }
              }
            } else {
              _filterList.addAll(widget._lictCurrency);
            }
            setState(() {});
          },
        ),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (context, index) {
            var model = _filterList[index];
            bool isChosen = widget._topCur == widget._bottomCur;
            return ListTile(
              onTap: () {
                if (isChosen) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: const Color(0xff2d334d),
                      content: Text(
                        'It has been chosen',
                        style: kTextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      )));
                }
                Navigator.pop(context, model);
              },
              tileColor: const Color(0xff2d334d),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(22.5),
                child: SvgPicture.asset(
                  'assets/flags/${model.ccy?.substring(0, 2).toLowerCase()}.svg',
                  height: 45,
                  width: 45,
                ),
              ),
              title: Text(
                model.ccy ?? '',
                style: kTextStyle(size: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                model.ccyNmEn ?? '',
                style: kTextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                model.rate ?? '',
                style: kTextStyle(size: 16, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: isChosen
                      ? const BorderSide(color: Color(0xff10a4d4), width: 2)
                      : BorderSide.none),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: _filterList.length),
    );
  }
}
