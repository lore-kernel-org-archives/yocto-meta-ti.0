Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A496E77183
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8519.1734132729145501537
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6C1F40CC7;
	Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZ0kdFw64IbV; Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF1D340CCC;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A046D164131;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 12/12] linux-bb.org_6.6: disable FORTIFY_SOURCE for now
Date: Fri, 13 Dec 2024 18:32:03 -0500
Message-Id: <20241213233203.2688541-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18116

From: Denys Dmytriyenko <denys@konsulko.com>

Rogue graphics driver 24.1 currently fails to build against the kernel
that enables FORTIFY_SOURCE, such as bb.org. Disable this config for now,
until the driver is fixed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
New patch since RFC v2

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
index bf8f8a24..c50802e4 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -66,3 +66,6 @@ PV:aarch64 =3D "6.6.58+git"
 BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r16"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
+
+SRC_URI +=3D "file://no-fortify.cfg"
+KERNEL_CONFIG_FRAGMENTS +=3D "${UNPACKDIR}/no-fortify.cfg"
--=20
2.25.1


