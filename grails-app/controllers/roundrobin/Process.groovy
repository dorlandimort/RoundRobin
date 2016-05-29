package roundrobin

/**
 * Created by giovanni on 28/05/16.
 */
class Process implements Comparable<Process> {

    String name
    double cpu
    double totalCpu
    double start
    double end
    double waitTime
    double spareTime = 0.0
    String date

    @Override
    int compareTo(Process p) {
        return this.cpu - p.cpu - this.name.compareTo(p.name)
    }

}
