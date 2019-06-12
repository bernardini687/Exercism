export const reverseString = word => {
  let reverseWord = '';
  for (let index = word.length; index > 0; index--)
    reverseWord += word[index - 1];
  return reverseWord;
};
