Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4F9C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:46:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.13539.1751420780952114308
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 18:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E30440C85;
	Wed,  2 Jul 2025 01:46:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qXSulaJCImu; Wed,  2 Jul 2025 01:46:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44E8E40C8C;
	Wed,  2 Jul 2025 01:46:19 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9815816B1FC;
	Tue,  1 Jul 2025 21:46:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v2 3/6] ti-kernel-fitimage: extend default FIT image wrapper
Date: Tue,  1 Jul 2025 21:46:13 -0400
Message-Id: <20250702014616.100136-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702014616.100136-1-denis@denix.org>
References: <20250702014616.100136-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Jul 2025 01:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18755

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core provides default FIT image wrapper, but we need to extend it
with support for the dynamic devicetree prefix matching. While at it,
also use the correct kernel version from PKGV. Both of these use the
shared kernel sources tree, hence ensure it's available before any
processing.

Since old behavior was putting vendor subdir as a sanitized prefix
for each DTB entry as "ti_", U-boot expects corresponding config
entries to also contain the same - update conf prefix accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - set conf prefix to contain sanitized vendor subdir

 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.b=
b

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/met=
a-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
new file mode 100644
index 00000000..dae76387
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -0,0 +1,8 @@
+FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PKGV}/${MACHINE}"
+FIT_CONF_PREFIX ?=3D "conf-ti_"
+
+require recipes-kernel/linux/linux-yocto-fitimage.bb
+
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+
+do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
--=20
2.25.1


