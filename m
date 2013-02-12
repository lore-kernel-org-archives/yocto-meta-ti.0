Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 2AA38E006C9
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:57 -0800 (PST)
Received: by mail-oa0-f52.google.com with SMTP id k14so7057766oag.11
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=iGqyfPYWjNll9AlE+HXhoTfxLTRkpmoqz2PnDFAYpGY=;
	b=djSZ+2Udh5WkP8z4eAgjKb5/bJtxK6waYOW97e71CwLJ7QDbxvkkk9KeSVI1YHzkyT
	cp5SngOZc4XrITYw29gKzl+V7Fds7p3WGfuIj87WZIFydRU4QFNXeApyszQQUotrkuwJ
	42trtIapaRyQ5HciWl1igp6Jviljg5QG6HwdZ7k8t5YxuYuul/lZSFAoMfogdhMUrjZl
	XTX5Pg96Tfm4cGZ0tU4HgYsmRHBMxZvUnKaHOCAmM/nIWe+Y+xOiLXpFgsQFTereP07V
	HIU05g0fdmPrT1eKEqu3HCc+SE4mdLXCHNyxPomrFufr0d5zDuCCKgcL0+NZFRrdsbh9
	cD3A==
X-Received: by 10.60.25.138 with SMTP id c10mr12292754oeg.12.1360631096475;
	Mon, 11 Feb 2013 17:04:56 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:55 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:39 -0600
Message-Id: <1360631082-29015-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360631082-29015-1-git-send-email-fcooper@ti.com>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 4/7] ti-pru-sw-edma-driver: Port PRU SW edma driver from Arago
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
X-List-Received-Date: Tue, 12 Feb 2013 01:04:57 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add PRU SW edma driver recipe for the omapl138 machines

* This recipe builds and installs an edma driver module that supports the
  edma user space libraries built by the ti-pru-sw-edma-library recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb |   32 ++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb

diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
new file mode 100644
index 0000000..c7fdfd1
--- /dev/null
+++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Builds eDMA module used by eDMA libraries for PRU sw example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://edmautils.c;beginline=1;endline=23;md5=312e9cb8a37a044c617c98a9e980ad1b"
+
+COMPATIBLE_MACHINE = "omapl138"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+SRCREV = "33"
+
+S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
+
+inherit module
+
+EXTRA_OEMAKE += "KERNEL_DIR='${STAGING_KERNEL_DIR}'"
+
+do_compile_prepend () {
+        export CCTOOL_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}"
+}
+
+do_install () {
+        install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
+        install -m 0755 ${S}/edmautils.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
+}
+
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"
-- 
1.7.0.4


