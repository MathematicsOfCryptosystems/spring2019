## SageMath Code Introduction ##

SageMath is a free, opensource coding language that was designed for mathematical applications.  

There are three main ways you can use SageMath:
1. Download SageMath from <http://www.sagemath.org/>
2. Create an account on CoCalc at <https://cocalc.com/>
3. Use SageMathCell at <https://sagecell.sagemath.org/>

**Notes:**  
* If you download SageMath, I **highly** recommend that you also install Anaconda with Python 3.7 available for free at <https://www.anaconda.com/distribution/> as this will allow you to produce high quality Jupyter notebooks using SageMath
* If you have a Mac and download SageMath, you may have trouble opening the .dmg file so check the FAQ section 
* SageMathCell is only for short code snippets that are a few lines long so if you want to write larger scripts, you should either download SageMath or use CoCalc

If you are new to SageMath, the following documentation may be helpful:
* SageMath documentation: <http://doc.sagemath.org/html/en/index.html>
* A free undergraduate Sage book: <http://dl.lateralis.org/public/sagebook/sagebook-ba6596d.pdf>

SageMath also has excellent built-in number theory functions, for more information see:
* Number theory quickstart: <http://doc.sagemath.org/html/en/prep/Quickstarts/Number-Theory.html>
* Number theory tutorial: <http://doc.sagemath.org/html/en/tutorial/tour_numtheory.html>
* Number theory reference sheet: <https://wiki.sagemath.org/quickref?action=AttachFile&do=get&target=quickref-nt.pdf>

**Note:** I have not uploaded my Tutorial Notebook to Github because it is a Jupyter notebook which cannot be opened unless you have installed Anaconda.  However, I have placed my code in code blocks below for reference.

This function produces the residues modulo n and prints them as a list.  The value of n is passed as an argument.
```
def int_mod_n(n):
    mods = []
    for i in range(n):
        mods.append(mod(i, n))
    return mods
```
This function returns a power table for i which is reduced modulo n and then sorted in increasing numerical order.
Here, RealField(300) produces a field of real numbers with 300 bits of precision on which to perform operations.
The line R(i^j) casts the value of i^j into the real field to maintain precision.
```
R = RealField(300)
def mod_table(i, n):
    pows = []
    for j in range(n):
        k = R(i^j)
        pows.append(mod(k, n))
    return sorted(pows)
```
This function produces a modulo n table where a power table is created for each of the nonzero residues modulo n. 
This table will print as n-1 lists of values sorted in ascending numerical order to help identify cycles and generators.
```
def mods(n):
    for i in range(1, n):
        print(mod_table(i, n))
```

**Note:** My Honors Thesis code is not included here because there is a much easier way to create polynomials in SageMath using the Polynomial Ring.  I had to use a more complicated method because I was generating random polynomials.
