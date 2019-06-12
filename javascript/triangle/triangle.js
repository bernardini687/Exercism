export class Triangle {
  constructor(side1, side2, side3) {
    this.sides = [side1, side2, side3];
  }

  valid() {
    const sumOf = array => array.reduce((acc, val) => acc + val);
    const sidesArePositive = this.sides.every(side => side > 0);
    const triangleInequality = this.sides.every(side => side <= sumOf(this.sides) - side);
    return sidesArePositive && triangleInequality;
  }

  kind() {
    if (this.valid()) {
      // case this.sides.uniq.length
      // when 3 => scalene
      // when 2 => isoscele
      // when 1 => equi
    }
  }
}


let temp = new Triangle(2, 2, 2);
console.log(temp.valid());
