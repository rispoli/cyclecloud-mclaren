# cyclecloud-mclaren
Multinode CycleCloud cluster templates

These templates are functioning examples for multi-node heterogeneous clusters (eg: mixed Intel/AMD/NVIDIA node types), which allow you to submit jobs to different queues ("nodearrays" in Cycle language), and have Cyclecloud autoscale the nodearrays for you. 

## Example PBS Job:

Use "nodearray=HC44" or "nodearray=HB60" to target your job to a specific queue: 
```
#PBS -N IMB_HC_TEST32
#PBS -l select=32:ncpus=44:nodearray=HC44
#PBS -l place=scatter
module load mpi/impi_2018.4.274
cd $PBS_O_WORKDIR
mpirun -genv I_MPI_FABRICS=shm:ofa -genv I_MPI_FALLBACK_DEVICE=0 IMB-MPI1
```
## Example SLURM Job: 

Use "--partition=HC44" or "--partition=HB60" 
```
#!/bin/bash
#SBATCH --job-name=imb
#SBATCH --output=imb_hc.txt
#SBATCH --account=tsp
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=44
#SBATCH --time=60:00
#SBATCH --partition=HC44
module load mpi/impi_2018.4.274
mpirun -np 2 -ppn 44 -genv I_MPI_FABRICS=shm:ofa -genv I_MPI_FALLBACK_DEVICE=0 IMB-MPI1
```

(cloned from: https://github.com/mkiernan/cyclecloud-colossus)
