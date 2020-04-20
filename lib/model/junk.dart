class Junk {
  String label;
  String fact;
  String daePath;
  String source;

  Junk({this.label, this.fact, this.daePath, this.source});

  static final List<Junk> junkData = [
    Junk(
        label: 'Plastic Bottles',
        fact:
            'In 2014, Americans consumed over 3,000 plastic bottles every SECOND.',
        daePath: 'models.scnassets/bottle/bottles.dae',
        source: 'Plastic Oceans International 2020 - The Facts'),
    Junk(
        label: 'Coffee Pods',
        fact: 'Over 1,800 single use coffee pods are thrown out every SECOND.',
        daePath: 'models.scnassets/coffee_pod/coffee_pods.dae',
        source:
            'Halo Coffee 2019 - Is Recycling Aluminium Coffee Capsules Really the Way Forward?'),
    Junk(
        label: 'Styrofoam Cups',
        fact:
            'The USA alone throws out almost 800 styrofoam cups every SECOND.',
        daePath: 'models.scnassets/styrofoam_cup/styrofoam_cups.dae',
        source:
            'earthday.org 2018 - Fact Sheet: How Much Disposable Plastic We Use'),
  ];
}
