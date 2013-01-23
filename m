Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7051E014AE
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 05:23:24 -0800 (PST)
Received: by mail-oa0-f51.google.com with SMTP id n12so8488001oag.10
	for <meta-ti@yoctoproject.org>; Wed, 23 Jan 2013 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Z/HN4JigKadyys31r35TSxvptCFmqo7jbQxJmDwBdVs=;
	b=WNTXCAX7AYlk+7fTSUvrOgkNlOtbq7yQ0ywwMpXcnCJoz+Or4LPuS64ctv2TQsPPk4
	KfneWDamMkfjY1c85MI0okuofojVgylxe1Xk2utIHBvKsqyUUg2y9HU4aKmmxFr/xRIq
	IJVCN7OKnU2l8l+3iczdnwN6fMdcLEdc18sNDAIB9sRGXKbcAcoJz9Cn1yDXDaj89otX
	I9sEFgprJmawSHV04B4N2402KraSSkPqs3dzFtdZFfIKFrvnZPe3upDnyQTEKG7OAXOm
	JvBMPW0KWcmqT9Esu+j2zjxu8pCpCdYVI59iCPrmt0tCJKC4KoAlaoA5Ma3xYedeTCKY
	Fc+A==
X-Received: by 10.182.119.6 with SMTP id kq6mr882478obb.102.1358947404091;
	Wed, 23 Jan 2013 05:23:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y10sm15900999oeg.12.2013.01.23.05.23.21
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 05:23:22 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 23 Jan 2013 07:23:15 -0600
Message-Id: <1358947395-28420-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] multi-kernel.inc: Change variable from config -> alt_config
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
X-List-Received-Date: Wed, 23 Jan 2013 13:23:25 -0000

* Some where after the do_configure, kernel_do_compile, do_compile_kernelmodules
  and kernel_do_install inside of the compileconfigs task the variable config
  used in the for loop is set to an empty string.
* This results in the basename $config statements outputting a basename missing
  operand error which isn't a bitbake error but shows up in compileconfigs log.
* In the images directory you end up seeing similar files as below:
  config-am180x-evm..config ( should be config-am180x-evm.static.config)
  uImage-am180x-evm..bin ( should be uImage-am180x-evm.static.bin)
* This is due to basename $config returning "" instead of "static" when
  bitbaking linux-omapl138-psp_2.6.37.
* By simply renaming config to alt_config this issue is resolved.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/multi-kernel.inc |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index e5ebe56..52129ea 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -55,11 +55,11 @@ do_compileconfigs () {
       # Context Save the regular 'defconfig'
       cp ${WORKDIR}/defconfig ${WORKDIR}/defconfig.save
 
-      for config in ${WORKDIR}/configs/* ; do
+      for alt_config in ${WORKDIR}/configs/* ; do
 
         # Copy in alternative config
         cd ${S}
-        cp $config ${WORKDIR}/defconfig
+        cp $alt_config ${WORKDIR}/defconfig
 
         # Enable config to be viewed on the target
         echo "CONFIG_IKCONFIG=y" >> ${WORKDIR}/defconfig
@@ -73,23 +73,23 @@ do_compileconfigs () {
 
         # Drop the resulting images in the deploy dir
         install -d ${DEPLOY_DIR_IMAGE}
-        install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
+        install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).bin
 
         if [ -d "${D}/lib" ]; then
-            tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz -C ${D} lib
+            tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).tgz -C ${D} lib
         fi
  
         # Install the final config alongside the images
-        cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
+        cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).config
 
         # Create symlinks
         cd ${DEPLOY_DIR_IMAGE}
-        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
-        ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
-        rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
-        ln -sf ${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
-        rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
-        ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
+        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).bin
+        ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).bin
+        rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).tgz
+        ln -sf ${MODULES_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).tgz
+        rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).config
+        ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $alt_config).config
 
       done
 
-- 
1.7.0.4


