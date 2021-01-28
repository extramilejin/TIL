// 2021.01.28 extramilejin

import Foundation
func isRightBrakets (_ b: [String]) -> Bool {
    guard b[0] != ")" else {return false}
	var stk = [String]()
	for index in 0..<b.count {
		if b[index] == "(" {stk.append("(")
        } else {
			guard !stk.isEmpty else {return false}
			stk.removeLast()
		}
	}
	if stk.isEmpty {return true}
    return false;
}

func solution(_ p: String) -> String {
    var str = p.map{String($0)}
    if str.isEmpty || isRightBrakets(str) { return p
    } else {
		var u = "", v = ""
		var lc = 0, rc = 0
		for i in 0..<str.count {
			if str[i] == "(" { lc += 1 
            } else { rc += 1 }
            
			if lc == rc {
				for j in 0...i {
					u += str[j]
				}
                for j in i + 1 ..< p.count {
                    v += str[j]
                }
				break;
			}
		}
        
		if isRightBrakets(u.map{String($0)}) {
			return u + solution(v);
		}
		else {
			var ret = "";
			ret += "(";
			ret += solution(v);
			ret += ")";
			if u.count <= 2 { return ret }
            
			for i in 1...u.count - 2 {
                var index = u.index(u.startIndex, offsetBy: i)
				if u[index] == "(" {ret += ")"
                } else { ret += "(" }
			}
            
			return ret;
		}
	}
    return ""
}