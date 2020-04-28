Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.508.1588115708239443230
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Apr 2020 16:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C71940BDF;
	Tue, 28 Apr 2020 23:15:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWk2zQmioGL4; Tue, 28 Apr 2020 23:15:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E557D40AB5;
	Tue, 28 Apr 2020 23:15:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A4C1916E905;
	Tue, 28 Apr 2020 19:15:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] linux-ti-staging: update to 5.4.34
Date: Tue, 28 Apr 2020 19:15:05 -0400
Message-Id: <1588115705-53518-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Also drop backported perf patch.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ake-perf-able-to-build-with-latest-libbfd.patch | 60 ----------------------
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb    |  4 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb       |  5 +-
 3 files changed, 4 insertions(+), 65 deletions(-)
 delete mode 100644 recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch

diff --git a/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch b/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch
deleted file mode 100644
index f5220a8..0000000
--- a/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0ada120c883d4f1f6aafd01cf0fbb10d8bbba015 Mon Sep 17 00:00:00 2001
-From: Changbin Du <changbin.du@gmail.com>
-Date: Tue, 28 Jan 2020 23:29:38 +0800
-Subject: [PATCH] perf: Make perf able to build with latest libbfd
-
-libbfd has changed the bfd_section_* macros to inline functions
-bfd_section_<field> since 2019-09-18. See below two commits:
-  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
-  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
-
-This fix make perf able to build with both old and new libbfd.
-
-Signed-off-by: Changbin Du <changbin.du@gmail.com>
-Acked-by: Jiri Olsa <jolsa@redhat.com>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/srcline.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
-index 6ccf6f6..5b7d6c1 100644
---- a/tools/perf/util/srcline.c
-+++ b/tools/perf/util/srcline.c
-@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, asection *section, void *data)
- 	bfd_vma pc, vma;
- 	bfd_size_type size;
- 	struct a2l_data *a2l = data;
-+	flagword flags;
- 
- 	if (a2l->found)
- 		return;
- 
--	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
-+#ifdef bfd_get_section_flags
-+	flags = bfd_get_section_flags(abfd, section);
-+#else
-+	flags = bfd_section_flags(section);
-+#endif
-+	if ((flags & SEC_ALLOC) == 0)
- 		return;
- 
- 	pc = a2l->addr;
-+#ifdef bfd_get_section_vma
- 	vma = bfd_get_section_vma(abfd, section);
-+#else
-+	vma = bfd_section_vma(section);
-+#endif
-+#ifdef bfd_get_section_size
- 	size = bfd_get_section_size(section);
-+#else
-+	size = bfd_section_size(section);
-+#endif
- 
- 	if (pc < vma || pc >= vma + size)
- 		return;
--- 
-2.7.4
-
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 7bce939..a0c5fd1 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "c19c1f9f817e15b923c18a22b218024788627692"
-PV = "5.4.28+git${SRCPV}"
+SRCREV = "e62f2659b5254a7fcdaad8f5a7705040ccaadeae"
+PV = "5.4.34+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 5c0f06b..1a53dec 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,8 +60,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "30623f353f82825846b4086004845ee859b1e992"
-PV = "5.4.28+git${SRCPV}"
+SRCREV = "2050bb49c5732e34cc2372ad9c9879b6d485d556"
+PV = "5.4.34+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
@@ -70,7 +70,6 @@ PR = "${MACHINE_KERNEL_PR}"
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch \
             file://defconfig"
 
 FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.7.4

