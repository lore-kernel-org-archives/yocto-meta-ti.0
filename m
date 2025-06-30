Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C2C83037
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47585.1751306137429696058
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 10:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98A86407DA;
	Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWQBaxOZGrGt; Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7810240C7B;
	Mon, 30 Jun 2025 17:55:35 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A885716AFD8;
	Mon, 30 Jun 2025 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/6] ti-kernel-devicetree-prefix: use shared kernel sources for prefix match
Date: Mon, 30 Jun 2025 13:55:12 -0400
Message-Id: <20250630175516.1782298-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630175516.1782298-1-denis@denix.org>
References: <20250630175516.1782298-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 17:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18734

From: Denys Dmytriyenko <denys@konsulko.com>

Handle devicetree prefix matching inside the shared kernel sources
tree, instead of ${S}. From the kernel recipe perspective, ${S} is
just a symlink to the shared kernel sources. But since the new FIT
image wrapper is a separate recipe now, it has its own different
${S}. To enable FIT image wrapper to support devicetree prefix
matching, it also needs to access the same shared kernel sources.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/ti-kernel-devicetree-prefix.inc    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix=
.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
index 04c91004..2d7be280 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
@@ -1,4 +1,3 @@
-
 def get_dtbs_from_kernel(dts_dir, dts_prefix):
     import os
     import glob
@@ -36,7 +35,6 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
 KERNEL_DEVICETREE_DTBMERGE ?=3D ""
=20
 KERNEL_DEVICETREE =3D " \
-    ${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEV=
ICETREE_PREFIX}')} \
-    ${@get_merge_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERN=
EL_DEVICETREE_DTBMERGE}')} \
+    ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts=
/', '${KERNEL_DEVICETREE_PREFIX}')} \
+    ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/bo=
ot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
 "
-
--=20
2.25.1


