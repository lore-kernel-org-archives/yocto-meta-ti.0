Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F683C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:18:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.26466.1739391511738571147
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 12:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZKuiyzhZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CKIVuR3971621
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739391511;
	bh=2YbUeub2XUjEXeJkygmZDrSFnqwWRgOLwmgNs8+tUlo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZKuiyzhZymOitkMiF3rubHDCGxPyNDSjzzEZAjI+HDiRNl/P7P6AqF/QE3dl8A58d
	 4i41Hl+QcknSjH02Xel0JFWxnYUEavvOeJ7XeSufCmQhYwKsrO/21eQKMRSq6GVgVS
	 +2nX0uXjh7RwnGiNnCUO+ISRzCZfwtQzyZ/ECqEQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CKIUc9103430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 14:18:30 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 12 Feb
 2025 14:18:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 14:18:30 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CKIUdF049546
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 2/3] recipes-graphics : port gc320 libs to work on kernel 6.12
Date: Wed, 12 Feb 2025 14:18:29 -0600
Message-ID: <20250212201830.2090247-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212201830.2090247-1-a-christidis@ti.com>
References: <20250212201830.2090247-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 20:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18305

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

The user mode libraries needed recompiling with the scarthgap revision of gcc to
remove all the warning about 32bit API usage during the linking stage, New SRCREV
and branch includes this changes. Versions of the libraries remain the same.

Also, create custom package split logic. Old logic would place the symbolic link
to the new recompiled packages, in a package that would not be included in the
SDK. So, new logic makes sure the symbolic link is included in a package that
get included in the rootfs.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 807f421c..02b44355 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
 
 CLEANBROKEN = "1"
 
-BRANCH = "ti-${PV}"
+BRANCH = "ti-${PV}-scarthgap"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
+SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
 
 RRECOMMENDS:${PN} = "ti-gc320-driver"
 
@@ -41,6 +41,10 @@ EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir}"
 do_install() {
     oe_runmake install
     chown -R root:root ${D}
+    mkdir lib
 }
 
-INSANE_SKIP:${PN} += "ldflags"
+PACKAGES = "${PN}"
+FILES:${PN} = "${libdir} /usr/include"
+
+INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
-- 
2.34.1


