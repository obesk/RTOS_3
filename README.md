# Assignment 3 RTOS

## Description

This assignment demonstrates real time scheduling and the use of device drivers in Linux.

This demonstration uses 3 periodic tasks scheduled with the Rate Monotonic scheduling algorithm and 1 aperiodic task which can be triggered by the second task.

All task write their output to the kernel using the `simple` device driver.

## How to install and run 

The install you can run the following command:

```bash
sudo make install
```

which installs the simple driver and compiles the scheduling demonstration.

You can run the demonstration with the following command:

```bash
sudo ./RM-AP
```

The output of the threads can be followed with:

```bash
sudo dmesg -w
```

which shows the kernel log

## Example of output

```text
[211902.518478]  2[ 
[211902.618200]  1[ 
[211902.745625]  ]1 
[211902.766980] :ex(4)
[211902.767003]  ]2 
[211902.767023]  3[ 
[211902.770885]  ]3 
[211902.770910]  4[ 
[211902.820934]  ]4 
```


Here we can see that the task 2 started and got preempted by the task 1 which has higher priority, after task 1 finished the task 2 ran the aperiodic task 4.
Since the task 4 has the lowest priority, due to background scheduling, task 3 ran before it and then the task 4 executed.