
#listMonad

|Case|Allocated|GCs|
|:---|---:|---:|
|list (n=1, s=1)|552|0|
|list (n=3, s=0)|2,504|0|
|list (n=5, s=10)|30,744|0|
|list (n=8, s=92)|1,425,648|0|
|list (n=10, s=724)|26,138,944|6|

#logictMonad

|Case|Allocated|GCs|
|:---|---:|---:|
|logict (n=1, s=1)|312|0|
|logict (n=3, s=0)|2,536|0|
|logict (n=5, s=10)|66,712|0|
|logict (n=8, s=92)|2,141,480|0|
|logict (n=10, s=724)|44,294,936|10|
