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
        List<Process> processesList = rrb.createRoundRobin(processes, quantum)

        [processes: processesList, originalProcesses: processes, quantum: quantum]
    }

    def prueba() {

    }

    def _processInput() {

    }
}
