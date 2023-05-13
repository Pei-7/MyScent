//
//  ViewController.swift
//  MyScent
//
//  Created by 陳佩琪 on 2023/5/13.
//

import UIKit

class ViewController: UIViewController {
    
//input page
    
    @IBOutlet var infoInputView: UIView!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var IEslider: UISlider!
    @IBOutlet weak var NSslider: UISlider!
    @IBOutlet weak var FTslider: UISlider!
    @IBOutlet weak var JPslider: UISlider!
    @IBOutlet weak var ingredientSwitch: UISwitch!
    
    var IE :String = ""
    var NS :String = ""
    var FT :String = ""
    var JP :String = ""
    
    
//output page
    
    @IBOutlet var infoOutputView: UIView!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scentStyleLabel: UILabel!
    @IBOutlet weak var topNoteTextView: UITextView!
    @IBOutlet weak var middleNoteTextView: UITextView!
    @IBOutlet weak var baseNoteTextView: UITextView!
    
    @IBOutlet var ingredientView: UIView!
    @IBOutlet var noIngredientView: UIView!
    
    
    let personalities = ["INTJ","INTP","ENTJ","ENTP","INFJ","INFP","ENFJ","ENFP","ISTJ","ISFJ","ESTJ","ESFJ","ISTP","ISFP","ESTP","ESFP"]
    let characters = ["Architect 建築師","Logician 邏輯學家","Commander 指揮官","Debater 辯論家","Advocate 提倡者","Mediator 調停者","Protagonist 主人公","Campaigner 活動家","Logistician 軍需官","Defender 守衛者","Executive 執行長","Consul 執政官","Virtuoso 演奏家","Adventurer 探險家","Entrepreneur 企業家","Entertainer 表演者"]
    let descriptions = ["獨立、自信，想像力豐富卻很果斷，充滿好奇心但從不浪費精力，是理性客觀的完美主義者。","熱愛追求知識、又富有創造力，獨立、安靜、理性，擅長理清邏輯關系。","堅定、勇敢、富有創造力。善於規劃掌控，樂於接受挑戰，絕不輕言放棄。","自信、聰穎、長於創造、善於雄辯。不喜歡被控制，並勇於跳脫框架。","具強烈的道德感、追求完美與理想。擁有深刻的洞察力，會為自己的信念奮鬥。","富想像力的理想主義者，喜歡獨處和思考，堅守自己價值觀及信念，重視心靈上的滿足。","熱情且有責任感，做事果決、充滿幹勁。喜歡幫助、啟發他人。","樂觀愛玩，永遠保持童心與好奇，熱情且有創造力，能夠為了理想而拼命。","務實正直、恪盡職守、腳踏實地。勇於承擔責任並努力達成目標。","善於傾聽、理解，天性和善、責任感強，重視穩定和安全感。","做事高效果斷，善於計劃，喜歡團隊合作，循規蹈矩。對自己要求嚴格，不輕易展示自己的情緒。","外向健談，熱情溫暖，樂於照顧他人，講究實事求是。具有強烈責任感的利他主義者。","冷靜疏離而具有神秘感，善於觀察探索事物，樂於動手解決問題。","溫柔浪漫、富有閒情逸趣，喜歡追求變化，想像力高、適應力強。","聰明跳脫，熱愛冒險，善於交際。不會瞻前顧後，總能在不斷前進中成長學習。","社交中心，活潑熱情。樂於嘗試新鮮事物，活在當下。觀察力敏銳且，具有強烈個人風格。"]
    let scentStyle = ["強烈辛辣的綠質調","澄淨低調的柑苔調","強勢大膽的木質調","辛辣清新的東方調","若隱若現的木質調","若隱若現的東方調","清淡沈穩的花香調","香甜靈動的柑苔調","清新淺淡的木質調","沈穩自然的東方調","清爽內斂的花香調","香甜馥郁的柑橘調","辛辣中性的花香調","清新朦朧的綠質調","辛辣濃重的木質調","酸甜熱烈的柑苔調"]
    
