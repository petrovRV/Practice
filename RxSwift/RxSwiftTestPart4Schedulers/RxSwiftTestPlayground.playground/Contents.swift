import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift
import UIKit

/*example("without observeOn") {
 _ = Observable.of(1, 2, 3)
 .subscribe(onNext: {
 print("\(Thread.current): ", $0)
 }, onError: nil, onCompleted: {
 print("Completed")
 }, onDisposed: nil)
 }
 
 example("observeOn") {
 _ = Observable.of(1, 2, 3)
 .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
 .subscribe(onNext: {
 print("\(Thread.current): ", $0)
 }, onError: nil, onCompleted: {
 print("Completed")
 }, onDisposed: nil)
 }*/

example("subscribeOn and onseveOn") {
    let queue1 = DispatchQueue.global(qos: .default)
    let queue2 = DispatchQueue.global(qos: .default)
    
    print("Init Thread: \(Thread.current)")
    _ = Observable<Int>.create({ (observer) -> Disposable in
        print("Observable thread: \(Thread.current)")
        
        observer.on(.next(1))
        observer.on(.next(2))
        observer.on(.next(3))
        
        return Disposables.create()
    })
        
        .subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue1")).observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue2"))
        
        .subscribe(onNext: {
            print("Observable thread: \(Thread.current)", $0)
        })
}