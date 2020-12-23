.Resources
 | to_entries
 | (map({from: .. | .Ref?, to: .key})
   + map({from: .. | .DependsOn?[]?, to: .key})
   + map({from: .. | .["Fn::GetAtt"]?[0]?, to: .key}))
 | map(select(.from and (.from | test("AWS::") | not)))
 | map("from=\"" + .from + "\" to=\"" + .to + "\"")
 | unique
 | .[]
