# YACC-compiler
Yacc -Yet Another Compiler Compiler

.l檔訂定規則

.y檔的部分

    statement : 

    | statement e1
    { printf("%d\n",$2); }  //代表多筆回傳結果
    | statement e1 '\n' 
    { printf("%d\n\n",$2); }
    
再來因為我們是要做四則運算的部分
    
    優先第一 : 正數、負數、括號
    次 : 乘號、除號
    後 : 加號、減號
    
    
    
    e1 : .......
       |e2 { $$ = $1;} //連結到e2
    e2 : .......
       | e3 { $$ = $1;} //連結到e3
    e3 : Lp e1 Rp    //括號裡面餵e1的意思括號內+-*/都可以做運算，如果放e2的話+-運算元吃不到
        { printf("");
          $$ = $2;} //這邊的$2就是e1 不懂的話程式pdf給我回去看清楚
       | Minus Realnumber
        { printf("");
          $$ = -$2;} //負數 $2是指Realnumber 遇到負號時要把$$也就是e3回傳值改負值 總不能compiler吃到Minus了回傳值還是正的吧
       | Realnumber
        { printf("");
          $$ = $1;}


不確定我講得清不清楚，但我發現很多人不知道是沒看到pdf還是怎樣

一直問我$$是什麼$1是甚麼= =

YACC比較難需要一點時間理解就是了
