import Foundation

class EventUtility {
    static var normalEvents: [Event] = []
    static var checkEvents: [Event] = []
    static let specialEvents: [String: String] = [
        "125 St": """
        在这站下车，你看到几个流浪汉歪在地上，还有几个像僵尸一样缓缓向你走来。
        你慌忙的跑去警亭，警察像看傻子一样看着你，"你在说什么？这里是harlem，哪来的回哪去！"
        """,
        "116 St–Columbia University": """
        车上的学生越来越多起来，不乏有各种肤色的留学生。
        你看着他们，想起来十年前自己第一次踏上这片土地时的场景。
        """,
        "96 St (Broadway–Seventh Ave Line)": """
        还没走到站口，你就听见人群窃窃私语。地铁广播里播报紧急情况线路暂停，铁轨也被警戒线拦了起来。
        好像有人跳轨了……
        你远远望过去，铁轨上有一堆建筑工地一样的沙子，盖着一团血糊糊的痕迹。大脑一片空白，本能让你扭头就走，救护车和警车的鸣笛回荡在耳边。
        """,
        "86 St (Lexington Avenue Line)": """
        车厢就要关门了，你冲上了车。只见身后有一对推着婴儿车的夫妇急匆匆的往这边走，说时迟那时快，你一脚卡住了地铁车门。
        虽然被夹了一下，车门还是又打开了。那对夫妇推着婴儿车赶上了车，连忙向你道谢。
        地铁开动，你看见他们把婴儿车的帘子打开，里面竟是一只超迷你茶杯犬！可爱的小狗迎来全车人的目光，你看着自己被夹脏了的白鞋，哭笑不得。
        """,
        "79 St": """
        地铁到站，门打开。
        "让一让！不好意思！让一让！"
        映入眼帘的是一个巨大的沙发，从地铁门间塞了进来。在搬家吗？你看着两个满头大汗的小哥想，他俩直接坐在了自带沙发上。
        有了这个沙发，地铁更像是纽约这座城市的客厅了。
        """,
        "66 St–Lincoln Center": """
        地下通道里，远处传来的悠扬的小提琴声。和一般听到的地铁艺术家不同，这个小提琴格外柔美，吸引着你的脚步去一探究竟。
        你顺着声音找到她，发现你竟然记得这张脸。上次在城市另一端的公园门口，你也是这样被她的演奏吸引到她的面前。
        你看了看她面前的二维码，默默记下了她的名字。纽约这么大，有缘人总会再相遇。
        """,
        "47–50 Sts–Rockefeller Ctr": """
        从车上下来，远远的你看见人群把地铁站里一块空地，围得水泄不通，还有麦克风和吉他的声音传来。
        你好奇的上前观望，天啊，居然是全美最有名的脱口秀主持人，和你超级喜欢的世界著名创作歌手正在路演。
        两个只会出现在电视上的人此刻就在眼前，伴随着人群阵阵欢呼，弹着吉他唱着歌。歌手的声音从便携小音箱里传出，宛如仙乐；脱口秀主持人也在张嘴。
        你努力踮起脚想看得跟清楚一些，一不小心和偶像对上了眼神。尽管只有一秒，但恍惚间你看见偶像调皮的向你眨了眨眼。
        """,
        "Times Sq–42 St": """
        从地铁出来，你彻底迷路了。这里是全纽约最大的地铁站，横跨五条街，有数十条线可以在这里换乘。
        而在这复杂的地下通道之上，也是全世界最知名的中心——时代广场。繁华的时代广场就像赛博朋克的新世界，每一个驻足，仰头观望的人，都向铺天盖地的广告屏幕投去虔诚崇拜的眼神，像教堂里的信徒看到上帝一样。纳斯达克上市在这敲钟，电影发布会在这走红毯，一个个疯狂的梦想在这实现。
        
        迷路的你误入一个安静逼仄的地下通道，那是7号线口。你路过一袋蜷缩着的人，他躺在地上一动不动，你不知道那一团生物是活着还是死了，只能捂着鼻子快速走过。外面是彻夜不眠的时代广场，而在这看不见的阴暗角落里，有一个被抛弃的灵魂正在长眠。
        """,
        "42 St–Port Authority Bus Terminal": """
        欢迎来到时代广场！这里灯火通明，彻夜不眠，上百块巨幕电子屏让人眼花缭乱，把夜晚的天空也照得像白天一样。
        不断拍照的游客，匆匆忙忙的上班族，餐车叫卖的小贩，街头表演的行为艺术家，持着长枪大炮正在拍摄的艺人，大批路边巡逻的警车……嘈杂，繁荣，熙熙攘攘。
        在霓虹灯，各种音乐，川流不息的人群中，还有无数招揽生意的玩偶人。他们戴着米奇，变形金刚，泰迪熊等等的头套，在时代广场上走来走去，和路人挥手击掌，想要得到一点小费。
        
        你悄悄跟在一个外星人玩偶身后，看着他走进了地铁站，摘下头套，里面竟还是一个外星人头……在纽约，任何人都可以找到自己的位置，包括外星人。
        """,
        "34 St–Penn Station (Eighth Avenue Line)": """
        这里是连接附近交通的纽约最大火车站之一，匆匆而过的旅客，有人大包小包，有人穿着精英。
        远远看过去，车站里排起了长长的队……肯定是Path线又出问题了。Path停摆，每天从新泽西往返纽约的上班族，现在全都滞留在曼哈顿。
        倒是隔壁ktown美食一条街的生意更加火爆，灯红酒绿中，你忘记了白天的工作，尽情享受在生活中。
        """,
        "23 St (Sixth Avenue Line)": """
        行驶的地铁中，你坐在地铁上发呆，突然一个白人女孩拍了拍你的肩膀。
        你发现她是刚刚坐在你对面，不停的在小本子上画画的那个女孩。
        "你好，不好意思我刚刚画了一副你，不过我要到站了，这个送给你，祝你有愉快的一天。"
        然后她就小跑着下了车，你看到她递给你的画纸片上你发呆的样子，心里暖暖的。
        """,
        "14 St (Eighth Avenue Line)": """
        早高峰上班，你站在站台边等地铁。光秃秃黑漆漆的铁轨在你眼前，铁轨上好像有什么东西在动。
        是一只大老鼠！！你瞪大了眼睛，看着那只小猫一样大的老鼠，拖着电脑包一样大的pizza盒子，吭哧吭哧往前爬。
        在纽约连老鼠都这么努力！你也要打起精神来！
        """,
        "8 St–NYU": """
        进入地铁站时，你抬头，看见路标上大写着橙色的BDFM。D字被涂鸦划掉，变成了S。
        你会心一笑，城里人真会玩！
        """,
        "Broadway-Lafayette St": """
        因为这站在SOHO的原因，站台上每个人穿着打扮都看起来格外时尚。
        全身各种材料，连包包logo都是黑色的暗黑系少女，浑身上下全是奢侈品的黑皮肤辣妹，头发染的火红的两米男，看起来简约但不简单的老钱白女。
        等等，你好像眼花了，那边怎么站了两个穿搭一模一样的人？卡其色紧身露背上衣，水洗色牛仔裤，马丁靴，金发，连耳环都一模一样……简直像游戏卡bug了一样。
        那一刻，你对时尚潮流又有了新的见解。
        """,
        "Delancey-Essex": """
        这里是L线中城东酒吧区附近，你在站台上看见几个背着琴的视觉系小朋友，看起来是刚刚结束地下演出的样子。
        """,
        "Canal St (Broadway Line)": """
        夏夜，晚上十点，过了华尔街下班的时间，车厢里不再繁忙。
        三五成群的金发白男涌进车厢，他们身材高大，穿着笔挺西装，皮鞋擦得锃亮，头发也梳成大人的模样。
        勾肩搭背脸颊泛红的微醺样子，是下班后去酒会的金融男。尽管身上带着酒气和成熟的古龙水香味，脸上的嬉笑出卖了他们还是小孩。
        也许是酒精作用，他们旁若无旁人的大声聊着天。在他们的高谈阔论中，你依稀听到"几十个亿的单子"，"亲戚家的欧洲酒庄"，"融资创业项目"和"这个夏天实习就快结束了"。
        """,
        "World Trade Center": """
        这里是纽约的一大地标建，一出地铁口，便是曾经911双子塔的旧址。
        尽管官方介绍这站地铁巨大的白色镂空建筑象征着起飞的和平鸽，可大部分人却觉得它看起来却更像巨大生物的脊椎白骨，趴伏在地上。
        旁边是一个下陷的喷泉广场，围绕着黑色大理石碑，刻满了遇难者的名字。名字上时常插着白色的鲜花。
        那天，你看见一对情侣，男方正单膝跪地，向女方求婚。鸽子飞过，围观的亲朋好友发出欢呼，男人女人幸福的拥抱在一起。
        这里曾经是死亡，现在是希望和新生。
        """,
        "Brooklyn Bridge–City Hall": """
        你喜欢坐在车窗边，哪怕地铁是地下，车窗外也有不少风景。
        比如现在，你看到地铁通过的墙壁上，一闪而过的一个个涂鸦，心生好奇。
        """,
        "Rector St (Broadway Line)": """
        深夜，你在空荡荡的地铁站等车，这里是曼哈顿最后一站，列车向前驶进布鲁克林。
        一个穿着嘻哈的黑人小哥在站台对面看着你。你有点害怕，但他却自顾自的在站台上跳起街舞来。
        一曲完毕，他看向站台对面的唯一的你。神使鬼差下，你也跟着音乐开始跳舞……
        """,
    ]
    
