use MPI
character(12) message 
integer rank,root
integer message2
data root/0/ 
call MPI_INIT(ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) 
if (rank .eq. root) then 
    message = "Hello, world"
    message2 = 6
endif 

print*, "node", rank, ":", message, message2
print*, "After BCAST"
call MPI_BARRIER(MPI_COMM_WORLD,ierr) 

call MPI_BCAST(message, 12, MPI_CHARACTER, root, &
         MPI_COMM_WORLD, ierr) 
call MPI_BCAST(message2, 1, MPI_DOUBLE_PRECISION, root, &
         MPI_COMM_WORLD, ierr) 


print*, "node", rank, ":", message, message2 
call MPI_FINALIZE(ierr)

end
