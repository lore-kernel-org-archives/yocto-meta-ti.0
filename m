Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD659D65C43
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 05:48:26 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.31209.1731563297657945829
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 21:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dMYvORbm;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-shenai@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5mHai2951499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:48:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731563297;
	bh=5OybEMMZUlrFaFzP28itPqzXNKuQ7w5JpNn7S+3vNaw=;
	h=From:To:CC:Subject:Date;
	b=dMYvORbmIk9qGHT9ihes1bL21rKlrbnAS/y9UzTH9cFJPNOkHL8Z9qp8NRadW546F
	 syh5KMq5o6WlhYCy8jS/gznqt9K49byQ7aUC+SKiwxl5WRMmNqHzg9g8EOBPSxlRUd
	 Xl+LKGijlIA6NJarbT+tSuGdMwmEQt1WrGTnYu7Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5mHol022653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:48:17 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 23:48:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 23:48:16 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5mEk2052367;
	Wed, 13 Nov 2024 23:48:15 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1] meta-ti: Linux configs: Bring selinux related configs
Date: Thu, 14 Nov 2024 11:18:08 +0530
Message-ID: <20241114054808.2945905-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 05:48:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18065

Kernel configs that are important for SELinux to be included in the
Linux kernel are present in the meta-selinux layer.

Ideally, we wouldn't want to be calling a file from another
layer since it would become messy. However, bringing those configs
into meta-ti layer would hit maintainbility issues.

The root cause of this problem lies in the recipe name. While
meta-selinux names their bbapend as linux_yocto_%.bbappend, TI has their
recipe named as linux-ti-staging_%.bb

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---
 .../linux/linux-ti-staging_%.bbappend             | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..460df5de
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,15 @@
+# The meta-selinux layer includes an selinux.cfg file containing
+# configs necessary for the Linux kernel to enable SELinux
+
+# In order to reduce maintainability issues, the file will 
+# be retained in meta-selinux layer
+
+FILESEXTRAPATHS:prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${TOPDIR}/../sources/meta-selinux/recipes-kernel/linux/files:', '', d)}"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)}"
+
+do_configure:append() {
+    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
+        cat ${WORKDIR}/selinux.cfg >> ${B}/.config
+    fi
+}
\ No newline at end of file
-- 
2.34.1


