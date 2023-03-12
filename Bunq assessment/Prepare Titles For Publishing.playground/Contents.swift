import Foundation

func prepareTitlesForPublishing(titles: [String]) -> String {
    
    let concatenated = titles.joined(separator: " ")
    let nonNumber = concatenated.replacingOccurrences(of: "\\d", with: "", options: .regularExpression)
    let words = nonNumber.split(separator: " ").map{ String($0) }
    let capitalised = words.map{ $0.capitalized }
    let final = capitalised.joined(separator: " ")
    return final
}

let titles1 = ["hello123123 world", "gOodBye moon", "12345"]
let final1 = prepareTitlesForPublishing(titles: titles1)
print("\(final1) - \(final1 == "Hello World Goodbye Moon")" )

let titles2 = ["2Here2 ","is"," our STRING",]
let final2 = prepareTitlesForPublishing(titles: titles2)
print("\(final2) - \(final2 == "Here Is Our String")" )

let titles3 = ["","Fresh fried fish - fish fresh fried",]
let final3 = prepareTitlesForPublishing(titles: titles3)
print("\(final3) - \(final3 == "Fresh Fried Fish - Fish Fresh Fried")" )

let titles4 = ["break3ing news5:","1A 1circle is round!",]
let final4 = prepareTitlesForPublishing(titles: titles4)
print("\(final4) - \(final4 == "Breaking News: A Circle Is Round!")" )

let titles5 = ["123","eat;sleep;repeat","321"]
let final5 = prepareTitlesForPublishing(titles: titles5)
print("\(final5) - \(final5 == "Eat;Sleep;Repeat")" )
