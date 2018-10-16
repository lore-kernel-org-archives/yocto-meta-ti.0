Return-Path: <jeremy@synack.me>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79112E00AC5; Mon, 15 Oct 2018 20:19:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1878E00A4F
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2018 20:19:14 -0700 (PDT)
Received: by mail-ed1-f68.google.com with SMTP id d15-v6so19820852edq.6
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2018 20:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synack.me; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=QKE2SYFnGXxHOeftwwbKQ//BVVCMfGiMiobx1k4ajhE=;
	b=SuoIE8FQVEypjHf6ed4dtd6BrXTvBwAAnLe9pwO9/WmTfxof6WPc+KEFf6te7RZI3w
	c/UarOOMERKkrre/EpABB0rkIozkqaEejhZ8nxySm6NIQ+SMb0LDIygVybGRe1CBwdrW
	QbUSUx1zup0UjrSKh5EGLTO74PZcCRt5LigeuLT/kIo3t5KODZaspnsOTxUO08DPkRmQ
	j4z0zjG5XPeKORZA0urIDNvF0RKqfZwmrDQYp6mz3aQcaDhG5V5c0uVEb+2Lv3PNsTxr
	EjI6O2j5OMAL2/drPEYlW9OKnFwEUoJopWy9q/YJB0QTntdvMJ4FwnuzFi1gCj0vAtUx
	X86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QKE2SYFnGXxHOeftwwbKQ//BVVCMfGiMiobx1k4ajhE=;
	b=UquliVxz9F+gszBJRWrDNJEXJmkl5bsmNd9uhg7C8R9S+WayUwbE8fUS242sK0OMy4
	rPo6ARQmPHhrQR25TTG2CUpJOUYpk9/I6kMLJEiU9nPJUPWuLwyYbf9H3w6TCngBFqWi
	HO1DN4Eyb0qj3VK9OiayY7b0ITYnsCIAq3t0nKHdy5/K175y3fIcJ8trFRkl6S3PyX7N
	cQp5qXZQCceDRQDITrbdGtZTJUMgut0hc7QtW/ZQieEQ3PAcgFw4myXQHpNp+bij8gev
	hlS7s3sJG+6tcqMTxJSGC5E7kI0WcWbOb4SQzYEtDD2VMU3RQ37iKm8CWYqy/ZHHCECx
	XaBw==
X-Gm-Message-State: ABuFfogb/xd0f2fCJSAHrcfiJSAUPOcIlUCxmWRRZzTdDxQbLlubepue
	fEubNrbqnhobGhoM+woawpbh03BDiOjvt/GEOxcWC55q
X-Google-Smtp-Source: ACcGV62CVaEmtT1FVUC49n1iYdmO4Dr4s09mZ/34sBnKCU7IVujTEDhfK3RlAAkrxw/ZJoLEnY9yl/KRGNXI1og056I=
X-Received: by 2002:a50:b84f:: with SMTP id
	k15-v6mr27369053ede.105.1539659953649; 
	Mon, 15 Oct 2018 20:19:13 -0700 (PDT)
MIME-Version: 1.0
From: Jeremy Grosser <jeremy@synack.me>
Date: Mon, 15 Oct 2018 20:19:02 -0700
Message-ID: <CANg34PkEbA1B1q+3dK4TWCHzg6RhPD6skB8bgCqWGU8VCUx1xw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: [PATCH] lego-ev3: Add support for LEGO Mindstorms EV3 (AM1808)
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
X-List-Received-Date: Tue, 16 Oct 2018 03:19:17 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Jeremy Grosser <jeremy@synack.me>
---
 conf/machine/lego-ev3.conf                    | 21 ++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc              |  2 ++
 recipes-kernel/linux/bundle-devicetree.inc    | 24 +++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.14.bb |  1 +
 4 files changed, 48 insertions(+)
 create mode 100644 conf/machine/lego-ev3.conf
 create mode 100644 recipes-kernel/linux/bundle-devicetree.inc

diff --git a/conf/machine/lego-ev3.conf b/conf/machine/lego-ev3.conf
new file mode 100644
index 00000000..18626001
--- /dev/null
+++ b/conf/machine/lego-ev3.conf
@@ -0,0 +1,21 @@
+#@TYPE: Machine
+#@NAME: LEGO Mindstorms EV3
+#@DESCRIPTION: Machine configuration for the LEGO Mindstorms EV3
+
+require conf/machine/include/davinci.inc
+require conf/machine/include/omapl138.inc
+
+UBOOT_MACHINE = "legoev3_config"
+UBOOT_SUFFIX = "bin"
+UBOOT_ENTRYPOINT = "0xC0008000"
+UBOOT_LOADADDRESS = "0xC0008000"
+
+KERNEL_DEVICETREE = "da850-lego-ev3.dtb"
+KERNEL_IMAGETYPES = "uImage"
+KERNEL_DEVICETREE_BUNDLE = "1"
+SERIAL_CONSOLE ?= "115200 ttyS1"
+
+IMAGE_FSTYPES += " wic"
+WKS_FILE = "sdimage-bootpart.wks"
+WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
+IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPES}"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f22fcb4d..aba5e90c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -57,12 +57,14 @@ SPL_BINARY_k2hk-hs-evm = ""
 SPL_BINARY_k2g-hs-evm = ""
 SPL_BINARY_k2l-hs-evm = ""
 SPL_BINARY_omapl138 = ""
+SPL_BINARY_lego-ev3 = ""
 SPL_BINARY_k3 = "tispl.bin"

 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY_keystone = ""
 SPL_UART_BINARY_k3 = ""
+SPL_UART_BINARY_lego-ev3 = ""

 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
diff --git a/recipes-kernel/linux/bundle-devicetree.inc
b/recipes-kernel/linux/bundle-devicetree.inc
new file mode 100644
index 00000000..ce159878
--- /dev/null
+++ b/recipes-kernel/linux/bundle-devicetree.inc
@@ -0,0 +1,24 @@
+# Upstream kernel-devicetree.bbclass only supports bundling the DTB with
+# zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so we
+# append the DTB to the final uImage here.
+
+do_deploy_append() {
+    for dtbf in ${KERNEL_DEVICETREE}; do
+        dtb=`normalize_dtb "$dtbf"`
+        dtb_ext=${dtb##*.}
+        dtb_base_name=`basename $dtb .$dtb_ext`
+        install -d ${DEPLOYDIR}
+        for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+            if [ "$type" = "uImage" ] && [
"${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+                cat ${D}/${KERNEL_IMAGEDEST}/$type \
+                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
+                    >
${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+                ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+
${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+                cat ${D}/${KERNEL_IMAGEDEST}/$type \
+                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
+                    > ${DEPLOYDIR}/$type
+            fi
+        done
+    done
+}
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb
b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 5ee206ec..13b94ffe 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -8,6 +8,7 @@ inherit kernel
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
+require recipes-kernel/linux/bundle-devicetree.inc

 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
--
2.19.1

