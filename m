Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2936.1586205595120138561
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8846B40BA3;
	Mon,  6 Apr 2020 20:39:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZGPBaaQDHyk; Mon,  6 Apr 2020 20:39:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7400E40B73;
	Mon,  6 Apr 2020 20:39:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3025517126C;
	Mon,  6 Apr 2020 16:39:53 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] linux-ti-staging: fix perf build against latest libbfd
Date: Mon,  6 Apr 2020 16:39:51 -0400
Message-Id: <1586205591-55907-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ake-perf-able-to-build-with-latest-libbfd.patch | 60 ++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_5.4.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch

diff --git a/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch b/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch
new file mode 100644
index 0000000..f5220a8
--- /dev/null
+++ b/recipes-kernel/linux/files/0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch
@@ -0,0 +1,60 @@
+From 0ada120c883d4f1f6aafd01cf0fbb10d8bbba015 Mon Sep 17 00:00:00 2001
+From: Changbin Du <changbin.du@gmail.com>
+Date: Tue, 28 Jan 2020 23:29:38 +0800
+Subject: [PATCH] perf: Make perf able to build with latest libbfd
+
+libbfd has changed the bfd_section_* macros to inline functions
+bfd_section_<field> since 2019-09-18. See below two commits:
+  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
+  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
+
+This fix make perf able to build with both old and new libbfd.
+
+Signed-off-by: Changbin Du <changbin.du@gmail.com>
+Acked-by: Jiri Olsa <jolsa@redhat.com>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/util/srcline.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
+index 6ccf6f6..5b7d6c1 100644
+--- a/tools/perf/util/srcline.c
++++ b/tools/perf/util/srcline.c
+@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, asection *section, void *data)
+ 	bfd_vma pc, vma;
+ 	bfd_size_type size;
+ 	struct a2l_data *a2l = data;
++	flagword flags;
+ 
+ 	if (a2l->found)
+ 		return;
+ 
+-	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
++#ifdef bfd_get_section_flags
++	flags = bfd_get_section_flags(abfd, section);
++#else
++	flags = bfd_section_flags(section);
++#endif
++	if ((flags & SEC_ALLOC) == 0)
+ 		return;
+ 
+ 	pc = a2l->addr;
++#ifdef bfd_get_section_vma
+ 	vma = bfd_get_section_vma(abfd, section);
++#else
++	vma = bfd_section_vma(section);
++#endif
++#ifdef bfd_get_section_size
+ 	size = bfd_get_section_size(section);
++#else
++	size = bfd_section_size(section);
++#endif
+ 
+ 	if (pc < vma || pc >= vma + size)
+ 		return;
+-- 
+2.7.4
+
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 49a4c18..3530657 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -70,6 +70,7 @@ PR = "${MACHINE_KERNEL_PR}"
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch \
             file://defconfig"
 
 FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.7.4

