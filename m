Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6D7C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 23:45:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.795.1721087144130967367
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 16:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 337F740C82;
	Mon, 15 Jul 2024 23:45:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uWQSdua_rAr; Mon, 15 Jul 2024 23:45:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F1CA240A2F;
	Mon, 15 Jul 2024 23:45:41 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A4FD7163FF0;
	Mon, 15 Jul 2024 19:45:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] linux: remove old unused patches
Date: Mon, 15 Jul 2024 19:45:38 -0400
Message-Id: <20240715234539.2284580-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jul 2024 23:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17863

From: Denys Dmytriyenko <denys@konsulko.com>

These patches are not used anywhere now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...s-Fix-build-for-upcoming-GCC-release.patch |  46 --------
 ...ture-changes-causes-compile-failures.patch | 111 ------------------
 2 files changed, 157 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugi=
ns-Fix-build-for-upcoming-GCC-release.patch
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/init_disassemb=
le_info-signature-changes-causes-compile-failures.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-=
build-for-upcoming-GCC-release.patch b/meta-ti-bsp/recipes-kernel/linux/f=
iles/0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch
deleted file mode 100644
index 3dfa31a1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-build-f=
or-upcoming-GCC-release.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3cd29a3d7c25cca9989e7d8966141f725fa99c68 Mon Sep 17 00:00:00 2001
-From: Palmer Dabbelt <palmer@rivosinc.com>
-Date: Fri, 13 Jan 2023 09:30:33 -0800
-Subject: [PATCH] gcc-plugins: Fix build for upcoming GCC release
-
-The upcoming GCC release has refactored the gimple plugin interface a
-bit and unless gimple-iterator.h is included before gimple-fold.h I end
-up with a bunch of missing declarations when building the stack
-protector plugin.
-
-Upstream-Status: Backport [https://lore.kernel.org/all/20230113173033.43=
80-1-palmer@rivosinc.com/]
-Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
-Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
-Link: https://lore.kernel.org/all/20230113173033.4380-1-palmer@rivosinc.=
com/
-Cc: linux-hardening@vger.kernel.org
-Signed-off-by: Kees Cook <keescook@chromium.org>
----
- scripts/gcc-plugins/gcc-common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/scripts/gcc-plugins/gcc-common.h
-+++ b/scripts/gcc-plugins/gcc-common.h
-@@ -108,7 +108,9 @@
- #include "varasm.h"
- #include "stor-layout.h"
- #include "internal-fn.h"
-+#include "gimple.h"
- #include "gimple-expr.h"
-+#include "gimple-iterator.h"
- #include "gimple-fold.h"
- #include "context.h"
- #include "tree-ssa-alias.h"
-@@ -124,13 +126,10 @@
- #include "gimplify.h"
- #endif
-
--#include "gimple.h"
--
- #if BUILDING_GCC_VERSION >=3D 4009
- #include "tree-ssa-operands.h"
- #include "tree-phinodes.h"
- #include "tree-cfg.h"
--#include "gimple-iterator.h"
- #include "gimple-ssa.h"
- #include "ssa-iterators.h"
- #endif
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info=
-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-ke=
rnel/linux/files/init_disassemble_info-signature-changes-causes-compile-f=
ailures.patch
deleted file mode 100644
index e1e04c34..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signat=
ure-changes-causes-compile-failures.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-
-Adaption of a patch [A] applied to meta-arm for the kernel.  But since T=
I has it's own
-kernel we have to "adjust" the patch to match our files.
-
-[A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.=
4888-1-jon.mason@arm.com/#5104
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
-
-
-
-From 1b2013986271de39360cf79e62ed9b7d2cc59f9b Mon Sep 17 00:00:00 2001
-From: Andres Freund <andres@anarazel.de>
-Date: Wed, 22 Jun 2022 11:19:18 -0700
-Subject: [PATCH] init_disassemble_info() signature changes causes compil=
e
- failures
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Hi,
-
-binutils changed the signature of init_disassemble_info(), which now cau=
ses
-perf and bpftool to fail to compile (e.g. on debian unstable).
-
-Relevant binutils commit: https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3D60a3da00bd5407f07d64dff82a4dae98230dfaac
-
-util/annotate.c: In function ?symbol__disassemble_bpf?:
-util/annotate.c:1765:9: error: too few arguments to function ?init_disas=
semble_info?
- 1765 |         init_disassemble_info(&info, s,
-      |         ^~~~~~~~~~~~~~~~~~~~~
-In file included from util/annotate.c:1718:
-/usr/include/dis-asm.h:472:13: note: declared here
-  472 | extern void init_disassemble_info (struct disassemble_info *dinf=
o, void *stream,
-      |             ^~~~~~~~~~~~~~~~~~~~~
-
-with equivalent failures in
-
-tools/bpf/bpf_jit_disasm.c
-tools/bpf/bpftool/jit_disasm.c
-
-The fix is easy enough, add a wrapper around fprintf() that conforms to =
the
-new signature.
-
-However I assume the necessary feature test and wrapper should only be a=
dded
-once? I don't know the kernel stuff well enough to choose the right stru=
cture
-here.
-
-Attached is my local fix for perf. Obviously would need work to be a rea=
l
-solution.
-
-Greetings,
-
-Andres Freund
----
-
-binutils 2.39 changed the signature of init_disassemble_info(),
-which now causes perf and bpftool to fail to compile.
-
-Relevant binutils commit: [1]
-
-There is a proper fix in development upstream[2].
-This is a work-around for older kernels.
-
-[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D=
60a3da00bd5407f07d64dff82a4dae98230dfaac
-[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.=
156015-1-andres@anarazel.de/
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
-
- tools/perf/util/annotate.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
-index 308189454788..6573d2b07548 100644
---- a/tools/perf/util/annotate.c
-+++ b/tools/perf/util/annotate.c
-@@ -1685,6 +1685,18 @@
- #include <bfd.h>
- #include <dis-asm.h>
-=20
-+static int fprintf_styled(void *, enum disassembler_style, const char* =
fmt, ...)
-+{
-+  va_list args;
-+  int r;
-+
-+  va_start(args, fmt);
-+  r =3D vprintf(fmt, args);
-+  va_end(args);
-+
-+  return r;
-+}
-+
- static int symbol__disassemble_bpf(struct symbol *sym,
-				   struct annotate_args *args)
- {
-@@ -1727,7 +1739,8 @@ static int symbol__disassemble_bpf(struct symbol *=
sym,
-		goto out;
-	}
-	init_disassemble_info(&info, s,
--			      (fprintf_ftype) fprintf);
-+			      (fprintf_ftype) fprintf,
-+                  fprintf_styled);
-=20
-	info.arch =3D bfd_get_arch(bfdf);
-	info.mach =3D bfd_get_mach(bfdf);
---=20
-2.17.1
-
--=20
2.25.1


