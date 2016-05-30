package roundrobin

class ProcessController {

    def index() {}

    def results() {
        Set<Process> processes = new TreeSet<>()
        RoundRobin rrb = new RoundRobin()
        double quantum = Double.parseDouble(params.quantum)
        def names = params.list('name')
        def cpus = params.list('cpu')
        Process p

        for (def i = 0; i < names.size(); i++) {
            p = new Process(name: names.get(i), cpu: Double.parseDouble(cpus.get(i)),
                    totalCpu: Double.parseDouble(cpus.get(i)))
            processes.add(p)
        }

        int ctxChanges = 0
        List<Process> processesList = rrb.createRoundRobin(processes, quantum, ctxChanges)

        [processes: processesList, originalProcesses: processes, quantum: quantum, ctxChanges: ctxChanges]
    }

    def prueba() {

    }

    def _processInput() {

    }
}
