Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.117203.1597949316444605880
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 11:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C63B240C26;
	Thu, 20 Aug 2020 18:48:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bG7O_ObdWBQN; Thu, 20 Aug 2020 18:48:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB1D840B2D;
	Thu, 20 Aug 2020 18:48:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 31958174467;
	Thu, 20 Aug 2020 14:48:34 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-rtos-metadata: expand compatibility to ti-soc, but deploy only k3 for now
Date: Thu, 20 Aug 2020 14:48:33 -0400
Message-Id: <1597949313-15907-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

This is needed for future support and to make CI prep step machine-agnostic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index d49d7d8..564a54e 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
-COMPATIBLE_MACHINE = "k3"
+COMPATIBLE_MACHINE = "ti-soc"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -34,6 +34,10 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 
 do_deploy () {
+	:
+}
+
+do_deploy_k3 () {
 	install -d ${DEPLOYDIR}
 	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
 }
-- 
2.7.4

