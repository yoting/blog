---
layout: post
title: Java的foreach循环中删除集合元素
date: 2014-10-02
categories: Java
tags: Java集合
---

　　在集合操作的时候，我们通常会使用foreach增强for循环遍历集合，比如我们想输出集合中的每个元素，我们可以使用for循环遍历。代码如下：

```java
​//初始化一个集合
static List< String > list = new ArrayList< String >();
list.add("1");
list.add("2");
list.add("3");
list.add("4");

​//遍历集合
for (String l : list) {
	System.out.println(l);
}
```

　　但是当我们在使用增强for循环的时候，如果我们想在循环中删除一个或者多个元素的时候，直接调运集合的remove（）方法是不行的，会报异常：java.util.ConcurrentModificationException。

```java
for (String l : list) {
	if (l.equals("1")) {
		list.remove(l);
	}
}
```

　　究其原因，是因为我们在使用集合的remove（）操作的时候，java底层会去执行一个modCount++操作，修改modCount这个变量的值。同时我们在执行增强for循环的时候，本质上是在使用集合的Iterator，而这个Iterator也会维护这个modCount的变量，此外它还维护一个expectedModCount变量。也就是说集合本身会维护modCount变量，Iterator会维护modCount和exceptionModCount变量。但是每次在Iterator执行操作的时候，都会先检查modCount变量和exceptionModCount的值是否一致，源代码如下：

```java
final void checkForComodification() {
       if (modCount != expectedModCount)
            throw new ConcurrentModificationException();
}
```

　　在检查modCount和exceptionModCount的值是否还相同，如果不相同，那么就报异常。在上面for循环的操作中，我们使用for循环遍历，但是在循环内部使用集合自己的remove方法，这个方法把modCount的值给修改，接下来再遍历的时候，使用到了Iterator的方法，这时再检查那两个变量的时候，因为只有modCount被改了，所以他们不一致了，自然要抛异常。好了，现在明白为什么报异常以后，就知道怎么避免这个问题了。

我们有两个办法可以避免这个异常：

- 第一，不要使用集合Iterator相关的方法，不涉及到exceptionModCount变量即可，只涉及到modCount变量即可。说具体点就是我们不要使用任何和Iterator相关的东西，也就是说不要使用争强for循环，当然这样就不会执行检查两个变量是否相同了。代码体现如下：

```java
for (int i = 0; i < list.size(); i++) {
	if (list.get(i).equals("4")) {
		// list.remove(i);
		list.remove(list.get(i));//只使用到集合自己的remove方法，不会涉及到exceptionModCount
	}
}
```

- 第二，我们每次操作的时候，不要只修改modCount变量，同时修改exceptionModCount变量，使之永远保持一致即可。也就是说不要使用集合自己remove方法，使用iterator提供的方法。代码体现如下：

```java
Iterator< String > itList = list.iterator();
while (itList.hasNext()) {
	if (itList.next().equals("1")) {
		itList.remove();//使用Iterator的remove方法，这样modCount和exceptionModCount永远是一致的
	}
}
```

- 另外，我们还有个一个择中的办法。首先使用iterator的方法得到所有需要被删除的元素，然后在使用集合的removeAll（）方法一次性将要删的的元素都删除，在removeAll方法中，我们也不会涉及到检查modCount和exceptionModCount是否一致的问题。

　　这里只列举了List集合的例子，对于Set集合和Map集合是相同的。

​
