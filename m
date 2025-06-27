Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350B4C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 21:54:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2375.1751061284003835003
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 14:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A7A640CBF;
	Fri, 27 Jun 2025 21:54:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4vDKkdRcIAz; Fri, 27 Jun 2025 21:54:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2962740C37;
	Fri, 27 Jun 2025 21:54:42 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C724E16ADCC;
	Fri, 27 Jun 2025 17:54:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] Revert "meta-beagle: linux: Add INSANE_SKIP debug-deps"
Date: Fri, 27 Jun 2025 17:54:41 -0400
Message-Id: <20250627215441.2408098-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 21:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18728

From: Denys Dmytriyenko <denys@konsulko.com>

This reverts commit 3e0b29d2e6780d31b1100cc11329601d6c3a8139.

As debug-deps QA false-positives were recently fixed in OE-Core/master,
we no longer need these INSANE_SKIP.

https://git.openembedded.org/openembedded-core/commit/?id=3D1b85d84c736a0=
fa5cb27b8716ca37f181464c85a

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb  | 2 --
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb | 2 --
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
index 067c9ddf..16b4012c 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
@@ -66,5 +66,3 @@ PV:aarch64 =3D "6.1.83+git"
 BRANCH:aarch64 =3D "v6.1.83-ti-arm64-r64"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
-
-INSANE_SKIP:kernel-modules +=3D "debug-deps"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 6e221d1b..4146bfb4 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -66,5 +66,3 @@ PV:aarch64 =3D "6.12.22+git"
 BRANCH:aarch64 =3D "v6.12.22-ti-arm64-r35"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
-
-INSANE_SKIP:kernel-modules +=3D "debug-deps"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index cc7a56ac..3fcd5454 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -69,5 +69,3 @@ KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.=
git"
=20
 SRC_URI +=3D "file://no-fortify.cfg"
 KERNEL_CONFIG_FRAGMENTS +=3D "${UNPACKDIR}/no-fortify.cfg"
-
-INSANE_SKIP:kernel-modules +=3D "debug-deps"
--=20
2.25.1


