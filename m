Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BC05E013F9
	for <meta-ti@yoctoproject.org>; Thu, 20 Sep 2012 20:58:53 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so3765530obb.35
	for <meta-ti@yoctoproject.org>; Thu, 20 Sep 2012 20:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5bGw3HyBYBj+aBYmqxnZWrHVd1eSvqL/sNnksHiJWoA=;
	b=C8eI9UvOO89nQfUmLmHdkw4WZS9yg5KPpBo7O5wENgY5wIriu2mbbfDXGyDlizAC0A
	JHJKFfuuMt8Kjo12rHDsIUprStKF+1j2RFvlqEfO6dFE38P5bDJwTOh7mOimZK/FMokQ
	a4Nhuv5ghknaM0G+OW41zTxVBuFdCFcVTR4wTFpF/KFNjNBrTehqAXAyZ4OzMNCpSGwI
	w4jyrIlGWE0qyauaTHqZN2KPP3tsd1QRSNnlMLyDvwIHheXGcCExdgW5+6C1nfEE3I3Y
	sdA9NRu/w9tO4fLCL9X/P0JbltREelXJpfOUx/MfJ/JLevLlLcA0eqmwSeru76zAqjde
	b0JA==
Received: by 10.60.13.41 with SMTP id e9mr3009975oec.15.1348199930189;
	Thu, 20 Sep 2012 20:58:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o4sm5555426oef.11.2012.09.20.20.58.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 20:58:49 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 20 Sep 2012 23:21:46 -0500
Message-Id: <1348201306-12756-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1348201306-12756-1-git-send-email-fcooper@ti.com>
References: <1348201306-12756-1-git-send-email-fcooper@ti.com>
Subject: [PATCH] u-boot_2011.09-psp04.06.00.08: Add the SDK released version of u-boot
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
X-List-Received-Date: Fri, 21 Sep 2012 03:58:53 -0000

* Add the official version of u-boot that is used by the Sitara SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb

diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
new file mode 100644
index 0000000..cbaff76
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
@@ -0,0 +1,29 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "ti33x|am37x-evm|am3517-evm|beagleboard"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "AM335XPSP_04.06.00.08"
+
+# Lock to the commit corresponding to TAG:
+# v2011.09_AM335xPSP_04.06.00.08
+SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"
-- 
1.7.0.4


