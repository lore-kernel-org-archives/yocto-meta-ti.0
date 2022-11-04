Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BECC3E8A8
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.807.1667602019758244670
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE29D40D85
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeAS2LEep3Xy for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D27B440D80
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A51B7163696
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 27/50] linux-ti-mainline: unbreak devtool
Date: Fri,  4 Nov 2022 22:46:29 +0000
Message-Id: <20221104224653.1223044-28-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15301

From: Denys Dmytriyenko <denys@konsulko.com>

devtool has a long-standing bug where it cannot handle references to ${WO=
RKDIR}
due to externalsrc:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12677

linux-ti-mainline clones additional ti-upstream-tools repo alongside the =
kernel
sources into ${WORKDIR}, which exposes this devtool bug.

Work around the issue by moving ti-upstream-tools inside the kernel sourc=
e tree,
i.e. inside ${S}

Reported-by: Radoslav Pesek <radoslav.pesek@microstep-mis.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 0fe54cda..6c1b1825 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 inherit kernel
=20
-DEFCONFIG_BUILDER =3D "${WORKDIR}/ti-upstream-tools/config/defconfig_bui=
lder.sh"
+DEFCONFIG_BUILDER =3D "${S}/ti-upstream-tools/config/defconfig_builder.s=
h"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
@@ -32,7 +32,7 @@ KERNEL_GIT_URI =3D "git://git.kernel.org/pub/scm/linux/=
kernel/git/torvalds/linux.g
 KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D " \
     ${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANC=
H};name=3Dlinux \
-    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=3D=
${TOOLS_BRANCH};protocol=3D${KERNEL_GIT_PROTOCOL};name=3Dti-upstream-tool=
s;destsuffix=3Dti-upstream-tools \
+    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=3D=
${TOOLS_BRANCH};protocol=3D${KERNEL_GIT_PROTOCOL};name=3Dti-upstream-tool=
s;destsuffix=3Dgit/ti-upstream-tools \
     file://defconfig \
 "
=20
@@ -43,7 +43,7 @@ KERNEL_DEVICETREE =3D ""
=20
 kernel_do_compile:append() {
 	oe_runmake dtbs CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" ${KE=
RNEL_EXTRA_ARGS}
-	oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=3D${S} DTC=3D${B}/scri=
pts/dtc/dtc O=3D${B} CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" $=
{KERNEL_EXTRA_ARGS}
+	oe_runmake -C ${S}/ti-upstream-tools LINUX=3D${S} DTC=3D${B}/scripts/dt=
c/dtc O=3D${B} CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" ${KERNE=
L_EXTRA_ARGS}
 }
=20
 do_install:append() {
--=20
2.25.1


