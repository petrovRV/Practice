import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift

/*example("PublishSubject") {
    let disposablebag = DisposeBag()
    
    let subject = PublishSubject<String>()
    
    subject.subscribe {
        print("Subscription First: ", $0)
    }.addDisposableTo(disposablebag)
    
    subject.on(.next("Hello"))
    subject.onNext("RxSwift")
    subject.subscribe(onNext: {
        print("Subscription Second: ", $0)
    }).addDisposableTo(disposablebag)
    
    subject.onNext("Hi!")
    subject.onNext("My name is Yura")
 }

example("BehaviorSubject") {
    let disposablebag = DisposeBag()
    let subject = BehaviorSubject(value: 1)//[1]
    
    let firstSubscription = subject.subscribe(onNext: {
        print(#line, $0)
    }).addDisposableTo(disposablebag)
    
    subject.onNext(2)//[1, 2]
    subject.onNext(3)//[1, 2, 3]
    
    let secondSubscription = subject.map({ $0 + 2 }).subscribe(onNext: {
        print(#line, $0) // 3 last value
    }).addDisposableTo(disposablebag)
}

example("ReplaySubject") {
    let disposablebag = DisposeBag()
    /*let subject = ReplaySubject<String>.create(bufferSize: 1)
    
    subject.subscribe {
        print("First subsription: ", $0)
    }.addDisposableTo(disposablebag)
    
    subject.onNext("a")
    subject.onNext("b")
    
    subject.subscribe {
        print("Second subsription: ", $0)
    }.addDisposableTo(disposablebag)
    
    subject.onNext("c")
    subject.onNext("d")*/
    let subject = ReplaySubject<Int>.create(bufferSize: 3)
    subject.onNext(1)
    subject.onNext(2)
    subject.onNext(3)
    subject.onNext(4)
    
    subject.subscribe {
        print($0)
    }.addDisposableTo(disposablebag)
}*/

example("Variables") {
    let disposableBag = DisposeBag()
    
    let variable = Variable("A")
    
    variable.asObservable().subscribe(onNext: {
        print($0)
    }).addDisposableTo(disposableBag)
    
    variable.value = "B"
}