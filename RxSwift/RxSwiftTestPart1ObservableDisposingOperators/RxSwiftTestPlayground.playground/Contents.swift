import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import RxSwift

example("Test") {
    let intObservable = Observable.just(30)
    let stringObservable = Observable.just("Hello")
}

/*example("just") {
    //OBSERVABLE
    let observable = Observable.just("hello, RxSwift!")
    
    //OBSERVER
    observable.subscribe({ (event) in
        print(event)
    })
}*/

/*example("of") {
    let observable = Observable.of(1, 2, 3, 4, 5)
    observable.subscribe({ (event) in
        print(event)
    })
    
    observable.subscribe {
        print($0)
    }
}

example("create") {
    let items = [1, 2, 3, 4, 5]
    Observable.from(items).subscribe(onNext: { (event) in
        print(event)
    }, onError: { (error) in
        print("error")
    }, onCompleted: {
        print("Ok!")
    }, onDisposed: { 
        print("Disposed")
    })
}

example("Disposable") {
    let seq = [1, 2, 3]
    Observable.from(seq).subscribe({ (event) in
        print(event)
    })
    
    Disposables.create()
}

example("dispose") {
    let seq = [1, 2, 3]
    let subscription = Observable.from(seq)
    subscription.subscribe({ (event) in
        print(event)
    }).dispose()
}

example("disposeBage") {
    let disposeBag = DisposeBag()
    let seq = [1, 2, 3]
    let subscription = Observable.from(seq)
    subscription.subscribe({ (event) in
        print(event)
    }).addDisposableTo(disposeBag)
    
}

example("takeUntil") {
    let stopSeq = Observable.just(1).delay(2, scheduler: MainScheduler.instance)
    let seq = Observable.from([1, 2, 3]).takeUntil(stopSeq)
    seq.subscribe {
        print($0)
    }
}

example("filter") {
    let seq = Observable.of(1, 2, 20, 3, 40).filter{ $0 > 10 }
    seq.subscribe({ (event) in
        print(event)
    })
}

example("map") {
    let seq = Observable.of(1, 2, 3).map { $0 * 10 }
    seq.subscribe({ (event) in
        print(event)
    })
}
*/

example("merge") {
    let firstSeq = Observable.of(1, 2, 3)
    let secondSeq = Observable.of(4, 5, 6)
    
    let bothSeq = Observable.of(firstSeq, secondSeq)
    let mergeSeq = bothSeq.merge()
    
    mergeSeq.subscribe({ (event) in
        print(event)
    })
}
