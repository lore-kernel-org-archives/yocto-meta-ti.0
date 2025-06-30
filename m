Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7260C83033
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47583.1751306137282697660
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 10:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DBEF40CC3;
	Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5Y94wO4GhXH; Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BD9840CBE;
	Mon, 30 Jun 2025 17:55:35 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AAA9216AFDB;
	Mon, 30 Jun 2025 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/6] ti-kernel-fitimage: extend default FIT image wrapper
Date: Mon, 30 Jun 2025 13:55:13 -0400
Message-Id: <20250630175516.1782298-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630175516.1782298-1-denis@denix.org>
References: <20250630175516.1782298-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 17:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18732

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core provides default FIT image wrapper, but we need to extend it
with support for the dynamic devicetree prefix matching. While at it,
also use the correct kernel version from PKGV. Both of these use the
shared kernel sources tree, hence ensure it's available before any
processing.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.b=
b

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/met=
a-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
new file mode 100644
index 00000000..d22f992c
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -0,0 +1,7 @@
+FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PKGV}/${MACHINE}"
+
+require recipes-kernel/linux/linux-yocto-fitimage.bb
+
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+
+do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
--=20
2.25.1


