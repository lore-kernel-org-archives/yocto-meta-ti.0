Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F78C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:24:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.39257.1680211483015001735
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GMm8GBYA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOfCo033955;
	Thu, 30 Mar 2023 16:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680211481;
	bh=nu/t6ctT+iRtfu7j2eZEjvF1ZkCFBtS/SdFo7f8FlAc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GMm8GBYAgnT8fwWyjT6ULdscoZHRLq8v4nKo6zIB9tTOtTIV9CllCmWskk4GuEdFB
	 LqzM0ErpnF5nI8RL1kihAEpJYebWXwLza+YcJl94iCd4aBqQ46Nf8fRw/AksYCT0Sn
	 /tKo6X6z450ROfHSzGpDFJgu2la8jwNFRO8HR1Q0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULOfiw019263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:24:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:24:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:24:40 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOeqW081109;
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phzlA-00054c-LO; Thu, 30 Mar 2023 16:24:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 4/4] kernel-fitimage: Add signing of fitImage entries for 5.10 kernel
Date: Thu, 30 Mar 2023 16:24:40 -0500
Message-ID: <20230330212440.19437-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330212440.19437-1-reatmon@ti.com>
References: <20230330212440.19437-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16262

While we are mirgrating to kernel v6.1 and u-boot 2023.04, we want to
keep kernel 5.10 and u-boot 2021.01 "working" for anyone looking at
kirkstone.  One of the changes we are looking at changing is the signing
of entries in the fitImage.

To try and acheive a limited parity with dunfell while we work on the
migration, this creates a class that implements the logic that was in
dunfell and applies that class to the 5.10 kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../classes/kernel-fitimage-ti-u-boot.bbclass | 214 ++++++++++++++++++
 .../linux/linux-ti-staging_5.10.bb            |   2 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass

