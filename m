Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CAFD5C0FD
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 15:51:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16067.1731081064935284943
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 07:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 508B940CA8;
	Fri,  8 Nov 2024 15:51:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5cvUrWVCuzv; Fri,  8 Nov 2024 15:51:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F3D940C3E;
	Fri,  8 Nov 2024 15:51:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 61CDA1640E4;
	Fri,  8 Nov 2024 10:50:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH v2 09/10] linux-bb.org, u-boot-bb.org: rename recipes with version
Date: Fri,  8 Nov 2024 10:50:57 -0500
Message-Id: <20241108155058.2729634-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108155058.2729634-1-denis@denix.org>
References: <20241108155058.2729634-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Nov 2024 15:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18060

From: Denys Dmytriyenko <denys@konsulko.com>

Rename "bb_org" BSP recipes to include version in the recipe names.
This way we can support multiple versions.

Also remove 2 unused kernel patches that were needed for 5.10

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...bb.org_git.bb =3D> u-boot-bb.org_2023.04.bb} |  0
 .../defconfig                                 |  0
 ...void-64-bit-division-in-ioc_timer_fn.patch | 56 -------------------
 ...-gcc13-keep-large-values-in-a-new-en.patch | 54 ------------------
 ...inux-bb.org_git.bb =3D> linux-bb.org_6.1.bb} |  3 +
 5 files changed, 3 insertions(+), 110 deletions(-)
 rename meta-beagle/recipes-bsp/u-boot/{u-boot-bb.org_git.bb =3D> u-boot-=
bb.org_2023.04.bb} (100%)
 rename meta-beagle/recipes-kernel/linux/{linux-bb.org =3D> linux-bb.org-=
6.1}/defconfig (100%)
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org/0001-bl=
k-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
 delete mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org/0001-bl=
