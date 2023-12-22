# SIZER PLUS

A Flutter package to deal with parenting relative layout.<br/>
You can define child Widgets sizes based on their parents, starting from page<br/>
<br/>


- [SIZER PLUS](#sizer-plus)
  - [Defining](#defining)
  - [Relative Size](#relative-size)
- [Contribute](#contribute)



<a name="sizer"></a>

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

<a name="plug-data"></a>

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


<br/><br/>

# Contribute
If you have some improvement or correction to make, please feel free to open an issue or pull request on the github project. All feedback are very welcome.


<a href="https://www.buymeacoffee.com/guilhermetog" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174">
</a># sizer_plus