    static func loadEventsFromCSV() {
        let allEvents = CSVLoader.loadEvents(from: "events")
        
        normalEvents = allEvents.filter { $0.EventType == .normal }
        checkEvents = allEvents.filter { $0.EventType == .check }
        
        print("Loaded \(normalEvents.count) normal events and \(checkEvents.count) check events")
    }
    
    static func createEventFromStation(_ station: Station) -> Event {
        switch station.EventType {
        case .normal:
            if !normalEvents.isEmpty {
                let randomIndex = Int.random(in: 0..<normalEvents.count)
                var selectedEvent = normalEvents[randomIndex]
                selectedEvent.currentUser = nil
                return selectedEvent
            }
        case .check:
            if !checkEvents.isEmpty {
                let randomIndex = Int.random(in: 0..<checkEvents.count)
                var selectedEvent = checkEvents[randomIndex]
                selectedEvent.currentUser = nil
                self.updateCheckActionConfig(for:&selectedEvent)
                return selectedEvent
            }
        case .special:
            let action = ActionConfig(
            StoryResult: "",
            HPChange: 3,
            MoneyChange: 3,
            SanityChange: 3,
            SkipRound: false,
            RepeatRound: false
        )
            if let story = specialEvents[station.Name] {
                return Event(
                    EventType: station.EventType,
                    Title: "\(station.Name)",
                    Story: story,
                    currentUser: nil,
                    actions: [action]
                )
            }
            break
        }
        
        return Event(
            EventType: station.EventType,
            Title: "Event at \(station.Name)",
            Story: "You have arrived at \(station.Name) station. Something interesting might happen here.",
            currentUser: nil,
            actions: [ActionConfig()]
        )
    }

