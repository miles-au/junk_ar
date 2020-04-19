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
            'Humans worldwide produce about 16,000 plastic bottles every SECOND.',
        daePath: 'models.scnassets/bottle/bottle.dae',
        source: 'Reuters 2019 - Drowning in plastic'),
    Junk(
        label: 'Coffee Pods',
        fact: 'Over 1,800 single use coffee pods are thrown out every SECOND.',
        daePath: 'models.scnassets/coffee_pod/coffee_pod.dae',
        source:
            'Halo Coffee 2019 - Is Recycling Aluminium Coffee Capsules Really the Way Forward?'),
    Junk(
        label: 'Takeout Containers',
        fact: 'A shit ton of takeout containers are thrown out every SECOND.',
        daePath: 'models.scnassets/coffee_pod/coffee_pod.dae',
        source: 'My eyes'),
  ];
}
