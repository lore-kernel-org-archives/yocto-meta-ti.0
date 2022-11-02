Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1086C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 22:16:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.12713.1667427395600598863
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 15:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB98B40C62;
	Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxJHrZZqBow6; Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 96D9240C76;
	Wed,  2 Nov 2022 22:16:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0A19516338C;
	Wed,  2 Nov 2022 18:16:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>
Subject: [dunfell][PATCH 2/2] ti-sci-fw: use getVar() to check if TI_SECURE_DEV_PKG_K3 is defined
Date: Wed,  2 Nov 2022 18:16:23 -0400
Message-Id: <1667427383-18305-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667427383-18305-1-git-send-email-denis@denix.org>
References: <1667427383-18305-1-git-send-email-denis@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Nov 2022 22:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15215

From: Denys Dmytriyenko <denys@konsulko.com>

Otherwise undefined variable is returned literally as ${TI_SECURE_DEV_PKG_K3}
and the condition won't work.

Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 866cd7b..e5dcdd6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -20,7 +20,7 @@ COMPATIBLE_MACHINE_aarch64 = "null"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TI_SECURE_DEV_PKG = "${@ '${TI_SECURE_DEV_PKG_K3}' or '${TI_K3_SECDEV_INSTALL_DIR}' }"
+TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_K3_SECDEV_INSTALL_DIR}' }"
 export TI_SECURE_DEV_PKG
 
 SYSFW_SOC ?= "unknown"
-- 
2.7.4


