cwlVersion: cwl:v1.0
class: CommandLineTool
requirements:
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: hdf5check:latest
inputs:
  - id: directory
    type: Directory
    inputBinding:
      prefix: -d
      position: 1
  - id: threads
    type: int
    default: 0
    inputBinding:
      prefix: -T
      position: 2
  - id: results
    type: string
    default: ResultsHdf5
    inputBinding:
      prefix: -r
      position: 3
  - id: fastq
    type: boolean
    default: false
    inputBinding:
      prefix: -b
      position: 4
outputs:
  - id: pbFastqReads
    type: File
    outputBinding:
      glob: "*/pbReads.fastq"
baseCommand: ["python","/root/Assemblosis/Run/hdf5check/hdf5Check.py"]
