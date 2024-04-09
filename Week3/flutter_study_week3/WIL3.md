### Theme

build를 호출하는 부분을 보면 MaterialApp의 파라미터로 theme을 전달하도록 되어있다. 2주차 과제를 보면 앱바 부분이 바이올렛 색인데, 이걸 여기서 지정해주는 것 같다. 구체적인 코드를 보면

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Week3"),
    );
  }
}
```

요렇게 딥퍼플을 시드 컬러로 사용하도록 되어있다. 찾아보니 ColorScheme class는 머터리얼 스펙에서 기본적으로 제공하는 25가지 색상 템플릿이다. 시드 컬러를 지정해주면 알아서 primary key color, secondary key color를 만들어준다. 디자인 고민하지 않아도 되게 만들어주는 아주 편한 놈이다.

https://pogon.tistory.com/entry/Flutter-ColorScheme-class-%EC%A3%BC%EC%9A%94-%EC%83%89%EC%83%81%EB%A7%8C-%EC%A7%80%EC%A0%95%ED%95%98%EB%A9%B4-%EC%83%89%EA%B9%94%EC%9D%84-%EC%95%8C%EC%95%84%EC%84%9C-%EB%9A%9D%EB%94%B1

요구사항을 보면 우리는 흑백이면 된다. 대충 시드 컬러를 블랙으로 지정해주자... 근데 우리가 생각한 흑백으로 나오지 않는다. 이상한 핑크색이 들어감. 구글에 flutter colorScheme black and white으로 검색하면 이런 글이 나온다.

https://stackoverflow.com/questions/75331405/material-3-colorschemeseed-and-having-plain-black-and-white-theme

대충 긁어서 쓰면 우리가 예상한 완전한 흑백이 나온다.
여기서 글씨 -> primary, 배경 -> background를 쓰면 된다.

??: 그냥 모든 텍스트에 색상을 Black으로 지정하거나 배경에 White를 지정해주면 되는 거 아닌가요?

그래도 된다. 하지만 그렇게 했을 때 유지보수는 당신의 몫이다.
DRY 원칙이라는 게 있다. 중복을 최소하는 게 좋다는 거다. 마냥 최소화하는 건 아니고... 만약 당신이 크기 24에 회색 텍스트를 계속 사용할 것 같다면 "같은 컨텍스트로 사용되는 한" 그 지식은 하나의 코드베이스에 하나만 존재해야 한다.

같은 컨텍스트라는 단서가 붙었음에 유의하자.

### 폰트 적용

프리텐다드를 적용해보자.

어떻게 하냐? 구글링을 하면 모든 게 다 나온다.

https://jutole.tistory.com/91

에셋 폴더를 만들고 그 안에 폰트 폴더를 만든다. 에셋 폴더는 lib와 같은 레벨에 위치해야 한다.

`pubspec.yml` 에서 폰트를 등록해준다.

그리고 `Themedata`에서 fontFamily를 프리텐다드로 등록해준다.
이렇게 하면 텍스트 위젯을 사용할 때 굳이굳이 폰트패밀리를 지정해주지 않아도 알아서 프리텐다드가 된다. 즉 fontWeight만 잘 관리해주면 된다.

### 앱바 윤곽선

앱바 아래에 선이 있다. AppBar 위젯의 파라미터를 보면 친절하게 bottom이라는 파라미터가 있다. 당연히 이거겠지? 싶다.

여기서는 PrefferedSize라는 위젯을 쓰는데 주로 앱바의 높이를 조정하는데 쓰는 것 같다. 하지만 우리는 높이는 별로 안 궁금하고 child 컴포넌트에 0.5짜리 회색 컨테이너를 넣어서 윤곽선처럼 만들어줄 수 있다.

### 카드 버튼 컴포넌트로 빼내기

저번에 그냥 무지성으로 메서드로 반복되는 위젯을 추출해냈는데, 이게 안티패턴이라고 한다.

https://changjoopark.medium.com/flutter-%EC%9C%84%EC%A0%AF-%EB%A6%AC%ED%8C%A9%ED%86%A0%EB%A7%81-%EA%B8%B4-%EC%9C%84%EC%A0%AF-%EC%BD%94%EB%93%9C%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%82%98%EB%88%84%EC%96%B4%EC%95%BC-%ED%95%A0%EA%B9%8C-23950ff583ee

이유는 깊게 파고들기엔 좀 뭣하지만 간단하게 요약하자면

1. 메서드라서 중간에 다른 로직이 개입할 여지가 있음
2. 리페인팅이 발생할 수 있음

이다. 그래서 클래스로 빼줬다.

```dart
class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const MyCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
```

### 캘린더 추가

`RenderFlex children have non-zero flex but incoming width constraints are unbounded.`

이런 에러가 발생했다.

https://velog.io/@vrdhan212/%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%A0%9C%EC%95%BD-%EC%A1%B0%EA%B1%B4

Expanded로 감싸준다.

Expanded 위젯은 자식에게 남아 있는 공간을 모두 채우도록 지시한다. 이 변경을 통해 TableCalendar는 부모인 Row로부터 받는 제한된 너비 내에서 렌더링될 수 있다.

### 화면이 좀 긴데요

'나의 다짐'부터 하단 영역을 침범하기 시작했다.

화면에 표시되는 컨텐츠가 뷰포트(viewport)를 초과하면 오버플로가 발생한다. Column 위젯은 기본적으로 무한 높이를 가질 수 없기 때문에, 자식 위젯들이 Column의 전체 공간을 넘어설 때 오버플로가 일어난다.

해결 방법은 이것저것 있는데, 넘어선 부분을 스크롤 할 수 있게 `SingleChildScrollView` 를 사용할 생각이다.

### todo - 그림자 효과 주는 BoxDecoration 중복 해결하기

이건 나중에 할 예정이다...
