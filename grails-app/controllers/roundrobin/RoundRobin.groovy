package roundrobin

/**
 * Created by giovanni on 28/05/16.
 */
class RoundRobin {

    Map createRoundRobin(Set<Process> processSet, double quantum) {
        Date today = new Date()
        Date todayAux
        int ctxChanges = 0
        List<Process> processes = new LinkedList<>()
        Deque<Process> stack = new ArrayDeque<>()
        Map map = new HashMap()

        processSet.each { p ->
            stack.addLast(p)
        }
        Process p
        double passedTime = 0.0

        while (! stack.isEmpty()) {
            p = stack.removeFirst()

            if (! stack.isEmpty())
                ctxChanges ++

            Process aux = new Process()
            aux.name = p.name
            aux.totalCpu = p.totalCpu
            if (p.cpu > quantum) {
                p.cpu -= quantum
                aux.start = p.waitTime + p.spareTime
                p.spareTime += quantum
                aux.end = aux.start + quantum

                stack.each { pr ->
                    pr.waitTime += quantum
                }
                stack.addLast(p)
                passedTime += quantum

            } else {
                aux.start = p.waitTime + p.spareTime
                aux.end = aux.start + p.cpu

                stack.each { pr ->
                    pr.waitTime += p.cpu
                }
                passedTime += p.cpu
            }

            todayAux = today + (int) passedTime
            String a = todayAux.format("dd/MM/yyyy").toString()
            aux.date = a
            processes.add(aux)

        }
        map.put("processes", processes)
        map.put("changes", ctxChanges + 1)
        return map

    }

}
