pub usingnamespace @import("std").zig.c_builtins;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = c_longdouble;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
pub const __mbstate_t = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*c_void,
    reg_save_area: ?*c_void,
};
pub const __builtin_va_list = [1]struct___va_list_tag;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?fn (?*c_void) callconv(.C) void,
    __arg: ?*c_void,
    __next: [*c]struct___darwin_pthread_handler_rec,
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long,
    __opaque: [40]u8,
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long,
    __opaque: [192]u8,
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long,
    __opaque: [16]u8,
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long,
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec,
    __opaque: [8176]u8,
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub extern fn memchr(__s: ?*const c_void, __c: c_int, __n: c_ulong) ?*c_void;
pub extern fn memcmp(__s1: ?*const c_void, __s2: ?*const c_void, __n: c_ulong) c_int;
pub extern fn memcpy(__dst: ?*c_void, __src: ?*const c_void, __n: c_ulong) ?*c_void;
pub extern fn memmove(__dst: ?*c_void, __src: ?*const c_void, __len: c_ulong) ?*c_void;
pub extern fn memset(__b: ?*c_void, __c: c_int, __len: c_ulong) ?*c_void;
pub extern fn strcat(__s1: [*c]u8, __s2: [*c]const u8) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strncat(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strpbrk(__s: [*c]const u8, __charset: [*c]const u8) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strspn(__s: [*c]const u8, __charset: [*c]const u8) c_ulong;
pub extern fn strstr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strtok(__str: [*c]u8, __sep: [*c]const u8) [*c]u8;
pub extern fn strxfrm(__s1: [*c]u8, __s2: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strtok_r(__str: [*c]u8, __sep: [*c]const u8, __lasts: [*c][*c]u8) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __strerrbuf: [*c]u8, __buflen: usize) c_int;
pub extern fn strdup(__s1: [*c]const u8) [*c]u8;
pub extern fn memccpy(__dst: ?*c_void, __src: ?*const c_void, __c: c_int, __n: c_ulong) ?*c_void;
pub extern fn stpcpy(__dst: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn stpncpy(__dst: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strndup(__s1: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strnlen(__s1: [*c]const u8, __n: usize) usize;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub const rsize_t = __darwin_size_t;
pub const errno_t = c_int;
pub extern fn memset_s(__s: ?*c_void, __smax: rsize_t, __c: c_int, __n: rsize_t) errno_t;
pub extern fn memmem(__big: ?*const c_void, __big_len: usize, __little: ?*const c_void, __little_len: usize) ?*c_void;
pub extern fn memset_pattern4(__b: ?*c_void, __pattern4: ?*const c_void, __len: usize) void;
pub extern fn memset_pattern8(__b: ?*c_void, __pattern8: ?*const c_void, __len: usize) void;
pub extern fn memset_pattern16(__b: ?*c_void, __pattern16: ?*const c_void, __len: usize) void;
pub extern fn strcasestr(__big: [*c]const u8, __little: [*c]const u8) [*c]u8;
pub extern fn strnstr(__big: [*c]const u8, __little: [*c]const u8, __len: usize) [*c]u8;
pub extern fn strlcat(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strlcpy(__dst: [*c]u8, __source: [*c]const u8, __size: c_ulong) c_ulong;
pub extern fn strmode(__mode: c_int, __bp: [*c]u8) void;
pub extern fn strsep(__stringp: [*c][*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn swab(noalias ?*const c_void, noalias ?*c_void, isize) void;
pub extern fn timingsafe_bcmp(__b1: ?*const c_void, __b2: ?*const c_void, __len: usize) c_int;
pub extern fn bcmp(?*const c_void, ?*const c_void, c_ulong) c_int;
pub extern fn bcopy(?*const c_void, ?*c_void, usize) void;
pub extern fn bzero(?*c_void, c_ulong) void;
pub extern fn index([*c]const u8, c_int) [*c]u8;
pub extern fn rindex([*c]const u8, c_int) [*c]u8;
pub extern fn ffs(c_int) c_int;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, c_ulong) c_int;
pub extern fn ffsl(c_long) c_int;
pub extern fn ffsll(c_longlong) c_int;
pub extern fn fls(c_int) c_int;
pub extern fn flsl(c_long) c_int;
pub extern fn flsll(c_longlong) c_int;
pub const va_list = __darwin_va_list;
pub extern fn renameat(c_int, [*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn renamex_np([*c]const u8, [*c]const u8, c_uint) c_int;
pub extern fn renameatx_np(c_int, [*c]const u8, c_int, [*c]const u8, c_uint) c_int;
pub const fpos_t = __darwin_off_t;
pub const struct___sbuf = extern struct {
    _base: [*c]u8,
    _size: c_int,
};
pub const struct___sFILEX = opaque {};
pub const struct___sFILE = extern struct {
    _p: [*c]u8,
    _r: c_int,
    _w: c_int,
    _flags: c_short,
    _file: c_short,
    _bf: struct___sbuf,
    _lbfsize: c_int,
    _cookie: ?*c_void,
    _close: ?fn (?*c_void) callconv(.C) c_int,
    _read: ?fn (?*c_void, [*c]u8, c_int) callconv(.C) c_int,
    _seek: ?fn (?*c_void, fpos_t, c_int) callconv(.C) fpos_t,
    _write: ?fn (?*c_void, [*c]const u8, c_int) callconv(.C) c_int,
    _ub: struct___sbuf,
    _extra: ?*struct___sFILEX,
    _ur: c_int,
    _ubuf: [3]u8,
    _nbuf: [1]u8,
    _lb: struct___sbuf,
    _blksize: c_int,
    _offset: fpos_t,
};
pub const FILE = struct___sFILE;
pub extern var __stdinp: [*c]FILE;
pub extern var __stdoutp: [*c]FILE;
pub extern var __stderrp: [*c]FILE;
pub extern fn clearerr([*c]FILE) void;
pub extern fn fclose([*c]FILE) c_int;
pub extern fn feof([*c]FILE) c_int;
pub extern fn ferror([*c]FILE) c_int;
pub extern fn fflush([*c]FILE) c_int;
pub extern fn fgetc([*c]FILE) c_int;
pub extern fn fgetpos(noalias [*c]FILE, [*c]fpos_t) c_int;
pub extern fn fgets(noalias [*c]u8, c_int, [*c]FILE) [*c]u8;
pub extern fn fopen(__filename: [*c]const u8, __mode: [*c]const u8) [*c]FILE;
pub extern fn fprintf([*c]FILE, [*c]const u8, ...) c_int;
pub extern fn fputc(c_int, [*c]FILE) c_int;
pub extern fn fputs(noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*c_void, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn freopen(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]FILE) [*c]FILE;
pub extern fn fscanf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn fseek([*c]FILE, c_long, c_int) c_int;
pub extern fn fsetpos([*c]FILE, [*c]const fpos_t) c_int;
pub extern fn ftell([*c]FILE) c_long;
pub extern fn fwrite(__ptr: ?*const c_void, __size: c_ulong, __nitems: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn getc([*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn gets([*c]u8) [*c]u8;
pub extern fn perror([*c]const u8) void;
pub extern fn printf([*c]const u8, ...) c_int;
pub extern fn putc(c_int, [*c]FILE) c_int;
pub extern fn putchar(c_int) c_int;
pub extern fn puts([*c]const u8) c_int;
pub extern fn remove([*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn rewind([*c]FILE) void;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
pub extern fn setbuf(noalias [*c]FILE, noalias [*c]u8) void;
pub extern fn setvbuf(noalias [*c]FILE, noalias [*c]u8, c_int, usize) c_int;
pub extern fn sprintf([*c]u8, [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn ungetc(c_int, [*c]FILE) c_int;
pub extern fn vfprintf([*c]FILE, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vprintf([*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsprintf([*c]u8, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn fdopen(c_int, [*c]const u8) [*c]FILE;
pub extern fn fileno([*c]FILE) c_int;
pub extern fn pclose([*c]FILE) c_int;
pub extern fn popen([*c]const u8, [*c]const u8) [*c]FILE;
pub extern fn __srget([*c]FILE) c_int;
pub extern fn __svfscanf([*c]FILE, [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn __swbuf(c_int, [*c]FILE) c_int;
pub fn __sputc(arg__c: c_int, arg__p: [*c]FILE) callconv(.C) c_int {
    var _c = arg__c;
    var _p = arg__p;
    if (((blk: {
        const ref = &_p.*._w;
        ref.* -= 1;
        break :blk ref.*;
    }) >= @as(c_int, 0)) or ((_p.*._w >= _p.*._lbfsize) and (@bitCast(c_int, @as(c_uint, @bitCast(u8, @truncate(i8, _c)))) != @as(c_int, '\n')))) return @bitCast(c_int, @as(c_uint, blk: {
        const tmp = @bitCast(u8, @truncate(i8, _c));
        (blk_1: {
            const ref = &_p.*._p;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })) else return __swbuf(_c, _p);
    return 0;
}
pub extern fn flockfile([*c]FILE) void;
pub extern fn ftrylockfile([*c]FILE) c_int;
pub extern fn funlockfile([*c]FILE) void;
pub extern fn getc_unlocked([*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn putc_unlocked(c_int, [*c]FILE) c_int;
pub extern fn putchar_unlocked(c_int) c_int;
pub extern fn getw([*c]FILE) c_int;
pub extern fn putw(c_int, [*c]FILE) c_int;
pub extern fn tempnam(__dir: [*c]const u8, __prefix: [*c]const u8) [*c]u8;
pub const off_t = __darwin_off_t;
pub extern fn fseeko(__stream: [*c]FILE, __offset: off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) off_t;
pub extern fn snprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsnprintf(__str: [*c]u8, __size: c_ulong, __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn vsscanf(noalias __str: [*c]const u8, noalias __format: [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn dprintf(c_int, noalias [*c]const u8, ...) c_int;
pub extern fn vdprintf(c_int, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn getdelim(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) isize;
pub extern fn getline(noalias __linep: [*c][*c]u8, noalias __linecapp: [*c]usize, noalias __stream: [*c]FILE) isize;
pub extern fn fmemopen(noalias __buf: ?*c_void, __size: usize, noalias __mode: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufp: [*c][*c]u8, __sizep: [*c]usize) [*c]FILE;
pub extern const sys_nerr: c_int;
pub extern const sys_errlist: [*c]const [*c]const u8;
pub extern fn asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn ctermid_r([*c]u8) [*c]u8;
pub extern fn fgetln([*c]FILE, [*c]usize) [*c]u8;
pub extern fn fmtcheck([*c]const u8, [*c]const u8) [*c]const u8;
pub extern fn fpurge([*c]FILE) c_int;
pub extern fn setbuffer([*c]FILE, [*c]u8, c_int) void;
pub extern fn setlinebuf([*c]FILE) c_int;
pub extern fn vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn zopen([*c]const u8, [*c]const u8, c_int) [*c]FILE;
pub extern fn funopen(?*const c_void, ?fn (?*c_void, [*c]u8, c_int) callconv(.C) c_int, ?fn (?*c_void, [*c]const u8, c_int) callconv(.C) c_int, ?fn (?*c_void, fpos_t, c_int) callconv(.C) fpos_t, ?fn (?*c_void) callconv(.C) c_int) [*c]FILE;
pub extern fn __sprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __snprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __vsprintf_chk(noalias [*c]u8, c_int, usize, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub extern fn __vsnprintf_chk(noalias [*c]u8, usize, c_int, usize, noalias [*c]const u8, [*c]struct___va_list_tag) c_int;
pub const P_ALL: c_int = 0;
pub const P_PID: c_int = 1;
pub const P_PGID: c_int = 2;
pub const idtype_t = c_uint;
pub const pid_t = __darwin_pid_t;
pub const id_t = __darwin_id_t;
pub const sig_atomic_t = c_int;
pub const struct___darwin_i386_thread_state = extern struct {
    __eax: c_uint,
    __ebx: c_uint,
    __ecx: c_uint,
    __edx: c_uint,
    __edi: c_uint,
    __esi: c_uint,
    __ebp: c_uint,
    __esp: c_uint,
    __ss: c_uint,
    __eflags: c_uint,
    __eip: c_uint,
    __cs: c_uint,
    __ds: c_uint,
    __es: c_uint,
    __fs: c_uint,
    __gs: c_uint,
}; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/mach/i386/_structs.h:94:21: warning: struct demoted to opaque type - has bitfield
pub const struct___darwin_fp_control = opaque {};
pub const __darwin_fp_control_t = struct___darwin_fp_control; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/mach/i386/_structs.h:152:21: warning: struct demoted to opaque type - has bitfield
pub const struct___darwin_fp_status = opaque {};
pub const __darwin_fp_status_t = struct___darwin_fp_status;
pub const struct___darwin_mmst_reg = extern struct {
    __mmst_reg: [10]u8,
    __mmst_rsrv: [6]u8,
};
pub const struct___darwin_xmm_reg = extern struct {
    __xmm_reg: [16]u8,
};
pub const struct___darwin_ymm_reg = extern struct {
    __ymm_reg: [32]u8,
};
pub const struct___darwin_zmm_reg = extern struct {
    __zmm_reg: [64]u8,
};
pub const struct___darwin_opmask_reg = extern struct {
    __opmask_reg: [8]u8,
};
pub const struct___darwin_i386_float_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
};
pub const struct___darwin_i386_avx_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
};
pub const struct___darwin_i386_avx512_state = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_rsrv4: [224]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_k0: struct___darwin_opmask_reg,
    __fpu_k1: struct___darwin_opmask_reg,
    __fpu_k2: struct___darwin_opmask_reg,
    __fpu_k3: struct___darwin_opmask_reg,
    __fpu_k4: struct___darwin_opmask_reg,
    __fpu_k5: struct___darwin_opmask_reg,
    __fpu_k6: struct___darwin_opmask_reg,
    __fpu_k7: struct___darwin_opmask_reg,
    __fpu_zmmh0: struct___darwin_ymm_reg,
    __fpu_zmmh1: struct___darwin_ymm_reg,
    __fpu_zmmh2: struct___darwin_ymm_reg,
    __fpu_zmmh3: struct___darwin_ymm_reg,
    __fpu_zmmh4: struct___darwin_ymm_reg,
    __fpu_zmmh5: struct___darwin_ymm_reg,
    __fpu_zmmh6: struct___darwin_ymm_reg,
    __fpu_zmmh7: struct___darwin_ymm_reg,
};
pub const struct___darwin_i386_exception_state = extern struct {
    __trapno: __uint16_t,
    __cpu: __uint16_t,
    __err: __uint32_t,
    __faultvaddr: __uint32_t,
};
pub const struct___darwin_x86_debug_state32 = extern struct {
    __dr0: c_uint,
    __dr1: c_uint,
    __dr2: c_uint,
    __dr3: c_uint,
    __dr4: c_uint,
    __dr5: c_uint,
    __dr6: c_uint,
    __dr7: c_uint,
};
pub const struct___x86_pagein_state = extern struct {
    __pagein_error: c_int,
};
pub const struct___darwin_x86_thread_state64 = extern struct {
    __rax: __uint64_t,
    __rbx: __uint64_t,
    __rcx: __uint64_t,
    __rdx: __uint64_t,
    __rdi: __uint64_t,
    __rsi: __uint64_t,
    __rbp: __uint64_t,
    __rsp: __uint64_t,
    __r8: __uint64_t,
    __r9: __uint64_t,
    __r10: __uint64_t,
    __r11: __uint64_t,
    __r12: __uint64_t,
    __r13: __uint64_t,
    __r14: __uint64_t,
    __r15: __uint64_t,
    __rip: __uint64_t,
    __rflags: __uint64_t,
    __cs: __uint64_t,
    __fs: __uint64_t,
    __gs: __uint64_t,
};
pub const struct___darwin_x86_thread_full_state64 = extern struct {
    __ss64: struct___darwin_x86_thread_state64,
    __ds: __uint64_t,
    __es: __uint64_t,
    __ss: __uint64_t,
    __gsbase: __uint64_t,
};
pub const struct___darwin_x86_float_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
};
pub const struct___darwin_x86_avx_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_ymmh8: struct___darwin_xmm_reg,
    __fpu_ymmh9: struct___darwin_xmm_reg,
    __fpu_ymmh10: struct___darwin_xmm_reg,
    __fpu_ymmh11: struct___darwin_xmm_reg,
    __fpu_ymmh12: struct___darwin_xmm_reg,
    __fpu_ymmh13: struct___darwin_xmm_reg,
    __fpu_ymmh14: struct___darwin_xmm_reg,
    __fpu_ymmh15: struct___darwin_xmm_reg,
};
pub const struct___darwin_x86_avx512_state64 = extern struct {
    __fpu_reserved: [2]c_int,
    __fpu_fcw: struct___darwin_fp_control,
    __fpu_fsw: struct___darwin_fp_status,
    __fpu_ftw: __uint8_t,
    __fpu_rsrv1: __uint8_t,
    __fpu_fop: __uint16_t,
    __fpu_ip: __uint32_t,
    __fpu_cs: __uint16_t,
    __fpu_rsrv2: __uint16_t,
    __fpu_dp: __uint32_t,
    __fpu_ds: __uint16_t,
    __fpu_rsrv3: __uint16_t,
    __fpu_mxcsr: __uint32_t,
    __fpu_mxcsrmask: __uint32_t,
    __fpu_stmm0: struct___darwin_mmst_reg,
    __fpu_stmm1: struct___darwin_mmst_reg,
    __fpu_stmm2: struct___darwin_mmst_reg,
    __fpu_stmm3: struct___darwin_mmst_reg,
    __fpu_stmm4: struct___darwin_mmst_reg,
    __fpu_stmm5: struct___darwin_mmst_reg,
    __fpu_stmm6: struct___darwin_mmst_reg,
    __fpu_stmm7: struct___darwin_mmst_reg,
    __fpu_xmm0: struct___darwin_xmm_reg,
    __fpu_xmm1: struct___darwin_xmm_reg,
    __fpu_xmm2: struct___darwin_xmm_reg,
    __fpu_xmm3: struct___darwin_xmm_reg,
    __fpu_xmm4: struct___darwin_xmm_reg,
    __fpu_xmm5: struct___darwin_xmm_reg,
    __fpu_xmm6: struct___darwin_xmm_reg,
    __fpu_xmm7: struct___darwin_xmm_reg,
    __fpu_xmm8: struct___darwin_xmm_reg,
    __fpu_xmm9: struct___darwin_xmm_reg,
    __fpu_xmm10: struct___darwin_xmm_reg,
    __fpu_xmm11: struct___darwin_xmm_reg,
    __fpu_xmm12: struct___darwin_xmm_reg,
    __fpu_xmm13: struct___darwin_xmm_reg,
    __fpu_xmm14: struct___darwin_xmm_reg,
    __fpu_xmm15: struct___darwin_xmm_reg,
    __fpu_rsrv4: [96]u8,
    __fpu_reserved1: c_int,
    __avx_reserved1: [64]u8,
    __fpu_ymmh0: struct___darwin_xmm_reg,
    __fpu_ymmh1: struct___darwin_xmm_reg,
    __fpu_ymmh2: struct___darwin_xmm_reg,
    __fpu_ymmh3: struct___darwin_xmm_reg,
    __fpu_ymmh4: struct___darwin_xmm_reg,
    __fpu_ymmh5: struct___darwin_xmm_reg,
    __fpu_ymmh6: struct___darwin_xmm_reg,
    __fpu_ymmh7: struct___darwin_xmm_reg,
    __fpu_ymmh8: struct___darwin_xmm_reg,
    __fpu_ymmh9: struct___darwin_xmm_reg,
    __fpu_ymmh10: struct___darwin_xmm_reg,
    __fpu_ymmh11: struct___darwin_xmm_reg,
    __fpu_ymmh12: struct___darwin_xmm_reg,
    __fpu_ymmh13: struct___darwin_xmm_reg,
    __fpu_ymmh14: struct___darwin_xmm_reg,
    __fpu_ymmh15: struct___darwin_xmm_reg,
    __fpu_k0: struct___darwin_opmask_reg,
    __fpu_k1: struct___darwin_opmask_reg,
    __fpu_k2: struct___darwin_opmask_reg,
    __fpu_k3: struct___darwin_opmask_reg,
    __fpu_k4: struct___darwin_opmask_reg,
    __fpu_k5: struct___darwin_opmask_reg,
    __fpu_k6: struct___darwin_opmask_reg,
    __fpu_k7: struct___darwin_opmask_reg,
    __fpu_zmmh0: struct___darwin_ymm_reg,
    __fpu_zmmh1: struct___darwin_ymm_reg,
    __fpu_zmmh2: struct___darwin_ymm_reg,
    __fpu_zmmh3: struct___darwin_ymm_reg,
    __fpu_zmmh4: struct___darwin_ymm_reg,
    __fpu_zmmh5: struct___darwin_ymm_reg,
    __fpu_zmmh6: struct___darwin_ymm_reg,
    __fpu_zmmh7: struct___darwin_ymm_reg,
    __fpu_zmmh8: struct___darwin_ymm_reg,
    __fpu_zmmh9: struct___darwin_ymm_reg,
    __fpu_zmmh10: struct___darwin_ymm_reg,
    __fpu_zmmh11: struct___darwin_ymm_reg,
    __fpu_zmmh12: struct___darwin_ymm_reg,
    __fpu_zmmh13: struct___darwin_ymm_reg,
    __fpu_zmmh14: struct___darwin_ymm_reg,
    __fpu_zmmh15: struct___darwin_ymm_reg,
    __fpu_zmm16: struct___darwin_zmm_reg,
    __fpu_zmm17: struct___darwin_zmm_reg,
    __fpu_zmm18: struct___darwin_zmm_reg,
    __fpu_zmm19: struct___darwin_zmm_reg,
    __fpu_zmm20: struct___darwin_zmm_reg,
    __fpu_zmm21: struct___darwin_zmm_reg,
    __fpu_zmm22: struct___darwin_zmm_reg,
    __fpu_zmm23: struct___darwin_zmm_reg,
    __fpu_zmm24: struct___darwin_zmm_reg,
    __fpu_zmm25: struct___darwin_zmm_reg,
    __fpu_zmm26: struct___darwin_zmm_reg,
    __fpu_zmm27: struct___darwin_zmm_reg,
    __fpu_zmm28: struct___darwin_zmm_reg,
    __fpu_zmm29: struct___darwin_zmm_reg,
    __fpu_zmm30: struct___darwin_zmm_reg,
    __fpu_zmm31: struct___darwin_zmm_reg,
};
pub const struct___darwin_x86_exception_state64 = extern struct {
    __trapno: __uint16_t,
    __cpu: __uint16_t,
    __err: __uint32_t,
    __faultvaddr: __uint64_t,
};
pub const struct___darwin_x86_debug_state64 = extern struct {
    __dr0: __uint64_t,
    __dr1: __uint64_t,
    __dr2: __uint64_t,
    __dr3: __uint64_t,
    __dr4: __uint64_t,
    __dr5: __uint64_t,
    __dr6: __uint64_t,
    __dr7: __uint64_t,
};
pub const struct___darwin_x86_cpmu_state64 = extern struct {
    __ctrs: [16]__uint64_t,
};
pub const struct___darwin_mcontext32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_float_state,
};
pub const struct___darwin_mcontext_avx32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_avx_state,
};
pub const struct___darwin_mcontext_avx512_32 = extern struct {
    __es: struct___darwin_i386_exception_state,
    __ss: struct___darwin_i386_thread_state,
    __fs: struct___darwin_i386_avx512_state,
};
pub const struct___darwin_mcontext64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_float_state64,
};
pub const struct___darwin_mcontext64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_float_state64,
};
pub const struct___darwin_mcontext_avx64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_avx_state64,
};
pub const struct___darwin_mcontext_avx64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_avx_state64,
};
pub const struct___darwin_mcontext_avx512_64 = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_state64,
    __fs: struct___darwin_x86_avx512_state64,
};
pub const struct___darwin_mcontext_avx512_64_full = extern struct {
    __es: struct___darwin_x86_exception_state64,
    __ss: struct___darwin_x86_thread_full_state64,
    __fs: struct___darwin_x86_avx512_state64,
};
pub const mcontext_t = [*c]struct___darwin_mcontext64;
pub const pthread_attr_t = __darwin_pthread_attr_t;
pub const struct___darwin_sigaltstack = extern struct {
    ss_sp: ?*c_void,
    ss_size: __darwin_size_t,
    ss_flags: c_int,
};
pub const stack_t = struct___darwin_sigaltstack;
pub const struct___darwin_ucontext = extern struct {
    uc_onstack: c_int,
    uc_sigmask: __darwin_sigset_t,
    uc_stack: struct___darwin_sigaltstack,
    uc_link: [*c]struct___darwin_ucontext,
    uc_mcsize: __darwin_size_t,
    uc_mcontext: [*c]struct___darwin_mcontext64,
};
pub const ucontext_t = struct___darwin_ucontext;
pub const sigset_t = __darwin_sigset_t;
pub const uid_t = __darwin_uid_t;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*c_void,
};
pub const struct_sigevent = extern struct {
    sigev_notify: c_int,
    sigev_signo: c_int,
    sigev_value: union_sigval,
    sigev_notify_function: ?fn (union_sigval) callconv(.C) void,
    sigev_notify_attributes: [*c]pthread_attr_t,
};
pub const struct___siginfo = extern struct {
    si_signo: c_int,
    si_errno: c_int,
    si_code: c_int,
    si_pid: pid_t,
    si_uid: uid_t,
    si_status: c_int,
    si_addr: ?*c_void,
    si_value: union_sigval,
    si_band: c_long,
    __pad: [7]c_ulong,
};
pub const siginfo_t = struct___siginfo;
pub const union___sigaction_u = extern union {
    __sa_handler: ?fn (c_int) callconv(.C) void,
    __sa_sigaction: ?fn (c_int, [*c]struct___siginfo, ?*c_void) callconv(.C) void,
};
pub const struct___sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_tramp: ?fn (?*c_void, c_int, c_int, [*c]siginfo_t, ?*c_void) callconv(.C) void,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const struct_sigaction = extern struct {
    __sigaction_u: union___sigaction_u,
    sa_mask: sigset_t,
    sa_flags: c_int,
};
pub const sig_t = ?fn (c_int) callconv(.C) void;
pub const struct_sigvec = extern struct {
    sv_handler: ?fn (c_int) callconv(.C) void,
    sv_mask: c_int,
    sv_flags: c_int,
};
pub const struct_sigstack = extern struct {
    ss_sp: [*c]u8,
    ss_onstack: c_int,
};
pub extern fn signal(c_int, ?fn (c_int) callconv(.C) void) ?fn (c_int) callconv(.C) void;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast8_t = i8;
pub const int_fast16_t = i16;
pub const int_fast32_t = i32;
pub const int_fast64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = u16;
pub const uint_fast32_t = u32;
pub const uint_fast64_t = u64;
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const struct_timeval = extern struct {
    tv_sec: __darwin_time_t,
    tv_usec: __darwin_suseconds_t,
};
pub const rlim_t = __uint64_t;
pub const struct_rusage = extern struct {
    ru_utime: struct_timeval,
    ru_stime: struct_timeval,
    ru_maxrss: c_long,
    ru_ixrss: c_long,
    ru_idrss: c_long,
    ru_isrss: c_long,
    ru_minflt: c_long,
    ru_majflt: c_long,
    ru_nswap: c_long,
    ru_inblock: c_long,
    ru_oublock: c_long,
    ru_msgsnd: c_long,
    ru_msgrcv: c_long,
    ru_nsignals: c_long,
    ru_nvcsw: c_long,
    ru_nivcsw: c_long,
};
pub const rusage_info_t = ?*c_void;
pub const struct_rusage_info_v0 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
};
pub const struct_rusage_info_v1 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
};
pub const struct_rusage_info_v2 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
};
pub const struct_rusage_info_v3 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
};
pub const struct_rusage_info_v4 = extern struct {
    ri_uuid: [16]u8,
    ri_user_time: u64,
    ri_system_time: u64,
    ri_pkg_idle_wkups: u64,
    ri_interrupt_wkups: u64,
    ri_pageins: u64,
    ri_wired_size: u64,
    ri_resident_size: u64,
    ri_phys_footprint: u64,
    ri_proc_start_abstime: u64,
    ri_proc_exit_abstime: u64,
    ri_child_user_time: u64,
    ri_child_system_time: u64,
    ri_child_pkg_idle_wkups: u64,
    ri_child_interrupt_wkups: u64,
    ri_child_pageins: u64,
    ri_child_elapsed_abstime: u64,
    ri_diskio_bytesread: u64,
    ri_diskio_byteswritten: u64,
    ri_cpu_time_qos_default: u64,
    ri_cpu_time_qos_maintenance: u64,
    ri_cpu_time_qos_background: u64,
    ri_cpu_time_qos_utility: u64,
    ri_cpu_time_qos_legacy: u64,
    ri_cpu_time_qos_user_initiated: u64,
    ri_cpu_time_qos_user_interactive: u64,
    ri_billed_system_time: u64,
    ri_serviced_system_time: u64,
    ri_logical_writes: u64,
    ri_lifetime_max_phys_footprint: u64,
    ri_instructions: u64,
    ri_cycles: u64,
    ri_billed_energy: u64,
    ri_serviced_energy: u64,
    ri_interval_max_phys_footprint: u64,
    ri_runnable_time: u64,
};
pub const rusage_info_current = struct_rusage_info_v4;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t,
    rlim_max: rlim_t,
};
pub const struct_proc_rlimit_control_wakeupmon = extern struct {
    wm_flags: u32,
    wm_rate: i32,
};
pub extern fn getpriority(c_int, id_t) c_int;
pub extern fn getiopolicy_np(c_int, c_int) c_int;
pub extern fn getrlimit(c_int, [*c]struct_rlimit) c_int;
pub extern fn getrusage(c_int, [*c]struct_rusage) c_int;
pub extern fn setpriority(c_int, id_t, c_int) c_int;
pub extern fn setiopolicy_np(c_int, c_int, c_int) c_int;
pub extern fn setrlimit(c_int, [*c]const struct_rlimit) c_int;
pub fn _OSSwapInt16(arg__data: __uint16_t) callconv(.C) __uint16_t {
    var _data = arg__data;
    return @bitCast(__uint16_t, @truncate(c_short, (@bitCast(c_int, @as(c_uint, _data)) << @intCast(@import("std").math.Log2Int(c_int), 8)) | (@bitCast(c_int, @as(c_uint, _data)) >> @intCast(@import("std").math.Log2Int(c_int), 8))));
}
pub fn _OSSwapInt32(arg__data: __uint32_t) callconv(.C) __uint32_t {
    var _data = arg__data;
    return __builtin_bswap32(_data);
}
pub fn _OSSwapInt64(arg__data: __uint64_t) callconv(.C) __uint64_t {
    var _data = arg__data;
    return __builtin_bswap64(_data);
} // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/wait.h:201:19: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_1 = opaque {}; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/wait.h:220:19: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_2 = opaque {};
pub const union_wait = extern union {
    w_status: c_int,
    w_T: struct_unnamed_1,
    w_S: struct_unnamed_2,
};
pub extern fn wait([*c]c_int) pid_t;
pub extern fn waitpid(pid_t, [*c]c_int, c_int) pid_t;
pub extern fn waitid(idtype_t, id_t, [*c]siginfo_t, c_int) c_int;
pub extern fn wait3([*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn wait4(pid_t, [*c]c_int, c_int, [*c]struct_rusage) pid_t;
pub extern fn alloca(c_ulong) ?*c_void;
pub const ct_rune_t = __darwin_ct_rune_t;
pub const rune_t = __darwin_rune_t;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern var __mb_cur_max: c_int;
pub extern fn malloc(__size: c_ulong) ?*c_void;
pub extern fn calloc(__count: c_ulong, __size: c_ulong) ?*c_void;
pub extern fn free(?*c_void) void;
pub extern fn realloc(__ptr: ?*c_void, __size: c_ulong) ?*c_void;
pub extern fn valloc(usize) ?*c_void;
pub extern fn aligned_alloc(__alignment: usize, __size: usize) ?*c_void;
pub extern fn posix_memalign(__memptr: [*c]?*c_void, __alignment: usize, __size: usize) c_int;
pub extern fn abort() noreturn;
pub extern fn abs(c_int) c_int;
pub extern fn atexit(?fn () callconv(.C) void) c_int;
pub extern fn atof([*c]const u8) f64;
pub extern fn atoi([*c]const u8) c_int;
pub extern fn atol([*c]const u8) c_long;
pub extern fn atoll([*c]const u8) c_longlong;
pub extern fn bsearch(__key: ?*const c_void, __base: ?*const c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) ?*c_void;
pub extern fn div(c_int, c_int) div_t;
pub extern fn exit(c_int) noreturn;
pub extern fn getenv([*c]const u8) [*c]u8;
pub extern fn labs(c_long) c_long;
pub extern fn ldiv(c_long, c_long) ldiv_t;
pub extern fn llabs(c_longlong) c_longlong;
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbstowcs(noalias [*c]wchar_t, noalias [*c]const u8, usize) usize;
pub extern fn mbtowc(noalias [*c]wchar_t, noalias [*c]const u8, usize) c_int;
pub extern fn qsort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void;
pub extern fn rand() c_int;
pub extern fn srand(c_uint) void;
pub extern fn strtod([*c]const u8, [*c][*c]u8) f64;
pub extern fn strtof([*c]const u8, [*c][*c]u8) f32;
pub extern fn strtol(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtold([*c]const u8, [*c][*c]u8) c_longdouble;
pub extern fn strtoll(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoul(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoull(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn system([*c]const u8) c_int;
pub extern fn wcstombs(noalias [*c]u8, noalias [*c]const wchar_t, usize) usize;
pub extern fn wctomb([*c]u8, wchar_t) c_int;
pub extern fn _Exit(c_int) noreturn;
pub extern fn a64l([*c]const u8) c_long;
pub extern fn drand48() f64;
pub extern fn ecvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn erand48([*c]c_ushort) f64;
pub extern fn fcvt(f64, c_int, noalias [*c]c_int, noalias [*c]c_int) [*c]u8;
pub extern fn gcvt(f64, c_int, [*c]u8) [*c]u8;
pub extern fn getsubopt([*c][*c]u8, [*c]const [*c]u8, [*c][*c]u8) c_int;
pub extern fn grantpt(c_int) c_int;
pub extern fn initstate(c_uint, [*c]u8, usize) [*c]u8;
pub extern fn jrand48([*c]c_ushort) c_long;
pub extern fn l64a(c_long) [*c]u8;
pub extern fn lcong48([*c]c_ushort) void;
pub extern fn lrand48() c_long;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mrand48() c_long;
pub extern fn nrand48([*c]c_ushort) c_long;
pub extern fn posix_openpt(c_int) c_int;
pub extern fn ptsname(c_int) [*c]u8;
pub extern fn ptsname_r(fildes: c_int, buffer: [*c]u8, buflen: usize) c_int;
pub extern fn putenv([*c]u8) c_int;
pub extern fn random() c_long;
pub extern fn rand_r([*c]c_uint) c_int;
pub extern fn realpath(noalias [*c]const u8, noalias [*c]u8) [*c]u8;
pub extern fn seed48([*c]c_ushort) [*c]c_ushort;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __overwrite: c_int) c_int;
pub extern fn setkey([*c]const u8) void;
pub extern fn setstate([*c]const u8) [*c]u8;
pub extern fn srand48(c_long) void;
pub extern fn srandom(c_uint) void;
pub extern fn unlockpt(c_int) c_int;
pub extern fn unsetenv([*c]const u8) c_int;
pub const dev_t = __darwin_dev_t;
pub const mode_t = __darwin_mode_t;
pub extern fn arc4random() u32;
pub extern fn arc4random_addrandom([*c]u8, c_int) void;
pub extern fn arc4random_buf(__buf: ?*c_void, __nbytes: usize) void;
pub extern fn arc4random_stir() void;
pub extern fn arc4random_uniform(__upper_bound: u32) u32; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:275:6: warning: unsupported type: 'BlockPointer'
pub const atexit_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:275:6
// /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:276:7: warning: unsupported type: 'BlockPointer'
pub const bsearch_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:276:7
pub extern fn cgetcap([*c]u8, [*c]const u8, c_int) [*c]u8;
pub extern fn cgetclose() c_int;
pub extern fn cgetent([*c][*c]u8, [*c][*c]u8, [*c]const u8) c_int;
pub extern fn cgetfirst([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetmatch([*c]const u8, [*c]const u8) c_int;
pub extern fn cgetnext([*c][*c]u8, [*c][*c]u8) c_int;
pub extern fn cgetnum([*c]u8, [*c]const u8, [*c]c_long) c_int;
pub extern fn cgetset([*c]const u8) c_int;
pub extern fn cgetstr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn cgetustr([*c]u8, [*c]const u8, [*c][*c]u8) c_int;
pub extern fn daemon(c_int, c_int) c_int;
pub extern fn devname(dev_t, mode_t) [*c]u8;
pub extern fn devname_r(dev_t, mode_t, buf: [*c]u8, len: c_int) [*c]u8;
pub extern fn getbsize([*c]c_int, [*c]c_long) [*c]u8;
pub extern fn getloadavg([*c]f64, c_int) c_int;
pub extern fn getprogname() [*c]const u8;
pub extern fn setprogname([*c]const u8) void;
pub extern fn heapsort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) c_int; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:312:6: warning: unsupported type: 'BlockPointer'
pub const heapsort_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:312:6
pub extern fn mergesort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) c_int; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:319:6: warning: unsupported type: 'BlockPointer'
pub const mergesort_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:319:6
pub extern fn psort(__base: ?*c_void, __nel: usize, __width: usize, __compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:327:7: warning: unsupported type: 'BlockPointer'
pub const psort_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:327:7
pub extern fn psort_r(__base: ?*c_void, __nel: usize, __width: usize, ?*c_void, __compar: ?fn (?*c_void, ?*const c_void, ?*const c_void) callconv(.C) c_int) void; // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:335:7: warning: unsupported type: 'BlockPointer'
pub const qsort_b = @compileError("unable to resolve prototype of function"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdlib.h:335:7
pub extern fn qsort_r(__base: ?*c_void, __nel: usize, __width: usize, ?*c_void, __compar: ?fn (?*c_void, ?*const c_void, ?*const c_void) callconv(.C) c_int) void;
pub extern fn radixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn rpmatch([*c]const u8) c_int;
pub extern fn sradixsort(__base: [*c][*c]const u8, __nel: c_int, __table: [*c]const u8, __endbyte: c_uint) c_int;
pub extern fn sranddev() void;
pub extern fn srandomdev() void;
pub extern fn reallocf(__ptr: ?*c_void, __size: usize) ?*c_void;
pub extern fn strtoq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(__str: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern var suboptarg: [*c]u8;
pub const jmp_buf = [37]c_int;
pub const sigjmp_buf = [38]c_int;
pub extern fn setjmp([*c]c_int) c_int;
pub extern fn longjmp([*c]c_int, c_int) noreturn;
pub extern fn _setjmp([*c]c_int) c_int;
pub extern fn _longjmp([*c]c_int, c_int) noreturn;
pub extern fn sigsetjmp([*c]c_int, c_int) c_int;
pub extern fn siglongjmp([*c]c_int, c_int) noreturn;
pub extern fn longjmperror() void;
pub const __gnuc_va_list = __builtin_va_list;
pub const FT_Int16 = c_short;
pub const FT_UInt16 = c_ushort;
pub const FT_Int32 = c_int;
pub const FT_UInt32 = c_uint;
pub const FT_Fast = c_int;
pub const FT_UFast = c_uint;
pub const FT_Int64 = c_long;
pub const FT_UInt64 = c_ulong;
pub extern fn __error() [*c]c_int;
pub const FT_Memory = [*c]struct_FT_MemoryRec_;
pub const FT_Alloc_Func = ?fn (FT_Memory, c_long) callconv(.C) ?*c_void;
pub const FT_Free_Func = ?fn (FT_Memory, ?*c_void) callconv(.C) void;
pub const FT_Realloc_Func = ?fn (FT_Memory, c_long, c_long, ?*c_void) callconv(.C) ?*c_void;
pub const struct_FT_MemoryRec_ = extern struct {
    user: ?*c_void,
    alloc: FT_Alloc_Func,
    free: FT_Free_Func,
    realloc: FT_Realloc_Func,
};
pub const union_FT_StreamDesc_ = extern union {
    value: c_long,
    pointer: ?*c_void,
};
pub const FT_StreamDesc = union_FT_StreamDesc_;
pub const FT_Stream = [*c]struct_FT_StreamRec_;
pub const FT_Stream_IoFunc = ?fn (FT_Stream, c_ulong, [*c]u8, c_ulong) callconv(.C) c_ulong;
pub const FT_Stream_CloseFunc = ?fn (FT_Stream) callconv(.C) void;
pub const struct_FT_StreamRec_ = extern struct {
    base: [*c]u8,
    size: c_ulong,
    pos: c_ulong,
    descriptor: FT_StreamDesc,
    pathname: FT_StreamDesc,
    read: FT_Stream_IoFunc,
    close: FT_Stream_CloseFunc,
    memory: FT_Memory,
    cursor: [*c]u8,
    limit: [*c]u8,
};
pub const FT_StreamRec = struct_FT_StreamRec_;
pub const FT_Pos = c_long;
pub const struct_FT_Vector_ = extern struct {
    x: FT_Pos,
    y: FT_Pos,
};
pub const FT_Vector = struct_FT_Vector_;
pub const struct_FT_BBox_ = extern struct {
    xMin: FT_Pos,
    yMin: FT_Pos,
    xMax: FT_Pos,
    yMax: FT_Pos,
};
pub const FT_BBox = struct_FT_BBox_;
pub const FT_PIXEL_MODE_NONE: c_int = 0;
pub const FT_PIXEL_MODE_MONO: c_int = 1;
pub const FT_PIXEL_MODE_GRAY: c_int = 2;
pub const FT_PIXEL_MODE_GRAY2: c_int = 3;
pub const FT_PIXEL_MODE_GRAY4: c_int = 4;
pub const FT_PIXEL_MODE_LCD: c_int = 5;
pub const FT_PIXEL_MODE_LCD_V: c_int = 6;
pub const FT_PIXEL_MODE_BGRA: c_int = 7;
pub const FT_PIXEL_MODE_MAX: c_int = 8;
pub const enum_FT_Pixel_Mode_ = c_uint;
pub const FT_Pixel_Mode = enum_FT_Pixel_Mode_;
pub const struct_FT_Bitmap_ = extern struct {
    rows: c_uint,
    width: c_uint,
    pitch: c_int,
    buffer: [*c]u8,
    num_grays: c_ushort,
    pixel_mode: u8,
    palette_mode: u8,
    palette: ?*c_void,
};
pub const FT_Bitmap = struct_FT_Bitmap_;
pub const struct_FT_Outline_ = extern struct {
    n_contours: c_short,
    n_points: c_short,
    points: [*c]FT_Vector,
    tags: [*c]u8,
    contours: [*c]c_short,
    flags: c_int,
};
pub const FT_Outline = struct_FT_Outline_;
pub const FT_Outline_MoveToFunc = ?fn ([*c]const FT_Vector, ?*c_void) callconv(.C) c_int;
pub const FT_Outline_LineToFunc = ?fn ([*c]const FT_Vector, ?*c_void) callconv(.C) c_int;
pub const FT_Outline_ConicToFunc = ?fn ([*c]const FT_Vector, [*c]const FT_Vector, ?*c_void) callconv(.C) c_int;
pub const FT_Outline_CubicToFunc = ?fn ([*c]const FT_Vector, [*c]const FT_Vector, [*c]const FT_Vector, ?*c_void) callconv(.C) c_int;
pub const struct_FT_Outline_Funcs_ = extern struct {
    move_to: FT_Outline_MoveToFunc,
    line_to: FT_Outline_LineToFunc,
    conic_to: FT_Outline_ConicToFunc,
    cubic_to: FT_Outline_CubicToFunc,
    shift: c_int,
    delta: FT_Pos,
};
pub const FT_Outline_Funcs = struct_FT_Outline_Funcs_;
pub const FT_GLYPH_FORMAT_NONE: c_int = 0;
pub const FT_GLYPH_FORMAT_COMPOSITE: c_int = 1668246896;
pub const FT_GLYPH_FORMAT_BITMAP: c_int = 1651078259;
pub const FT_GLYPH_FORMAT_OUTLINE: c_int = 1869968492;
pub const FT_GLYPH_FORMAT_PLOTTER: c_int = 1886154612;
pub const enum_FT_Glyph_Format_ = c_uint;
pub const FT_Glyph_Format = enum_FT_Glyph_Format_;
pub const struct_FT_Span_ = extern struct {
    x: c_short,
    len: c_ushort,
    coverage: u8,
};
pub const FT_Span = struct_FT_Span_;
pub const FT_SpanFunc = ?fn (c_int, c_int, [*c]const FT_Span, ?*c_void) callconv(.C) void;
pub const FT_Raster_BitTest_Func = ?fn (c_int, c_int, ?*c_void) callconv(.C) c_int;
pub const FT_Raster_BitSet_Func = ?fn (c_int, c_int, ?*c_void) callconv(.C) void;
pub const struct_FT_Raster_Params_ = extern struct {
    target: [*c]const FT_Bitmap,
    source: ?*const c_void,
    flags: c_int,
    gray_spans: FT_SpanFunc,
    black_spans: FT_SpanFunc,
    bit_test: FT_Raster_BitTest_Func,
    bit_set: FT_Raster_BitSet_Func,
    user: ?*c_void,
    clip_box: FT_BBox,
};
pub const FT_Raster_Params = struct_FT_Raster_Params_;
pub const struct_FT_RasterRec_ = opaque {};
pub const FT_Raster = ?*struct_FT_RasterRec_;
pub const FT_Raster_NewFunc = ?fn (?*c_void, [*c]FT_Raster) callconv(.C) c_int;
pub const FT_Raster_DoneFunc = ?fn (FT_Raster) callconv(.C) void;
pub const FT_Raster_ResetFunc = ?fn (FT_Raster, [*c]u8, c_ulong) callconv(.C) void;
pub const FT_Raster_SetModeFunc = ?fn (FT_Raster, c_ulong, ?*c_void) callconv(.C) c_int;
pub const FT_Raster_RenderFunc = ?fn (FT_Raster, [*c]const FT_Raster_Params) callconv(.C) c_int;
pub const struct_FT_Raster_Funcs_ = extern struct {
    glyph_format: FT_Glyph_Format,
    raster_new: FT_Raster_NewFunc,
    raster_reset: FT_Raster_ResetFunc,
    raster_set_mode: FT_Raster_SetModeFunc,
    raster_render: FT_Raster_RenderFunc,
    raster_done: FT_Raster_DoneFunc,
};
pub const FT_Raster_Funcs = struct_FT_Raster_Funcs_;
pub const FT_Bool = u8;
pub const FT_FWord = c_short;
pub const FT_UFWord = c_ushort;
pub const FT_Char = i8;
pub const FT_Byte = u8;
pub const FT_Bytes = [*c]const FT_Byte;
pub const FT_Tag = FT_UInt32;
pub const FT_String = u8;
pub const FT_Short = c_short;
pub const FT_UShort = c_ushort;
pub const FT_Int = c_int;
pub const FT_UInt = c_uint;
pub const FT_Long = c_long;
pub const FT_ULong = c_ulong;
pub const FT_F2Dot14 = c_short;
pub const FT_F26Dot6 = c_long;
pub const FT_Fixed = c_long;
pub const FT_Error = c_int;
pub const FT_Pointer = ?*c_void;
pub const FT_Offset = usize;
pub const FT_PtrDist = ptrdiff_t;
pub const struct_FT_UnitVector_ = extern struct {
    x: FT_F2Dot14,
    y: FT_F2Dot14,
};
pub const FT_UnitVector = struct_FT_UnitVector_;
pub const struct_FT_Matrix_ = extern struct {
    xx: FT_Fixed,
    xy: FT_Fixed,
    yx: FT_Fixed,
    yy: FT_Fixed,
};
pub const FT_Matrix = struct_FT_Matrix_;
pub const struct_FT_Data_ = extern struct {
    pointer: [*c]const FT_Byte,
    length: FT_Int,
};
pub const FT_Data = struct_FT_Data_;
pub const FT_Generic_Finalizer = ?fn (?*c_void) callconv(.C) void;
pub const struct_FT_Generic_ = extern struct {
    data: ?*c_void,
    finalizer: FT_Generic_Finalizer,
};
pub const FT_Generic = struct_FT_Generic_;
pub const FT_ListNode = [*c]struct_FT_ListNodeRec_;
pub const struct_FT_ListNodeRec_ = extern struct {
    prev: FT_ListNode,
    next: FT_ListNode,
    data: ?*c_void,
};
pub const struct_FT_ListRec_ = extern struct {
    head: FT_ListNode,
    tail: FT_ListNode,
};
pub const FT_List = [*c]struct_FT_ListRec_;
pub const FT_ListNodeRec = struct_FT_ListNodeRec_;
pub const FT_ListRec = struct_FT_ListRec_;
pub const FT_Mod_Err_Base: c_int = 0;
pub const FT_Mod_Err_Autofit: c_int = 0;
pub const FT_Mod_Err_BDF: c_int = 0;
pub const FT_Mod_Err_Bzip2: c_int = 0;
pub const FT_Mod_Err_Cache: c_int = 0;
pub const FT_Mod_Err_CFF: c_int = 0;
pub const FT_Mod_Err_CID: c_int = 0;
pub const FT_Mod_Err_Gzip: c_int = 0;
pub const FT_Mod_Err_LZW: c_int = 0;
pub const FT_Mod_Err_OTvalid: c_int = 0;
pub const FT_Mod_Err_PCF: c_int = 0;
pub const FT_Mod_Err_PFR: c_int = 0;
pub const FT_Mod_Err_PSaux: c_int = 0;
pub const FT_Mod_Err_PShinter: c_int = 0;
pub const FT_Mod_Err_PSnames: c_int = 0;
pub const FT_Mod_Err_Raster: c_int = 0;
pub const FT_Mod_Err_SFNT: c_int = 0;
pub const FT_Mod_Err_Smooth: c_int = 0;
pub const FT_Mod_Err_TrueType: c_int = 0;
pub const FT_Mod_Err_Type1: c_int = 0;
pub const FT_Mod_Err_Type42: c_int = 0;
pub const FT_Mod_Err_Winfonts: c_int = 0;
pub const FT_Mod_Err_GXvalid: c_int = 0;
pub const FT_Mod_Err_Sdf: c_int = 0;
pub const FT_Mod_Err_Max: c_int = 1;
const enum_unnamed_3 = c_uint;
pub const FT_Err_Ok: c_int = 0;
pub const FT_Err_Cannot_Open_Resource: c_int = 1;
pub const FT_Err_Unknown_File_Format: c_int = 2;
pub const FT_Err_Invalid_File_Format: c_int = 3;
pub const FT_Err_Invalid_Version: c_int = 4;
pub const FT_Err_Lower_Module_Version: c_int = 5;
pub const FT_Err_Invalid_Argument: c_int = 6;
pub const FT_Err_Unimplemented_Feature: c_int = 7;
pub const FT_Err_Invalid_Table: c_int = 8;
pub const FT_Err_Invalid_Offset: c_int = 9;
pub const FT_Err_Array_Too_Large: c_int = 10;
pub const FT_Err_Missing_Module: c_int = 11;
pub const FT_Err_Missing_Property: c_int = 12;
pub const FT_Err_Invalid_Glyph_Index: c_int = 16;
pub const FT_Err_Invalid_Character_Code: c_int = 17;
pub const FT_Err_Invalid_Glyph_Format: c_int = 18;
pub const FT_Err_Cannot_Render_Glyph: c_int = 19;
pub const FT_Err_Invalid_Outline: c_int = 20;
pub const FT_Err_Invalid_Composite: c_int = 21;
pub const FT_Err_Too_Many_Hints: c_int = 22;
pub const FT_Err_Invalid_Pixel_Size: c_int = 23;
pub const FT_Err_Invalid_Handle: c_int = 32;
pub const FT_Err_Invalid_Library_Handle: c_int = 33;
pub const FT_Err_Invalid_Driver_Handle: c_int = 34;
pub const FT_Err_Invalid_Face_Handle: c_int = 35;
pub const FT_Err_Invalid_Size_Handle: c_int = 36;
pub const FT_Err_Invalid_Slot_Handle: c_int = 37;
pub const FT_Err_Invalid_CharMap_Handle: c_int = 38;
pub const FT_Err_Invalid_Cache_Handle: c_int = 39;
pub const FT_Err_Invalid_Stream_Handle: c_int = 40;
pub const FT_Err_Too_Many_Drivers: c_int = 48;
pub const FT_Err_Too_Many_Extensions: c_int = 49;
pub const FT_Err_Out_Of_Memory: c_int = 64;
pub const FT_Err_Unlisted_Object: c_int = 65;
pub const FT_Err_Cannot_Open_Stream: c_int = 81;
pub const FT_Err_Invalid_Stream_Seek: c_int = 82;
pub const FT_Err_Invalid_Stream_Skip: c_int = 83;
pub const FT_Err_Invalid_Stream_Read: c_int = 84;
pub const FT_Err_Invalid_Stream_Operation: c_int = 85;
pub const FT_Err_Invalid_Frame_Operation: c_int = 86;
pub const FT_Err_Nested_Frame_Access: c_int = 87;
pub const FT_Err_Invalid_Frame_Read: c_int = 88;
pub const FT_Err_Raster_Uninitialized: c_int = 96;
pub const FT_Err_Raster_Corrupted: c_int = 97;
pub const FT_Err_Raster_Overflow: c_int = 98;
pub const FT_Err_Raster_Negative_Height: c_int = 99;
pub const FT_Err_Too_Many_Caches: c_int = 112;
pub const FT_Err_Invalid_Opcode: c_int = 128;
pub const FT_Err_Too_Few_Arguments: c_int = 129;
pub const FT_Err_Stack_Overflow: c_int = 130;
pub const FT_Err_Code_Overflow: c_int = 131;
pub const FT_Err_Bad_Argument: c_int = 132;
pub const FT_Err_Divide_By_Zero: c_int = 133;
pub const FT_Err_Invalid_Reference: c_int = 134;
pub const FT_Err_Debug_OpCode: c_int = 135;
pub const FT_Err_ENDF_In_Exec_Stream: c_int = 136;
pub const FT_Err_Nested_DEFS: c_int = 137;
pub const FT_Err_Invalid_CodeRange: c_int = 138;
pub const FT_Err_Execution_Too_Long: c_int = 139;
pub const FT_Err_Too_Many_Function_Defs: c_int = 140;
pub const FT_Err_Too_Many_Instruction_Defs: c_int = 141;
pub const FT_Err_Table_Missing: c_int = 142;
pub const FT_Err_Horiz_Header_Missing: c_int = 143;
pub const FT_Err_Locations_Missing: c_int = 144;
pub const FT_Err_Name_Table_Missing: c_int = 145;
pub const FT_Err_CMap_Table_Missing: c_int = 146;
pub const FT_Err_Hmtx_Table_Missing: c_int = 147;
pub const FT_Err_Post_Table_Missing: c_int = 148;
pub const FT_Err_Invalid_Horiz_Metrics: c_int = 149;
pub const FT_Err_Invalid_CharMap_Format: c_int = 150;
pub const FT_Err_Invalid_PPem: c_int = 151;
pub const FT_Err_Invalid_Vert_Metrics: c_int = 152;
pub const FT_Err_Could_Not_Find_Context: c_int = 153;
pub const FT_Err_Invalid_Post_Table_Format: c_int = 154;
pub const FT_Err_Invalid_Post_Table: c_int = 155;
pub const FT_Err_DEF_In_Glyf_Bytecode: c_int = 156;
pub const FT_Err_Missing_Bitmap: c_int = 157;
pub const FT_Err_Syntax_Error: c_int = 160;
pub const FT_Err_Stack_Underflow: c_int = 161;
pub const FT_Err_Ignore: c_int = 162;
pub const FT_Err_No_Unicode_Glyph_Name: c_int = 163;
pub const FT_Err_Glyph_Too_Big: c_int = 164;
pub const FT_Err_Missing_Startfont_Field: c_int = 176;
pub const FT_Err_Missing_Font_Field: c_int = 177;
pub const FT_Err_Missing_Size_Field: c_int = 178;
pub const FT_Err_Missing_Fontboundingbox_Field: c_int = 179;
pub const FT_Err_Missing_Chars_Field: c_int = 180;
pub const FT_Err_Missing_Startchar_Field: c_int = 181;
pub const FT_Err_Missing_Encoding_Field: c_int = 182;
pub const FT_Err_Missing_Bbx_Field: c_int = 183;
pub const FT_Err_Bbx_Too_Big: c_int = 184;
pub const FT_Err_Corrupted_Font_Header: c_int = 185;
pub const FT_Err_Corrupted_Font_Glyphs: c_int = 186;
pub const FT_Err_Max: c_int = 187;
const enum_unnamed_4 = c_uint;
pub extern fn FT_Error_String(error_code: FT_Error) [*c]const u8;
pub const struct_FT_Glyph_Metrics_ = extern struct {
    width: FT_Pos,
    height: FT_Pos,
    horiBearingX: FT_Pos,
    horiBearingY: FT_Pos,
    horiAdvance: FT_Pos,
    vertBearingX: FT_Pos,
    vertBearingY: FT_Pos,
    vertAdvance: FT_Pos,
};
pub const FT_Glyph_Metrics = struct_FT_Glyph_Metrics_;
pub const struct_FT_Bitmap_Size_ = extern struct {
    height: FT_Short,
    width: FT_Short,
    size: FT_Pos,
    x_ppem: FT_Pos,
    y_ppem: FT_Pos,
};
pub const FT_Bitmap_Size = struct_FT_Bitmap_Size_;
pub const struct_FT_LibraryRec_ = opaque {};
pub const FT_Library = ?*struct_FT_LibraryRec_;
pub const struct_FT_ModuleRec_ = opaque {};
pub const FT_Module = ?*struct_FT_ModuleRec_;
pub const struct_FT_DriverRec_ = opaque {};
pub const FT_Driver = ?*struct_FT_DriverRec_;
pub const struct_FT_RendererRec_ = opaque {};
pub const FT_Renderer = ?*struct_FT_RendererRec_;
pub const FT_Face = [*c]struct_FT_FaceRec_;
pub const FT_ENCODING_NONE: c_int = 0;
pub const FT_ENCODING_MS_SYMBOL: c_int = 1937337698;
pub const FT_ENCODING_UNICODE: c_int = 1970170211;
pub const FT_ENCODING_SJIS: c_int = 1936353651;
pub const FT_ENCODING_PRC: c_int = 1734484000;
pub const FT_ENCODING_BIG5: c_int = 1651074869;
pub const FT_ENCODING_WANSUNG: c_int = 2002873971;
pub const FT_ENCODING_JOHAB: c_int = 1785686113;
pub const FT_ENCODING_GB2312: c_int = 1734484000;
pub const FT_ENCODING_MS_SJIS: c_int = 1936353651;
pub const FT_ENCODING_MS_GB2312: c_int = 1734484000;
pub const FT_ENCODING_MS_BIG5: c_int = 1651074869;
pub const FT_ENCODING_MS_WANSUNG: c_int = 2002873971;
pub const FT_ENCODING_MS_JOHAB: c_int = 1785686113;
pub const FT_ENCODING_ADOBE_STANDARD: c_int = 1094995778;
pub const FT_ENCODING_ADOBE_EXPERT: c_int = 1094992453;
pub const FT_ENCODING_ADOBE_CUSTOM: c_int = 1094992451;
pub const FT_ENCODING_ADOBE_LATIN_1: c_int = 1818326065;
pub const FT_ENCODING_OLD_LATIN_2: c_int = 1818326066;
pub const FT_ENCODING_APPLE_ROMAN: c_int = 1634889070;
pub const enum_FT_Encoding_ = c_uint;
pub const FT_Encoding = enum_FT_Encoding_;
pub const struct_FT_CharMapRec_ = extern struct {
    face: FT_Face,
    encoding: FT_Encoding,
    platform_id: FT_UShort,
    encoding_id: FT_UShort,
};
pub const FT_CharMap = [*c]struct_FT_CharMapRec_;
pub const struct_FT_SubGlyphRec_ = opaque {};
pub const FT_SubGlyph = ?*struct_FT_SubGlyphRec_;
pub const struct_FT_Slot_InternalRec_ = opaque {};
pub const FT_Slot_Internal = ?*struct_FT_Slot_InternalRec_;
pub const struct_FT_GlyphSlotRec_ = extern struct {
    library: FT_Library,
    face: FT_Face,
    next: FT_GlyphSlot,
    glyph_index: FT_UInt,
    generic: FT_Generic,
    metrics: FT_Glyph_Metrics,
    linearHoriAdvance: FT_Fixed,
    linearVertAdvance: FT_Fixed,
    advance: FT_Vector,
    format: FT_Glyph_Format,
    bitmap: FT_Bitmap,
    bitmap_left: FT_Int,
    bitmap_top: FT_Int,
    outline: FT_Outline,
    num_subglyphs: FT_UInt,
    subglyphs: FT_SubGlyph,
    control_data: ?*c_void,
    control_len: c_long,
    lsb_delta: FT_Pos,
    rsb_delta: FT_Pos,
    other: ?*c_void,
    internal: FT_Slot_Internal,
};
pub const FT_GlyphSlot = [*c]struct_FT_GlyphSlotRec_;
pub const struct_FT_Size_Metrics_ = extern struct {
    x_ppem: FT_UShort,
    y_ppem: FT_UShort,
    x_scale: FT_Fixed,
    y_scale: FT_Fixed,
    ascender: FT_Pos,
    descender: FT_Pos,
    height: FT_Pos,
    max_advance: FT_Pos,
};
pub const FT_Size_Metrics = struct_FT_Size_Metrics_;
pub const struct_FT_Size_InternalRec_ = opaque {};
pub const FT_Size_Internal = ?*struct_FT_Size_InternalRec_;
pub const struct_FT_SizeRec_ = extern struct {
    face: FT_Face,
    generic: FT_Generic,
    metrics: FT_Size_Metrics,
    internal: FT_Size_Internal,
};
pub const FT_Size = [*c]struct_FT_SizeRec_;
pub const struct_FT_Face_InternalRec_ = opaque {};
pub const FT_Face_Internal = ?*struct_FT_Face_InternalRec_;
pub const struct_FT_FaceRec_ = extern struct {
    num_faces: FT_Long,
    face_index: FT_Long,
    face_flags: FT_Long,
    style_flags: FT_Long,
    num_glyphs: FT_Long,
    family_name: [*c]FT_String,
    style_name: [*c]FT_String,
    num_fixed_sizes: FT_Int,
    available_sizes: [*c]FT_Bitmap_Size,
    num_charmaps: FT_Int,
    charmaps: [*c]FT_CharMap,
    generic: FT_Generic,
    bbox: FT_BBox,
    units_per_EM: FT_UShort,
    ascender: FT_Short,
    descender: FT_Short,
    height: FT_Short,
    max_advance_width: FT_Short,
    max_advance_height: FT_Short,
    underline_position: FT_Short,
    underline_thickness: FT_Short,
    glyph: FT_GlyphSlot,
    size: FT_Size,
    charmap: FT_CharMap,
    driver: FT_Driver,
    memory: FT_Memory,
    stream: FT_Stream,
    sizes_list: FT_ListRec,
    autohint: FT_Generic,
    extensions: ?*c_void,
    internal: FT_Face_Internal,
};
pub const FT_CharMapRec = struct_FT_CharMapRec_;
pub const FT_FaceRec = struct_FT_FaceRec_;
pub const FT_SizeRec = struct_FT_SizeRec_;
pub const FT_GlyphSlotRec = struct_FT_GlyphSlotRec_;
pub extern fn FT_Init_FreeType(alibrary: [*c]FT_Library) FT_Error;
pub extern fn FT_Done_FreeType(library: FT_Library) FT_Error;
pub const struct_FT_Parameter_ = extern struct {
    tag: FT_ULong,
    data: FT_Pointer,
};
pub const FT_Parameter = struct_FT_Parameter_;
pub const struct_FT_Open_Args_ = extern struct {
    flags: FT_UInt,
    memory_base: [*c]const FT_Byte,
    memory_size: FT_Long,
    pathname: [*c]FT_String,
    stream: FT_Stream,
    driver: FT_Module,
    num_params: FT_Int,
    params: [*c]FT_Parameter,
};
pub const FT_Open_Args = struct_FT_Open_Args_;
pub extern fn FT_New_Face(library: FT_Library, filepathname: [*c]const u8, face_index: FT_Long, aface: [*c]FT_Face) FT_Error;
pub extern fn FT_New_Memory_Face(library: FT_Library, file_base: [*c]const FT_Byte, file_size: FT_Long, face_index: FT_Long, aface: [*c]FT_Face) FT_Error;
pub extern fn FT_Open_Face(library: FT_Library, args: [*c]const FT_Open_Args, face_index: FT_Long, aface: [*c]FT_Face) FT_Error;
pub extern fn FT_Attach_File(face: FT_Face, filepathname: [*c]const u8) FT_Error;
pub extern fn FT_Attach_Stream(face: FT_Face, parameters: [*c]FT_Open_Args) FT_Error;
pub extern fn FT_Reference_Face(face: FT_Face) FT_Error;
pub extern fn FT_Done_Face(face: FT_Face) FT_Error;
pub extern fn FT_Select_Size(face: FT_Face, strike_index: FT_Int) FT_Error;
pub const FT_SIZE_REQUEST_TYPE_NOMINAL: c_int = 0;
pub const FT_SIZE_REQUEST_TYPE_REAL_DIM: c_int = 1;
pub const FT_SIZE_REQUEST_TYPE_BBOX: c_int = 2;
pub const FT_SIZE_REQUEST_TYPE_CELL: c_int = 3;
pub const FT_SIZE_REQUEST_TYPE_SCALES: c_int = 4;
pub const FT_SIZE_REQUEST_TYPE_MAX: c_int = 5;
pub const enum_FT_Size_Request_Type_ = c_uint;
pub const FT_Size_Request_Type = enum_FT_Size_Request_Type_;
pub const struct_FT_Size_RequestRec_ = extern struct {
    type: FT_Size_Request_Type,
    width: FT_Long,
    height: FT_Long,
    horiResolution: FT_UInt,
    vertResolution: FT_UInt,
};
pub const FT_Size_RequestRec = struct_FT_Size_RequestRec_;
pub const FT_Size_Request = [*c]struct_FT_Size_RequestRec_;
pub extern fn FT_Request_Size(face: FT_Face, req: FT_Size_Request) FT_Error;
pub extern fn FT_Set_Char_Size(face: FT_Face, char_width: FT_F26Dot6, char_height: FT_F26Dot6, horz_resolution: FT_UInt, vert_resolution: FT_UInt) FT_Error;
pub extern fn FT_Set_Pixel_Sizes(face: FT_Face, pixel_width: FT_UInt, pixel_height: FT_UInt) FT_Error;
pub extern fn FT_Load_Glyph(face: FT_Face, glyph_index: FT_UInt, load_flags: FT_Int32) FT_Error;
pub extern fn FT_Load_Char(face: FT_Face, char_code: FT_ULong, load_flags: FT_Int32) FT_Error;
pub extern fn FT_Set_Transform(face: FT_Face, matrix: [*c]FT_Matrix, delta: [*c]FT_Vector) void;
pub extern fn FT_Get_Transform(face: FT_Face, matrix: [*c]FT_Matrix, delta: [*c]FT_Vector) void;
pub const FT_RENDER_MODE_NORMAL: c_int = 0;
pub const FT_RENDER_MODE_LIGHT: c_int = 1;
pub const FT_RENDER_MODE_MONO: c_int = 2;
pub const FT_RENDER_MODE_LCD: c_int = 3;
pub const FT_RENDER_MODE_LCD_V: c_int = 4;
pub const FT_RENDER_MODE_SDF: c_int = 5;
pub const FT_RENDER_MODE_MAX: c_int = 6;
pub const enum_FT_Render_Mode_ = c_uint;
pub const FT_Render_Mode = enum_FT_Render_Mode_;
pub extern fn FT_Render_Glyph(slot: FT_GlyphSlot, render_mode: FT_Render_Mode) FT_Error;
pub const FT_KERNING_DEFAULT: c_int = 0;
pub const FT_KERNING_UNFITTED: c_int = 1;
pub const FT_KERNING_UNSCALED: c_int = 2;
pub const enum_FT_Kerning_Mode_ = c_uint;
pub const FT_Kerning_Mode = enum_FT_Kerning_Mode_;
pub extern fn FT_Get_Kerning(face: FT_Face, left_glyph: FT_UInt, right_glyph: FT_UInt, kern_mode: FT_UInt, akerning: [*c]FT_Vector) FT_Error;
pub extern fn FT_Get_Track_Kerning(face: FT_Face, point_size: FT_Fixed, degree: FT_Int, akerning: [*c]FT_Fixed) FT_Error;
pub extern fn FT_Get_Glyph_Name(face: FT_Face, glyph_index: FT_UInt, buffer: FT_Pointer, buffer_max: FT_UInt) FT_Error;
pub extern fn FT_Get_Postscript_Name(face: FT_Face) [*c]const u8;
pub extern fn FT_Select_Charmap(face: FT_Face, encoding: FT_Encoding) FT_Error;
pub extern fn FT_Set_Charmap(face: FT_Face, charmap: FT_CharMap) FT_Error;
pub extern fn FT_Get_Charmap_Index(charmap: FT_CharMap) FT_Int;
pub extern fn FT_Get_Char_Index(face: FT_Face, charcode: FT_ULong) FT_UInt;
pub extern fn FT_Get_First_Char(face: FT_Face, agindex: [*c]FT_UInt) FT_ULong;
pub extern fn FT_Get_Next_Char(face: FT_Face, char_code: FT_ULong, agindex: [*c]FT_UInt) FT_ULong;
pub extern fn FT_Face_Properties(face: FT_Face, num_properties: FT_UInt, properties: [*c]FT_Parameter) FT_Error;
pub extern fn FT_Get_Name_Index(face: FT_Face, glyph_name: [*c]const FT_String) FT_UInt;
pub extern fn FT_Get_SubGlyph_Info(glyph: FT_GlyphSlot, sub_index: FT_UInt, p_index: [*c]FT_Int, p_flags: [*c]FT_UInt, p_arg1: [*c]FT_Int, p_arg2: [*c]FT_Int, p_transform: [*c]FT_Matrix) FT_Error;
pub extern fn FT_Get_FSType_Flags(face: FT_Face) FT_UShort;
pub extern fn FT_Face_GetCharVariantIndex(face: FT_Face, charcode: FT_ULong, variantSelector: FT_ULong) FT_UInt;
pub extern fn FT_Face_GetCharVariantIsDefault(face: FT_Face, charcode: FT_ULong, variantSelector: FT_ULong) FT_Int;
pub extern fn FT_Face_GetVariantSelectors(face: FT_Face) [*c]FT_UInt32;
pub extern fn FT_Face_GetVariantsOfChar(face: FT_Face, charcode: FT_ULong) [*c]FT_UInt32;
pub extern fn FT_Face_GetCharsOfVariant(face: FT_Face, variantSelector: FT_ULong) [*c]FT_UInt32;
pub extern fn FT_MulDiv(a: FT_Long, b: FT_Long, c: FT_Long) FT_Long;
pub extern fn FT_MulFix(a: FT_Long, b: FT_Long) FT_Long;
pub extern fn FT_DivFix(a: FT_Long, b: FT_Long) FT_Long;
pub extern fn FT_RoundFix(a: FT_Fixed) FT_Fixed;
pub extern fn FT_CeilFix(a: FT_Fixed) FT_Fixed;
pub extern fn FT_FloorFix(a: FT_Fixed) FT_Fixed;
pub extern fn FT_Vector_Transform(vector: [*c]FT_Vector, matrix: [*c]const FT_Matrix) void;
pub extern fn FT_Library_Version(library: FT_Library, amajor: [*c]FT_Int, aminor: [*c]FT_Int, apatch: [*c]FT_Int) void;
pub extern fn FT_Face_CheckTrueTypePatents(face: FT_Face) FT_Bool;
pub extern fn FT_Face_SetUnpatentedHinting(face: FT_Face, value: FT_Bool) FT_Bool;
pub const FT_CONFIG_CONFIG_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:117:9
pub const FT_CONFIG_STANDARD_LIBRARY_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:132:9
pub const FT_CONFIG_OPTIONS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:147:9
pub const FT_CONFIG_MODULES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:163:9
pub const FT_FREETYPE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:180:9
pub const FT_ERRORS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:195:9
pub const FT_MODULE_ERRORS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:208:9
pub const FT_SYSTEM_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:224:9
pub const FT_IMAGE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:240:9
pub const FT_TYPES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:255:9
pub const FT_LIST_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:270:9
pub const FT_OUTLINE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:283:9
pub const FT_SIZES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:296:9
pub const FT_MODULE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:309:9
pub const FT_RENDER_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:322:9
pub const FT_DRIVER_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:335:9
pub const FT_TYPE1_TABLES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:408:9
pub const FT_TRUETYPE_IDS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:423:9
pub const FT_TRUETYPE_TABLES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:436:9
pub const FT_TRUETYPE_TAGS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:450:9
pub const FT_BDF_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:463:9
pub const FT_CID_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:476:9
pub const FT_GZIP_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:489:9
pub const FT_LZW_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:502:9
pub const FT_BZIP2_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:515:9
pub const FT_WINFONTS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:528:9
pub const FT_GLYPH_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:541:9
pub const FT_BITMAP_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:554:9
pub const FT_BBOX_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:567:9
pub const FT_CACHE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:580:9
pub const FT_MAC_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:597:9
pub const FT_MULTIPLE_MASTERS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:610:9
pub const FT_SFNT_NAMES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:624:9
pub const FT_OPENTYPE_VALIDATE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:638:9
pub const FT_GX_VALIDATE_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:652:9
pub const FT_PFR_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:665:9
pub const FT_STROKER_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:677:9
pub const FT_SYNTHESIS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:689:9
pub const FT_FONT_FORMATS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:701:9
pub const FT_TRIGONOMETRY_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:717:9
pub const FT_LCD_FILTER_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:729:9
pub const FT_INCREMENTAL_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:741:9
pub const FT_GASP_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:753:9
pub const FT_ADVANCES_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:765:9
pub const FT_COLOR_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:777:9
pub const FT_ERROR_DEFINITIONS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:783:9
pub const FT_PARAMETER_TAGS_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:784:9
pub const FT_UNPATENTED_HINTING_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:787:9
pub const FT_TRUETYPE_UNPATENTED_H = @compileError("unable to translate C expr: unexpected token .AngleBracketLeft"); // /usr/local/include/freetype2/freetype/config/ftheader.h:788:9
pub const offsetof = @compileError("TODO implement function '__builtin_offsetof' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stddef.h:104:9
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:113:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token .Hash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:114:9
pub const __const = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:116:9
pub const __volatile = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:118:9
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:202:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token .Keyword_restrict"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:222:9
pub const __swift_unavailable = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:288:9
pub const __header_inline = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:322:10
pub const __unreachable_ok_push = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:348:10
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:379:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:399:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:403:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:407:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:411:9
pub const __alloc_size = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:429:9
pub const __DARWIN_ALIAS = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:612:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:613:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:614:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:615:9
pub const __DARWIN_INODE64 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:616:9
pub const __DARWIN_1050 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:618:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:619:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:620:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:621:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:622:9
pub const __DARWIN_EXTSN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:624:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:625:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_10_15 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:491:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1 = @compileError("unable to translate C expr: unexpected token .Eof"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/_symbol_aliasing.h:497:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:635:9
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:698:9
pub const __compiler_barrier = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:812:9
pub const __enum_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:836:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:838:9
pub const __options_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:840:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/sys/cdefs.h:842:9
pub const __offsetof = @compileError("TODO implement function '__builtin_offsetof' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_types.h:83:9
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2919:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2920:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2934:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2938:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2941:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2945:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2947:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2951:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2953:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2958:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2965:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2969:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2971:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2975:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2977:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2982:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2987:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2991:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2993:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2997:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:2999:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3003:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3005:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3009:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3011:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3015:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3017:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3021:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3023:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3035:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3039:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3041:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3044:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3046:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3050:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3052:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3057:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3061:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3062:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3064:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3068:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3070:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3074:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3076:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3081:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3086:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3088:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3092:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3094:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3098:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3100:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3110:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3112:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3116:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3118:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3122:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3124:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3128:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3130:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3134:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3136:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3140:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3142:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3146:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3148:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3152:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3154:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3165:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3169:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3171:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3176:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3181:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3183:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3187:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3189:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3193:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3195:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3200:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3207:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3211:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3213:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3217:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3219:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3224:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3228:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3229:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3231:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3235:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3237:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3241:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3243:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3247:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3249:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3253:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3255:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3259:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3261:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3265:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3267:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3271:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3272:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3273:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3278:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3282:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3284:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3289:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3293:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3296:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3300:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3302:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3306:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3313:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3317:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3320:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3324:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3326:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3337:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3341:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3350:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3354:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3356:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3360:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3362:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3374:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3378:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3379:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3380:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3382:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3383:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3386:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3390:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3392:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3397:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3401:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3402:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3404:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3410:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3414:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3416:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3421:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3425:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3426:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3428:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3432:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3434:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3438:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3440:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3445:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3449:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3451:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3455:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3457:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3461:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3463:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3467:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3469:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3473:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3475:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3479:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3480:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3481:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3483:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3484:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3486:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3490:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3492:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3497:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3501:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3502:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3504:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3508:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3510:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3514:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3516:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3521:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3525:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3526:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3528:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3532:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3534:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3538:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3540:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3545:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3549:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3550:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3552:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3556:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3558:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3562:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3564:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3568:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3570:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3574:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3575:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3576:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3581:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3585:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3587:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3592:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3596:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3597:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3599:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3603:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3605:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3609:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3611:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3616:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3620:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3621:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3623:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3627:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3629:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3633:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3635:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3640:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3644:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3645:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3647:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3651:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3653:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3657:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3659:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3663:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3664:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3665:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3666:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3667:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3668:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3670:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3674:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3676:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3681:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3685:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3686:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3688:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3692:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3694:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3698:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3700:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3705:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3709:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3710:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3712:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3716:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3718:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3722:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3724:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3729:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3733:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3734:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3736:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3740:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3742:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3746:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3747:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3748:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3750:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3751:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3753:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3757:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3759:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3764:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3768:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3769:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3771:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3775:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3777:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3781:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3783:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3788:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3792:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3793:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3795:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3799:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3801:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3805:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3807:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3812:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3816:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3817:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3818:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3820:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3824:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3825:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3826:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3827:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3829:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3833:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3834:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3835:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3837:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3841:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3843:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3848:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3852:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3853:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3855:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3859:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3861:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3865:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3867:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3872:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3876:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3877:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3879:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3883:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3885:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3889:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3891:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3896:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3900:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3902:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3906:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3908:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3912:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3914:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3918:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3920:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3924:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3926:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3930:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3932:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3936:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3938:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3942:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3944:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3955:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3959:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3960:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3961:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3966:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3970:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3972:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3976:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3977:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3979:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3983:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3985:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3989:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3991:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:3996:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4001:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4003:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4007:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4009:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4013:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4015:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4020:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4025:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4026:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4034:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4036:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4042:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4046:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4048:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4053:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4057:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4058:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4066:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4070:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4072:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4077:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4081:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4082:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4083:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4084:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4087:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4091:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4093:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4098:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4102:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4103:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4111:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4115:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4117:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4122:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4126:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4127:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4129:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4133:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4135:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4139:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4141:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4146:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4150:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4152:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4156:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4157:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4163:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4167:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4169:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4173:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4175:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4179:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4182:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4186:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4188:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4192:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4194:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4199:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4203:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4206:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4208:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4212:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4214:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4218:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4219:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4221:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4225:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4233:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4238:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4242:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4243:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4245:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4247:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4251:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4252:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4254:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4258:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4260:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4264:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4266:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4271:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4281:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4285:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4287:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4291:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4293:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4298:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4302:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4303:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4305:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4309:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4315:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4317:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4322:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4326:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4327:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4328:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4336:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4338:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4349:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4350:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4353:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4357:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4364:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4365:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4373:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4374:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4383:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4394:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4398:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4405:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4406:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4407:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4409:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4410:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4412:21
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4442:13
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4443:13
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4444:13
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4445:13
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4446:13
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4448:13
pub const __API_AVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4451:14
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4453:13
pub const __API_A = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4457:17
pub const __API_AVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4466:13
pub const __API_AVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4467:13
pub const __API_AVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4468:13
pub const __API_AVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4469:13
pub const __API_AVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4470:13
pub const __API_AVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4471:13
pub const __API_AVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4472:13
pub const __API_APPLY_TO = @compileError("unable to translate C expr: expected Identifier instead got: Comma"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4474:13
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token .Hash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4476:13
pub const __API_A_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4478:13
pub const __API_AVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4481:13
pub const __API_AVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4482:13
pub const __API_AVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4483:13
pub const __API_AVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4484:13
pub const __API_AVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4485:13
pub const __API_AVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4486:13
pub const __API_AVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4487:13
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4490:13
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4491:13
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4492:13
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4493:13
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4494:13
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4496:13
pub const __API_DEPRECATED_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4499:14
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4501:13
pub const __API_D = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4505:17
pub const __API_DEPRECATED_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4514:13
pub const __API_DEPRECATED_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4515:13
pub const __API_DEPRECATED_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4516:13
pub const __API_DEPRECATED_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4517:13
pub const __API_DEPRECATED_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4518:13
pub const __API_DEPRECATED_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4519:13
pub const __API_DEPRECATED_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4520:13
pub const __API_D_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4522:13
pub const __API_DEPRECATED_BEGIN_MSG3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4525:13
pub const __API_DEPRECATED_BEGIN_MSG4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4526:13
pub const __API_DEPRECATED_BEGIN_MSG5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4527:13
pub const __API_DEPRECATED_BEGIN_MSG6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4528:13
pub const __API_DEPRECATED_BEGIN_MSG7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4529:13
pub const __API_DEPRECATED_BEGIN_MSG8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4530:13
pub const __API_DEPRECATED_BEGIN_MSG_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4531:13
pub const __API_R = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4534:17
pub const __API_DEPRECATED_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4540:13
pub const __API_DEPRECATED_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4541:13
pub const __API_DEPRECATED_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4542:13
pub const __API_DEPRECATED_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4543:13
pub const __API_DEPRECATED_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4544:13
pub const __API_DEPRECATED_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4545:13
pub const __API_DEPRECATED_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4546:13
pub const __API_R_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4549:17
pub const __API_DEPRECATED_BEGIN_REP3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4555:13
pub const __API_DEPRECATED_BEGIN_REP4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4556:13
pub const __API_DEPRECATED_BEGIN_REP5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4557:13
pub const __API_DEPRECATED_BEGIN_REP6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4558:13
pub const __API_DEPRECATED_BEGIN_REP7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4559:13
pub const __API_DEPRECATED_BEGIN_REP8 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4560:13
pub const __API_DEPRECATED_BEGIN_REP_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4561:13
pub const __API_U = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4586:17
pub const __API_UNAVAILABLE2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4595:13
pub const __API_UNAVAILABLE3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4596:13
pub const __API_UNAVAILABLE4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4597:13
pub const __API_UNAVAILABLE5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4598:13
pub const __API_UNAVAILABLE6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4599:13
pub const __API_UNAVAILABLE7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4600:13
pub const __API_UNAVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4601:13
pub const __API_U_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4603:13
pub const __API_UNAVAILABLE_BEGIN2 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4606:13
pub const __API_UNAVAILABLE_BEGIN3 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4607:13
pub const __API_UNAVAILABLE_BEGIN4 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4608:13
pub const __API_UNAVAILABLE_BEGIN5 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4609:13
pub const __API_UNAVAILABLE_BEGIN6 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4610:13
pub const __API_UNAVAILABLE_BEGIN7 = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4611:13
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4612:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4661:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/AvailabilityInternal.h:4669:11
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:295:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:296:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:298:17
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:322:13
pub const __OS_EXTENSION_UNAVAILABLE = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:350:9
pub const __OSX_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:358:13
pub const __OSX_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:359:13
pub const __IOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:381:13
pub const __IOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:382:13
pub const __TVOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:408:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:409:13
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:435:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate C expr: unexpected token .Identifier"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:436:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:504:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:506:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:525:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:526:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:528:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:531:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:542:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:544:13
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:598:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/Availability.h:602:11
pub const __sgetc = @compileError("TODO unary inc/dec expr"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdio.h:258:9
pub const __sclearerr = @compileError("unable to translate C expr: expected ')' instead got: AmpersandEqual"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/stdio.h:282:9
pub const SIG_DFL = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/signal.h:131:9
pub const SIG_IGN = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/signal.h:132:9
pub const SIG_HOLD = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/signal.h:133:9
pub const SIG_ERR = @compileError("unable to translate C expr: expected ')'"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/signal.h:134:9
pub const __DARWIN_OS_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/libkern/i386/_OSByteOrder.h:34:17
pub const __DARWIN_OSSwapInt16 = @compileError("TODO implement function '__builtin_constant_p' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/libkern/_OSByteOrder.h:71:9
pub const __DARWIN_OSSwapInt32 = @compileError("TODO implement function '__builtin_constant_p' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/libkern/_OSByteOrder.h:74:9
pub const __DARWIN_OSSwapInt64 = @compileError("TODO implement function '__builtin_constant_p' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/x86_64-macos-gnu/libkern/_OSByteOrder.h:77:9
pub const NTOHL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:143:9
pub const NTOHS = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:144:9
pub const NTOHLL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:145:9
pub const HTONL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:146:9
pub const HTONS = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:147:9
pub const HTONLL = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/sys/_endian.h:148:9
pub const __alloca = @compileError("TODO implement function '__builtin_alloca' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/libc/include/any-macos-any/alloca.h:40:9
pub const ft_setjmp = @compileError("unable to translate C expr: unexpected token .RParen"); // /usr/local/include/freetype2/freetype/config/ftstdlib.h:163:9
pub const va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stdarg.h:17:9
pub const va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stdarg.h:18:9
pub const va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stdarg.h:19:9
pub const __va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stdarg.h:24:9
pub const va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // /usr/local/Cellar/zig/HEAD-eb010ce_1/lib/zig/include/stdarg.h:27:9
pub const FT_EXPORT = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /usr/local/include/freetype2/freetype/config/public-macros.h:104:9
pub const FT_UNUSED = @compileError("unable to translate C expr: expected ')' instead got: Equal"); // /usr/local/include/freetype2/freetype/config/public-macros.h:114:9
pub const FT_IMAGE_TAG = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/include/freetype2/freetype/ftimage.h:703:9
pub const FT_ERR_XCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/include/freetype2/freetype/fttypes.h:594:9
pub const FT_MODERRDEF = @compileError("unable to translate C expr: unexpected token .HashHash"); // /usr/local/include/freetype2/freetype/ftmoderr.h:123:9
pub const FT_MODERR_START_LIST = @compileError("unable to translate C expr: expected Identifier instead got: LBrace"); // /usr/local/include/freetype2/freetype/ftmoderr.h:126:9
pub const FT_MODERR_END_LIST = @compileError("unable to translate C expr: unexpected token .RBrace"); // /usr/local/include/freetype2/freetype/ftmoderr.h:127:9
pub const FT_ERRORDEF = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/include/freetype2/freetype/fterrors.h:173:9
pub const FT_ERROR_START_LIST = @compileError("unable to translate C expr: expected Identifier instead got: LBrace"); // /usr/local/include/freetype2/freetype/fterrors.h:174:9
pub const FT_ERROR_END_LIST = @compileError("unable to translate C expr: unexpected token .RBrace"); // /usr/local/include/freetype2/freetype/fterrors.h:175:9
pub const FT_ENC_TAG = @compileError("unable to translate C expr: unexpected token .Equal"); // /usr/local/include/freetype2/freetype/freetype.h:619:9
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 12);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 1);
pub const __clang_version__ = "12.0.1 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Homebrew Clang 12.0.1";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __block = __attribute__(__blocks__(byref));
pub const __BLOCKS__ = @as(c_int, 1);
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_TYPE__ = c_int;
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = LL;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = U;
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = ULL;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = @"_";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __nonnull = _Nonnull;
pub const __null_unspecified = _Null_unspecified;
pub const __nullable = _Nullable;
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = __attribute__(address_space(@as(c_int, 256)));
pub const __seg_fs = __attribute__(address_space(@as(c_int, 257)));
pub const __corei7 = @as(c_int, 1);
pub const __corei7__ = @as(c_int, 1);
pub const __tune_corei7__ = @as(c_int, 1);
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __RTM__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __SGX__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __APPLE_CC__ = @as(c_int, 6000);
pub const __APPLE__ = @as(c_int, 1);
pub const __STDC_NO_THREADS__ = @as(c_int, 1);
pub const __weak = __attribute__(objc_gc(weak));
pub const __DYNAMIC__ = @as(c_int, 1);
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101406, .decimal);
pub const __MACH__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const FT_AUTOHINTER_H = FT_DRIVER_H;
pub const FT_CFF_DRIVER_H = FT_DRIVER_H;
pub const FT_TRUETYPE_DRIVER_H = FT_DRIVER_H;
pub const FT_PCF_DRIVER_H = FT_DRIVER_H;
pub const FT_XFREE86_H = FT_FONT_FORMATS_H;
pub const FT_CACHE_IMAGE_H = FT_CACHE_H;
pub const FT_CACHE_SMALL_BITMAPS_H = FT_CACHE_H;
pub const FT_CACHE_CHARMAP_H = FT_CACHE_H;
pub const FT_CACHE_MANAGER_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_MRU_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_MANAGER_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_CACHE_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_GLYPH_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_IMAGE_H = FT_CACHE_H;
pub const FT_CACHE_INTERNAL_SBITS_H = FT_CACHE_H;
pub const FT_RENDER_POOL_SIZE = @as(c_long, 16384);
pub const FT_MAX_MODULES = @as(c_int, 32);
pub const TT_CONFIG_OPTION_SUBPIXEL_HINTING = @as(c_int, 2);
pub const TT_CONFIG_OPTION_MAX_RUNNABLE_OPCODES = @as(c_long, 1000000);
pub const T1_MAX_DICT_DEPTH = @as(c_int, 5);
pub const T1_MAX_SUBRS_CALLS = @as(c_int, 16);
pub const T1_MAX_CHARSTRINGS_OPERANDS = @as(c_int, 256);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_X1 = @as(c_int, 500);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_Y1 = @as(c_int, 400);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_X2 = @as(c_int, 1000);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_Y2 = @as(c_int, 275);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_X3 = @as(c_int, 1667);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_Y3 = @as(c_int, 275);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_X4 = @as(c_int, 2333);
pub const CFF_CONFIG_OPTION_DARKENING_PARAMETER_Y4 = @as(c_int, 0);
pub const NULL = @import("std").zig.c_translation.cast(?*c_void, @as(c_int, 0));
pub const ft_ptrdiff_t = ptrdiff_t;
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    return protos;
}
pub const __signed = c_int;
pub const __dead2 = __attribute__(__noreturn__);
pub const __pure2 = __attribute__(__const__);
pub const __unused = __attribute__(__unused__);
pub const __used = __attribute__(__used__);
pub const __cold = __attribute__(__cold__);
pub const __deprecated = __attribute__(__deprecated__);
pub inline fn __deprecated_msg(_msg: anytype) @TypeOf(__attribute__(__deprecated__(_msg))) {
    return __attribute__(__deprecated__(_msg));
}
pub inline fn __deprecated_enum_msg(_msg: anytype) @TypeOf(__deprecated_msg(_msg)) {
    return __deprecated_msg(_msg);
}
pub const __unavailable = __attribute__(__unavailable__);
pub const __disable_tail_calls = __attribute__(__disable_tail_calls__);
pub const __not_tail_called = __attribute__(__not_tail_called__);
pub const __result_use_check = __attribute__(__warn_unused_result__);
pub const __abortlike = __dead2 ++ __cold ++ __not_tail_called;
pub const __header_always_inline = __header_inline ++ __attribute__(__always_inline__);
pub const __unreachable_ok_pop = _Pragma("clang diagnostic pop");
pub inline fn __printflike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__printf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf__, fmtarg, firstvararg));
}
pub inline fn __printf0like(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__printf0__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf0__, fmtarg, firstvararg));
}
pub inline fn __scanflike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__scanf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__scanf__, fmtarg, firstvararg));
}
pub inline fn __COPYRIGHT(s: anytype) @TypeOf(__IDSTRING(copyright, s)) {
    return __IDSTRING(copyright, s);
}
pub inline fn __RCSID(s: anytype) @TypeOf(__IDSTRING(rcsid, s)) {
    return __IDSTRING(rcsid, s);
}
pub inline fn __SCCSID(s: anytype) @TypeOf(__IDSTRING(sccsid, s)) {
    return __IDSTRING(sccsid, s);
}
pub inline fn __PROJECT_VERSION(s: anytype) @TypeOf(__IDSTRING(project_version, s)) {
    return __IDSTRING(project_version, s);
}
pub const __DARWIN_ONLY_64_BIT_INO_T = @as(c_int, 0);
pub const __DARWIN_ONLY_VERS_1050 = @as(c_int, 0);
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const __DARWIN_UNIX03 = @as(c_int, 1);
pub const __DARWIN_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_NON_CANCELABLE = @as(c_int, 0);
pub const __DARWIN_SUF_64_BIT_INO_T = "$INODE64";
pub const __DARWIN_SUF_1050 = "$1050";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) @TypeOf(x) {
    return x;
}
pub const __DARWIN_C_ANSI = @as(c_long, 0o10000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = @as(c_int, 1);
pub const __DARWIN_NO_LONG_LONG = @as(c_int, 0);
pub const _DARWIN_FEATURE_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = @as(c_int, 3);
pub inline fn __CAST_AWAY_QUALIFIER(variable: anytype, qualifier: anytype, type_1: anytype) @TypeOf(type_1(c_long)(variable)) {
    _ = qualifier;
    return type_1(c_long)(variable);
}
pub const __XNU_PRIVATE_EXTERN = __attribute__(visibility("hidden"));
pub const __enum_open = __attribute__(__enum_extensibility__(open));
pub const __enum_closed = __attribute__(__enum_extensibility__(closed));
pub const __enum_options = __attribute__(__flag_enum__);
pub const __DARWIN_CLK_TCK = @as(c_int, 100);
pub const CHAR_BIT = @as(c_int, 8);
pub const MB_LEN_MAX = @as(c_int, 6);
pub const CLK_TCK = __DARWIN_CLK_TCK;
pub const SCHAR_MAX = @as(c_int, 127);
pub const SCHAR_MIN = -@as(c_int, 128);
pub const UCHAR_MAX = @as(c_int, 255);
pub const CHAR_MAX = @as(c_int, 127);
pub const CHAR_MIN = -@as(c_int, 128);
pub const USHRT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const SHRT_MAX = @as(c_int, 32767);
pub const SHRT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const UINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hexadecimal);
pub const INT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const ULONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 0xffffffffffffffff, .hexadecimal);
pub const LONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hexadecimal);
pub const LONG_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hexadecimal) - @as(c_int, 1);
pub const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const LLONG_MAX = @as(c_longlong, 0x7fffffffffffffff);
pub const LLONG_MIN = -@as(c_longlong, 0x7fffffffffffffff) - @as(c_int, 1);
pub const LONG_BIT = @as(c_int, 64);
pub const SSIZE_MAX = LONG_MAX;
pub const WORD_BIT = @as(c_int, 32);
pub const SIZE_T_MAX = ULONG_MAX;
pub const UQUAD_MAX = ULLONG_MAX;
pub const QUAD_MAX = LLONG_MAX;
pub const QUAD_MIN = LLONG_MIN;
pub const ARG_MAX = @as(c_int, 256) * @as(c_int, 1024);
pub const CHILD_MAX = @as(c_int, 266);
pub const GID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const LINK_MAX = @as(c_int, 32767);
pub const MAX_CANON = @as(c_int, 1024);
pub const MAX_INPUT = @as(c_int, 1024);
pub const NAME_MAX = @as(c_int, 255);
pub const NGROUPS_MAX = @as(c_int, 16);
pub const UID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const OPEN_MAX = @as(c_int, 10240);
pub const PATH_MAX = @as(c_int, 1024);
pub const PIPE_BUF = @as(c_int, 512);
pub const BC_BASE_MAX = @as(c_int, 99);
pub const BC_DIM_MAX = @as(c_int, 2048);
pub const BC_SCALE_MAX = @as(c_int, 99);
pub const BC_STRING_MAX = @as(c_int, 1000);
pub const CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const EQUIV_CLASS_MAX = @as(c_int, 2);
pub const EXPR_NEST_MAX = @as(c_int, 32);
pub const LINE_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 255);
pub const NZERO = @as(c_int, 20);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_EQUIV_CLASS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_CLOCKRES_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20000000, .decimal);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_KEYS_MAX = @as(c_int, 512);
pub const PTHREAD_STACK_MIN = @as(c_int, 8192);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_SS_REPL_MAX = @as(c_int, 4);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_EVENT_NAME_MAX = @as(c_int, 30);
pub const _POSIX_TRACE_NAME_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_SYS_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_USER_EVENT_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX_RE_DUP_MAX = _POSIX2_RE_DUP_MAX;
pub const OFF_MIN = LLONG_MIN;
pub const OFF_MAX = LLONG_MAX;
pub const PASS_MAX = @as(c_int, 128);
pub const NL_ARGMAX = @as(c_int, 9);
pub const NL_LANGMAX = @as(c_int, 14);
pub const NL_MSGMAX = @as(c_int, 32767);
pub const NL_NMAX = @as(c_int, 1);
pub const NL_SETMAX = @as(c_int, 255);
pub const NL_TEXTMAX = @as(c_int, 2048);
pub const _XOPEN_IOV_MAX = @as(c_int, 16);
pub const IOV_MAX = @as(c_int, 1024);
pub const _XOPEN_NAME_MAX = @as(c_int, 255);
pub const _XOPEN_PATH_MAX = @as(c_int, 1024);
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const FT_CHAR_BIT = CHAR_BIT;
pub const FT_USHORT_MAX = USHRT_MAX;
pub const FT_INT_MAX = INT_MAX;
pub const FT_INT_MIN = INT_MIN;
pub const FT_UINT_MAX = UINT_MAX;
pub const FT_LONG_MIN = LONG_MIN;
pub const FT_LONG_MAX = LONG_MAX;
pub const FT_ULONG_MAX = ULONG_MAX;
pub const __DARWIN_NULL = @import("std").zig.c_translation.cast(?*c_void, @as(c_int, 0));
pub const __PTHREAD_SIZE__ = @as(c_int, 8176);
pub const __PTHREAD_ATTR_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_MUTEXATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_MUTEX_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_CONDATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_COND_SIZE__ = @as(c_int, 40);
pub const __PTHREAD_ONCE_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_RWLOCK_SIZE__ = @as(c_int, 192);
pub const __PTHREAD_RWLOCKATTR_SIZE__ = @as(c_int, 16);
pub inline fn __strfmonlike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__strfmon__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__strfmon__, fmtarg, firstvararg));
}
pub inline fn __strftimelike(fmtarg: anytype) @TypeOf(__attribute__(__format__(__strftime__, fmtarg, @as(c_int, 0)))) {
    return __attribute__(__format__(__strftime__, fmtarg, @as(c_int, 0)));
}
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal) - @as(c_int, 1);
pub const __DARWIN_WEOF = @import("std").zig.c_translation.cast(__darwin_wint_t, -@as(c_int, 1));
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const __API_TO_BE_DEPRECATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __MAC_10_0 = @as(c_int, 1000);
pub const __MAC_10_1 = @as(c_int, 1010);
pub const __MAC_10_2 = @as(c_int, 1020);
pub const __MAC_10_3 = @as(c_int, 1030);
pub const __MAC_10_4 = @as(c_int, 1040);
pub const __MAC_10_5 = @as(c_int, 1050);
pub const __MAC_10_6 = @as(c_int, 1060);
pub const __MAC_10_7 = @as(c_int, 1070);
pub const __MAC_10_8 = @as(c_int, 1080);
pub const __MAC_10_9 = @as(c_int, 1090);
pub const __MAC_10_10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101000, .decimal);
pub const __MAC_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101002, .decimal);
pub const __MAC_10_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101003, .decimal);
pub const __MAC_10_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101100, .decimal);
pub const __MAC_10_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101102, .decimal);
pub const __MAC_10_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101103, .decimal);
pub const __MAC_10_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101104, .decimal);
pub const __MAC_10_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101200, .decimal);
pub const __MAC_10_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101201, .decimal);
pub const __MAC_10_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101202, .decimal);
pub const __MAC_10_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101204, .decimal);
pub const __MAC_10_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101300, .decimal);
pub const __MAC_10_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101301, .decimal);
pub const __MAC_10_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101302, .decimal);
pub const __MAC_10_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101304, .decimal);
pub const __MAC_10_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101400, .decimal);
pub const __MAC_10_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101401, .decimal);
pub const __MAC_10_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101404, .decimal);
pub const __MAC_10_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101500, .decimal);
pub const __MAC_10_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101501, .decimal);
pub const __MAC_10_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101504, .decimal);
pub const __IPHONE_2_0 = @as(c_int, 20000);
pub const __IPHONE_2_1 = @as(c_int, 20100);
pub const __IPHONE_2_2 = @as(c_int, 20200);
pub const __IPHONE_3_0 = @as(c_int, 30000);
pub const __IPHONE_3_1 = @as(c_int, 30100);
pub const __IPHONE_3_2 = @as(c_int, 30200);
pub const __IPHONE_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __IPHONE_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __IPHONE_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __IPHONE_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __IPHONE_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __IPHONE_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __IPHONE_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __IPHONE_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __IPHONE_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __IPHONE_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __IPHONE_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const __IPHONE_8_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80100, .decimal);
pub const __IPHONE_8_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80200, .decimal);
pub const __IPHONE_8_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80300, .decimal);
pub const __IPHONE_8_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80400, .decimal);
pub const __IPHONE_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __IPHONE_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __IPHONE_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __IPHONE_9_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90300, .decimal);
pub const __IPHONE_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __IPHONE_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __IPHONE_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __IPHONE_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100300, .decimal);
pub const __IPHONE_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __IPHONE_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __IPHONE_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __IPHONE_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __IPHONE_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __IPHONE_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __IPHONE_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __IPHONE_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __IPHONE_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __IPHONE_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __IPHONE_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130100, .decimal);
pub const __IPHONE_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __IPHONE_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __IPHONE_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __IPHONE_13_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130500, .decimal);
pub const __IPHONE_13_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130600, .decimal);
pub const __TVOS_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __TVOS_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __TVOS_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __TVOS_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __TVOS_10_0_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100001, .decimal);
pub const __TVOS_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __TVOS_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __TVOS_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __TVOS_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __TVOS_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __TVOS_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __TVOS_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __TVOS_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __TVOS_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __TVOS_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __TVOS_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __TVOS_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __TVOS_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __TVOS_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __TVOS_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __WATCHOS_1_0 = @as(c_int, 10000);
pub const __WATCHOS_2_0 = @as(c_int, 20000);
pub const __WATCHOS_2_1 = @as(c_int, 20100);
pub const __WATCHOS_2_2 = @as(c_int, 20200);
pub const __WATCHOS_3_0 = @as(c_int, 30000);
pub const __WATCHOS_3_1 = @as(c_int, 30100);
pub const __WATCHOS_3_1_1 = @as(c_int, 30101);
pub const __WATCHOS_3_2 = @as(c_int, 30200);
pub const __WATCHOS_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __WATCHOS_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __WATCHOS_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __WATCHOS_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __WATCHOS_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __WATCHOS_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __WATCHOS_5_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50200, .decimal);
pub const __WATCHOS_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __WATCHOS_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __WATCHOS_6_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60200, .decimal);
pub const __DRIVERKIT_19_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 190000, .decimal);
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_10_15;
pub const __AVAILABILITY_INTERNAL_DEPRECATED = __attribute__(deprecated);
pub inline fn __AVAILABILITY_INTERNAL_DEPRECATED_MSG(_msg: anytype) @TypeOf(__attribute__(deprecated(_msg))) {
    return __attribute__(deprecated(_msg));
}
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = __attribute__(unavailable);
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = __attribute__(weak_import);
pub const __ENABLE_LEGACY_MAC_AVAILABILITY = @as(c_int, 1);
pub const __AVAILABILITY_INTERNAL__MAC_NA = __attribute__(availability(macosx, unavailable));
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = __attribute__(availability(macosx, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG(_msg: anytype) @TypeOf(__attribute__(availability(macosx, unavailable))) {
    _ = _msg;
    return __attribute__(availability(macosx, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG(_msg: anytype) @TypeOf(__attribute__(availability(ios, unavailable))) {
    _ = _msg;
    return __attribute__(availability(ios, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG(_msg: anytype) @TypeOf(__attribute__(availability(ios, unavailable))) {
    _ = _msg;
    return __attribute__(availability(ios, unavailable));
}
pub inline fn __API_AVAILABLE1(x: anytype) @TypeOf(__API_A(x)) {
    return __API_A(x);
}
pub inline fn __API_RANGE_STRINGIFY(x: anytype) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    return __API_RANGE_STRINGIFY2(x);
}
pub inline fn __API_AVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_A_BEGIN(a)) {
    return __API_A_BEGIN(a);
}
pub inline fn __API_DEPRECATED_MSG2(msg: anytype, x: anytype) @TypeOf(__API_D(msg, x)) {
    return __API_D(msg, x);
}
pub inline fn __API_DEPRECATED_BEGIN_MSG2(msg: anytype, a: anytype) @TypeOf(__API_D_BEGIN(msg, a)) {
    return __API_D_BEGIN(msg, a);
}
pub inline fn __API_DEPRECATED_REP2(rep: anytype, x: anytype) @TypeOf(__API_R(rep, x)) {
    return __API_R(rep, x);
}
pub inline fn __API_DEPRECATED_BEGIN_REP2(rep: anytype, a: anytype) @TypeOf(__API_R_BEGIN(rep, a)) {
    return __API_R_BEGIN(rep, a);
}
pub const __API_UNAVAILABLE_PLATFORM_macos = blk: {
    _ = macos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macosx = blk: {
    _ = macosx;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_ios = blk: {
    _ = ios;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_watchos = blk: {
    _ = watchos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_tvos = blk: {
    _ = tvos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = blk: {
    _ = macCatalyst;
    break :blk unavailable;
};
pub inline fn __API_UNAVAILABLE_PLATFORM_uikitformac(x: anytype) @TypeOf(unavailable) {
    _ = x;
    return blk: {
        _ = uikitformac;
        break :blk unavailable;
    };
}
pub const __API_UNAVAILABLE_PLATFORM_driverkit = blk: {
    _ = driverkit;
    break :blk unavailable;
};
pub inline fn __API_UNAVAILABLE1(x: anytype) @TypeOf(__API_U(x)) {
    return __API_U(x);
}
pub inline fn __API_UNAVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_U_BEGIN(a)) {
    return __API_U_BEGIN(a);
}
pub inline fn __OS_AVAILABILITY(_target: anytype, _availability: anytype) @TypeOf(__attribute__(availability(_target, _availability))) {
    return __attribute__(availability(_target, _availability));
}
pub inline fn __OSX_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg);
}
pub inline fn __IOS_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg);
}
pub const __OSX_UNAVAILABLE = __OS_AVAILABILITY(macosx, unavailable);
pub const __IOS_UNAVAILABLE = __OS_AVAILABILITY(ios, unavailable);
pub const __IOS_PROHIBITED = __OS_AVAILABILITY(ios, unavailable);
pub const __TVOS_UNAVAILABLE = __OS_AVAILABILITY(tvos, unavailable);
pub const __TVOS_PROHIBITED = __OS_AVAILABILITY(tvos, unavailable);
pub const __WATCHOS_UNAVAILABLE = __OS_AVAILABILITY(watchos, unavailable);
pub const __WATCHOS_PROHIBITED = __OS_AVAILABILITY(watchos, unavailable);
pub const __SWIFT_UNAVAILABLE = __OS_AVAILABILITY(swift, unavailable);
pub inline fn __SWIFT_UNAVAILABLE_MSG(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(swift, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(swift, unavailable, _msg);
}
pub const __API_AVAILABLE_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = _Pragma("clang attribute pop");
pub const __API_UNAVAILABLE_END = _Pragma("clang attribute pop");
pub const USER_ADDR_NULL = @import("std").zig.c_translation.cast(user_addr_t, @as(c_int, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) user_addr_t {
    return @import("std").zig.c_translation.cast(user_addr_t, @import("std").zig.c_translation.cast(usize, a_ptr));
}
pub const _USE_FORTIFY_LEVEL = @as(c_int, 2);
pub inline fn __darwin_obsz0(object: anytype) @TypeOf(__builtin_object_size(object, @as(c_int, 0))) {
    return __builtin_object_size(object, @as(c_int, 0));
}
pub inline fn __darwin_obsz(object: anytype) @TypeOf(__builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0))) {
    return __builtin_object_size(object, if (_USE_FORTIFY_LEVEL > @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0));
}
pub const __HAS_FIXED_CHK_PROTOTYPES = @as(c_int, 1);
pub const ft_memchr = memchr;
pub const ft_memcmp = memcmp;
pub const ft_memcpy = memcpy;
pub const ft_memmove = memmove;
pub const ft_memset = memset;
pub const ft_strcat = strcat;
pub const ft_strcmp = strcmp;
pub const ft_strcpy = strcpy;
pub const ft_strlen = strlen;
pub const ft_strncmp = strncmp;
pub const ft_strncpy = strncpy;
pub const ft_strrchr = strrchr;
pub const ft_strstr = strstr;
pub const RENAME_SECLUDE = @as(c_int, 0x00000001);
pub const RENAME_SWAP = @as(c_int, 0x00000002);
pub const RENAME_EXCL = @as(c_int, 0x00000004);
pub const __SLBF = @as(c_int, 0x0001);
pub const __SNBF = @as(c_int, 0x0002);
pub const __SRD = @as(c_int, 0x0004);
pub const __SWR = @as(c_int, 0x0008);
pub const __SRW = @as(c_int, 0x0010);
pub const __SEOF = @as(c_int, 0x0020);
pub const __SERR = @as(c_int, 0x0040);
pub const __SMBF = @as(c_int, 0x0080);
pub const __SAPP = @as(c_int, 0x0100);
pub const __SSTR = @as(c_int, 0x0200);
pub const __SOPT = @as(c_int, 0x0400);
pub const __SNPT = @as(c_int, 0x0800);
pub const __SOFF = @as(c_int, 0x1000);
pub const __SMOD = @as(c_int, 0x2000);
pub const __SALC = @as(c_int, 0x4000);
pub const __SIGN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hexadecimal);
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 1024);
pub const EOF = -@as(c_int, 1);
pub const FOPEN_MAX = @as(c_int, 20);
pub const FILENAME_MAX = @as(c_int, 1024);
pub const P_tmpdir = "/var/tmp/";
pub const L_tmpnam = @as(c_int, 1024);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 308915776, .decimal);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const stdin = __stdinp;
pub const stdout = __stdoutp;
pub const stderr = __stderrp;
pub const L_ctermid = @as(c_int, 1024);
pub inline fn __swift_unavailable_on(osx_msg: anytype, ios_msg: anytype) @TypeOf(__swift_unavailable(osx_msg)) {
    _ = ios_msg;
    return __swift_unavailable(osx_msg);
}
pub inline fn __sfeof(p: anytype) @TypeOf((p.*._flags & __SEOF) != @as(c_int, 0)) {
    return (p.*._flags & __SEOF) != @as(c_int, 0);
}
pub inline fn __sferror(p: anytype) @TypeOf((p.*._flags & __SERR) != @as(c_int, 0)) {
    return (p.*._flags & __SERR) != @as(c_int, 0);
}
pub inline fn __sfileno(p: anytype) @TypeOf(p.*._file) {
    return p.*._file;
}
pub inline fn fropen(cookie: anytype, @"fn": anytype) @TypeOf(funopen(cookie, @"fn", @as(c_int, 0), @as(c_int, 0), @as(c_int, 0))) {
    return funopen(cookie, @"fn", @as(c_int, 0), @as(c_int, 0), @as(c_int, 0));
}
pub inline fn fwopen(cookie: anytype, @"fn": anytype) @TypeOf(funopen(cookie, @as(c_int, 0), @"fn", @as(c_int, 0), @as(c_int, 0))) {
    return funopen(cookie, @as(c_int, 0), @"fn", @as(c_int, 0), @as(c_int, 0));
}
pub inline fn feof_unlocked(p: anytype) @TypeOf(__sfeof(p)) {
    return __sfeof(p);
}
pub inline fn ferror_unlocked(p: anytype) @TypeOf(__sferror(p)) {
    return __sferror(p);
}
pub inline fn clearerr_unlocked(p: anytype) @TypeOf(__sclearerr(p)) {
    return __sclearerr(p);
}
pub inline fn fileno_unlocked(p: anytype) @TypeOf(__sfileno(p)) {
    return __sfileno(p);
}
pub const FT_FILE = FILE;
pub const ft_fclose = fclose;
pub const ft_fopen = fopen;
pub const ft_fread = fread;
pub const ft_fseek = fseek;
pub const ft_ftell = ftell;
pub const ft_sprintf = sprintf;
pub const __DARWIN_NSIG = @as(c_int, 32);
pub const NSIG = __DARWIN_NSIG;
pub const _I386_SIGNAL_H_ = @as(c_int, 1);
pub const SIGHUP = @as(c_int, 1);
pub const SIGINT = @as(c_int, 2);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGILL = @as(c_int, 4);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGABRT = @as(c_int, 6);
pub const SIGIOT = SIGABRT;
pub const SIGEMT = @as(c_int, 7);
pub const SIGFPE = @as(c_int, 8);
pub const SIGKILL = @as(c_int, 9);
pub const SIGBUS = @as(c_int, 10);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGSYS = @as(c_int, 12);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGTERM = @as(c_int, 15);
pub const SIGURG = @as(c_int, 16);
pub const SIGSTOP = @as(c_int, 17);
pub const SIGTSTP = @as(c_int, 18);
pub const SIGCONT = @as(c_int, 19);
pub const SIGCHLD = @as(c_int, 20);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGIO = @as(c_int, 23);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGWINCH = @as(c_int, 28);
pub const SIGINFO = @as(c_int, 29);
pub const SIGUSR1 = @as(c_int, 30);
pub const SIGUSR2 = @as(c_int, 31);
pub const _STRUCT_X86_THREAD_STATE32 = struct___darwin_i386_thread_state;
pub const _STRUCT_FP_CONTROL = struct___darwin_fp_control;
pub const FP_PREC_24B = @as(c_int, 0);
pub const FP_PREC_53B = @as(c_int, 2);
pub const FP_PREC_64B = @as(c_int, 3);
pub const FP_RND_NEAR = @as(c_int, 0);
pub const FP_RND_DOWN = @as(c_int, 1);
pub const FP_RND_UP = @as(c_int, 2);
pub const FP_CHOP = @as(c_int, 3);
pub const _STRUCT_FP_STATUS = struct___darwin_fp_status;
pub const _STRUCT_MMST_REG = struct___darwin_mmst_reg;
pub const _STRUCT_XMM_REG = struct___darwin_xmm_reg;
pub const _STRUCT_YMM_REG = struct___darwin_ymm_reg;
pub const _STRUCT_ZMM_REG = struct___darwin_zmm_reg;
pub const _STRUCT_OPMASK_REG = struct___darwin_opmask_reg;
pub const FP_STATE_BYTES = @as(c_int, 512);
pub const _STRUCT_X86_FLOAT_STATE32 = struct___darwin_i386_float_state;
pub const _STRUCT_X86_AVX_STATE32 = struct___darwin_i386_avx_state;
pub const _STRUCT_X86_AVX512_STATE32 = struct___darwin_i386_avx512_state;
pub const _STRUCT_X86_EXCEPTION_STATE32 = struct___darwin_i386_exception_state;
pub const _STRUCT_X86_DEBUG_STATE32 = struct___darwin_x86_debug_state32;
pub const _STRUCT_X86_PAGEIN_STATE = struct___x86_pagein_state;
pub const _STRUCT_X86_THREAD_STATE64 = struct___darwin_x86_thread_state64;
pub const _STRUCT_X86_THREAD_FULL_STATE64 = struct___darwin_x86_thread_full_state64;
pub const _STRUCT_X86_FLOAT_STATE64 = struct___darwin_x86_float_state64;
pub const _STRUCT_X86_AVX_STATE64 = struct___darwin_x86_avx_state64;
pub const _STRUCT_X86_AVX512_STATE64 = struct___darwin_x86_avx512_state64;
pub const _STRUCT_X86_EXCEPTION_STATE64 = struct___darwin_x86_exception_state64;
pub const _STRUCT_X86_DEBUG_STATE64 = struct___darwin_x86_debug_state64;
pub const _STRUCT_X86_CPMU_STATE64 = struct___darwin_x86_cpmu_state64;
pub const _STRUCT_MCONTEXT32 = struct___darwin_mcontext32;
pub const _STRUCT_MCONTEXT_AVX32 = struct___darwin_mcontext_avx32;
pub const _STRUCT_MCONTEXT_AVX512_32 = struct___darwin_mcontext_avx512_32;
pub const _STRUCT_MCONTEXT64 = struct___darwin_mcontext64;
pub const _STRUCT_MCONTEXT64_FULL = struct___darwin_mcontext64_full;
pub const _STRUCT_MCONTEXT_AVX64 = struct___darwin_mcontext_avx64;
pub const _STRUCT_MCONTEXT_AVX64_FULL = struct___darwin_mcontext_avx64_full;
pub const _STRUCT_MCONTEXT_AVX512_64 = struct___darwin_mcontext_avx512_64;
pub const _STRUCT_MCONTEXT_AVX512_64_FULL = struct___darwin_mcontext_avx512_64_full;
pub const _STRUCT_MCONTEXT = _STRUCT_MCONTEXT64;
pub const _STRUCT_SIGALTSTACK = struct___darwin_sigaltstack;
pub const _STRUCT_UCONTEXT = struct___darwin_ucontext;
pub const SIGEV_NONE = @as(c_int, 0);
pub const SIGEV_SIGNAL = @as(c_int, 1);
pub const SIGEV_THREAD = @as(c_int, 3);
pub const ILL_NOOP = @as(c_int, 0);
pub const ILL_ILLOPC = @as(c_int, 1);
pub const ILL_ILLTRP = @as(c_int, 2);
pub const ILL_PRVOPC = @as(c_int, 3);
pub const ILL_ILLOPN = @as(c_int, 4);
pub const ILL_ILLADR = @as(c_int, 5);
pub const ILL_PRVREG = @as(c_int, 6);
pub const ILL_COPROC = @as(c_int, 7);
pub const ILL_BADSTK = @as(c_int, 8);
pub const FPE_NOOP = @as(c_int, 0);
pub const FPE_FLTDIV = @as(c_int, 1);
pub const FPE_FLTOVF = @as(c_int, 2);
pub const FPE_FLTUND = @as(c_int, 3);
pub const FPE_FLTRES = @as(c_int, 4);
pub const FPE_FLTINV = @as(c_int, 5);
pub const FPE_FLTSUB = @as(c_int, 6);
pub const FPE_INTDIV = @as(c_int, 7);
pub const FPE_INTOVF = @as(c_int, 8);
pub const SEGV_NOOP = @as(c_int, 0);
pub const SEGV_MAPERR = @as(c_int, 1);
pub const SEGV_ACCERR = @as(c_int, 2);
pub const BUS_NOOP = @as(c_int, 0);
pub const BUS_ADRALN = @as(c_int, 1);
pub const BUS_ADRERR = @as(c_int, 2);
pub const BUS_OBJERR = @as(c_int, 3);
pub const TRAP_BRKPT = @as(c_int, 1);
pub const TRAP_TRACE = @as(c_int, 2);
pub const CLD_NOOP = @as(c_int, 0);
pub const CLD_EXITED = @as(c_int, 1);
pub const CLD_KILLED = @as(c_int, 2);
pub const CLD_DUMPED = @as(c_int, 3);
pub const CLD_TRAPPED = @as(c_int, 4);
pub const CLD_STOPPED = @as(c_int, 5);
pub const CLD_CONTINUED = @as(c_int, 6);
pub const POLL_IN = @as(c_int, 1);
pub const POLL_OUT = @as(c_int, 2);
pub const POLL_MSG = @as(c_int, 3);
pub const POLL_ERR = @as(c_int, 4);
pub const POLL_PRI = @as(c_int, 5);
pub const POLL_HUP = @as(c_int, 6);
pub const sa_handler = __sigaction_u.__sa_handler;
pub const sa_sigaction = __sigaction_u.__sa_sigaction;
pub const SA_ONSTACK = @as(c_int, 0x0001);
pub const SA_RESTART = @as(c_int, 0x0002);
pub const SA_RESETHAND = @as(c_int, 0x0004);
pub const SA_NOCLDSTOP = @as(c_int, 0x0008);
pub const SA_NODEFER = @as(c_int, 0x0010);
pub const SA_NOCLDWAIT = @as(c_int, 0x0020);
pub const SA_SIGINFO = @as(c_int, 0x0040);
pub const SA_USERTRAMP = @as(c_int, 0x0100);
pub const SA_64REGSET = @as(c_int, 0x0200);
pub const SA_USERSPACE_MASK = (((((SA_ONSTACK | SA_RESTART) | SA_RESETHAND) | SA_NOCLDSTOP) | SA_NODEFER) | SA_NOCLDWAIT) | SA_SIGINFO;
pub const SIG_BLOCK = @as(c_int, 1);
pub const SIG_UNBLOCK = @as(c_int, 2);
pub const SIG_SETMASK = @as(c_int, 3);
pub const SI_USER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10001, .hexadecimal);
pub const SI_QUEUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10002, .hexadecimal);
pub const SI_TIMER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10003, .hexadecimal);
pub const SI_ASYNCIO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004, .hexadecimal);
pub const SI_MESGQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10005, .hexadecimal);
pub const SS_ONSTACK = @as(c_int, 0x0001);
pub const SS_DISABLE = @as(c_int, 0x0004);
pub const MINSIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const SV_ONSTACK = SA_ONSTACK;
pub const SV_INTERRUPT = SA_RESTART;
pub const SV_RESETHAND = SA_RESETHAND;
pub const SV_NODEFER = SA_NODEFER;
pub const SV_NOCLDSTOP = SA_NOCLDSTOP;
pub const SV_SIGINFO = SA_SIGINFO;
pub const sv_onstack = sv_flags;
pub inline fn sigmask(m: anytype) @TypeOf(@as(c_int, 1) << (m - @as(c_int, 1))) {
    return @as(c_int, 1) << (m - @as(c_int, 1));
}
pub const BADSIG = SIG_ERR;
pub const __WORDSIZE = @as(c_int, 64);
pub inline fn INT8_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn INT16_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn INT32_C(v: anytype) @TypeOf(v) {
    return v;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub inline fn UINT8_C(v: anytype) @TypeOf(v) {
    return v;
}
pub inline fn UINT16_C(v: anytype) @TypeOf(v) {
    return v;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -INT32_MAX - @as(c_int, 1);
pub const INT64_MIN = -INT64_MAX - @as(c_int, 1);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = @as(c_ulonglong, 18446744073709551615);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INTPTR_MIN = -INTPTR_MAX - @as(c_int, 1);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MAX = INTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = UINTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTMAX_MIN = -INTMAX_MAX - @as(c_int, 1);
pub const PTRDIFF_MIN = INTMAX_MIN;
pub const PTRDIFF_MAX = INTMAX_MAX;
pub const SIZE_MAX = UINTPTR_MAX;
pub const RSIZE_MAX = SIZE_MAX >> @as(c_int, 1);
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WCHAR_MIN = -WCHAR_MAX - @as(c_int, 1);
pub const WINT_MIN = INT32_MIN;
pub const WINT_MAX = INT32_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const _STRUCT_TIMEVAL = struct_timeval;
pub const PRIO_PROCESS = @as(c_int, 0);
pub const PRIO_PGRP = @as(c_int, 1);
pub const PRIO_USER = @as(c_int, 2);
pub const PRIO_DARWIN_THREAD = @as(c_int, 3);
pub const PRIO_DARWIN_PROCESS = @as(c_int, 4);
pub const PRIO_MIN = -@as(c_int, 20);
pub const PRIO_MAX = @as(c_int, 20);
pub const PRIO_DARWIN_BG = @as(c_int, 0x1000);
pub const PRIO_DARWIN_NONUI = @as(c_int, 0x1001);
pub const RUSAGE_SELF = @as(c_int, 0);
pub const RUSAGE_CHILDREN = -@as(c_int, 1);
pub const ru_first = ru_ixrss;
pub const ru_last = ru_nivcsw;
pub const RUSAGE_INFO_V0 = @as(c_int, 0);
pub const RUSAGE_INFO_V1 = @as(c_int, 1);
pub const RUSAGE_INFO_V2 = @as(c_int, 2);
pub const RUSAGE_INFO_V3 = @as(c_int, 3);
pub const RUSAGE_INFO_V4 = @as(c_int, 4);
pub const RUSAGE_INFO_CURRENT = RUSAGE_INFO_V4;
pub const RLIM_INFINITY = (@import("std").zig.c_translation.cast(__uint64_t, @as(c_int, 1)) << @as(c_int, 63)) - @as(c_int, 1);
pub const RLIM_SAVED_MAX = RLIM_INFINITY;
pub const RLIM_SAVED_CUR = RLIM_INFINITY;
pub const RLIMIT_CPU = @as(c_int, 0);
pub const RLIMIT_FSIZE = @as(c_int, 1);
pub const RLIMIT_DATA = @as(c_int, 2);
pub const RLIMIT_STACK = @as(c_int, 3);
pub const RLIMIT_CORE = @as(c_int, 4);
pub const RLIMIT_AS = @as(c_int, 5);
pub const RLIMIT_RSS = RLIMIT_AS;
pub const RLIMIT_MEMLOCK = @as(c_int, 6);
pub const RLIMIT_NPROC = @as(c_int, 7);
pub const RLIMIT_NOFILE = @as(c_int, 8);
pub const RLIM_NLIMITS = @as(c_int, 9);
pub const _RLIMIT_POSIX_FLAG = @as(c_int, 0x1000);
pub const RLIMIT_WAKEUPS_MONITOR = @as(c_int, 0x1);
pub const RLIMIT_CPU_USAGE_MONITOR = @as(c_int, 0x2);
pub const RLIMIT_THREAD_CPULIMITS = @as(c_int, 0x3);
pub const RLIMIT_FOOTPRINT_INTERVAL = @as(c_int, 0x4);
pub const WAKEMON_ENABLE = @as(c_int, 0x01);
pub const WAKEMON_DISABLE = @as(c_int, 0x02);
pub const WAKEMON_GET_PARAMS = @as(c_int, 0x04);
pub const WAKEMON_SET_DEFAULTS = @as(c_int, 0x08);
pub const WAKEMON_MAKE_FATAL = @as(c_int, 0x10);
pub const CPUMON_MAKE_FATAL = @as(c_int, 0x1000);
pub const FOOTPRINT_INTERVAL_RESET = @as(c_int, 0x1);
pub const IOPOL_TYPE_DISK = @as(c_int, 0);
pub const IOPOL_TYPE_VFS_ATIME_UPDATES = @as(c_int, 2);
pub const IOPOL_TYPE_VFS_MATERIALIZE_DATALESS_FILES = @as(c_int, 3);
pub const IOPOL_TYPE_VFS_STATFS_NO_DATA_VOLUME = @as(c_int, 4);
pub const IOPOL_SCOPE_PROCESS = @as(c_int, 0);
pub const IOPOL_SCOPE_THREAD = @as(c_int, 1);
pub const IOPOL_SCOPE_DARWIN_BG = @as(c_int, 2);
pub const IOPOL_DEFAULT = @as(c_int, 0);
pub const IOPOL_IMPORTANT = @as(c_int, 1);
pub const IOPOL_PASSIVE = @as(c_int, 2);
pub const IOPOL_THROTTLE = @as(c_int, 3);
pub const IOPOL_UTILITY = @as(c_int, 4);
pub const IOPOL_STANDARD = @as(c_int, 5);
pub const IOPOL_APPLICATION = IOPOL_STANDARD;
pub const IOPOL_NORMAL = IOPOL_IMPORTANT;
pub const IOPOL_ATIME_UPDATES_DEFAULT = @as(c_int, 0);
pub const IOPOL_ATIME_UPDATES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_DEFAULT = @as(c_int, 0);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_ON = @as(c_int, 2);
pub const IOPOL_VFS_STATFS_NO_DATA_VOLUME_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_STATFS_FORCE_NO_DATA_VOLUME = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 0x00000001);
pub const WUNTRACED = @as(c_int, 0x00000002);
pub inline fn _W_INT(w: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]c_int, &w).*) {
    return @import("std").zig.c_translation.cast([*c]c_int, &w).*;
}
pub const WCOREFLAG = @as(c_int, 0o200);
pub inline fn _WSTATUS(x: anytype) @TypeOf(_W_INT(x) & @as(c_int, 0o177)) {
    return _W_INT(x) & @as(c_int, 0o177);
}
pub const _WSTOPPED = @as(c_int, 0o177);
pub inline fn WEXITSTATUS(x: anytype) @TypeOf((_W_INT(x) >> @as(c_int, 8)) & @as(c_int, 0x000000ff)) {
    return (_W_INT(x) >> @as(c_int, 8)) & @as(c_int, 0x000000ff);
}
pub inline fn WSTOPSIG(x: anytype) @TypeOf(_W_INT(x) >> @as(c_int, 8)) {
    return _W_INT(x) >> @as(c_int, 8);
}
pub inline fn WIFCONTINUED(x: anytype) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == @as(c_int, 0x13))) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) == @as(c_int, 0x13));
}
pub inline fn WIFSTOPPED(x: anytype) @TypeOf((_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != @as(c_int, 0x13))) {
    return (_WSTATUS(x) == _WSTOPPED) and (WSTOPSIG(x) != @as(c_int, 0x13));
}
pub inline fn WIFEXITED(x: anytype) @TypeOf(_WSTATUS(x) == @as(c_int, 0)) {
    return _WSTATUS(x) == @as(c_int, 0);
}
pub inline fn WIFSIGNALED(x: anytype) @TypeOf((_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != @as(c_int, 0))) {
    return (_WSTATUS(x) != _WSTOPPED) and (_WSTATUS(x) != @as(c_int, 0));
}
pub inline fn WTERMSIG(x: anytype) @TypeOf(_WSTATUS(x)) {
    return _WSTATUS(x);
}
pub inline fn WCOREDUMP(x: anytype) @TypeOf(_W_INT(x) & WCOREFLAG) {
    return _W_INT(x) & WCOREFLAG;
}
pub inline fn W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | _WSTOPPED) {
    return (sig << @as(c_int, 8)) | _WSTOPPED;
}
pub const WEXITED = @as(c_int, 0x00000004);
pub const WSTOPPED = @as(c_int, 0x00000008);
pub const WCONTINUED = @as(c_int, 0x00000010);
pub const WNOWAIT = @as(c_int, 0x00000020);
pub const WAIT_ANY = -@as(c_int, 1);
pub const WAIT_MYPGRP = @as(c_int, 0);
pub const _QUAD_HIGHWORD = @as(c_int, 1);
pub const _QUAD_LOWWORD = @as(c_int, 0);
pub const __DARWIN_LITTLE_ENDIAN = @as(c_int, 1234);
pub const __DARWIN_BIG_ENDIAN = @as(c_int, 4321);
pub const __DARWIN_PDP_ENDIAN = @as(c_int, 3412);
pub const __DARWIN_BYTE_ORDER = __DARWIN_LITTLE_ENDIAN;
pub const LITTLE_ENDIAN = __DARWIN_LITTLE_ENDIAN;
pub const BIG_ENDIAN = __DARWIN_BIG_ENDIAN;
pub const PDP_ENDIAN = __DARWIN_PDP_ENDIAN;
pub const BYTE_ORDER = __DARWIN_BYTE_ORDER;
pub inline fn __DARWIN_OSSwapConstInt16(x: anytype) __uint16_t {
    return @import("std").zig.c_translation.cast(__uint16_t, ((@import("std").zig.c_translation.cast(__uint16_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hexadecimal)) >> @as(c_int, 8)) | ((@import("std").zig.c_translation.cast(__uint16_t, x) & @as(c_int, 0x00ff)) << @as(c_int, 8)));
}
pub inline fn __DARWIN_OSSwapConstInt32(x: anytype) __uint32_t {
    return @import("std").zig.c_translation.cast(__uint32_t, ((((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000ff00, .hexadecimal)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @as(c_int, 0x000000ff)) << @as(c_int, 24)));
}
pub inline fn __DARWIN_OSSwapConstInt64(x: anytype) __uint64_t {
    return @import("std").zig.c_translation.cast(__uint64_t, ((((((((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56)));
}
pub inline fn ntohs(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn htons(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn ntohl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn htonl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn ntohll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub inline fn htonll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    return __DARWIN_OSSwapInt64(x);
}
pub const w_termsig = w_T.w_Termsig;
pub const w_coredump = w_T.w_Coredump;
pub const w_retcode = w_T.w_Retcode;
pub const w_stopval = w_S.w_Stopval;
pub const w_stopsig = w_S.w_Stopsig;
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal);
pub const MB_CUR_MAX = __mb_cur_max;
pub const __sort_noescape = __attribute__(__noescape__);
pub const ft_qsort = qsort;
pub const ft_scalloc = calloc;
pub const ft_sfree = free;
pub const ft_smalloc = malloc;
pub const ft_srealloc = realloc;
pub const ft_strtol = strtol;
pub const ft_getenv = getenv;
pub const _JBLEN = ((@as(c_int, 9) * @as(c_int, 2)) + @as(c_int, 3)) + @as(c_int, 16);
pub const ft_jmp_buf = jmp_buf;
pub const ft_longjmp = longjmp;
pub const __GNUC_VA_LIST = @as(c_int, 1);
pub const HAVE_UNISTD_H = @as(c_int, 1);
pub const HAVE_FCNTL_H = @as(c_int, 1);
pub const FT_SIZEOF_INT = @as(c_int, 32) / FT_CHAR_BIT;
pub const FT_SIZEOF_LONG = @as(c_int, 64) / FT_CHAR_BIT;
pub const FT_INT64 = c_long;
pub const FT_UINT64 = c_ulong;
pub const FT_PUBLIC_FUNCTION_ATTRIBUTE = __attribute__(visibility("default"));
pub const errno = __error().*;
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EDEADLK = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EAGAIN = @as(c_int, 35);
pub const EWOULDBLOCK = EAGAIN;
pub const EINPROGRESS = @as(c_int, 36);
pub const EALREADY = @as(c_int, 37);
pub const ENOTSOCK = @as(c_int, 38);
pub const EDESTADDRREQ = @as(c_int, 39);
pub const EMSGSIZE = @as(c_int, 40);
pub const EPROTOTYPE = @as(c_int, 41);
pub const ENOPROTOOPT = @as(c_int, 42);
pub const EPROTONOSUPPORT = @as(c_int, 43);
pub const ESOCKTNOSUPPORT = @as(c_int, 44);
pub const ENOTSUP = @as(c_int, 45);
pub const EPFNOSUPPORT = @as(c_int, 46);
pub const EAFNOSUPPORT = @as(c_int, 47);
pub const EADDRINUSE = @as(c_int, 48);
pub const EADDRNOTAVAIL = @as(c_int, 49);
pub const ENETDOWN = @as(c_int, 50);
pub const ENETUNREACH = @as(c_int, 51);
pub const ENETRESET = @as(c_int, 52);
pub const ECONNABORTED = @as(c_int, 53);
pub const ECONNRESET = @as(c_int, 54);
pub const ENOBUFS = @as(c_int, 55);
pub const EISCONN = @as(c_int, 56);
pub const ENOTCONN = @as(c_int, 57);
pub const ESHUTDOWN = @as(c_int, 58);
pub const ETOOMANYREFS = @as(c_int, 59);
pub const ETIMEDOUT = @as(c_int, 60);
pub const ECONNREFUSED = @as(c_int, 61);
pub const ELOOP = @as(c_int, 62);
pub const ENAMETOOLONG = @as(c_int, 63);
pub const EHOSTDOWN = @as(c_int, 64);
pub const EHOSTUNREACH = @as(c_int, 65);
pub const ENOTEMPTY = @as(c_int, 66);
pub const EPROCLIM = @as(c_int, 67);
pub const EUSERS = @as(c_int, 68);
pub const EDQUOT = @as(c_int, 69);
pub const ESTALE = @as(c_int, 70);
pub const EREMOTE = @as(c_int, 71);
pub const EBADRPC = @as(c_int, 72);
pub const ERPCMISMATCH = @as(c_int, 73);
pub const EPROGUNAVAIL = @as(c_int, 74);
pub const EPROGMISMATCH = @as(c_int, 75);
pub const EPROCUNAVAIL = @as(c_int, 76);
pub const ENOLCK = @as(c_int, 77);
pub const ENOSYS = @as(c_int, 78);
pub const EFTYPE = @as(c_int, 79);
pub const EAUTH = @as(c_int, 80);
pub const ENEEDAUTH = @as(c_int, 81);
pub const EPWROFF = @as(c_int, 82);
pub const EDEVERR = @as(c_int, 83);
pub const EOVERFLOW = @as(c_int, 84);
pub const EBADEXEC = @as(c_int, 85);
pub const EBADARCH = @as(c_int, 86);
pub const ESHLIBVERS = @as(c_int, 87);
pub const EBADMACHO = @as(c_int, 88);
pub const ECANCELED = @as(c_int, 89);
pub const EIDRM = @as(c_int, 90);
pub const ENOMSG = @as(c_int, 91);
pub const EILSEQ = @as(c_int, 92);
pub const ENOATTR = @as(c_int, 93);
pub const EBADMSG = @as(c_int, 94);
pub const EMULTIHOP = @as(c_int, 95);
pub const ENODATA = @as(c_int, 96);
pub const ENOLINK = @as(c_int, 97);
pub const ENOSR = @as(c_int, 98);
pub const ENOSTR = @as(c_int, 99);
pub const EPROTO = @as(c_int, 100);
pub const ETIME = @as(c_int, 101);
pub const EOPNOTSUPP = @as(c_int, 102);
pub const ENOPOLICY = @as(c_int, 103);
pub const ENOTRECOVERABLE = @as(c_int, 104);
pub const EOWNERDEAD = @as(c_int, 105);
pub const EQFULL = @as(c_int, 106);
pub const ELAST = @as(c_int, 106);
pub const MAC_OS_X_VERSION_10_0 = @as(c_int, 1000);
pub const MAC_OS_X_VERSION_10_1 = @as(c_int, 1010);
pub const MAC_OS_X_VERSION_10_2 = @as(c_int, 1020);
pub const MAC_OS_X_VERSION_10_3 = @as(c_int, 1030);
pub const MAC_OS_X_VERSION_10_4 = @as(c_int, 1040);
pub const MAC_OS_X_VERSION_10_5 = @as(c_int, 1050);
pub const MAC_OS_X_VERSION_10_6 = @as(c_int, 1060);
pub const MAC_OS_X_VERSION_10_7 = @as(c_int, 1070);
pub const MAC_OS_X_VERSION_10_8 = @as(c_int, 1080);
pub const MAC_OS_X_VERSION_10_9 = @as(c_int, 1090);
pub const MAC_OS_X_VERSION_10_10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101000, .decimal);
pub const MAC_OS_X_VERSION_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101002, .decimal);
pub const MAC_OS_X_VERSION_10_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101003, .decimal);
pub const MAC_OS_X_VERSION_10_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101100, .decimal);
pub const MAC_OS_X_VERSION_10_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101102, .decimal);
pub const MAC_OS_X_VERSION_10_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101103, .decimal);
pub const MAC_OS_X_VERSION_10_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101104, .decimal);
pub const MAC_OS_X_VERSION_10_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101200, .decimal);
pub const MAC_OS_X_VERSION_10_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101201, .decimal);
pub const MAC_OS_X_VERSION_10_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101202, .decimal);
pub const MAC_OS_X_VERSION_10_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101204, .decimal);
pub const MAC_OS_X_VERSION_10_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101300, .decimal);
pub const MAC_OS_X_VERSION_10_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101301, .decimal);
pub const MAC_OS_X_VERSION_10_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101302, .decimal);
pub const MAC_OS_X_VERSION_10_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101304, .decimal);
pub const MAC_OS_X_VERSION_10_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101400, .decimal);
pub const MAC_OS_X_VERSION_10_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101401, .decimal);
pub const MAC_OS_X_VERSION_10_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101404, .decimal);
pub const MAC_OS_X_VERSION_10_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101500, .decimal);
pub const MAC_OS_X_VERSION_10_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101501, .decimal);
pub const MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const MAC_OS_X_VERSION_MAX_ALLOWED = MAC_OS_X_VERSION_10_15;
pub const WEAK_IMPORT_ATTRIBUTE = __attribute__(weak_import);
pub const DEPRECATED_ATTRIBUTE = __attribute__(deprecated);
pub inline fn DEPRECATED_MSG_ATTRIBUTE(s: anytype) @TypeOf(__attribute__(deprecated(s))) {
    return __attribute__(deprecated(s));
}
pub const UNAVAILABLE_ATTRIBUTE = __attribute__(unavailable);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED = DEPRECATED_ATTRIBUTE;
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_0_AND_LATER = DEPRECATED_ATTRIBUTE;
pub const __AVAILABILITY_MACROS_USES_AVAILABILITY = @as(c_int, 1);
pub const __IPHONE_COMPAT_VERSION = __IPHONE_4_0;
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_1, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_2, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_5 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_5 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_5 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_5 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_5 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_6 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_7, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_7 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_13 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_13, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_8 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_9 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_10, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_10_2, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_10_3, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_10_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_11, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_11_2, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_11_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_11_3, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_3 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_11_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_11_4, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_4, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_11_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_11_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_12, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_4, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_1_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_12_1, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_1_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_1, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_4, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_1 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12, __MAC_10_12_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_2_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_12_2, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_2_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_2, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_4, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_2 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_1, __MAC_10_12_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_4_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_12_4, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_4_AND_LATER_BUT_DEPRECATED = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_4, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_1, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_2, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_3, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_7_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_7, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_8_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_8, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_9_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_9, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_2, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_10_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_10_3, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_2, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_3_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_3, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_11_4_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_11_4, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_1_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_1, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_12_2_AND_LATER_BUT_DEPRECATED_IN_MAC_OS_X_VERSION_10_12_4 = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_12_2, __MAC_10_12_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_13_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_13, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_14_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_14, __IPHONE_COMPAT_VERSION);
pub const AVAILABLE_MAC_OS_X_VERSION_10_15_AND_LATER = __OSX_AVAILABLE_STARTING(__MAC_10_15, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_1_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_1, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_2_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_2, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_3_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_3, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_4_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_5_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_5, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_6_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_6, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_7_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_7, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_8_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_8, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_9_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_9, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_10_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_10, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_11_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_11, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_12_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_12, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_13_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_13, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const DEPRECATED_IN_MAC_OS_X_VERSION_10_14_4_AND_LATER = __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_0, __MAC_10_14_4, __IPHONE_COMPAT_VERSION, __IPHONE_COMPAT_VERSION);
pub const ft_pixel_mode_none = FT_PIXEL_MODE_NONE;
pub const ft_pixel_mode_mono = FT_PIXEL_MODE_MONO;
pub const ft_pixel_mode_grays = FT_PIXEL_MODE_GRAY;
pub const ft_pixel_mode_pal2 = FT_PIXEL_MODE_GRAY2;
pub const ft_pixel_mode_pal4 = FT_PIXEL_MODE_GRAY4;
pub const FT_OUTLINE_CONTOURS_MAX = SHRT_MAX;
pub const FT_OUTLINE_POINTS_MAX = SHRT_MAX;
pub const FT_OUTLINE_NONE = @as(c_int, 0x0);
pub const FT_OUTLINE_OWNER = @as(c_int, 0x1);
pub const FT_OUTLINE_EVEN_ODD_FILL = @as(c_int, 0x2);
pub const FT_OUTLINE_REVERSE_FILL = @as(c_int, 0x4);
pub const FT_OUTLINE_IGNORE_DROPOUTS = @as(c_int, 0x8);
pub const FT_OUTLINE_SMART_DROPOUTS = @as(c_int, 0x10);
pub const FT_OUTLINE_INCLUDE_STUBS = @as(c_int, 0x20);
pub const FT_OUTLINE_OVERLAP = @as(c_int, 0x40);
pub const FT_OUTLINE_HIGH_PRECISION = @as(c_int, 0x100);
pub const FT_OUTLINE_SINGLE_PASS = @as(c_int, 0x200);
pub const ft_outline_none = FT_OUTLINE_NONE;
pub const ft_outline_owner = FT_OUTLINE_OWNER;
pub const ft_outline_even_odd_fill = FT_OUTLINE_EVEN_ODD_FILL;
pub const ft_outline_reverse_fill = FT_OUTLINE_REVERSE_FILL;
pub const ft_outline_ignore_dropouts = FT_OUTLINE_IGNORE_DROPOUTS;
pub const ft_outline_high_precision = FT_OUTLINE_HIGH_PRECISION;
pub const ft_outline_single_pass = FT_OUTLINE_SINGLE_PASS;
pub inline fn FT_CURVE_TAG(flag: anytype) @TypeOf(flag & @as(c_int, 0x03)) {
    return flag & @as(c_int, 0x03);
}
pub const FT_CURVE_TAG_ON = @as(c_int, 0x01);
pub const FT_CURVE_TAG_CONIC = @as(c_int, 0x00);
pub const FT_CURVE_TAG_CUBIC = @as(c_int, 0x02);
pub const FT_CURVE_TAG_HAS_SCANMODE = @as(c_int, 0x04);
pub const FT_CURVE_TAG_TOUCH_X = @as(c_int, 0x08);
pub const FT_CURVE_TAG_TOUCH_Y = @as(c_int, 0x10);
pub const FT_CURVE_TAG_TOUCH_BOTH = FT_CURVE_TAG_TOUCH_X | FT_CURVE_TAG_TOUCH_Y;
pub const FT_Curve_Tag_On = FT_CURVE_TAG_ON;
pub const FT_Curve_Tag_Conic = FT_CURVE_TAG_CONIC;
pub const FT_Curve_Tag_Cubic = FT_CURVE_TAG_CUBIC;
pub const FT_Curve_Tag_Touch_X = FT_CURVE_TAG_TOUCH_X;
pub const FT_Curve_Tag_Touch_Y = FT_CURVE_TAG_TOUCH_Y;
pub const FT_Outline_MoveTo_Func = FT_Outline_MoveToFunc;
pub const FT_Outline_LineTo_Func = FT_Outline_LineToFunc;
pub const FT_Outline_ConicTo_Func = FT_Outline_ConicToFunc;
pub const FT_Outline_CubicTo_Func = FT_Outline_CubicToFunc;
pub const ft_glyph_format_none = FT_GLYPH_FORMAT_NONE;
pub const ft_glyph_format_composite = FT_GLYPH_FORMAT_COMPOSITE;
pub const ft_glyph_format_bitmap = FT_GLYPH_FORMAT_BITMAP;
pub const ft_glyph_format_outline = FT_GLYPH_FORMAT_OUTLINE;
pub const ft_glyph_format_plotter = FT_GLYPH_FORMAT_PLOTTER;
pub const FT_Raster_Span_Func = FT_SpanFunc;
pub const FT_RASTER_FLAG_DEFAULT = @as(c_int, 0x0);
pub const FT_RASTER_FLAG_AA = @as(c_int, 0x1);
pub const FT_RASTER_FLAG_DIRECT = @as(c_int, 0x2);
pub const FT_RASTER_FLAG_CLIP = @as(c_int, 0x4);
pub const FT_RASTER_FLAG_SDF = @as(c_int, 0x8);
pub const ft_raster_flag_default = FT_RASTER_FLAG_DEFAULT;
pub const ft_raster_flag_aa = FT_RASTER_FLAG_AA;
pub const ft_raster_flag_direct = FT_RASTER_FLAG_DIRECT;
pub const ft_raster_flag_clip = FT_RASTER_FLAG_CLIP;
pub const FT_Raster_New_Func = FT_Raster_NewFunc;
pub const FT_Raster_Done_Func = FT_Raster_DoneFunc;
pub const FT_Raster_Reset_Func = FT_Raster_ResetFunc;
pub const FT_Raster_Set_Mode_Func = FT_Raster_SetModeFunc;
pub const FT_Raster_Render_Func = FT_Raster_RenderFunc;
pub inline fn FT_MAKE_TAG(_x1: anytype, _x2: anytype, _x3: anytype, _x4: anytype) FT_Tag {
    return @import("std").zig.c_translation.cast(FT_Tag, (((@import("std").zig.c_translation.cast(FT_ULong, _x1) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(FT_ULong, _x2) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(FT_ULong, _x3) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(FT_ULong, _x4));
}
pub inline fn FT_IS_EMPTY(list: anytype) @TypeOf(list.head == @as(c_int, 0)) {
    return list.head == @as(c_int, 0);
}
pub inline fn FT_BOOL(x: anytype) FT_Bool {
    return @import("std").zig.c_translation.cast(FT_Bool, x != @as(c_int, 0));
}
pub inline fn FT_ERR_CAT(x: anytype, y: anytype) @TypeOf(FT_ERR_XCAT(x, y)) {
    return FT_ERR_XCAT(x, y);
}
pub inline fn FT_ERR(e: anytype) @TypeOf(FT_ERR_CAT(FT_ERR_PREFIX, e)) {
    return FT_ERR_CAT(FT_ERR_PREFIX, e);
}
pub inline fn FT_ERROR_BASE(x: anytype) @TypeOf(x & @as(c_int, 0xFF)) {
    return x & @as(c_int, 0xFF);
}
pub inline fn FT_ERROR_MODULE(x: anytype) @TypeOf(x & @as(c_uint, 0xFF00)) {
    return x & @as(c_uint, 0xFF00);
}
pub inline fn FT_ERR_EQ(x: anytype, e: anytype) @TypeOf(FT_ERROR_BASE(x) == FT_ERROR_BASE(FT_ERR(e))) {
    return FT_ERROR_BASE(x) == FT_ERROR_BASE(FT_ERR(e));
}
pub inline fn FT_ERR_NEQ(x: anytype, e: anytype) @TypeOf(FT_ERROR_BASE(x) != FT_ERROR_BASE(FT_ERR(e))) {
    return FT_ERROR_BASE(x) != FT_ERROR_BASE(FT_ERR(e));
}
pub const FT_ERR_PREFIX = FT_Err_;
pub const FT_ERR_BASE = @as(c_int, 0);
pub inline fn FT_ERRORDEF_(e: anytype, v: anytype, s: anytype) @TypeOf(FT_ERRORDEF(FT_ERR_CAT(FT_ERR_PREFIX, e), v + FT_ERR_BASE, s)) {
    return FT_ERRORDEF(FT_ERR_CAT(FT_ERR_PREFIX, e), v + FT_ERR_BASE, s);
}
pub inline fn FT_NOERRORDEF_(e: anytype, v: anytype, s: anytype) @TypeOf(FT_ERRORDEF(FT_ERR_CAT(FT_ERR_PREFIX, e), v, s)) {
    return FT_ERRORDEF(FT_ERR_CAT(FT_ERR_PREFIX, e), v, s);
}
pub const ft_encoding_none = FT_ENCODING_NONE;
pub const ft_encoding_unicode = FT_ENCODING_UNICODE;
pub const ft_encoding_symbol = FT_ENCODING_MS_SYMBOL;
pub const ft_encoding_latin_1 = FT_ENCODING_ADOBE_LATIN_1;
pub const ft_encoding_latin_2 = FT_ENCODING_OLD_LATIN_2;
pub const ft_encoding_sjis = FT_ENCODING_SJIS;
pub const ft_encoding_gb2312 = FT_ENCODING_PRC;
pub const ft_encoding_big5 = FT_ENCODING_BIG5;
pub const ft_encoding_wansung = FT_ENCODING_WANSUNG;
pub const ft_encoding_johab = FT_ENCODING_JOHAB;
pub const ft_encoding_adobe_standard = FT_ENCODING_ADOBE_STANDARD;
pub const ft_encoding_adobe_expert = FT_ENCODING_ADOBE_EXPERT;
pub const ft_encoding_adobe_custom = FT_ENCODING_ADOBE_CUSTOM;
pub const ft_encoding_apple_roman = FT_ENCODING_APPLE_ROMAN;
pub const FT_FACE_FLAG_SCALABLE = @as(c_long, 1) << @as(c_int, 0);
pub const FT_FACE_FLAG_FIXED_SIZES = @as(c_long, 1) << @as(c_int, 1);
pub const FT_FACE_FLAG_FIXED_WIDTH = @as(c_long, 1) << @as(c_int, 2);
pub const FT_FACE_FLAG_SFNT = @as(c_long, 1) << @as(c_int, 3);
pub const FT_FACE_FLAG_HORIZONTAL = @as(c_long, 1) << @as(c_int, 4);
pub const FT_FACE_FLAG_VERTICAL = @as(c_long, 1) << @as(c_int, 5);
pub const FT_FACE_FLAG_KERNING = @as(c_long, 1) << @as(c_int, 6);
pub const FT_FACE_FLAG_FAST_GLYPHS = @as(c_long, 1) << @as(c_int, 7);
pub const FT_FACE_FLAG_MULTIPLE_MASTERS = @as(c_long, 1) << @as(c_int, 8);
pub const FT_FACE_FLAG_GLYPH_NAMES = @as(c_long, 1) << @as(c_int, 9);
pub const FT_FACE_FLAG_EXTERNAL_STREAM = @as(c_long, 1) << @as(c_int, 10);
pub const FT_FACE_FLAG_HINTER = @as(c_long, 1) << @as(c_int, 11);
pub const FT_FACE_FLAG_CID_KEYED = @as(c_long, 1) << @as(c_int, 12);
pub const FT_FACE_FLAG_TRICKY = @as(c_long, 1) << @as(c_int, 13);
pub const FT_FACE_FLAG_COLOR = @as(c_long, 1) << @as(c_int, 14);
pub const FT_FACE_FLAG_VARIATION = @as(c_long, 1) << @as(c_int, 15);
pub inline fn FT_HAS_HORIZONTAL(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_HORIZONTAL) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_HORIZONTAL) != 0);
}
pub inline fn FT_HAS_VERTICAL(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_VERTICAL) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_VERTICAL) != 0);
}
pub inline fn FT_HAS_KERNING(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_KERNING) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_KERNING) != 0);
}
pub inline fn FT_IS_SCALABLE(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_SCALABLE) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_SCALABLE) != 0);
}
pub inline fn FT_IS_SFNT(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_SFNT) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_SFNT) != 0);
}
pub inline fn FT_IS_FIXED_WIDTH(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_FIXED_WIDTH) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_FIXED_WIDTH) != 0);
}
pub inline fn FT_HAS_FIXED_SIZES(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_FIXED_SIZES) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_FIXED_SIZES) != 0);
}
pub inline fn FT_HAS_FAST_GLYPHS(face: anytype) @TypeOf(@as(c_int, 0)) {
    _ = face;
    return @as(c_int, 0);
}
pub inline fn FT_HAS_GLYPH_NAMES(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_GLYPH_NAMES) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_GLYPH_NAMES) != 0);
}
pub inline fn FT_HAS_MULTIPLE_MASTERS(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_MULTIPLE_MASTERS) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_MULTIPLE_MASTERS) != 0);
}
pub inline fn FT_IS_NAMED_INSTANCE(face: anytype) @TypeOf(!!((face.*.face_index & @as(c_long, 0x7FFF0000)) != 0)) {
    return !!((face.*.face_index & @as(c_long, 0x7FFF0000)) != 0);
}
pub inline fn FT_IS_VARIATION(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_VARIATION) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_VARIATION) != 0);
}
pub inline fn FT_IS_CID_KEYED(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_CID_KEYED) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_CID_KEYED) != 0);
}
pub inline fn FT_IS_TRICKY(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_TRICKY) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_TRICKY) != 0);
}
pub inline fn FT_HAS_COLOR(face: anytype) @TypeOf(!!((face.*.face_flags & FT_FACE_FLAG_COLOR) != 0)) {
    return !!((face.*.face_flags & FT_FACE_FLAG_COLOR) != 0);
}
pub const FT_STYLE_FLAG_ITALIC = @as(c_int, 1) << @as(c_int, 0);
pub const FT_STYLE_FLAG_BOLD = @as(c_int, 1) << @as(c_int, 1);
pub const FT_OPEN_MEMORY = @as(c_int, 0x1);
pub const FT_OPEN_STREAM = @as(c_int, 0x2);
pub const FT_OPEN_PATHNAME = @as(c_int, 0x4);
pub const FT_OPEN_DRIVER = @as(c_int, 0x8);
pub const FT_OPEN_PARAMS = @as(c_int, 0x10);
pub const ft_open_memory = FT_OPEN_MEMORY;
pub const ft_open_stream = FT_OPEN_STREAM;
pub const ft_open_pathname = FT_OPEN_PATHNAME;
pub const ft_open_driver = FT_OPEN_DRIVER;
pub const ft_open_params = FT_OPEN_PARAMS;
pub const FT_LOAD_DEFAULT = @as(c_int, 0x0);
pub const FT_LOAD_NO_SCALE = @as(c_long, 1) << @as(c_int, 0);
pub const FT_LOAD_NO_HINTING = @as(c_long, 1) << @as(c_int, 1);
pub const FT_LOAD_RENDER = @as(c_long, 1) << @as(c_int, 2);
pub const FT_LOAD_NO_BITMAP = @as(c_long, 1) << @as(c_int, 3);
pub const FT_LOAD_VERTICAL_LAYOUT = @as(c_long, 1) << @as(c_int, 4);
pub const FT_LOAD_FORCE_AUTOHINT = @as(c_long, 1) << @as(c_int, 5);
pub const FT_LOAD_CROP_BITMAP = @as(c_long, 1) << @as(c_int, 6);
pub const FT_LOAD_PEDANTIC = @as(c_long, 1) << @as(c_int, 7);
pub const FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = @as(c_long, 1) << @as(c_int, 9);
pub const FT_LOAD_NO_RECURSE = @as(c_long, 1) << @as(c_int, 10);
pub const FT_LOAD_IGNORE_TRANSFORM = @as(c_long, 1) << @as(c_int, 11);
pub const FT_LOAD_MONOCHROME = @as(c_long, 1) << @as(c_int, 12);
pub const FT_LOAD_LINEAR_DESIGN = @as(c_long, 1) << @as(c_int, 13);
pub const FT_LOAD_NO_AUTOHINT = @as(c_long, 1) << @as(c_int, 15);
pub const FT_LOAD_COLOR = @as(c_long, 1) << @as(c_int, 20);
pub const FT_LOAD_COMPUTE_METRICS = @as(c_long, 1) << @as(c_int, 21);
pub const FT_LOAD_BITMAP_METRICS_ONLY = @as(c_long, 1) << @as(c_int, 22);
pub const FT_LOAD_ADVANCE_ONLY = @as(c_long, 1) << @as(c_int, 8);
pub const FT_LOAD_SBITS_ONLY = @as(c_long, 1) << @as(c_int, 14);
pub inline fn FT_LOAD_TARGET_(x: anytype) @TypeOf(@import("std").zig.c_translation.cast(FT_Int32, x & @as(c_int, 15)) << @as(c_int, 16)) {
    return @import("std").zig.c_translation.cast(FT_Int32, x & @as(c_int, 15)) << @as(c_int, 16);
}
pub const FT_LOAD_TARGET_NORMAL = FT_LOAD_TARGET_(FT_RENDER_MODE_NORMAL);
pub const FT_LOAD_TARGET_LIGHT = FT_LOAD_TARGET_(FT_RENDER_MODE_LIGHT);
pub const FT_LOAD_TARGET_MONO = FT_LOAD_TARGET_(FT_RENDER_MODE_MONO);
pub const FT_LOAD_TARGET_LCD = FT_LOAD_TARGET_(FT_RENDER_MODE_LCD);
pub const FT_LOAD_TARGET_LCD_V = FT_LOAD_TARGET_(FT_RENDER_MODE_LCD_V);
pub inline fn FT_LOAD_TARGET_MODE(x: anytype) FT_Render_Mode {
    return @import("std").zig.c_translation.cast(FT_Render_Mode, (x >> @as(c_int, 16)) & @as(c_int, 15));
}
pub const ft_render_mode_normal = FT_RENDER_MODE_NORMAL;
pub const ft_render_mode_mono = FT_RENDER_MODE_MONO;
pub const ft_kerning_default = FT_KERNING_DEFAULT;
pub const ft_kerning_unfitted = FT_KERNING_UNFITTED;
pub const ft_kerning_unscaled = FT_KERNING_UNSCALED;
pub const FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS = @as(c_int, 1);
pub const FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = @as(c_int, 2);
pub const FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID = @as(c_int, 4);
pub const FT_SUBGLYPH_FLAG_SCALE = @as(c_int, 8);
pub const FT_SUBGLYPH_FLAG_XY_SCALE = @as(c_int, 0x40);
pub const FT_SUBGLYPH_FLAG_2X2 = @as(c_int, 0x80);
pub const FT_SUBGLYPH_FLAG_USE_MY_METRICS = @as(c_int, 0x200);
pub const FT_FSTYPE_INSTALLABLE_EMBEDDING = @as(c_int, 0x0000);
pub const FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = @as(c_int, 0x0002);
pub const FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING = @as(c_int, 0x0004);
pub const FT_FSTYPE_EDITABLE_EMBEDDING = @as(c_int, 0x0008);
pub const FT_FSTYPE_NO_SUBSETTING = @as(c_int, 0x0100);
pub const FT_FSTYPE_BITMAP_EMBEDDING_ONLY = @as(c_int, 0x0200);
pub const FREETYPE_MAJOR = @as(c_int, 2);
pub const FREETYPE_MINOR = @as(c_int, 11);
pub const FREETYPE_PATCH = @as(c_int, 0);
pub const __va_list_tag = struct___va_list_tag;
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const __sbuf = struct___sbuf;
pub const __sFILEX = struct___sFILEX;
pub const __sFILE = struct___sFILE;
pub const __darwin_i386_thread_state = struct___darwin_i386_thread_state;
pub const __darwin_fp_control = struct___darwin_fp_control;
pub const __darwin_fp_status = struct___darwin_fp_status;
pub const __darwin_mmst_reg = struct___darwin_mmst_reg;
pub const __darwin_xmm_reg = struct___darwin_xmm_reg;
pub const __darwin_ymm_reg = struct___darwin_ymm_reg;
pub const __darwin_zmm_reg = struct___darwin_zmm_reg;
pub const __darwin_opmask_reg = struct___darwin_opmask_reg;
pub const __darwin_i386_float_state = struct___darwin_i386_float_state;
pub const __darwin_i386_avx_state = struct___darwin_i386_avx_state;
pub const __darwin_i386_avx512_state = struct___darwin_i386_avx512_state;
pub const __darwin_i386_exception_state = struct___darwin_i386_exception_state;
pub const __darwin_x86_debug_state32 = struct___darwin_x86_debug_state32;
pub const __x86_pagein_state = struct___x86_pagein_state;
pub const __darwin_x86_thread_state64 = struct___darwin_x86_thread_state64;
pub const __darwin_x86_thread_full_state64 = struct___darwin_x86_thread_full_state64;
pub const __darwin_x86_float_state64 = struct___darwin_x86_float_state64;
pub const __darwin_x86_avx_state64 = struct___darwin_x86_avx_state64;
pub const __darwin_x86_avx512_state64 = struct___darwin_x86_avx512_state64;
pub const __darwin_x86_exception_state64 = struct___darwin_x86_exception_state64;
pub const __darwin_x86_debug_state64 = struct___darwin_x86_debug_state64;
pub const __darwin_x86_cpmu_state64 = struct___darwin_x86_cpmu_state64;
pub const __darwin_mcontext32 = struct___darwin_mcontext32;
pub const __darwin_mcontext_avx32 = struct___darwin_mcontext_avx32;
pub const __darwin_mcontext_avx512_32 = struct___darwin_mcontext_avx512_32;
pub const __darwin_mcontext64 = struct___darwin_mcontext64;
pub const __darwin_mcontext64_full = struct___darwin_mcontext64_full;
pub const __darwin_mcontext_avx64 = struct___darwin_mcontext_avx64;
pub const __darwin_mcontext_avx64_full = struct___darwin_mcontext_avx64_full;
pub const __darwin_mcontext_avx512_64 = struct___darwin_mcontext_avx512_64;
pub const __darwin_mcontext_avx512_64_full = struct___darwin_mcontext_avx512_64_full;
pub const __darwin_sigaltstack = struct___darwin_sigaltstack;
pub const __darwin_ucontext = struct___darwin_ucontext;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const __siginfo = struct___siginfo;
pub const __sigaction_u = union___sigaction_u;
pub const __sigaction = struct___sigaction;
pub const sigaction = struct_sigaction;
pub const sigvec = struct_sigvec;
pub const sigstack = struct_sigstack;
pub const timeval = struct_timeval;
pub const rusage = struct_rusage;
pub const rusage_info_v0 = struct_rusage_info_v0;
pub const rusage_info_v1 = struct_rusage_info_v1;
pub const rusage_info_v2 = struct_rusage_info_v2;
pub const rusage_info_v3 = struct_rusage_info_v3;
pub const rusage_info_v4 = struct_rusage_info_v4;
pub const rlimit = struct_rlimit;
pub const proc_rlimit_control_wakeupmon = struct_proc_rlimit_control_wakeupmon;
pub const FT_MemoryRec_ = struct_FT_MemoryRec_;
pub const FT_StreamDesc_ = union_FT_StreamDesc_;
pub const FT_StreamRec_ = struct_FT_StreamRec_;
pub const FT_Vector_ = struct_FT_Vector_;
pub const FT_BBox_ = struct_FT_BBox_;
pub const FT_Pixel_Mode_ = enum_FT_Pixel_Mode_;
pub const FT_Bitmap_ = struct_FT_Bitmap_;
pub const FT_Outline_ = struct_FT_Outline_;
pub const FT_Outline_Funcs_ = struct_FT_Outline_Funcs_;
pub const FT_Glyph_Format_ = enum_FT_Glyph_Format_;
pub const FT_Span_ = struct_FT_Span_;
pub const FT_Raster_Params_ = struct_FT_Raster_Params_;
pub const FT_RasterRec_ = struct_FT_RasterRec_;
pub const FT_Raster_Funcs_ = struct_FT_Raster_Funcs_;
pub const FT_UnitVector_ = struct_FT_UnitVector_;
pub const FT_Matrix_ = struct_FT_Matrix_;
pub const FT_Data_ = struct_FT_Data_;
pub const FT_Generic_ = struct_FT_Generic_;
pub const FT_ListNodeRec_ = struct_FT_ListNodeRec_;
pub const FT_ListRec_ = struct_FT_ListRec_;
pub const FT_Glyph_Metrics_ = struct_FT_Glyph_Metrics_;
pub const FT_Bitmap_Size_ = struct_FT_Bitmap_Size_;
pub const FT_LibraryRec_ = struct_FT_LibraryRec_;
pub const FT_ModuleRec_ = struct_FT_ModuleRec_;
pub const FT_DriverRec_ = struct_FT_DriverRec_;
pub const FT_RendererRec_ = struct_FT_RendererRec_;
pub const FT_Encoding_ = enum_FT_Encoding_;
pub const FT_CharMapRec_ = struct_FT_CharMapRec_;
pub const FT_SubGlyphRec_ = struct_FT_SubGlyphRec_;
pub const FT_Slot_InternalRec_ = struct_FT_Slot_InternalRec_;
pub const FT_GlyphSlotRec_ = struct_FT_GlyphSlotRec_;
pub const FT_Size_Metrics_ = struct_FT_Size_Metrics_;
pub const FT_Size_InternalRec_ = struct_FT_Size_InternalRec_;
pub const FT_SizeRec_ = struct_FT_SizeRec_;
pub const FT_Face_InternalRec_ = struct_FT_Face_InternalRec_;
pub const FT_FaceRec_ = struct_FT_FaceRec_;
pub const FT_Parameter_ = struct_FT_Parameter_;
pub const FT_Open_Args_ = struct_FT_Open_Args_;
pub const FT_Size_Request_Type_ = enum_FT_Size_Request_Type_;
pub const FT_Size_RequestRec_ = struct_FT_Size_RequestRec_;
pub const FT_Render_Mode_ = enum_FT_Render_Mode_;
pub const FT_Kerning_Mode_ = enum_FT_Kerning_Mode_;
