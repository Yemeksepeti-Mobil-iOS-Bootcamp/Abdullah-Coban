import Foundation

struct Player {
    var nickname: String
    var score: Int
}

struct BallGun {
    var ballspeed: Double
    var angle: Double
    
    init(angle: Double, ballspeed: Double) {
        self.angle = angle
        self.ballspeed = ballspeed
    }
}

struct Bottle {
    var distance: Double
    var delta: Double
    var status: Bool
    
    init(distance: Double, delta: Double, status: Bool) {
        self.distance = distance
        self.delta = delta
        self.status = status
    }
}


struct Game {
    var player: Player
    var ballGun: BallGun
    var bottle: Bottle
    
    init(player: Player = Player(nickname: "", score: 0), ballGun: BallGun = BallGun(angle: 0, ballspeed: 0),bottle: Bottle = Bottle(distance: 0, delta: 0, status: false)) {
        self.player = player
        self.ballGun = ballGun
        self.bottle = bottle
    }
    
    mutating func PlayerLogin() {
        print("Please, enter nickname: ")
        guard let name = readLine() else { return }
        self.player = Player(nickname: name, score: 0)
    }
    
    mutating func SetBallGun() {
        print("Enter the velocity of ball: ")
        let velocity = readLine()
        
        if(Double(velocity!)! < 0.0 || Double(velocity!)! > 100.0) {
            print("Please, enter a valid velocity 0 - 100 m/s ")
            exit(0)
        }
        
        print("Enter the angle of shooting: ")
        let angle = readLine()
        
        if(Double(angle!)! < 0.0 || Double(angle!)! > 90.0) {
            print("Please, enter a valid angle between 0 - 90 !")
            exit(0)
        }
        
        self.ballGun = BallGun(angle: Double(angle!)!, ballspeed: Double(velocity!)!)
                
    }
    
    mutating func SetBottle() {
        print("Enter distance of bottle: ")
        let distance = readLine()
        if(Double(distance!)! < 0.0 || Double(distance!)! > 1500.0) {
            print("Please, enter a valid distance between 0 - 1500m !")
            exit(0)
        }
        
        print("Enter distance of delta: ")
        let delta = readLine()
        if(Double(delta!)! < 0.0 || Double(delta!)! > 1500.0) {
            print("Please, enter a valid delta between 0.1 - 1m !")
            exit(0)
        }
        
        self.bottle = Bottle(distance: Double(distance!)!, delta: Double(delta!)!, status: false)
        
    }
    
    func ShowParameters() {
        print("Player Information")
        print("Username: \(self.player.nickname), Score: \(self.player.score)")
        print("Ball Gun")
        print("Speed of ball gun: \(self.ballGun.ballspeed), Angle of shooting: \(self.ballGun.angle)")
        print("Bottle")
        print("Distance of Bottle: \(self.bottle.distance), Delta: \(self.bottle.delta)")
    }
    
    func ShowInfo() {
        print("\(self.player.nickname)'s Score: \(self.player.score)")
    }
    
    mutating func Shoot() {
        let gravity: Double = 10
        let range: Double = self.ballGun.ballspeed * self.ballGun.ballspeed * sin(2 * self.ballGun.angle) / gravity
        
        if ((self.bottle.distance - self.bottle.delta) <= range) && ((self.bottle.distance + self.bottle.delta) > range) {
            self.bottle.status = true
            self.player.score += 1
            print("Congratulations! Succes Shooting!")
        } else {
            print("You missed the bottle!")
        }
    }
    
    
    
    
}


func Play() {
    var play = Game()
    play.PlayerLogin()
    play.SetBallGun()
    play.SetBottle()
    play.ShowParameters()
    print("Are you ready? y/n")
    let ready = readLine()
    if ready == "y" {
        play.Shoot()
    } else {
        exit(0)
    }
    print("Shooting completed.")
    play.ShowInfo()
    
    print("Do you want play new game? y/n")
    let newGame = readLine()
    
    if newGame == "y" {
        Play()
    } else {
        exit(0)
    }
    
    
}


Play()

