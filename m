Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3077C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 22:16:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.12516.1667427395536350218
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 15:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AFB3E40C86;
	Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXBO0mKLCteu; Wed,  2 Nov 2022 22:16:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8ED7C40C62;
	Wed,  2 Nov 2022 22:16:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F15201621FF;
	Wed,  2 Nov 2022 18:16:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Andrew Davis <afd@ti.com>
Subject: [dunfell][PATCH 1/2] ti-k3-secdev: include ti-paths.inc
Date: Wed,  2 Nov 2022 18:16:22 -0400
Message-Id: <1667427383-18305-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667427383-18305-1-git-send-email-denis@denix.org>
References: <1667427383-18305-1-git-send-email-denis@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Nov 2022 22:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15216

From: Denys Dmytriyenko <denys@konsulko.com>

Include ti-paths.inc so TI_K3_SECDEV_INSTALL_DIR_RECIPE gets defined and
artifacts are installed in the correct location.

Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
index 28dbe9e..7196be9 100644
--- a/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,6 +4,8 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
 
+require recipes-ti/includes/ti-paths.inc
+
 # Native host tool only
 COMPATIBLE_MACHINE = "null"
 COMPATIBLE_MACHINE_class-native = "(.*)"
-- 
2.7.4


