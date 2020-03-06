Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.13922.1583507348084204037
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 07:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pnkOcvJ+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026F97dI109421;
	Fri, 6 Mar 2020 09:09:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583507347;
	bh=tnG7YtYJSH4CdVZEExlh6+W5kGfdVvfdhsTRm9muHkY=;
	h=From:To:CC:Subject:Date;
	b=pnkOcvJ+sTkfQ3jeDcnWMrxdDIEe1xbKqBa6WF+RCPtAhCDIWKpaOn+ZGP74jxe5H
	 FIPD0OSO+bfw6+QhICwuHFTrigv5cXn286zzQwu3BCJeGQl/RmHEL3cSOnZomMrHxE
	 cnG+HIDf5a+Ymgf8nJIhdd70NdKhhT72hKYye5HY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026F97kS104042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Mar 2020 09:09:07 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Mar
 2020 09:09:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Mar 2020 09:09:07 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 026F94vp031065;
	Fri, 6 Mar 2020 09:09:05 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v1] recipes-bsp: ivshmem-uio-tests: New recipe for ivshmem test apps
Date: Fri, 6 Mar 2020 20:38:53 +0530
Message-ID: <20200306150853.31928-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

uio_send and uio_read are the applications used for communication
between different Virtual Machines using the ivshmem protocol.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../ivshmem-uio/ivshmem-uio-tests_git.bb      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
new file mode 100644
index 00000000..997b8c48
--- /dev/null
+++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
@@ -0,0 +1,23 @@
+SUMMARY =  "UIO tests for IVSHMEM based UIO driver"
+DESCRIPTION = "Test programs which use UIO (userspace io) device for inter VM communication"
+HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
+
+inherit cmake
+
+PROTOCOL = "git"
+BRANCH = "jailhouse"
+SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
+SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git/uio/tests/Interrupts/VM"
+
+COMPATIBLE_MACHINE = "(ti-soc)"
+OECMAKE_TARGET_COMPILE = "uio_send uio_read"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 755 ${B}/uio_send ${D}/${bindir}/
+    install -m 755 ${B}/uio_read ${D}/${bindir}/
+}
-- 
2.17.1

