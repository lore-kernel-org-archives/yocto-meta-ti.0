Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48F8E77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.115501.1734554967754120098
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2412B40CB0;
	Wed, 18 Dec 2024 20:49:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR0ctjGhtMAB; Wed, 18 Dec 2024 20:49:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1276C40CC6;
	Wed, 18 Dec 2024 20:49:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CB2C216413F;
	Wed, 18 Dec 2024 15:49:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 12/13] linux-bb.org_6.6: disable FORTIFY_SOURCE for now
Date: Wed, 18 Dec 2024 15:49:22 -0500
Message-Id: <20241218204923.2601088-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218204923.2601088-1-denis@denix.org>
References: <20241218204923.2601088-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:49:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18134

From: Denys Dmytriyenko <denys@konsulko.com>

Rogue graphics driver 24.1 currently fails to build against the kernel
that enables FORTIFY_SOURCE, such as bb.org. Disable this config for now,
until the driver is fixed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg       | 1 +
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb           | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-=
fortify.cfg

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify=
.cfg b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
new file mode 100644
index 00000000..808f9519
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
@@ -0,0 +1 @@
+CONFIG_FORTIFY_SOURCE=3Dn
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index bf8f8a24..056142d9 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -66,3 +66,6 @@ PV:aarch64 =3D "6.6.58+git"
 BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r16"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
+
+SRC_URI +=3D "file://no-fortify.cfg"
+KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/no-fortify.cfg"
--=20
2.25.1


