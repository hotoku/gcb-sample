from concurrent.futures import ProcessPoolExecutor
import time
import sys

import click

def doit(x, sl):
    t = time.time()
    time.sleep(sl)
    return t, x


@click.command()
@click.argument("num-task", type=int)
@click.argument("sleep", type=int)
def main(num_task, sleep):
    with ProcessPoolExecutor() as ex:
        fs = [ex.submit(doit, x, sleep) for x in range(num_task)]

    for f in fs:
        print(f.result())

main()    
