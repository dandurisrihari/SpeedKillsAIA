typedef struct _gcsHAL_FREE_NON_PAGED_MEMORY {

    gctUINT64 bytes;


    gctUINT32 physName;


    gctUINT64 logical;
} gcsHAL_FREE_NON_PAGED_MEMORY;



typedef struct _gcsHAL_ALLOCATE_LINEAR_VIDEO_MEMORY {

    gctUINT64 bytes;


    gctUINT32 alignment;


    gctUINT32 type;


    gctUINT32 flag;


    gctUINT32 pool;


    gctINT32 sRAMIndex;


    gctINT32 extSRAMIndex;


    gctINT32 vidMemIndex;


    gctUINT32 node;
} gcsHAL_ALLOCATE_LINEAR_VIDEO_MEMORY;

typedef struct _gcsUSER_MEMORY_DESC {

    gctUINT32 flag;


    gctUINT32 handle;
    gctUINT64 dmabuf;


    gctUINT64 logical;
    gctUINT64 physical;
    gctUINT64 size;
} gcsUSER_MEMORY_DESC;


typedef struct _gcsHAL_WRAP_USER_MEMORY {

    gcsUSER_MEMORY_DESC desc;


    gctUINT32 type;


    gctUINT32 node;


    gctUINT64 bytes;
} gcsHAL_WRAP_USER_MEMORY;


typedef struct _gcsHAL_RELEASE_VIDEO_MEMORY {

    gctUINT32 node;
} gcsHAL_RELEASE_VIDEO_MEMORY;
