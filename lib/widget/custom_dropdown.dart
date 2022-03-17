import 'package:bank_pay/constants/color.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  final String? hintText;
  final List<String>? items;
  final ValueChanged<String?>? onChanged;
  final List<DropdownMenuItem<String>>? itemsList;
  final IconData? icon;

  String? _selectedValue;

  CustomDropDown(
      {Key? key, this.onChanged, String? selectedValue, this.items, this.hintText, this.itemsList, this.icon})
      : _selectedValue = selectedValue,
        super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: CustomColors.PrimaryColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(
                widget.icon,
                color: CustomColors.kGrey,
                size: 25,
              ),
              Expanded(
                child: DropdownButton<String>(
                  elevation: 2,
                  dropdownColor: CustomColors.kBackgroundColor,
                  value: widget._selectedValue,
                  iconSize: 30,
                  iconEnabledColor: CustomColors.PrimaryColor,
                  style: const TextStyle(
                    color: CustomColors.AppBlack,
                    fontSize: 17,
                  ),
                  hint: Text(
                    widget.hintText ?? '',
                    style: const TextStyle(
                      color: CustomColors.AppBlack,
                    ),
                  ),
                  items: widget.itemsList,
                  onChanged: widget.onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
