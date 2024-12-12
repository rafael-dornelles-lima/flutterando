class Pearson {
  String _name = '';
  String _lastName = '';
  double _weight;
  double _height;

  Pearson(this._name, this._lastName, this._weight, this._height);

  String fullName() {
    return this._name + ' ' + this._lastName;
  }

  double calculateBodMassIndex() {
    if (this._weight > 0 && this._height > 0) {
      return this._weight / (this._height * this._height);
    }
    throw Exception('Please provide weight and height.');
  }
}
