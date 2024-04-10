# SIZER PLUS

A Flutter package to deal with parenting relative layout.<br/>
You can define child Widgets sizes based on their parents, starting from page<br/>
<br/>


- [SIZER PLUS](#sizer-plus)
  - [Defining](#defining)
  - [Relative Size](#relative-size)
  - [Min and Max](#min-and-max)
  - [Orientation](#orientation)
  - [FontSize](#fontsize)
- [Contribute](#contribute)




## Defining

To define a Sizer in your page you just need to instanciate a Sizer.of(context) in build method.

```dart

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer.of(context);
    return Scaffold(
      body: Container(
        height: size.height(100), // 100% of screen height
        width: size.width(100), // 100% of screen width
        alignment: Alignment.center,
        child: Box(size: size.fraction(height: 40, width: 90)),
      ),
    );
  }
}

```


## Relative Size
You can passa the size to use inside another Widget, throught fraction method

```dart

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer.of(context);
    return Scaffold(
      body: Container(
        height: size.height(100), //100% of screen height
        width: size.width(100), //100% of screen width
        alignment: Alignment.center,
        child: Box(size: size.fraction(height: 40, width: 90)), // setting Box as 40% of screen height and 90% of screen width 
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Sizer size;
  const Box({super.key, required this.size});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height(100), //100% of Box height == 40% of Screen height
      width: widget.size.width(100), //100% of Box width == 90% of Screen width
      color: Colors.blue,
      alignment: Alignment.center,
      child: Button(size: widget.size.fraction(height: 30, width: 90)),  // setting Box as 30% of Box height and 90% of Box width 
    );
  }
}

class Button extends StatelessWidget {
  final Sizer size;
  const Button({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height(100), //100% of Button height == 30% of Box height
      width: size.width(100), //100% of Button width == 90% of Box width
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "Botão",
        style: TextStyle(fontSize: size.height(50)), // 50% of Button height
      ),
    );
  }

```


## Min and Max
Some times we need to decided some sizes based on differents screen ratios. 
For example if we have to display a sequence of squared boxes.
In these cases we can count on min and max methods

It acts like a decision maker in real time. 
It calculates the desired height or width. 
Compare both, and returns the greater or lower depends on what method you are using.

The min method returns e lowest value between the calculated heigth or width

```dart

  ...
  Container(
    height: size.min(30, 10), // 30% of height or 10% of width
    width: size.min(30, 10), // returns the lower
  )

```

The min method returns e lowest value between the calculated heigth or width

```dart

  ...
  Container(
    height: size.max(30, 10), // 30% of height or 10% of width
    width: size.max(30, 10), // returns the greater
  )

```



## Orientation
With orientation you can identify at runtime if the screen is portrait or landscape
It's usefull to make breakpoint decisions.
Mostly of the breakchanges in the layout has more to do with the orientation than the resolution.

```dart

  ...
  if(size.orientation.isVertical)
   Column(children:[
      ...
   ])
  else
    Row(children:[
      ...
    ])

```


## FontSize
A size calculation based on the relation between the height and the width available.
This is called fontSize because it was create to use in texts, where the text can overflow both vertically or horizontally.
Using fontSize to calculate the size of the font can minimize the overflow problem, both for multiline texts, as for long lines.

```dart

  ...
  Text(
    "Text Example"
    height: size.fontSize(3), // 3% of the parent width, ajusted acording to the ratio of the parent
  )

```



<br/><br/>

# Contribute
If you have some improvement or correction to make, please feel free to open an issue or pull request on the github project. All feedback are very welcome.


<a href="https://www.buymeacoffee.com/guilhermetog" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174">
</a># sizer_plus