diff --git a/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass b/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
new file mode 100644
index 00000000..503c6d25
--- /dev/null
+++ b/meta-ti-bsp/classes/kernel-fitimage-ti-u-boot.bbclass
@@ -0,0 +1,214 @@
+
+inherit ti-secdev
+
+# The TI u-boot requires that the kernel image is signed.  To not overload the
+# entire kernel-fitimage.bbclass from oe-core, we just overwrite one function
+# and do the signing in there.
+
+#
+# Assemble fitImage
+#
+# $1 ... .its filename
+# $2 ... fitImage name
+# $3 ... include ramdisk
+fitimage_assemble() {
+	kernelcount=1
+	dtbcount=""
+	DTBS=""
+	ramdiskcount=$3
+	setupcount=""
+	bootscr_id=""
+	rm -f $1 arch/${ARCH}/boot/$2
+
+	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
+		bbfatal "Keys used to sign images and configuration nodes must be different."
+	fi
+
+	fitimage_emit_fit_header $1
+
+	#
+	# Step 1: Prepare a kernel image section.
+	#
+	fitimage_emit_section_maint $1 imagestart
+
+	uboot_prep_kimage
+	fitimage_ti_secure linux.bin linux.bin.sec
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin.sec "$linux_comp"
+
+	#
+	# Step 2: Prepare a DTB image section
+	#
+
+	if [ -n "${KERNEL_DEVICETREE}" ]; then
+		dtbcount=1
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo $DTB | grep -q '/dts/'; then
+				bbwarn "$DTB contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename $DTB | sed 's,\.dts$,.dtb,g'`
+			fi
+
+			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
+			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_DEVICETREE}/${DTB} ]; then
+				continue
+			fi
+
+			DTB_PATH="arch/${ARCH}/boot/dts/$DTB"
+			if [ ! -e "$DTB_PATH" ]; then
+				DTB_PATH="arch/${ARCH}/boot/$DTB"
+			fi
+
+			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
+			fitimage_ti_secure ${DTB_PATH} ${DTB_PATH}.sec
+
+            DTBS="$DTBS $DTB"
+			fitimage_emit_section_dtb $1 $DTB ${DTB_PATH}.sec
+		done
+	fi
+
+	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
+		dtbcount=1
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
+			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB/DTBO if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
+			fitimage_ti_secure ${EXTERNAL_KERNEL_DEVICETREE}/${DTB} ${EXTERNAL_KERNEL_DEVICETREE}/${DTB}.sec
+
+			DTBS="$DTBS $DTB"
+			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}.sec"
+		done
+	fi
+
+	#
+	# Step 3: Prepare a u-boot script section
+	#
+
+	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
+		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
+			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
+			bootscr_id="${UBOOT_ENV_BINARY}"
+			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
+		else
+			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
+		fi
+	fi
+
+	#
+	# Step 4: Prepare a setup section. (For x86)
+	#
+	if [ -e arch/${ARCH}/boot/setup.bin ]; then
+		setupcount=1
+		fitimage_emit_section_setup $1 $setupcount arch/${ARCH}/boot/setup.bin
+	fi
+
+	#
+	# Step 5: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+		# Find and use the first initramfs image archive type we find
+		found=
+		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			initramfs_local="usr/${INITRAMFS_IMAGE_NAME}.$img"
+			if [ -e "$initramfs_path" ]; then
+				bbnote "Found initramfs image: $initramfs_path"
+				found=true
+				fitimage_ti_secure ${initramfs_path} ${initramfs_local}.sec
+
+				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "${initramfs_local}.sec"
+				break
+			else
+				bbnote "Did not find initramfs image: $initramfs_path"
+			fi
+		done
+
+		if [ -z "$found" ]; then
+			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
+		fi
+	fi
+
+	fitimage_emit_section_maint $1 sectend
+
+	# Force the first Kernel and DTB in the default config
+	kernelcount=1
+	if [ -n "$dtbcount" ]; then
+		dtbcount=1
+	fi
+
+	#
+	# Step 6: Prepare a configurations section
+	#
+	fitimage_emit_section_maint $1 confstart
+
+	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
+	# more) to be added to the FIT image along with 0 or more device trees and
+	# 0 or 1 ramdisk.
+        # It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
+        # When the initramfs bundle is used ramdisk is disabled.
+	# If a device tree is to be part of the FIT image, then select
+	# the default configuration to be used is based on the dtbcount. If there is
+	# no dtb present than select the default configuation to be based on
+	# the kernelcount.
+	if [ -n "$DTBS" ]; then
+		i=1
+		for DTB in ${DTBS}; do
+			dtb_ext=${DTB##*.}
+			if [ "$dtb_ext" = "dtbo" ]; then
+				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`"
+			else
+				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`"
+			fi
+			i=`expr $i + 1`
+		done
+	else
+		defaultconfigcount=1
+		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount
+	fi
+
+	fitimage_emit_section_maint $1 sectend
+
+	fitimage_emit_section_maint $1 fitend
+
+	#
+	# Step 7: Assemble the image
+	#
+	${UBOOT_MKIMAGE} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f $1 \
+		arch/${ARCH}/boot/$2
+
+	#
+	# Step 8: Sign the image and add public key to U-Boot dtb
+	#
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
+		add_key_to_u_boot=""
+		if [ -n "${UBOOT_DTB_BINARY}" ]; then
+			# The u-boot.dtb is a symlink to UBOOT_DTB_IMAGE, so we need copy
+			# both of them, and don't dereference the symlink.
+			cp -P ${STAGING_DATADIR}/u-boot*.dtb ${B}
+			add_key_to_u_boot="-K ${B}/${UBOOT_DTB_BINARY}"
+		fi
+		${UBOOT_MKIMAGE_SIGN} \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			$add_key_to_u_boot \
+			-r arch/${ARCH}/boot/$2 \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
+	fi
+}
+
+fitimage_ti_secure() {
+	if test -n "${TI_SECURE_DEV_PKG}"; then
+		export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $1 $2
+	else
+		cp $1 $2
+	fi
+}
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index cc67188a..f3793baf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -3,6 +3,8 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
+KERNEL_CLASSES += "${@bb.utils.contains('TFA_PLATFORM', 'k3', 'kernel-fitimage-ti-u-boot', '', d)}"
+
 inherit kernel
 
 DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
-- 
2.17.1