    private static func updateCheckActionConfig(for event: inout Event) {
        var action1 = ActionConfig(
            StoryResult: "",
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        
        var action2 = ActionConfig(
            StoryResult: "",
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        if event.Title == "孩童" {
            action1.StoryResult = "在她的眼神祈求下，你买了一块巧克力。巧克力真香！你心满意足。"
            action1.HPChange = 2
            action1.MoneyChange = -2
            action2.StoryResult = "你向她摆了摆手，表示不要，下车的时候一摸口袋，哎怎么少了点东西！？"
            action2.MoneyChange = -2
        } else if event.Title == "巡演" {
            action1.StoryResult = "你扫了他们的二维码，打了一杯咖啡的钱。咖啡好喝，生活也不能没有梦想！"
            action1.SanityChange = 2
            action1.MoneyChange = -2
            action2.StoryResult = "你低着头假装什么也没有听见，下车的时候一摸口袋，哎怎么少了点东西！？"
            action2.MoneyChange = -2
        } else if event.Title == "飞跃" {
            action1.StoryResult = "没有人看见你的违法行为，从今天起，你成为了一个真正的New Yorker！"
            action1.HPChange = -2
            action1.MoneyChange = 2
            action2.StoryResult = "警亭里突然冒出来一个黑人大姐，揪住了你，看在你是初犯的份上，补买地铁票，下不为例！"
            action2.MoneyChange = -2
        } else if event.Title == "空车厢" {
            action1.StoryResult = "你当机立断，决定换一节车厢。"
            action1.SanityChange = +2
            action1.HPChange = -2
            action2.StoryResult = "在你犹豫要不要换车厢时，车启动了……接下来到站前，你将一直在害怕流浪汉随时醒来并突然发疯的恐惧之中。"
            action2.SanityChange = -2
        }
        event.actions = [action1, action2]
    }
}
