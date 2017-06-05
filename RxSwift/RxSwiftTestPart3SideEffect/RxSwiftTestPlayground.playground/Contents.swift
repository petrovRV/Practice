import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

example("SideEffect") {
    let db = DisposeBag()
    let seq = [0, 32, 100, 300]
    let tempSeq = Observable.from(seq)
    
    tempSeq.do(onNext: {
        print("\($0)F = ", terminator: "")
    }).map( {
        Double( $0 - 32 ) * 5/9.0
    }).subscribe(onNext: {
        print(String(format: "%.1f", $0))
    }).addDisposableTo(db)
}