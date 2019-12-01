type predicate<T> = (e: T) => boolean;

export function keep<T>(collection: any[], fun: predicate<T>) {
  return collection.filter(fun);
}

export function discard<T>(collection: any[], fun: predicate<T>) {
  return collection.reduce((prev, curr) => {
    if (!fun(curr)) prev.push(curr);
    return prev;
  }, []);
}
