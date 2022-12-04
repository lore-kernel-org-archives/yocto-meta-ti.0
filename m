Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C7AC4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 22:41:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.373.1670193657887509643
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 14:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9CB340C2B;
	Sun,  4 Dec 2022 22:40:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tb4eOxpT_2Ok; Sun,  4 Dec 2022 22:40:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A1EED40A03;
	Sun,  4 Dec 2022 22:40:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F0061636A5; Sun,  4 Dec 2022 17:40:45 -0500 (EST)
Date: Sun, 4 Dec 2022 17:40:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging: Clean up
 init_disassemble_info() patch
Message-ID: <20221204224045.GW22689@denix.org>
References: <20221204211439.9271-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204211439.9271-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 04 Dec 2022 22:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15403

On Sun, Dec 04, 2022 at 03:14:39PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> There were fuzz errors with the patch that needed to be cleaned up,
> and for some reason a v2 that was supposed to move the duplicate

Yeah, I was wondering where did v2 go... :)


> patches in files/ was not pushed properly before merging.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ture-changes-causes-compile-failures.patch |   8 +-
>  ...ture-changes-causes-compile-failures.patch | 109 ------------------
>  ...ture-changes-causes-compile-failures.patch | 109 ------------------
>  3 files changed, 4 insertions(+), 222 deletions(-)
>  rename meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-5.10 => files}/init_disassemble_info-signature-changes-causes-compile-failures.patch (92%)
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> similarity index 92%
> rename from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> rename to meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> index a8054125..33dee03a 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> @@ -75,7 +75,7 @@ diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
>  index 308189454788..6573d2b07548 100644
>  --- a/tools/perf/util/annotate.c
>  +++ b/tools/perf/util/annotate.c
> -@@ -1685,6 +1685,18 @@ static int dso__disassemble_filename(struct dso *dso, char *filename, size_t fil
> +@@ -1685,6 +1685,18 @@
>   #include <bfd.h>
>   #include <dis-asm.h>
>   
> @@ -92,7 +92,7 @@ index 308189454788..6573d2b07548 100644
>  +}
>  +
>   static int symbol__disassemble_bpf(struct symbol *sym,
> -                                   struct annotate_args *args)
> +				   struct annotate_args *args)
>   {
>  @@ -1727,7 +1739,8 @@ static int symbol__disassemble_bpf(struct symbol *sym,
>  		goto out;
> @@ -102,8 +102,8 @@ index 308189454788..6573d2b07548 100644
>  +			      (fprintf_ftype) fprintf,
>  +                  fprintf_styled);
>   
> -        info.arch = bfd_get_arch(bfdf);
> -        info.mach = bfd_get_mach(bfdf);
> +	info.arch = bfd_get_arch(bfdf);
> +	info.mach = bfd_get_mach(bfdf);
>  -- 
>  2.17.1
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> deleted file mode 100644
> index a8054125..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -
> -Adaption of a patch [A] applied to meta-arm for the kernel.  But since TI has it's own
> -kernel we have to "adjust" the patch to match our files.
> -
> -[A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
> -
> -Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> -
> -
> -
> -From 1b2013986271de39360cf79e62ed9b7d2cc59f9b Mon Sep 17 00:00:00 2001
> -From: Andres Freund <andres@anarazel.de>
> -Date: Wed, 22 Jun 2022 11:19:18 -0700
> -Subject: [PATCH] init_disassemble_info() signature changes causes compile
> - failures
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Hi,
> -
> -binutils changed the signature of init_disassemble_info(), which now causes
> -perf and bpftool to fail to compile (e.g. on debian unstable).
> -
> -Relevant binutils commit: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
> -
> -util/annotate.c: In function ?symbol__disassemble_bpf?:
> -util/annotate.c:1765:9: error: too few arguments to function ?init_disassemble_info?
> - 1765 |         init_disassemble_info(&info, s,
> -      |         ^~~~~~~~~~~~~~~~~~~~~
> -In file included from util/annotate.c:1718:
> -/usr/include/dis-asm.h:472:13: note: declared here
> -  472 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
> -      |             ^~~~~~~~~~~~~~~~~~~~~
> -
> -with equivalent failures in
> -
> -tools/bpf/bpf_jit_disasm.c
> -tools/bpf/bpftool/jit_disasm.c
> -
> -The fix is easy enough, add a wrapper around fprintf() that conforms to the
> -new signature.
> -
> -However I assume the necessary feature test and wrapper should only be added
> -once? I don't know the kernel stuff well enough to choose the right structure
> -here.
> -
> -Attached is my local fix for perf. Obviously would need work to be a real
> -solution.
> -
> -Greetings,
> -
> -Andres Freund
> ----
> -
> -binutils 2.39 changed the signature of init_disassemble_info(),
> -which now causes perf and bpftool to fail to compile.
> -
> -Relevant binutils commit: [1]
> -
> -There is a proper fix in development upstream[2].
> -This is a work-around for older kernels.
> -
> -[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
> -[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
> -
> -Upstream-Status: Pending
> -Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
> -
> -
> - tools/perf/util/annotate.c | 15 ++++++++++++++-
> - 1 file changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> -index 308189454788..6573d2b07548 100644
> ---- a/tools/perf/util/annotate.c
> -+++ b/tools/perf/util/annotate.c
> -@@ -1685,6 +1685,18 @@ static int dso__disassemble_filename(struct dso *dso, char *filename, size_t fil
> - #include <bfd.h>
> - #include <dis-asm.h>
> - 
> -+static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
> -+{
> -+  va_list args;
> -+  int r;
> -+
> -+  va_start(args, fmt);
> -+  r = vprintf(fmt, args);
> -+  va_end(args);
> -+
> -+  return r;
> -+}
> -+
> - static int symbol__disassemble_bpf(struct symbol *sym,
> -                                   struct annotate_args *args)
> - {
> -@@ -1727,7 +1739,8 @@ static int symbol__disassemble_bpf(struct symbol *sym,
> -		goto out;
> -	}
> -	init_disassemble_info(&info, s,
> --			      (fprintf_ftype) fprintf);
> -+			      (fprintf_ftype) fprintf,
> -+                  fprintf_styled);
> - 
> -        info.arch = bfd_get_arch(bfdf);
> -        info.mach = bfd_get_mach(bfdf);
> --- 
> -2.17.1
> -
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> deleted file mode 100644
> index a8054125..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -
> -Adaption of a patch [A] applied to meta-arm for the kernel.  But since TI has it's own
> -kernel we have to "adjust" the patch to match our files.
> -
> -[A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
> -
> -Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> -
> -
> -
> -From 1b2013986271de39360cf79e62ed9b7d2cc59f9b Mon Sep 17 00:00:00 2001
> -From: Andres Freund <andres@anarazel.de>
> -Date: Wed, 22 Jun 2022 11:19:18 -0700
> -Subject: [PATCH] init_disassemble_info() signature changes causes compile
> - failures
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Hi,
> -
> -binutils changed the signature of init_disassemble_info(), which now causes
> -perf and bpftool to fail to compile (e.g. on debian unstable).
> -
> -Relevant binutils commit: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
> -
> -util/annotate.c: In function ?symbol__disassemble_bpf?:
> -util/annotate.c:1765:9: error: too few arguments to function ?init_disassemble_info?
> - 1765 |         init_disassemble_info(&info, s,
> -      |         ^~~~~~~~~~~~~~~~~~~~~
> -In file included from util/annotate.c:1718:
> -/usr/include/dis-asm.h:472:13: note: declared here
> -  472 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
> -      |             ^~~~~~~~~~~~~~~~~~~~~
> -
> -with equivalent failures in
> -
> -tools/bpf/bpf_jit_disasm.c
> -tools/bpf/bpftool/jit_disasm.c
> -
> -The fix is easy enough, add a wrapper around fprintf() that conforms to the
> -new signature.
> -
> -However I assume the necessary feature test and wrapper should only be added
> -once? I don't know the kernel stuff well enough to choose the right structure
> -here.
> -
> -Attached is my local fix for perf. Obviously would need work to be a real
> -solution.
> -
> -Greetings,
> -
> -Andres Freund
> ----
> -
> -binutils 2.39 changed the signature of init_disassemble_info(),
> -which now causes perf and bpftool to fail to compile.
> -
> -Relevant binutils commit: [1]
> -
> -There is a proper fix in development upstream[2].
> -This is a work-around for older kernels.
> -
> -[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
> -[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
> -
> -Upstream-Status: Pending
> -Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
> -
> -
> - tools/perf/util/annotate.c | 15 ++++++++++++++-
> - 1 file changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> -index 308189454788..6573d2b07548 100644
> ---- a/tools/perf/util/annotate.c
> -+++ b/tools/perf/util/annotate.c
> -@@ -1685,6 +1685,18 @@ static int dso__disassemble_filename(struct dso *dso, char *filename, size_t fil
> - #include <bfd.h>
> - #include <dis-asm.h>
> - 
> -+static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
> -+{
> -+  va_list args;
> -+  int r;
> -+
> -+  va_start(args, fmt);
> -+  r = vprintf(fmt, args);
> -+  va_end(args);
> -+
> -+  return r;
> -+}
> -+
> - static int symbol__disassemble_bpf(struct symbol *sym,
> -                                   struct annotate_args *args)
> - {
> -@@ -1727,7 +1739,8 @@ static int symbol__disassemble_bpf(struct symbol *sym,
> -		goto out;
> -	}
> -	init_disassemble_info(&info, s,
> --			      (fprintf_ftype) fprintf);
> -+			      (fprintf_ftype) fprintf,
> -+                  fprintf_styled);
> - 
> -        info.arch = bfd_get_arch(bfdf);
> -        info.mach = bfd_get_mach(bfdf);
> --- 
> -2.17.1
> -
> -- 
> 2.17.1
> 

