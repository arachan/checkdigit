let
    // Get EAN12 Code from Excel Column
    Source= Excel.CurrentWorkbook(){[Name="JAN12Code"]}[Content],
    // Change EAN12 Text Type
    ChangedType = Table.TransformColumnTypes(Source,{{"EAN12", type text}}),
    // Add checkdigit to Excel Sheet
    AddCustom = Table.AddColumn(ChangedType, "checkdigit", 
    // Calculate Checkdigit
    each Number.Mod(10-Number.Mod(
    //    add even digits and 3 times 
    (Value.FromText(Text.At([EAN12],1))
    +Value.FromText(Text.At([EAN12],3))
    +Value.FromText(Text.At([EAN12],5))
    +Value.FromText(Text.At([EAN12],7))
    +Value.FromText(Text.At([EAN12],9))
    +Value.FromText(Text.At([EAN12],11)))*3
    //    add odd digits
    +Value.FromText(Text.At([EAN12],0))
    +Value.FromText(Text.At([EAN12],2))
    +Value.FromText(Text.At([EAN12],4))
    +Value.FromText(Text.At([EAN12],6))
    +Value.FromText(Text.At([EAN12],8))
    +Value.FromText(Text.At([EAN12],10))
    //     add digits divided by 10 with a reminder
    //     10 - reminder and devided by 10 with a reminder
    ,10),10)),
    AddCustom2 = Table.AddColumn(AddCustom, "EAN13", each [EAN12]&Number.ToText([checkdigit]))
in
    AddCustom2
