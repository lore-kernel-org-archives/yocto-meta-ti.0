Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 78E5EE00721
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:05:00 -0800 (PST)
Received: by mail-oa0-f50.google.com with SMTP id l20so7032939oag.9
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eMu1RFAx6wkqbGD0y4xa3OuDuU5KT94uQ2QJ4NvCFfk=;
	b=pK50E7k/Jl/xhPaQbIAL3othUvO4R7bjl9AgX81Zx7xfDp/2pBEvbPqfsqnEcAABMh
	HTdJ3rBqefL1FhJzvzhuE0q71FaNvoM2ETg7DNLVE5M1/QK4o3NcvoehQOmtJp9aV4Js
	ZNVSawJWsLV+u+if4UoRRE95BRf5jgfP/kCJPizo3Bjs/81X3mLkX7Ld0+zXgYJlozM9
	k07HjflOe/tRhriH7cxfogJEcaQcCh3XZcoAcS2UasqMkWT3p3ikl6J8CelbxWJvWJIf
	70c+dWd/nWxJQMThV5PvKwk9ftfSiuXDcwmG7fvtPlG3XvoE5nZqps7jKsQXdo5jfSpE
	WTWw==
X-Received: by 10.60.31.170 with SMTP id b10mr12118613oei.34.1360631099818;
	Mon, 11 Feb 2013 17:04:59 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:58 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:41 -0600
Message-Id: <1360631082-29015-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360631082-29015-1-git-send-email-fcooper@ti.com>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 6/7] ti-ocf-crypto-module: Port ti-ocf-crypto-module from Arago
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 01:05:00 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Recipe pulls in ti-ocf-crypto-module from gforge
* For am37x, this module allows access to the crypto hardware accelerators
  through OCF-Linux.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-ocf-crypto-module_1.0.bb                    |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb

diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
new file mode 100644
index 0000000..ece63d0
--- /dev/null
+++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Builds Crypto module used by OCF-Linux driver in OpenSSL example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/arm_crypto/"
+LICENSE = "BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=16;md5=acc0590f80e72fd64ad5c16cad8f4f76 \
+                    file://ocf_omap3_crypto.c;beginline=436;endline=438;md5=a52cad5c37c3aa3f27c6391552967304"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
+
+DEPENDS += "virtual/kernel"
+
+SRC_URI = "svn://gforge.ti.com/svn/arm_crypto/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+#gforge source revision
+SRCREV = "17"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+S = "${WORKDIR}/trunk"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
+
+do_compile_prepend () {
+    sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
+}
+
+do_install () {
+        install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+        install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+}
+
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/crypto/ocf/ocf_omap3_cryptok.ko"
-- 
1.7.0.4


