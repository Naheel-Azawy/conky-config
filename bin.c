#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>

//#define LOOP

#define BITS 6
#define b(c) c == '1' ? "●" : "○"

char * int2bin(int i) {
    size_t bits = BITS;
    char * str = malloc(bits + 1);
    if(!str) return NULL;
    str[bits] = 0;
    unsigned u = *(unsigned *)&i;
    for(; bits--; u >>= 1)
        str[bits] = u & 1 ? '1' : '0';
    return str;
}

void main() {

    time_t now;
    struct tm *now_tm;
    int h;
    int m;
    int s;
    char *hs;
    char *ms;
    char *ss;

#ifdef LOOP
    for (;;) {
        system("clear");
#endif
        now = time(NULL);
        now_tm = localtime(&now);

        h = now_tm->tm_hour;
        m = now_tm->tm_min;
        s = now_tm->tm_sec;
        
        hs = int2bin(h);
        ms = int2bin(m);
        ss = int2bin(s);
        
        for (int i = 0; i < BITS; ++i) {
            printf("%s %s %s\n", b(hs[i]), b(ms[i]), b(ss[i]));
        }
#ifdef LOOP
        sleep(1);
    }
#endif

}
