Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89123C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 21:22:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.131103.1669670562526447662
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 13:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vcvmxta1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ASLMead076231;
	Mon, 28 Nov 2022 15:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669670560;
	bh=pvXdpELsdJNDrU5TtL1kkooNIQH6LYZDVBwEj3G79CE=;
	h=From:To:Subject:Date;
	b=vcvmxta1lDVlm5titJA926u1KN244vy4h6muKCQ5pnow2dGvYlxg+Z2INuE7I4LWI
	 OHqPCWQMkKmTioZgg1iwmisxOBFgsCWt9zKEnvOHdn8KQNpI01fT7z9Gwo8xE+KuBR
	 AIr0oEuJe8sNe7nOzcpbA0DFX3olXOJdtWH5QzOM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ASLMeAJ008307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Nov 2022 15:22:40 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 28
 Nov 2022 15:22:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 28 Nov 2022 15:22:39 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ASLMdmA051987;
	Mon, 28 Nov 2022 15:22:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ozlaJ-0001km-QM; Mon, 28 Nov 2022 15:22:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] linux-ti-staging: work around for too few arguments to function init_disassemble_info() error
Date: Mon, 28 Nov 2022 15:22:39 -0600
Message-ID: <20221128212239.6701-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 21:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15373

binutils 2.39 changed the signature of init_disassemble_info(),
which now causes perf and bpftool to fail to compile.

Relevant binutils commit: [1]

There is a proper fix in development upstream[2].
This is a work-around for older kernels.

Inspired by a patch by Anton Antonov to fix this issue on meta-arm
kernels. [3]

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
[3] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
 .../linux/linux-ti-staging_5.10.bb            |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
new file mode 100644
index 00000000..a8054125
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
@@ -0,0 +1,109 @@
+
+Adaption of a patch [A] applied to meta-arm for the kernel.  But since TI has it's own
+kernel we have to "adjust" the patch to match our files.
+
+[A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+
+
+From 1b2013986271de39360cf79e62ed9b7d2cc59f9b Mon Sep 17 00:00:00 2001
+From: Andres Freund <andres@anarazel.de>
+Date: Wed, 22 Jun 2022 11:19:18 -0700
+Subject: [PATCH] init_disassemble_info() signature changes causes compile
+ failures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Hi,
+
+binutils changed the signature of init_disassemble_info(), which now causes
+perf and bpftool to fail to compile (e.g. on debian unstable).
+
+Relevant binutils commit: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
+
+util/annotate.c: In function ?symbol__disassemble_bpf?:
+util/annotate.c:1765:9: error: too few arguments to function ?init_disassemble_info?
+ 1765 |         init_disassemble_info(&info, s,
+      |         ^~~~~~~~~~~~~~~~~~~~~
+In file included from util/annotate.c:1718:
+/usr/include/dis-asm.h:472:13: note: declared here
+  472 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
+      |             ^~~~~~~~~~~~~~~~~~~~~
+
+with equivalent failures in
+
+tools/bpf/bpf_jit_disasm.c
+tools/bpf/bpftool/jit_disasm.c
+
+The fix is easy enough, add a wrapper around fprintf() that conforms to the
+new signature.
+
+However I assume the necessary feature test and wrapper should only be added
+once? I don't know the kernel stuff well enough to choose the right structure
+here.
+
+Attached is my local fix for perf. Obviously would need work to be a real
+solution.
+
+Greetings,
+
+Andres Freund
+---
+
+binutils 2.39 changed the signature of init_disassemble_info(),
+which now causes perf and bpftool to fail to compile.
+
+Relevant binutils commit: [1]
+
+There is a proper fix in development upstream[2].
+This is a work-around for older kernels.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
+[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+
+ tools/perf/util/annotate.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
+index 308189454788..6573d2b07548 100644
+--- a/tools/perf/util/annotate.c
++++ b/tools/perf/util/annotate.c
+@@ -1685,6 +1685,18 @@ static int dso__disassemble_filename(struct dso *dso, char *filename, size_t fil
+ #include <bfd.h>
+ #include <dis-asm.h>
+ 
++static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
++{
++  va_list args;
++  int r;
++
++  va_start(args, fmt);
++  r = vprintf(fmt, args);
++  va_end(args);
++
++  return r;
++}
++
+ static int symbol__disassemble_bpf(struct symbol *sym,
+                                   struct annotate_args *args)
+ {
+@@ -1727,7 +1739,8 @@ static int symbol__disassemble_bpf(struct symbol *sym,
+		goto out;
+	}
+	init_disassemble_info(&info, s,
+-			      (fprintf_ftype) fprintf);
++			      (fprintf_ftype) fprintf,
++                  fprintf_styled);
+ 
+        info.arch = bfd_get_arch(bfdf);
+        info.mach = bfd_get_mach(bfdf);
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index bf230dbc..462d26f1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
 KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://init_disassemble_info-signature-changes-causes-compile-failures.patch \
             file://defconfig"
 
 FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.17.1


