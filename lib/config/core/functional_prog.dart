abstract class EitherOf<Failure,Success>{
  const EitherOf();
  T get<T>(
    T Function (Failure reject) isReject,
    T Function (Success resolve) isResolve,
  );

  Success getOrElse(Success Function ()orElse)=> get((_)=>orElse(),id);
}

class Reject<Failure,Success> extends EitherOf<Failure,Success>{

  final Failure _failure;
  const Reject(this._failure);

  @override
  T get<T>(T Function(Failure reject) isReject, T Function(Success resolve) isResolve) =>isReject(_failure);
  
} 

class Resolve<Failure,Success> extends EitherOf<Failure,Success> {

  final Success _success;
  const Resolve(this._success);
  @override
  T get<T>(T Function(Failure reject) isReject, T Function(Success resolve) isResolve) => isResolve(_success);
}
EitherOf<Failure,Success> reject<Failure,Success>(Failure reject)=>Reject(reject);
EitherOf<Failure,Success> resolve<Failure,Success>(Success resolve)=>Resolve(resolve);

A id<A>(A a)=>a;