# devops-fundamentals
# Linux Troubleshooting Practice: Managing a Runaway Process

**Objective:** To identify, inspect, and terminate a CPU-bound runaway process on a Linux system, documenting each step of the procedure.

This exercise was completed on **Saturday, September 27, 2025**.

---

### 1. Process Simulation

A simple Python script, `stuck.py`, was created to simulate a runaway process by entering an infinite loop. This script was then executed in the background to allow for concurrent monitoring and management.

```bash
vagrant@ubuntu-jammy:~$ python3 stuck.py &
[1] 1634
2. Identification Using top
The top utility was used to get a real-time view of system resource consumption. The stuck.py process was immediately identified as the top consumer of CPU resources.

Key top Output:

  PID   USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  1634  vagrant   20   0   16672   8712   5608 R 100.0   0.9   2:46.16 python3
Observation: The process with PID 1634 is running as the vagrant user and is consuming 100.0% of a CPU core.

3. Verification Using ps
To confirm the details of the process outside of the interactive top view, ps aux was used in combination with grep. This is a standard method for finding a specific process and its PID programmatically.

Bash

vagrant@ubuntu-jammy:~$ ps aux | grep stuck.py
vagrant   1634 99.6  0.9  16672  8712 pts/2    R+   18:22   3:14 python3 stuck.py
vagrant   1718  0.0  0.2   7012  2172 pts/0    S+   18:25   0:00 grep --color=auto stuck.py
Observation: The command confirms that PID 1634 is the correct target. The second line of output is the grep command itself and can be ignored.

4. Process Termination
The standard kill command was used to send a SIGTERM (terminate) signal to the process, requesting a graceful shutdown.

Bash

vagrant@ubuntu-jammy:~$ kill 1634
5. Final Verification
After issuing the kill command, it is crucial to verify that the process has been terminated successfully. This was done by running the ps command again and observing the absence of the stuck.py process.

Bash

vagrant@ubuntu-jammy:~$ ps aux | grep stuck.py
vagrant   1721  0.0  0.2   7012  2188 pts/0    S+   18:27   0:00 grep --color=auto stuck.py
Conclusion: The only process found by grep is the search command itself, confirming that the runaway process with PID 1634 was successfully terminated. The system CPU load returned to normal levels shortly thereafter.
