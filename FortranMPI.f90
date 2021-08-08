program MPI_Hello
use mpi
implicit none
integer :: ierr
integer :: status(MPI_STATUS_SIZE)
integer :: my_rank
integer :: p
integer :: source, dest, tag
integer :: size
integer :: tmp
integer :: number=1
call MPI_Init(ierr)
call MPI_Comm_rank(MPI_COMM_WORLD, my_rank, ierr)
call MPI_Comm_size(MPI_COMM_WORLD, p, ierr)
WRITE(6,*) 'Running Rank', my_rank

if ( my_rank /= 0 ) then
    call MPI_Send(my_rank,1, MPI_INTEGER, 0, my_rank+10, MPI_COMM_WORLD,ierr)
endif

if ( my_rank == 0 ) then
    do source=1, p-1
        ! From ID, Tag should be same
        ! tmp is stored
        call MPI_Recv(tmp, 1, MPI_INTEGER, source, source+10, MPI_COMM_WORLD, status, ierr)
        WRITE(6,*)'Hello World from ',tmp
    enddo
ENDIF

call MPI_Finalize(ierr)
end program MPI_Hello
