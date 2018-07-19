package io.weli.rxjava;

import io.reactivex.Observable;

public class SourceMapDemo {
    public static void main(String[] args) {
        Observable<String> source = Observable.create(emitter -> {
            try {
                emitter.onNext("Alpha");
                emitter.onNext("Beta");
                emitter.onNext("Gamma");
                emitter.onNext("Delta");
                emitter.onNext("Epsilon");
//                emitter.onComplete();
            } catch (Throwable e) {
                emitter.onError(e);
            }
        });
        Observable<Integer> lengths = source.map(String::length);

        Observable<Integer> filtered = lengths.filter(i -> i >= 5);

        filtered.subscribe(s -> System.out.println("GOOD: " + s));
    }
}