Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1510.1639602667720199634
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2EDA940BEC
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8GxBsBs_Cnr for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2082C40C87
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8B7F617471C
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 04/11] videnc-test-app: Add the videnc-test-app recipe
Date: Wed, 15 Dec 2021 16:10:56 -0500
Message-Id: <1639602663-32787-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Sidraya <sidraya.bj@pathpartnertech.com>

The videnc-test-app provides the video encoder test app
(tienc_encode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb

diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
new file mode 100644
index 0000000..3bb5d74
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test applications for TI ENC (v4l2 encoder for IMG VXE384)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
+
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
+
+EXTRA_OEMAKE = "CC="${CC}""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
2.7.4

