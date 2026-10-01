// Query name: Fact_Sales
// Prasyarat: query staging bernama stg_Fact_Sales_Raw sudah ada.
let
    Source = stg_Fact_Sales_Raw,
    #"Removed Duplicates" = Table.Distinct(Source, {"Transaction_ID"}),

    #"Added Channel_Clean" = Table.AddColumn(#"Removed Duplicates", "Channel_Clean", each
        let c = Text.Lower(Text.Trim(Text.Clean(Text.From([Channel]))))
        in if c = "toko" then "Toko"
           else if c = "online" then "Online"
           else if c = "whatsapp" then "WhatsApp"
           else Text.From([Channel]), type text),
    #"Renamed Channel Raw" = Table.RenameColumns(#"Added Channel_Clean", {{"Channel", "Channel_Raw"}}),
    #"Renamed Channel Clean" = Table.RenameColumns(#"Renamed Channel Raw", {{"Channel_Clean", "Channel"}}),

    #"Added Transaction_Date_Clean" = Table.AddColumn(#"Renamed Channel Clean", "Transaction_Date_Clean", each
        let t = Text.Trim(Text.From([Transaction_Date]))
        in try Date.FromText(t, [Format="dd/MM/yyyy", Culture="en-GB"])
           otherwise try Date.FromText(t, [Format="yyyy-MM-dd", Culture="en-US"])
           otherwise null, type date),

    #"Added Unit_Price_Clean" = Table.AddColumn(#"Added Transaction_Date_Clean", "Unit_Price_Clean", each
        if Value.Is([Unit_Price], type text) then
            Number.FromText(Text.Replace(Text.Replace(Text.Trim([Unit_Price]), "Rp", ""), ".", ""))
        else Number.From([Unit_Price]), type number),

    #"Added Discount_Pct_Clean" = Table.AddColumn(#"Added Unit_Price_Clean", "Discount_Pct_Clean", each
        if Value.Is([Discount_Pct], type text) then
            Number.FromText(Text.Replace(Text.Trim([Discount_Pct]), "%", "")) / 100
        else Number.From([Discount_Pct]), type number),

    #"Renamed Numeric Raw" = Table.RenameColumns(#"Added Discount_Pct_Clean", {
        {"Unit_Price", "Unit_Price_Raw"}, {"Discount_Pct", "Discount_Pct_Raw"}}),
    #"Renamed Numeric Clean" = Table.RenameColumns(#"Renamed Numeric Raw", {
        {"Unit_Price_Clean", "Unit_Price"}, {"Discount_Pct_Clean", "Discount_Pct"}}),

    // Satisfaction_Score sengaja TIDAK diisi 0.
    #"Added Month_Start" = Table.AddColumn(#"Renamed Numeric Clean", "Month_Start", each Date.StartOfMonth([Transaction_Date_Clean]), type date),
    #"Added Month_Year" = Table.AddColumn(#"Added Month_Start", "Month_Year", each Date.ToText([Month_Start], "MMM yyyy", "id-ID"), type text),
    #"Added Month_Index" = Table.AddColumn(#"Added Month_Year", "Month_Index", each (Date.Year([Transaction_Date_Clean]) - 2024) * 12 + Date.Month([Transaction_Date_Clean]), Int64.Type)
in
    #"Added Month_Index"
