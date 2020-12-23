.Resources
 | to_entries
 | map("id=\"" + .key + "\" type=\"" + .value.Type + "\"")
 | .[]
