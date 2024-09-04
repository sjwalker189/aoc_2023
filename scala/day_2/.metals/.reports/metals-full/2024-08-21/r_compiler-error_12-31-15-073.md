file://<WORKSPACE>/src/main/scala/Main.scala
### java.lang.NoClassDefFoundError: sourcecode/Name

occurred in the presentation compiler.

presentation compiler configuration:
Scala version: 3.3.3
Classpath:
<HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala3-library_3/3.3.3/scala3-library_3-3.3.3.jar [exists ], <HOME>/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.12/scala-library-2.13.12.jar [exists ]
Options:



action parameters:
offset: 1327
uri: file://<WORKSPACE>/src/main/scala/Main.scala
text:
```scala
import scala.collection.mutable.HashMap

def text = """Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""

val red = 12
val green = 13
val blue = 14
val ID_PREFIX = "Game "

type Group = HashMap[String, Int]

@main def main(): Unit = {
  val sum = text
    .split("\n")
    .map { line =>
      val pairs = line.split(": ")
      (pairs(0).stripPrefix(ID_PREFIX).toInt, toGroup(pairs(1)))
    }
    .filter(_._2)
    .map(_._1)
    .sum

  println(s"Sum = $sum\n")
}

def toGroup(str: String): Boolean = {

  val groups = str.split("; ").map { chunk =>
    val group = new HashMap[String, Int]
    chunk.split(", ").foreach { (pairs) =>
      val count = pairs.head.toInt
      val color = pairs.tail.trim()
      group.addOne(color, group.getOrElse(color, 0) + count)
    }
    group
  }

  groups.map(isValidGroup).filter.sum 
}

def isValidGroup(group: HashMap[String, Int]): Boolean = {
  val redLimit = group.getOrElse("red", 0)
  val blueLimit = group.getOrElse("blue", 0)
  val greenLimit = group.getOrElse("green", 0)
  val isValid = redLimit <a@@ red && blueLimit < blue && greenLimit < green

  isValid
}

```



#### Error stacktrace:

```
scala.meta.internal.tokenizers.XmlParser$Xml$.UnpStart(XmlParser.scala:44)
	scala.meta.internal.tokenizers.XmlParser$Xml$.Unparsed(XmlParser.scala:43)
	scala.meta.internal.tokenizers.XmlParser$Xml$.XmlContent(XmlParser.scala:39)
	scala.meta.internal.tokenizers.XmlParser.$anonfun$XmlExpr$1(XmlParser.scala:25)
	scala.meta.shaded.internal.fastparse.internal.RepImpls$.rec$4(RepImpls.scala:226)
	scala.meta.shaded.internal.fastparse.internal.RepImpls$.rep$extension(RepImpls.scala:266)
	scala.meta.shaded.internal.fastparse.package$ByNameOps$.rep$extension(package.scala:202)
	scala.meta.internal.tokenizers.XmlParser.XmlExpr(XmlParser.scala:25)
	scala.meta.internal.tokenizers.LegacyScanner.$anonfun$getXml$2(LegacyScanner.scala:823)
	scala.meta.shaded.internal.fastparse.SharedPackageDefs.parseInputRaw(SharedPackageDefs.scala:69)
	scala.meta.shaded.internal.fastparse.SharedPackageDefs.parseInputRaw$(SharedPackageDefs.scala:45)
	scala.meta.shaded.internal.fastparse.package$.parseInputRaw(package.scala:6)
	scala.meta.shaded.internal.fastparse.Parsed$Extra.trace(Parsed.scala:139)
	scala.meta.internal.tokenizers.LegacyScanner.getXml(LegacyScanner.scala:826)
	scala.meta.internal.tokenizers.LegacyScanner.fetchLT$1(LegacyScanner.scala:300)
	scala.meta.internal.tokenizers.LegacyScanner.fetchToken(LegacyScanner.scala:307)
	scala.meta.internal.tokenizers.LegacyScanner.scala$meta$internal$tokenizers$LegacyScanner$$nextToken(LegacyScanner.scala:195)
	scala.meta.internal.tokenizers.LegacyScanner.nextToken(LegacyScanner.scala:172)
	scala.meta.internal.tokenizers.ScalametaTokenizer.nextToken$1(ScalametaTokenizer.scala:28)
	scala.meta.internal.tokenizers.ScalametaTokenizer.emitTokenWhitespace$1(ScalametaTokenizer.scala:64)
	scala.meta.internal.tokenizers.ScalametaTokenizer.emitToken$1(ScalametaTokenizer.scala:143)
	scala.meta.internal.tokenizers.ScalametaTokenizer.loop$1(ScalametaTokenizer.scala:152)
	scala.meta.internal.tokenizers.ScalametaTokenizer.uncachedTokenize(ScalametaTokenizer.scala:162)
	scala.meta.internal.tokenizers.ScalametaTokenizer.$anonfun$tokenize$1(ScalametaTokenizer.scala:16)
	scala.collection.concurrent.TrieMap.getOrElseUpdate(TrieMap.scala:962)
	scala.meta.internal.tokenizers.ScalametaTokenizer.tokenize(ScalametaTokenizer.scala:16)
	scala.meta.internal.tokenizers.ScalametaTokenizer$$anon$1.apply(ScalametaTokenizer.scala:313)
	scala.meta.tokenizers.Api$XtensionTokenizeDialectInput.tokenize(Api.scala:22)
	scala.meta.tokenizers.Api$XtensionTokenizeInputLike.tokenize(Api.scala:13)
	scala.meta.internal.mtags.ScalametaCommonEnrichments$XtensionStringDocMeta.safeTokenize(ScalametaCommonEnrichments.scala:237)
	scala.meta.internal.pc.completions.KeywordsCompletions$.reverseTokens$lzyINIT1$1(KeywordsCompletions.scala:49)
	scala.meta.internal.pc.completions.KeywordsCompletions$.reverseTokens$1(KeywordsCompletions.scala:53)
	scala.meta.internal.pc.completions.KeywordsCompletions$.contribute(KeywordsCompletions.scala:55)
	scala.meta.internal.pc.completions.Completions.completions(Completions.scala:188)
	scala.meta.internal.pc.completions.CompletionProvider.completions(CompletionProvider.scala:89)
	scala.meta.internal.pc.ScalaPresentationCompiler.complete$$anonfun$1(ScalaPresentationCompiler.scala:155)
```
#### Short summary: 

java.lang.NoClassDefFoundError: sourcecode/Name