    let femaleTopNote = ["鮮綠柑橘","夜茉莉、胡荽、牡丹、佛手柑","小蒼蘭、 粉色牡丹、 荔枝","檸檬、花椒、當歸","玫瑰","羅馬洋甘菊","牡丹、鈴蘭花、檸檬","檸檬、哈密瓜、金盞花","佛手柑、葡萄柚、檸檬、柑橘","橙花、茉莉","白香松、黑醋栗","巧克力、甜橙糖果、香草、焦糖","當歸、苦艾、黑加侖、薑黃","紫羅蘭葉、青木瓜、茉莉","小豆蔻、肉桂、生薑","紅莓、枸杞、佛手柑"]
    let femaleMiddleNote = ["鳶尾、茉莉","玫瑰、沙巴茉莉","木蘭花、 玫瑰花、 鈴蘭","茉莉、無花果、白松香","弗吉尼亞雪松","印度珊瑚茉莉、麝香","玫瑰、鳶尾花","鳳梨、黑醋栗","天竺葵、依蘭、玫瑰、無花果、橙花","水蜜桃、玫瑰、肉桂","茉莉花、晚香玉、鈴蘭","牛奶、檀木、龍誕香、祕魯橙花","五月玫瑰、保加利亞玫瑰、土耳其玫瑰","玫瑰、山谷百合","玫瑰、茉莉、伊蘭","扶桑花、睡蓮"]
    let femaleBaseNote = ["廣藿香、麝香","廣藿香、零陵香豆","香柏木、 甜蜜、 琥珀 ","焚香、琥珀 、零陵香豆","海地香根草、麝香","檀香、雪松、香草","白麝香、雪松","琥珀、白雪松、白麝香","橄欖樹、零陵香豆","檀香、皮革、琥珀、沉香、麝香","麝香、琥珀","苔蘚、雪松、廣藿香","廣藿香、冷杉、松樹、焚香","保加利亞玫瑰、白麝香、龍涎香","檀香、乳香、麝香","麝香木、雪松、石榴"]
    
    let maleTopNote = ["白松香、橙花、穀粒","葡萄柚","波旁岩蘭草","羅勒, 血橙 ","水仙花、橙花","葡萄柚","尤加利、柑橘、葡萄柚、蜜橘","佛手柑、檸檬，西柚、柑橘、橘子","葡萄柚、鼠尾草、荳蔻","黑莓、葡萄柚","柚子、 鼠尾草、檸檬","巴西花梨木、 西西里佛手柑、 柑橘","當歸、苦艾、黑加侖、薑黃","鳶尾花","白松香、苦橙花精萃、茴香、八角","鼠尾草、柑橘油、肉豆蔻"]
    let maleMiddleNote = ["玫瑰、含羞草、水仙、紫羅蘭","雪松、檀香","喀什米爾木香、香根草","木蘭花、玫瑰 ","波斯樹脂","蘆筆管、風信子、睡蓮","肉豆蔻、胡椒","無花果、粉紅胡椒、茉莉","肉桂皮、天竺葵","月桂葉、花香","肉桂葉 、紫羅蘭葉、薰衣草","甘菊、 向日葵、 野玫瑰","五月玫瑰、保加利亞玫瑰、土耳其玫瑰","薰衣草","樹脂、茉莉花、線香","粉紅胡椒、冷杉、迷迭香"]
    let maleBaseNote = ["橡樹、西洋杉木、香根草、頓加豆","廣藿香、龍涎香、苔蘚、零陵香豆","麝香、白扁柏木","柑橘、檀香、麝香 ","珍木","無花果、鳶尾花、麝香、焚香","松樹、焚香、雪松、香根草","麝香、雪松、無花果蜜","香根草、琥珀、癒創木","雪松木、香草根","雪松木、珍貴木質香","白桃、 佛羅倫斯鳶尾花、 香草","廣藿香、冷杉、松樹、焚香","皮革、麝香","麝香、雪松、香樹脂","廣藿香、西印度檀香、香根草、雪松"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        infoOutputView.isHidden = true
        
    }

    

    func identifyIE() {
        if IEslider.value <= 0.5 {
            IE = "I"
        } else {
            IE = "E"
        }
        
    }
    
    func identifyNS() {
        if NSslider.value <= 0.5 {
            NS = "N"
        } else {
            NS = "S"
        }
    }
    
    func identifyFT() {
        if FTslider.value <= 0.5 {
            FT = "F"
        } else {
            FT = "T"
        }
    }
    
    func identifyJP() {
        if JPslider.value <= 0.5 {
            JP = "J"
        } else {
            JP = "P"
        }
    }
    
    
    
    @IBAction func checkResult(_ sender: UIButton) {
        infoOutputView.isHidden = false
        identifyIE()
        identifyNS()
        identifyFT()
        identifyJP()
        var personality = IE + NS + FT + JP
        personalityLabel.text = personality
       
        index = personalities.firstIndex(of: personality)!
        
        
        characterLabel.text = characters[index]
        descriptionTextView.text = descriptions[index]
        scentStyleLabel.text = scentStyle[index]
        
        if genderControl.selectedSegmentIndex == 0 {
            topNoteTextView.text = femaleTopNote[index]
            middleNoteTextView.text = femaleMiddleNote[index]
            baseNoteTextView.text = femaleBaseNote[index]
        } else {
            topNoteTextView.text = maleTopNote[index]
            middleNoteTextView.text = maleMiddleNote[index]
            baseNoteTextView.text = maleBaseNote[index]
        }
        
        if ingredientSwitch.isOn {
            ingredientView.isHidden = false
            noIngredientView.isHidden = true
        } else {
            ingredientView.isHidden = true
            noIngredientView.isHidden = false
        }
        
        
    }
    
    
    @IBAction func redo(_ sender: Any) {
        infoOutputView.isHidden = true
    }
}

