type predicate<T> = (item: T) => boolean;

export function keep<T>(collection: Array<T>, fn: predicate<T>) {
  return collection.filter(fn);
}

export function discard<T>(collection: Array<T>, fn: predicate<T>) {
  return collection.reduce((select: Array<T>, item: T) => {
    if (!fn(item)) select.push(item);
    return select;
  }, []);
}
