Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D6C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:36:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33613.1685295407853441869
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 May 2023 10:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25B6540A03;
	Sun, 28 May 2023 17:36:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1xQ2xxGgFNY; Sun, 28 May 2023 17:36:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0827F40C24;
	Sun, 28 May 2023 17:36:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 59E7B163929;
	Sun, 28 May 2023 13:36:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] kernel: setup-defconfig: do_configure depends on the value of KERNEL_LOCALVERSION
Date: Sun, 28 May 2023 17:36:42 +0000
Message-Id: <20230528173642.1074952-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230528173642.1074952-1-denis@denix.org>
References: <20230528173642.1074952-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 28 May 2023 17:36:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16616

From: Denys Dmytriyenko <denys@konsulko.com>

Explicitly mark do_configure as depending on the value of KERNEL_LOCALVER=
SION
variable. This is similar to the U-boot change submitted to OE-Core:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230528171515.8=
32179-1-denis@denix.org/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-=
ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index df7d9ac8..bbdf30a2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,7 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
 KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).replace('AUTOINC+'=
,'')[:10]}"
+do_configure[vardepvalue] =3D "${KERNEL_LOCALVERSION}"
=20
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
--=20
2.25.1


