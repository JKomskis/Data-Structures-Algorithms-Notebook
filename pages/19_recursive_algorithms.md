# Recursive Algorithms

When designing a recursive algorithm, need to be able to prove its correctness using induction

## Euclid's Algorithm

```c++
int unsigned gcd(int unsigned m, int unsigned n){
    return (m > n) ? do_gcd(m, n) : do_gcd(n, m);
}
int unsigned do_gcd(int unsigned m, int unsigned n){
    return (n == 0) ? m : do_gcd(n, (m%n) );
}
```

Based on the observation 
* If x % d => 0 and y % d => 0 than (x % y) % d => 0

Proof

>Let q = x/y and r = x % y  
>Then x = q * y + r  
>0 = x % d  
>= (q * y + r) % d //substitute for x  
>= (q * y + (x % y) ) % d  
>= ( (q * y) % d ) + ( ( x % y ) % d )  
>We know that (q * y) % d => 0 iff y is evenly divisible by d, then >y's multiples are too  
>= 0 + (x % y) % d  
>= (x % y) % d  
>QED  
