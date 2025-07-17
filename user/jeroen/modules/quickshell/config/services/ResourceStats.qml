pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property double memTotal: 1
    property double memFree: 1
    property double memUsed: memTotal - memFree
    property double memPerc: memUsed / memTotal
    property double cpuUsage: 0
    property double cpuTemp: 0
    property string cpuTempOut: ""
    property double diskTotal: 0
    property double diskUsed: 0
    property double diskPerc: diskUsed / diskTotal
    property var previousCpuStats

    Timer {
        interval: 1
        running: true
        repeat: true

        onTriggered: {
            fileMemInfo.reload();
            fileCpuStat.reload();

            const textMemInfo = fileMemInfo.text();

            memTotal = textMemInfo.match(/MemTotal: *(\d+)/)?.[1] ?? 0;
            memFree = textMemInfo.match(/MemAvailable: *(\d+)/)?.[1] ?? 0;

            const textCpuStat = fileCpuStat.text();
            const cpuLine = textCpuStat.match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);
            if (cpuLine) {
                const stats = cpuLine.slice(1).map(Number);
                const total = stats.reduce((a, b) => a + b, 0);
                const idle = stats[3];

                if (previousCpuStats) {
                    const totalDiff = total - previousCpuStats.total;
                    const idleDiff = idle - previousCpuStats.idle;
                    cpuUsage = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;
                }

                previousCpuStats = {
                    total,
                    idle
                };
            }

            this.interval = 1000;
            avgTemp.running = true;
        }
    }

    Timer {
        interval: 10 * 1000
        onTriggered: {
            dfCmd.exec();
        }
    }

    FileView {
        id: fileMemInfo
        path: "/proc/meminfo"
    }

    FileView {
        id: fileCpuStat
        path: "/proc/stat"
    }

    Process {
        id: dfCmd
        command: ["df"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let output = this.text;
                let out = output.match(/\/dev\/nvme0n1p5 (\d+) (\d+) (\d+)/);
                if (out == null) {
                    diskUsed = 0;
                    diskTotal = 0;
                    diskPerc = 0;
                } else {
                    diskTotal = out[1];
                    diskUsed = out[2];
                }
            }
        }
    }

    Process {
        id: avgTemp
        command: ["sh", "\"$HOME/.config/quickshell/scripts/cpu_temp.sh\""]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                cpuTempOut = "-" + this.text;
                cpuTemp = parseFloat(this.text);
            }
        }
    }
}
