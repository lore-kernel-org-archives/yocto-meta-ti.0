Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BAAC87FCF
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 20:48:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29179.1753476519615712362
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 13:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BEC0C40CC3;
	Fri, 25 Jul 2025 20:48:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ra8RgMakCF1z; Fri, 25 Jul 2025 20:48:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A440C40BA9;
	Fri, 25 Jul 2025 20:48:37 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BEDEE16CE23;
	Fri, 25 Jul 2025 16:48:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/3] meta-ti-bsp: move KERNEL_DTBVENDORED settings
Date: Fri, 25 Jul 2025 16:48:34 -0400
Message-Id: <20250725204836.2549216-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Jul 2025 20:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18829

From: Denys Dmytriyenko <denys@konsulko.com>

Move KERNEL_DTBVENDORED settings from the kernel to ti-soc.inc
in the config scope.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/ti-soc.inc    | 5 +++++
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
index 56ea9e47..2eefa8a0 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -14,3 +14,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetre=
e"
=20
 # All machines should start off pointing at the default base kernel clas=
s
 KERNEL_BASE_CLASS =3D "kernel"
+
+# Tell the kernel class to install the DTBs in the same directory struct=
ure as
+# the kernel
+KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
+KERNEL_DTBVENDORED =3D "1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp=
/recipes-kernel/linux/ti-kernel.inc
index 40ddc4fd..ef4ba4a1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -1,8 +1,3 @@
-# Tell the kernel class to install the DTBs in the same directory struct=
ure as
-# the kernel.
-KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
-KERNEL_DTBVENDORED =3D "1"
-
 KERNEL_GIT_URI ?=3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kerne=
l.git"
 KERNEL_GIT_PROTOCOL ?=3D "https"
 KERNEL_GIT_BRANCH ?=3D "branch=3D${BRANCH}"
--=20
2.25.1


