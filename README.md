# dectalk

Public demo DECtalk instance opened for personal/casual use.

It has the *phoneme* mode enabled by default to allow for singing.

## Usage

### Using the widget

Visit https://dectalk.nitrix.me for the online widget.

### Using the API endpoint

You can make HTTP requests to https://dectalk.nitrix.me/synthesize with your speech inside the body.

The HTTP response is raw <string>wav</string> audio.

## Documentation

The table below lists the phonemic alphabet that DecTalk uses, along with an example of each sound.

DECtalk requires that the stress symbol appear immediately before the vowel.

| Symbol | Word (showing phoneme) | Word (complete) |
|-----|-----------|-----|
| aa	| b ob	    | bob |
| ae	| ba t	    | bat |
| ah	| b ut	    | but |
| ao	| bou ght	| bought |
| aw	| bout	    | bout |
| ax	| a bout	| about |
| ay	| by te	    | byte |
| b		| b ottle	| bottle |
| ch	| ch in	    | chin |
| d		| d ebt	    | debt |
| dh	| th is	    | this |
| dx	| rid er	| rider |
| eh	| b et	    | bet |
| el	| bottle	| bottle |
| en	| button	| button |
| ey	| ba ke	    | bake |
| f		| f in	    | fin |
| g		| guess	    | guess |
| hx	| h ead	    | head |
| ih	| b it      | bit |
| ix	| kisses	| kisses |
| iy	| bea t	    | beat |
| jh	| g in	    | gin |
| k		| Ken	    | Ken |
| l		| l et	    | let |
| lx	| el ectric	| electric |
| m		| m et	    | met |
| n		| n et	    | net |
| nx	| sing	    | sing |
| ow	| boa t	    | boat |
| oy	| b oy	    | boy |
| p		| p et	    | pet |
| q		| we e at   | weeat |
| r		| r ed	    | red |
| rr	| b ird	    | bird |
| rx	| or ation  | oration |
| s		| s it	    | sit |
| sh	| sh in	    | shin |
| t		| t est	    | test |
| th	| th in	    | thin |
| tx	| Lat in    | Latin |
| uh	| bo ok	    | book |
| uw	| lu te	    | lute |
| v		| v est	    | vest |
| w		| w et	    | wet |
| yu	| cu te	    | cute |
| yx	| y et	    | yet |
| z		| z oo	    | zoo |
| zh	| az ure    | azure |

See [this document](docs/EpsonDECtalk501.pdf) for the complete documentation.

## Example songs

Trololol:

```
[llao<1000,26>llao<400,21>llao<100,19>llao<1000,21>llao<200,14>llao<200,16>llao<1000,18>llao<1000,18>llao<400,16>llao<400,14>]
```

Mama, uw uw uw uw:

```
[mmaa<200,22>mmaa<1000,22>uw<400,20>uw<200,22>uw<200,23>uw<600,22]
```

Space odyssey:

```
[dah<2000,17>][dah<2000,24>][dah<2500,29>][dah<200,35>][dah<2000,34>]
```

Weird sound:

```
[:t300,20][:t600,20][:t900,20][:t1200,90][:t1500,90][:t1800,90][:t2100,90][:t2400,90][:t2700,90]
```

My little pony theme:

```
[mah<200,31>][rih<200,34>][teh<200,31>][pow<400,29>][ney<600,34>]
```

John Madden:

```
John[mae<999,34>][deh<1999,25>]n
```

Darth vader:

```
[dah<600,20>][dah<600,20>][dah<600,20>][dah<500,16>][dah<130,23>][dah<600,20>][dah<500,16>][dah<130,23>][dah<600,20>]
```

```
[dah<600,27>][dah<600,27>][dah<600,27>][dah<500,28>][dah<130,23>][dah<600,19>][dah<500,16>][dah<130,23>][dah<600,20>]
```

Oh yeah:

```
[ow<1320,313>yx<633,332>ae<322,550>ax<630,229>]
```

Satan voice:

```
[:dv as 304 pr 559 br 10100 hs 5969]
```

John madden songs:

```
[jhah<800,13>nmae<800,15>deh<800,17>n][_<800,17>][jhah<800,17>nmae<800,18>deh<800,20>n]

[jhah<400,20>ah<800,25>ah<400,24>ah<400,25>ah<800,20>ah<400,18>ah<800,17>nmae<800,15>deh<800,13>n]
```

Intro:

```
[llao<1600,25>][llao<350,20>][llao<300,18>][llao<1600,20>] [llao<350,13>][llao<300,15>][llao<1200,17>][llao<1200,20>][llao<600,17>][llao<1400,15>]

[llao<130,20>][llao<130,22>][llao<130,23>][llao<130,24>][llao<1600,25>][llao<350,20>][llao<300,18>][llao<1600,20>] [llao<350,13>][llao<300,15>][llao<1200,17>][llao<1200,17>][llao<600,15>] [llao<1000,13>] [llao<130,13>][llao<130,17>][llao<130,20>][llao<130,25>][llao<350,24>][llao<130,24>][llao<130,20>][llao<350,22>] [llao<130,22>][llao<130,18>][llao<620,20>][llao<130,8>][llao<130,12>] [llao<130,15>][llao<130,18>][llao<1600,17>] [llao<130,13>][llao<130,17>][llao<130,20>][llao<130,25>][llao<350,24>][llao<130,24>][llao<130,20>][llao<350,22>]

[llao<130,22>][llao<130,18>][llao<620,20>][llao<130,20>][llao<130,22>][llao<130,23>][llao<130,24>][llao<1600,25>] [llao<200,29>][llao<200,27>][llao<200,25>][llao<200,24>][llao<200,22>] [llao<300,20>][llao<130,17>][llao<130,18>][llao<1200,20>] [llao<350,13>][llao<300,15>][llao<1200,17>][llao<1200,17>][llao<600,15>][llao<1000,13>]
```

Call me maybe:

```
[_<1,20>]hey[_<400,12>]i[_<1,15>]just[_<1,20>]met[_<1,15>]yewwww[_<800,15>]and[_<1,12>]this[_<1,15>]is[_<1,24>]cray[_<1,20>]zee

[s<1,20>]but[s<1,24>]here's[s<1,25>]my[s<1,24>]numb[s<1,20>]ber.[s<1,20>]so[s<1,24>]call[s<1,22>]me. may[s<1,20>]be
```

## License

This is free and unencumbered software released into the public domain. See the [UNLICENSE](UNLICENSE) file for more details.
