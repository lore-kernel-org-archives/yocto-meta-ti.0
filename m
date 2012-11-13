Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84848E01371
	for <meta-ti@yoctoproject.org>; Mon, 12 Nov 2012 17:57:50 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDE00B7ELFGXE30@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Nov 2012 19:57:32 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5AA67201C1; Mon,
	12 Nov 2012 20:57:16 -0500 (EST)
Date: Mon, 12 Nov 2012 20:57:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
Message-id: <20121113015716.GE8900@denix.org>
References: <5077D9E9.4070207@mentor.com>
MIME-version: 1.0
In-reply-to: <5077D9E9.4070207@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-omap4-3.1.0: Add sched_process_exec tracing
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 01:57:50 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Fri, Oct 12, 2012 at 10:50:49AM +0200, Woegerer, Paul wrote:
> Hi,
> 
> the attached patch enables tracing of sched_process_exec events by
> adding upstream kernel commit:
> https://github.com/torvalds/linux/commit/4ff16c25e2cc48cbe6956e356c38a25ac063a64d
> to the linux-omap4-3.1.0 kernel recipe (tested with pandaboard).
> 
> We added this to our meta-ti mirror. It would be great if this could
> also be upstream.

Paul,

Care to port it to the 3.4 version we now have for OMAP4?

-- 
Denys


> -- 
> Paul Woegerer | SW Development Engineer
> http://go.mentor.com/sourceryanalyzer
> 
> Mentor Embedded(tm) | Prinz Eugen Straße 72/2/4, Vienna, 1040 Austria
> Nucleus® | Linux® | Android(tm) | Services | UI | Multi-OS
> 
> Android is a trademark of Google Inc. Use of this trademark is subject to Google Permissions.
> Linux is the registered trademark of Linus Torvalds in the U.S. and other countries.
> 

