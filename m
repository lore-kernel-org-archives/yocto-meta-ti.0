Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25A8C83036
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.47322.1751306137424704802
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 10:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A852A40C7B;
	Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSqe0zkBS3UI; Mon, 30 Jun 2025 17:55:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7982040C85;
	Mon, 30 Jun 2025 17:55:35 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C2B3116AFDD;
	Mon, 30 Jun 2025 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 5/6] kernel-fitimage-legacyhs: rename kernel-uboot class
Date: Mon, 30 Jun 2025 13:55:15 -0400
Message-Id: <20250630175516.1782298-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630175516.1782298-1-denis@denix.org>
References: <20250630175516.1782298-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 17:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18735

From: Denys Dmytriyenko <denys@konsulko.com>

Rename old snapshot of the kernel-uboot.bbclass to indicate it is
still being used by the FIT processing for the legacy HS devices.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass            | 2 +-
 ...l-uboot-deprecated.bbclass =3D> kernel-uboot-legacyhs.bbclass} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-ti-bsp/classes/{kernel-uboot-deprecated.bbclass =3D> kernel-=
uboot-legacyhs.bbclass} (100%)

diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-=
ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
index ca133457..558e8954 100644
--- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
@@ -1,4 +1,4 @@
-inherit ti-secdev kernel-uboot-deprecated uboot-sign-legacyhs
+inherit ti-secdev kernel-uboot-legacyhs uboot-sign-legacyhs
=20
 FITIMAGE_HASH_ALGO ?=3D "sha1"
 FITIMAGE_PACK_TEE ?=3D "0"
diff --git a/meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass b/meta-t=
i-bsp/classes/kernel-uboot-legacyhs.bbclass
similarity index 100%
rename from meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass
rename to meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass
--=20
2.25.1


