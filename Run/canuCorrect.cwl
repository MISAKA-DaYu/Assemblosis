cwlVersion: v1.0
class: CommandLineTool
id: "canu"
doc: "Assemble PacBio reads (canu -correct -trim -assemble)"
requirements:
  - class: InlineJavascriptRequirement
inputs:
  - id: prefix
    type: string
    inputBinding:
      position: 1
      prefix: -p
  - id: assemblyDir
    type: string
    default: CanuAssembly
    inputBinding:
      position: 2
      prefix: -d
  - id: genomeSize
    type: string
    inputBinding:
      position: 3
      separate: false
      prefix: genomeSize=
  - id: stopOnReadQuality
    type: string
    default: "true"
    inputBinding:
      position: 4
      separate: false
      prefix: stopOnReadQuality=
  - id: pacbio-raw
    type: File
    inputBinding:
      position: 6
      prefix: -pacbio-raw
  - id: corMaxEvidenceErate
    type: float
    default: 0.20
    inputBinding:
      position: 7
      separate: false
      prefix: corMaxEvidenceErate=
  - id: useGrid
    type: string
    default: "false"
    inputBinding:
      position: 10
      separate: false
      prefix: useGrid=
outputs:
  - id: correctedReads
    type: File
    outputBinding:
      glob: "*/$(inputs.prefix).correctedReads.fasta.gz"
baseCommand: ["canu", "-correct"]
arguments: []
stdout: out
hints:
  SoftwareRequirement:
    packages:
    - package: canu
      version:
      - "1.6"
