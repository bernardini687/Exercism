type predicate<T> = (item: T) => boolean;

export function keep<T>(items: T[], fn: predicate<T>) {
  return items.filter(fn);
}

export function discard<T>(items: T[], fn: predicate<T>) {
  return items.reduce((select: T[], item: T) => {
    if (!fn(item)) select.push(item);
    return select;
  }, []);
}