ock-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
 rename meta-beagle/recipes-kernel/linux/{linux-bb.org_git.bb =3D> linux-=
bb.org_6.1.bb} (93%)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-b=
eagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
similarity index 100%
rename from meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org/defconfig b/me=
ta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
similarity index 100%
rename from meta-beagle/recipes-kernel/linux/linux-bb.org/defconfig
rename to meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-blk-iocos=
t-avoid-64-bit-division-in-ioc_timer_fn.patch b/meta-beagle/recipes-kerne=
l/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_f=
n.patch
deleted file mode 100644
index a7806c22..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid=
-64-bit-division-in-ioc_timer_fn.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 5f2779dfa7b8cc7dfd4a1b6586d86e0d193266f3 Mon Sep 17 00:00:00 2001
-From: Arnd Bergmann <arnd@arndb.de>
-Date: Wed, 18 Jan 2023 09:07:01 +0100
-Subject: [PATCH] blk-iocost: avoid 64-bit division in ioc_timer_fn
-
-The behavior of 'enum' types has changed in gcc-13, so now the
-UNBUSY_THR_PCT constant is interpreted as a 64-bit number because
-it is defined as part of the same enum definition as some other
-constants that do not fit within a 32-bit integer. This in turn
-leads to some inefficient code on 32-bit architectures as well
-as a link error:
-
-arm-linux-gnueabi/bin/arm-linux-gnueabi-ld: block/blk-iocost.o: in funct=
ion `ioc_timer_fn':
-blk-iocost.c:(.text+0x68e8): undefined reference to `__aeabi_uldivmod'
-arm-linux-gnueabi-ld: blk-iocost.c:(.text+0x6908): undefined reference t=
o `__aeabi_uldivmod'
-
-Split the enum definition to keep the 64-bit timing constants in
-a separate enum type from those constants that can clearly fit
-within a smaller type.
-
-Signed-off-by: Arnd Bergmann <arnd@arndb.de>
-Acked-by: Tejun Heo <tj@kernel.org>
-Link: https://lore.kernel.org/r/20230118080706.3303186-1-arnd@kernel.org
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
----
- block/blk-iocost.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/block/blk-iocost.c b/block/blk-iocost.c
-index 6955605629e4..b691b6bb498f 100644
---- a/block/blk-iocost.c
-+++ b/block/blk-iocost.c
-@@ -258,6 +258,11 @@ enum {
-	VRATE_MIN		=3D VTIME_PER_USEC * VRATE_MIN_PPM / MILLION,
-	VRATE_CLAMP_ADJ_PCT	=3D 4,
-
-+	/* switch iff the conditions are met for longer than this */
-+	AUTOP_CYCLE_NSEC	=3D 10LLU * NSEC_PER_SEC,
-+};
-+
-+enum {
-	/* if IOs end up waiting for requests, issue less */
-	RQ_WAIT_BUSY_PCT	=3D 5,
-
-@@ -296,9 +301,6 @@ enum {
-	/* don't let cmds which take a very long time pin lagging for too long =
*/
-	MAX_LAGGING_PERIODS	=3D 10,
-
--	/* switch iff the conditions are met for longer than this */
--	AUTOP_CYCLE_NSEC	=3D 10LLU * NSEC_PER_SEC,
--
-	/*
-	 * Count IO size in 4k pages.  The 12bit shift helps keeping
-	 * size-proportional components of cost calculation in closer
---
-2.40.1
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-block-blk=
-iocost-gcc13-keep-large-values-in-a-new-en.patch b/meta-beagle/recipes-k=
ernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in=
-a-new-en.patch
deleted file mode 100644
index f5d0f476..00000000
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost=
-gcc13-keep-large-values-in-a-new-en.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ff1cc97b1f4c10db224f276d9615b22835b8c424 Mon Sep 17 00:00:00 2001
-From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
-Date: Tue, 13 Dec 2022 13:08:26 +0100
-Subject: [PATCH] block/blk-iocost (gcc13): keep large values in a new en=
um
-
-Since gcc13, each member of an enum has the same type as the enum [1]. A=
nd
-that is inherited from its members. Provided:
-  VTIME_PER_SEC_SHIFT     =3D 37,
-  VTIME_PER_SEC           =3D 1LLU << VTIME_PER_SEC_SHIFT,
-  ...
-  AUTOP_CYCLE_NSEC        =3D 10LLU * NSEC_PER_SEC,
-the named type is unsigned long.
-
-This generates warnings with gcc-13:
-  block/blk-iocost.c: In function 'ioc_weight_prfill':
-  block/blk-iocost.c:3037:37: error: format '%u' expects argument of typ=
e 'unsigned int', but argument 4 has type 'long unsigned int'
-
-  block/blk-iocost.c: In function 'ioc_weight_show':
-  block/blk-iocost.c:3047:34: error: format '%u' expects argument of typ=
e 'unsigned int', but argument 3 has type 'long unsigned int'
-
-So split the anonymous enum with large values to a separate enum, so
-that they don't affect other members.
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D36113
-
-Cc: Martin Liska <mliska@suse.cz>
-Cc: Tejun Heo <tj@kernel.org>
-Cc: Josef Bacik <josef@toxicpanda.com>
-Cc: Jens Axboe <axboe@kernel.dk>
-Cc: cgroups@vger.kernel.org
-Cc: linux-block@vger.kernel.org
-Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
-Link: https://lore.kernel.org/r/20221213120826.17446-1-jirislaby@kernel.=
org
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
----
- block/blk-iocost.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/block/blk-iocost.c b/block/blk-iocost.c
-index d1bdc12deaa7..549ddc9e0c6f 100644
---- a/block/blk-iocost.c
-+++ b/block/blk-iocost.c
-@@ -232,7 +232,9 @@ enum {
-
-	/* 1/64k is granular enough and can easily be handled w/ u32 */
-	WEIGHT_ONE		=3D 1 << 16,
-+};
-
-+enum {
-	/*
-	 * As vtime is used to calculate the cost of each IO, it needs to
-	 * be fairly high precision.  For example, it should be able to
---
-2.40.1
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
similarity index 93%
rename from meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
rename to meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
index 986eda68..063bcac3 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
@@ -1,3 +1,6 @@
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
+
 SECTION =3D "kernel"
 SUMMARY =3D "BeagleBoard.org Linux kernel"
 LICENSE =3D "GPL-2.0-only"
--=20
2.25.1


