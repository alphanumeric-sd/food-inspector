# Health-Inspector
A server agent for system monitoring and automatic recovery. The intention is to
be chef-like in construction.

## General service architecture
The health-inspector service should have 3 major components:

1. A primary thread of scheduled system checks using
[Rufus](https://github.com/jmettraux/rufus-scheduler)
  * scheduled checks publish events to subscribers for response processing
2. A series of event subscribers for conditioning handling and remediation using
[Wisper](https://github.com/krisleech/wisper)
3. A notification pipeline for alerting interested parties. architecture TBD.

## Remedy
Health checks, their responses, and their alert formatting should be drawn from
plugins in the form of class extensions of `HealthInspector::Remedy` that has
these key components:

1. An :inspection function returning a `HealthInspector::Inspection` variable.
  1. `HealthInspector::Inspection` contains the following items:
    * an **interpreter** flag `[:bash, :cmd, :powershell]`
    * a **script** field with code to execute to check the system's state
(should return non-zero on failure)
    * a **schedule** field with a [Rufus](https://github.com/jmettraux/rufus-scheduler)
compatible 'every' schedule string
2. A :remediation function returning a `HealthInspector::Remediation` variable.
  2. `HealthInspector::Remediation` contains the following items:
    * an **interpreter** flag `[:bash, :cmd, :powershell]`
    * a **script** field with code to execute to repair the undesired system state
(should return non-zero on failure)
2. A :report function returning a `HealthInspector::IncidentReport` variable.
  2. `HealthInspector::IncidentReport` will be definied in a future milestone. 
