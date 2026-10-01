// Query name: audit_Fact_Sales_Branch
let
    Source = Fact_Sales,
    #"Merged Dim_Branch" = Table.NestedJoin(Source, {"Branch_ID"}, Dim_Branch, {"Branch_ID"}, "Dim_Branch", JoinKind.LeftOuter),
    #"Expanded Branch" = Table.ExpandTableColumn(#"Merged Dim_Branch", "Dim_Branch", {"Branch_Name", "City", "Region"}, {"Branch_Name", "City", "Region"}),
    #"Added Branch_Key_Audit" = Table.AddColumn(#"Expanded Branch", "Branch_Key_Audit", each if [Branch_Name] = null then "Orphan key - tidak ditemukan di Dim_Branch" else "Valid", type text),
    #"Orphan Only" = Table.SelectRows(#"Added Branch_Key_Audit", each [Branch_Key_Audit] <> "Valid")
in
    #"Orphan Only"
