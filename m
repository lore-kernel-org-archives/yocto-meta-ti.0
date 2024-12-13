Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAEDE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8520.1734132730185064703
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A31C740C21;
	Fri, 13 Dec 2024 23:32:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YGdkKJ9T2p2; Fri, 13 Dec 2024 23:32:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF12540CCD;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7B46816412C;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 07/12] u-boot-bb_org, linux-bb_org: move "bb_org" providers to meta-beagle
Date: Fri, 13 Dec 2024 18:31:58 -0500
Message-Id: <20241213233203.2688541-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18118

From: Denys Dmytriyenko <denys@konsulko.com>

Move "bb_org" kernel and U-boot providers that use corresponding official
BeagleBoard.org trees into own meta-beagle layer.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since RFC v2:
* apply required SWIG patch from meta-ti-bsp to u-boot recipe

 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb                   | 4 +++-
 ...001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch | 0
 ...block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch | 0
 .../recipes-kernel/linux/linux-bb.org/defconfig               | 0
 .../recipes-kernel/linux/linux-bb.org_git.bb                  | 0
 5 files changed, 3 insertions(+), 1 deletion(-)
 rename {meta-ti-bsp =3D> meta-beagle}/recipes-bsp/u-boot/u-boot-bb.org_g=
it.bb (80%)
 rename {meta-ti-bsp =3D> meta-beagle}/recipes-kernel/linux/linux-bb.org/=
0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch (100%)
 rename {meta-ti-bsp =3D> meta-beagle}/recipes-kernel/linux/linux-bb.org/=
0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch (100%)
 rename {meta-ti-bsp =3D> meta-beagle}/recipes-kernel/linux/linux-bb.org/=
defconfig (100%)
 rename {meta-ti-bsp =3D> meta-beagle}/recipes-kernel/linux/linux-bb.org_=
git.bb (100%)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-b=
eagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
similarity index 80%
rename from meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 13286564..1d895f9c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -1,4 +1,4 @@
-require u-boot-ti.inc
+require recipes-bsp/u-boot/u-boot-ti.inc
=20
 SUMMARY =3D "BeagleBoard.org U-Boot"
=20
@@ -6,6 +6,8 @@ COMPATIBLE_MACHINE =3D "beagle.*"
=20
 PV =3D "2023.04"
=20
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+
 UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL =3D "https"
 BRANCH =3D "v2023.04-ti-09.01.00.008"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocos=
t-avoid-64-bit-division-in-ioc_timer_fn.patch b/meta-beagle/recipes-kerne=
l/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_f=
n.patch
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost=
-avoid-64-bit-division-in-ioc_timer_fn.patch
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-a=
void-64-bit-division-in-ioc_timer_fn.patch
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk=
-iocost-gcc13-keep-large-values-in-a-new-en.patch b/meta-beagle/recipes-k=
ernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in=
-a-new-en.patch
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-=
iocost-gcc13-keep-large-values-in-a-new-en.patch
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/0001-block-blk-io=
cost-gcc13-keep-large-values-in-a-new-en.patch
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig b/me=
ta-beagle/recipes-kernel/linux/linux-bb.org/defconfig
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
rename to meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
--=20
2.25.1