> From f1ae5aa3b3029073d20e542a45f8f6b25a4aab12 Mon Sep 17 00:00:00 2001
> From: Paul Woegerer <paul_woegerer@mentor.com>
> Date: Fri, 12 Oct 2012 00:40:24 -0700
> Subject: [PATCH] linux-omap4-3.1.0: Add sched_process_exec tracing
> 
> ---
>  .../linux-omap4-3.1.0/add_exec_tracepoint.patch    |  109 ++++++++++++++++++++
>  recipes-kernel/linux/linux-omap4_3.1.0.bb          |    3 +-
>  2 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/linux-omap4-3.1.0/add_exec_tracepoint.patch
> 
> diff --git a/recipes-kernel/linux/linux-omap4-3.1.0/add_exec_tracepoint.patch b/recipes-kernel/linux/linux-omap4-3.1.0/add_exec_tracepoint.patch
> new file mode 100644
> index 0000000..0d9a63b
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-omap4-3.1.0/add_exec_tracepoint.patch
> @@ -0,0 +1,109 @@
> +From 4ff16c25e2cc48cbe6956e356c38a25ac063a64d Mon Sep 17 00:00:00 2001
> +From: David Smith <dsmith@redhat.com>
> +Date: Tue, 7 Feb 2012 10:11:05 -0600
> +Subject: [PATCH] tracepoint, vfs, sched: Add exec() tracepoint
> +
> +Added a minimal exec tracepoint. Exec is an important major event
> +in the life of a task, like fork(), clone() or exit(), all of
> +which we already trace.
> +
> +[ We also do scheduling re-balancing during exec() - so it's useful
> +  from a scheduler instrumentation POV as well. ]
> +
> +If you want to watch a task start up, when it gets exec'ed is a good place
> +to start.  With the addition of this tracepoint, exec's can be monitored
> +and better picture of general system activity can be obtained. This
> +tracepoint will also enable better process life tracking, allowing you to
> +answer questions like "what process keeps starting up binary X?".
> +
> +This tracepoint can also be useful in ftrace filtering and trigger
> +conditions: i.e. starting or stopping filtering when exec is called.
> +
> +Signed-off-by: David Smith <dsmith@redhat.com>
> +Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
> +Cc: Steven Rostedt <rostedt@goodmis.org>
> +Cc: Christoph Hellwig <hch@infradead.org>
> +Cc: Al Viro <viro@zeniv.linux.org.uk>
> +Cc: Andrew Morton <akpm@linux-foundation.org>
> +Cc: Linus Torvalds <torvalds@linux-foundation.org>
> +Link: http://lkml.kernel.org/r/4F314D19.7030504@redhat.com
> +Signed-off-by: Ingo Molnar <mingo@elte.hu>
> +---
> + fs/exec.c                    |    9 ++++++---
> + include/trace/events/sched.h |   27 +++++++++++++++++++++++++++
> + 2 files changed, 33 insertions(+), 3 deletions(-)
> +
> +diff --git a/fs/exec.c b/fs/exec.c
> +index aeb135c..d0d2080 100644
> +--- a/fs/exec.c
> ++++ b/fs/exec.c
> +@@ -63,6 +63,8 @@
> + #include <trace/events/task.h>
> + #include "internal.h"
> + 
> ++#include <trace/events/sched.h>
> ++
> + int core_uses_pid;
> + char core_pattern[CORENAME_MAX_SIZE] = "core";
> + unsigned int core_pipe_limit;
> +@@ -1401,9 +1403,10 @@ int search_binary_handler(struct linux_binprm *bprm,struct pt_regs *regs)
> + 			 */
> + 			bprm->recursion_depth = depth;
> + 			if (retval >= 0) {
> +-				if (depth == 0)
> +-					ptrace_event(PTRACE_EVENT_EXEC,
> +-							old_pid);
> ++				if (depth == 0) {
> ++					trace_sched_process_exec(current, old_pid, bprm);
> ++					ptrace_event(PTRACE_EVENT_EXEC, old_pid);
> ++				}
> + 				put_binfmt(fmt);
> + 				allow_write_access(bprm->file);
> + 				if (bprm->file)
> +diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> +index 6ba596b..e61ddfe 100644
> +--- a/include/trace/events/sched.h
> ++++ b/include/trace/events/sched.h
> +@@ -6,6 +6,7 @@
> + 
> + #include <linux/sched.h>
> + #include <linux/tracepoint.h>
> ++#include <linux/binfmts.h>
> + 
> + /*
> +  * Tracepoint for calling kthread_stop, performed to end a kthread:
> +@@ -276,6 +277,32 @@ TRACE_EVENT(sched_process_fork,
> + );
> + 
> + /*
> ++ * Tracepoint for exec:
> ++ */
> ++TRACE_EVENT(sched_process_exec,
> ++
> ++	TP_PROTO(struct task_struct *p, pid_t old_pid,
> ++		 struct linux_binprm *bprm),
> ++
> ++	TP_ARGS(p, old_pid, bprm),
> ++
> ++	TP_STRUCT__entry(
> ++		__string(	filename,	bprm->filename	)
> ++		__field(	pid_t,		pid		)
> ++		__field(	pid_t,		old_pid		)
> ++	),
> ++
> ++	TP_fast_assign(
> ++		__assign_str(filename, bprm->filename);
> ++		__entry->pid		= p->pid;
> ++		__entry->old_pid	= p->pid;
> ++	),
> ++
> ++	TP_printk("filename=%s pid=%d old_pid=%d", __get_str(filename),
> ++		  __entry->pid, __entry->old_pid)
> ++);
> ++
> ++/*
> +  * XXX the below sched_stat tracepoints only apply to SCHED_OTHER/BATCH/IDLE
> +  *     adding sched_stat support to SCHED_FIFO/RR would be welcome.
> +  */
> +-- 
> +1.7.6.5
> diff --git a/recipes-kernel/linux/linux-omap4_3.1.0.bb b/recipes-kernel/linux/linux-omap4_3.1.0.bb
> index c57d034..7e67055 100644
> --- a/recipes-kernel/linux/linux-omap4_3.1.0.bb
> +++ b/recipes-kernel/linux/linux-omap4_3.1.0.bb
> @@ -3,7 +3,7 @@ COMPATIBLE_MACHINE = "pandaboard"
>  require linux.inc
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap4 see conf/machine/include/omap4.inc
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  
>  CORTEXA8FIXUP = "no"
>  
> @@ -12,6 +12,7 @@ SRCREV = "a5c60c099296fcfc0c8fa8085c40883971486512"
>  
>  SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.1-1282 \
>             file://0001-Makefile.fwinst-fix-install-breakage-for-FW-images-r.patch \
> +           file://add_exec_tracepoint.patch \
>             file://defconfig \
>             "
>  
> -- 
> 1.7.9.5
> 

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


