class Trash {
  String label;
  String fact;
  String daePath;
  String source;

  Trash({this.label, this.fact, this.daePath, this.source});

  static final List<Trash> trashData = [
    Trash(
        label: 'Plastic Bottles',
        fact:
            'Humans worldwide produce about 16,000 plastic bottles every SECOND.',
        daePath: 'models.scnassets/bottle/bottle.dae',
        source: 'Reuters 2019 - Drowning in plastic'),
    Trash(
        label: 'Coffee Pods',
        fact: 'Over 1,800 single use coffee pods are thrown out every SECOND.',
        daePath: 'models.scnassets/coffee_pod/coffee_pod.dae',
        source:
            'Halo Coffee 2019 - Is Recycling Aluminium Coffee Capsules Really the Way Forward?'),
  ];
}
