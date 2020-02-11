Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.18214.1581462379770931707
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 15:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69AE2E0167C; Tue, 11 Feb 2020 15:06:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DCD2E0167C
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2020 15:06:18 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B561140BCC;
	Tue, 11 Feb 2020 23:06:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQx3vWsPfo72; Tue, 11 Feb 2020 23:06:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A25FE40A10;
	Tue, 11 Feb 2020 23:06:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C4AFD1743FA;
	Tue, 11 Feb 2020 18:06:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 1/2] multiprocmgr-test: also do not access kernel headers directly
Date: Tue, 11 Feb 2020 18:06:14 -0500
Message-Id: <1581462375-22359-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index f01d651..aab8ae6 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -1,18 +1,20 @@
-DESCRIPTION = "TI Multiproc Manager test code"
+FILESEXTRAPATHS_prepend := "${THISDIR}/multiprocmgr:"
+
+SUMMARY = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
+SRC_URI += " \
+	file://0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch \
+	file://0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch \
+"
+
 PR = "${INC_PR}.2"
 
 DEPENDS = "multiprocmgr cmem"
 RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
 RDEPENDS_${PN} += "multiprocmgr-rtos-test bash"
 
-CC += "-I${STAGING_KERNEL_DIR}/include"
-
-# Assuming the multiprocmgr kernel API is safe
-CC[vardepsexclude] = "STAGING_KERNEL_DIR"
-
 FILES_${PN} += "\
     ${datadir}/ti/examples/mpm \
 "
-- 
2.7.4

