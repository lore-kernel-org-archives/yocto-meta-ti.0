Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D0DC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:46:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13492.1751420783075925371
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 18:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7772340C85;
	Wed,  2 Jul 2025 01:46:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFETiTpUoHpO; Wed,  2 Jul 2025 01:46:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D46840ACD;
	Wed,  2 Jul 2025 01:46:20 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B730E16B1FF;
	Tue,  1 Jul 2025 21:46:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH v2 6/6] classes: remove unused snapshots of FIT image classes
Date: Tue,  1 Jul 2025 21:46:16 -0400
Message-Id: <20250702014616.100136-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702014616.100136-1-denis@denix.org>
References: <20250702014616.100136-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Jul 2025 01:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18759

From: Denys Dmytriyenko <denys@konsulko.com>

Remove no longer used snapshots of the kernel and kernel-fitimage
classes that were used for the old FIT image processing.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - no changes

 .../kernel-fitimage-deprecated.bbclass        | 839 -----------------
 meta-ti-bsp/classes/kernel_deprecated.bbclass | 869 ------------------
 2 files changed, 1708 deletions(-)
 delete mode 100644 meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclas=
s
 delete mode 100644 meta-ti-bsp/classes/kernel_deprecated.bbclass

diff --git a/meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass b/met=
a-ti-bsp/classes/kernel-fitimage-deprecated.bbclass
deleted file mode 100644
index b1705818..00000000
--- a/meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass
+++ /dev/null
@@ -1,839 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit kernel-uboot-deprecated kernel-artifact-names uboot-config
-require conf/image-fitimage.conf
-
-def get_fit_replacement_type(d):
-    kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
-    replacementtype =3D ""
-    if 'fitImage' in kerneltypes.split():
-        uarch =3D d.getVar("UBOOT_ARCH")
-        if uarch =3D=3D "arm64":
-            replacementtype =3D "Image"
-        elif uarch =3D=3D "riscv":
-            replacementtype =3D "Image"
-        elif uarch =3D=3D "mips":
-            replacementtype =3D "vmlinuz.bin"
-        elif uarch =3D=3D "x86":
-            replacementtype =3D "bzImage"
-        elif uarch =3D=3D "microblaze":
-            replacementtype =3D "linux.bin"
-        else:
-            replacementtype =3D "zImage"
-    return replacementtype
-
-KERNEL_IMAGETYPE_REPLACEMENT ?=3D "${@get_fit_replacement_type(d)}"
-DEPENDS:append =3D " ${@'u-boot-tools-native dtc-native' if 'fitImage' i=
n (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
-
-python __anonymous () {
-    # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-    # to kernel.bbclass . We have to override it, since we pack zImage
-    # (at least for now) into the fitImage .
-    typeformake =3D d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-    if 'fitImage' in typeformake.split():
-        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitIm=
age', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
-
-    image =3D d.getVar('INITRAMFS_IMAGE')
-    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDL=
E')):
-        if d.getVar('INITRAMFS_MULTICONFIG'):
-            mc =3D d.getVar('BB_CURRENT_MC')
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends=
', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_c=
omplete')
-        else:
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',=
 ' ${INITRAMFS_IMAGE}:do_image_complete')
-
-    #check if there are any dtb providers
-    providerdtb =3D d.getVar("PREFERRED_PROVIDER_virtual/dtb")
-    if providerdtb:
-        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb=
:do_populate_sysroot')
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' v=
irtual/dtb:do_populate_sysroot')
-        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/d=
evicetree")
-}
-
-#
-# Emit the fitImage ITS header
-#
-# $1 ... .its filename
-fitimage_emit_fit_header() {
-	cat << EOF >> $1
-/dts-v1/;
-
-/ {
-        description =3D "${FIT_DESC}";
-        #address-cells =3D <${FIT_ADDRESS_CELLS}>;
-EOF
-}
-
-#
-# Emit the fitImage section bits
-#
-# $1 ... .its filename
-# $2 ... Section bit type: imagestart - image section start
-#                          confstart  - configuration section start
-#                          sectend    - section end
-#                          fitend     - fitimage end
-#
-fitimage_emit_section_maint() {
-	case $2 in
-	imagestart)
-		cat << EOF >> $1
-
-        images {
-EOF
-	;;
-	confstart)
-		cat << EOF >> $1
-
-        configurations {
-EOF
-	;;
-	sectend)
-		cat << EOF >> $1
-	};
-EOF
-	;;
-	fitend)
-		cat << EOF >> $1
-};
-EOF
-	;;
-	esac
-}
-
-#
-# Emit the fitImage ITS kernel section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to kernel image
-# $4 ... Compression type
-fitimage_emit_section_kernel() {
-
-	kernel_csum=3D"${FIT_HASH_ALG}"
-	kernel_sign_algo=3D"${FIT_SIGN_ALG}"
-	kernel_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-	ENTRYPOINT=3D"${UBOOT_ENTRYPOINT}"
-	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-		ENTRYPOINT=3D`${HOST_PREFIX}nm vmlinux | \
-			awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
-	fi
-
-	cat << EOF >> $1
-                kernel-$2 {
-                        description =3D "Linux kernel";
-                        data =3D /incbin/("$3");
-                        type =3D "${UBOOT_MKIMAGE_KERNEL_TYPE}";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "$4";
-                        load =3D <${UBOOT_LOADADDRESS}>;
-                        entry =3D <$ENTRYPOINT>;
-                        hash-1 {
-                                algo =3D "$kernel_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$kernel_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$kernel_csum,$kernel_sign_algo=
";
-                                key-name-hint =3D "$kernel_sign_keyname"=
;
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS DTB section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to DTB image
-fitimage_emit_section_dtb() {
-
-	dtb_csum=3D"${FIT_HASH_ALG}"
-	dtb_sign_algo=3D"${FIT_SIGN_ALG}"
-	dtb_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-	dtb_loadline=3D""
-	dtb_ext=3D${DTB##*.}
-	if [ "${dtb_ext}" =3D "dtbo" ]; then
-		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
-			dtb_loadline=3D"load =3D <${UBOOT_DTBO_LOADADDRESS}>;"
-		fi
-	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
-		dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
-	fi
-	cat << EOF >> $1
-                fdt-$2 {
-                        description =3D "Flattened Device Tree blob";
-                        data =3D /incbin/("$3");
-                        type =3D "flat_dt";
-                        arch =3D "${UBOOT_ARCH}";
-                        compression =3D "none";
-                        $dtb_loadline
-                        hash-1 {
-                                algo =3D "$dtb_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$dtb_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$dtb_csum,$dtb_sign_algo";
-                                key-name-hint =3D "$dtb_sign_keyname";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS u-boot script section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to boot script image
-fitimage_emit_section_boot_script() {
-
-	bootscr_csum=3D"${FIT_HASH_ALG}"
-	bootscr_sign_algo=3D"${FIT_SIGN_ALG}"
-	bootscr_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-        cat << EOF >> $1
-                bootscr-$2 {
-                        description =3D "U-boot script";
-                        data =3D /incbin/("$3");
-                        type =3D "script";
-                        arch =3D "${UBOOT_ARCH}";
-                        compression =3D "none";
-                        hash-1 {
-                                algo =3D "$bootscr_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$bootscr_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$bootscr_csum,$bootscr_sign_al=
go";
-                                key-name-hint =3D "$bootscr_sign_keyname=
";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS setup section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to setup image
-fitimage_emit_section_setup() {
-
-	setup_csum=3D"${FIT_HASH_ALG}"
-	setup_sign_algo=3D"${FIT_SIGN_ALG}"
-	setup_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-	cat << EOF >> $1
-                setup-$2 {
-                        description =3D "Linux setup.bin";
-                        data =3D /incbin/("$3");
-                        type =3D "x86_setup";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "none";
-                        load =3D <0x00090000>;
-                        entry =3D <0x00090000>;
-                        hash-1 {
-                                algo =3D "$setup_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$setup_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$setup_csum,$setup_sign_algo";
-                                key-name-hint =3D "$setup_sign_keyname";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS ramdisk section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to ramdisk image
-fitimage_emit_section_ramdisk() {
-
-	ramdisk_csum=3D"${FIT_HASH_ALG}"
-	ramdisk_sign_algo=3D"${FIT_SIGN_ALG}"
-	ramdisk_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-	ramdisk_loadline=3D""
-	ramdisk_entryline=3D""
-
-	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
-		ramdisk_loadline=3D"load =3D <${UBOOT_RD_LOADADDRESS}>;"
-	fi
-	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
-		ramdisk_entryline=3D"entry =3D <${UBOOT_RD_ENTRYPOINT}>;"
-	fi
-
-	cat << EOF >> $1
-                ramdisk-$2 {
-                        description =3D "${INITRAMFS_IMAGE}";
-                        data =3D /incbin/("$3");
-                        type =3D "ramdisk";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "none";
-                        $ramdisk_loadline
-                        $ramdisk_entryline
-                        hash-1 {
-                                algo =3D "$ramdisk_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$ramdisk_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$ramdisk_csum,$ramdisk_sign_al=
go";
-                                key-name-hint =3D "$ramdisk_sign_keyname=
";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# echoes symlink destination if it points below directory
-#
-# $1 ... file that's a potential symlink
-# $2 ... expected parent directory
-symlink_points_below() {
-	file=3D"$2/$1"
-	dir=3D$2
-
-	if ! [ -L "$file" ]; then
-		return
-	fi
-
-	realpath=3D"$(realpath --relative-to=3D$dir $file)"
-	if [ -z "${realpath%%../*}" ]; then
-		return
-	fi
-
-	echo "$realpath"
-}
-
-#
-# Emit the fitImage ITS configuration section
-#
-# $1 ... .its filename
-# $2 ... Linux kernel ID
-# $3 ... DTB image name
-# $4 ... ramdisk ID
-# $5 ... u-boot script ID
-# $6 ... config ID
-# $7 ... default flag
-# $8 ... default DTB image name
-fitimage_emit_section_config() {
-
-	conf_csum=3D"${FIT_HASH_ALG}"
-	conf_sign_algo=3D"${FIT_SIGN_ALG}"
-	conf_padding_algo=3D"${FIT_PAD_ALG}"
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
-		conf_sign_keyname=3D"${UBOOT_SIGN_KEYNAME}"
-	fi
-
-	its_file=3D"$1"
-	kernel_id=3D"$2"
-	dtb_image=3D"$3"
-	ramdisk_id=3D"$4"
-	bootscr_id=3D"$5"
-	config_id=3D"$6"
-	default_flag=3D"$7"
-	default_dtb_image=3D"$8"
-
-	# Test if we have any DTBs at all
-	sep=3D""
-	conf_desc=3D""
-	conf_node=3D"${FIT_CONF_PREFIX}"
-	kernel_line=3D""
-	fdt_line=3D""
-	ramdisk_line=3D""
-	bootscr_line=3D""
-	setup_line=3D""
-	default_line=3D""
-	compatible_line=3D""
-
-	dtb_image_sect=3D$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_D=
EVICETREE}")
-	if [ -z "$dtb_image_sect" ]; then
-		dtb_image_sect=3D$dtb_image
-	fi
-
-	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
-		compat=3D$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
-		if [ -n "$compat" ]; then
-			compatible_line=3D"compatible =3D \"$compat\";"
-		fi
-	fi
-
-	dtb_image=3D$(echo $dtb_image | tr '/' '_')
-	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
-
-	# conf node name is selected based on dtb ID if it is present,
-	# otherwise its selected based on kernel ID
-	if [ -n "$dtb_image" ]; then
-		conf_node=3D$conf_node$dtb_image
-	else
-		conf_node=3D$conf_node$kernel_id
-	fi
-
-	if [ -n "$kernel_id" ]; then
-		conf_desc=3D"Linux kernel"
-		sep=3D", "
-		kernel_line=3D"kernel =3D \"kernel-$kernel_id\";"
-	fi
-
-	if [ -n "$dtb_image" ]; then
-		conf_desc=3D"$conf_desc${sep}FDT blob"
-		sep=3D", "
-		fdt_line=3D"fdt =3D \"fdt-$dtb_image_sect\";"
-	fi
-
-	if [ -n "$ramdisk_id" ]; then
-		conf_desc=3D"$conf_desc${sep}ramdisk"
-		sep=3D", "
-		ramdisk_line=3D"ramdisk =3D \"ramdisk-$ramdisk_id\";"
-	fi
-
-	if [ -n "$bootscr_id" ]; then
-		conf_desc=3D"$conf_desc${sep}u-boot script"
-		sep=3D", "
-		bootscr_line=3D"bootscr =3D \"bootscr-$bootscr_id\";"
-	fi
-
-	if [ -n "$config_id" ]; then
-		conf_desc=3D"$conf_desc${sep}setup"
-		setup_line=3D"setup =3D \"setup-$config_id\";"
-	fi
-
-	if [ "$default_flag" =3D "1" ]; then
-		# default node is selected based on dtb ID if it is present,
-		# otherwise its selected based on kernel ID
-		if [ -n "$dtb_image" ]; then
-			# Select default node as user specified dtb when
-			# multiple dtb exists.
-			if [ -n "$default_dtb_image" ]; then
-				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$default_dtb_image\"=
;"
-			else
-				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
-			fi
-		else
-			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
-		fi
-	fi
-
-	cat << EOF >> $its_file
-                $default_line
-                $conf_node {
-                        description =3D "$default_flag $conf_desc";
-                        $compatible_line
-                        $kernel_line
-                        $fdt_line
-                        $ramdisk_line
-                        $bootscr_line
-                        $setup_line
-                        hash-1 {
-                                algo =3D "$conf_csum";
-                        };
-EOF
-
-	if [ -n "$conf_sign_keyname" ] ; then
-
-		sign_line=3D"sign-images =3D "
-		sep=3D""
-
-		if [ -n "$kernel_id" ]; then
-			sign_line=3D"$sign_line${sep}\"kernel\""
-			sep=3D", "
-		fi
-
-		if [ -n "$dtb_image" ]; then
-			sign_line=3D"$sign_line${sep}\"fdt\""
-			sep=3D", "
-		fi
-
-		if [ -n "$ramdisk_id" ]; then
-			sign_line=3D"$sign_line${sep}\"ramdisk\""
-			sep=3D", "
-		fi
-
-		if [ -n "$bootscr_id" ]; then
-			sign_line=3D"$sign_line${sep}\"bootscr\""
-			sep=3D", "
-		fi
-
-		if [ -n "$config_id" ]; then
-			sign_line=3D"$sign_line${sep}\"setup\""
-		fi
-
-		sign_line=3D"$sign_line;"
-
-		cat << EOF >> $its_file
-                        signature-1 {
-                                algo =3D "$conf_csum,$conf_sign_algo";
-                                key-name-hint =3D "$conf_sign_keyname";
-                                padding =3D "$conf_padding_algo";
-                                $sign_line
-                        };
-EOF
-	fi
-
-	cat << EOF >> $its_file
-                };
-EOF
-}
-
-#
-# Assemble fitImage
-#
-# $1 ... .its filename
-# $2 ... fitImage name
-# $3 ... include ramdisk
-fitimage_assemble() {
-	kernelcount=3D1
-	dtbcount=3D""
-	DTBS=3D""
-	ramdiskcount=3D$3
-	setupcount=3D""
-	bootscr_id=3D""
-	default_dtb_image=3D""
-	rm -f $1 arch/${ARCH}/boot/$2
-
-	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" =3D "${U=
BOOT_SIGN_IMG_KEYNAME}" ]; then
-		bbfatal "Keys used to sign images and configuration nodes must be diff=
erent."
-	fi
-
-	fitimage_emit_fit_header $1
-
-	#
-	# Step 1: Prepare a kernel image section.
-	#
-	fitimage_emit_section_maint $1 imagestart
-
-	uboot_prep_kimage
-	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
-
-	#
-	# Step 2: Prepare a DTB image section
-	#
-
-	if [ -n "${KERNEL_DEVICETREE}" ]; then
-		dtbcount=3D1
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo $DTB | grep -q '/dts/'; then
-				bbwarn "$DTB contains the full path to the the dts file, but only th=
e dtb name should be used."
-				DTB=3D`basename $DTB | sed 's,\.dts$,.dtb,g'`
-			fi
-
-			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
-			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_D=
EVICETREE}/${DTB} ]; then
-				continue
-			fi
-
-			DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/dts/$DTB"
-			if [ ! -e "$DTB_PATH" ]; then
-				DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/$DTB"
-			fi
-
-			# Strip off the path component from the filename
-			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) el=
se 'true'}"; then
-				DTB=3D`basename $DTB`
-			fi
-
-			# Set the default dtb image if it exists in the devicetree.
-			if [ "${FIT_CONF_DEFAULT_DTB}" =3D "$DTB" ];then
-				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=3D$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS=3D"$DTBS $DTB"
-			DTB=3D$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
-		done
-	fi
-
-	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
-		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -print=
f '%P\n' | sort) \
-		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' |=
 sort); do
-			# Set the default dtb image if it exists in the devicetree.
-			if [ ${FIT_CONF_DEFAULT_DTB} =3D $DTB ];then
-				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=3D$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB/DTBO if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS=3D"$DTBS $DTB"
-
-			# Also skip if a symlink. We'll later have each config section point =
at it
-			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && c=
ontinue
-
-			DTB=3D$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB=
"
-		done
-	fi
-
-	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then=20
-		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device=
 trees."
-	fi
-
-	#
-	# Step 3: Prepare a u-boot script section
-	#
-
-	if [ -n "${FIT_UBOOT_ENV}" ]; then
-		cp ${UNPACKDIR}/${FIT_UBOOT_ENV} ${B}
-		bootscr_id=3D"${FIT_UBOOT_ENV}"
-		fitimage_emit_section_boot_script $1 "$bootscr_id" ${FIT_UBOOT_ENV}
-	fi
-
-	#
-	# Step 4: Prepare a setup section. (For x86)
-	#
-	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
-		setupcount=3D1
-		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.=
bin
-	fi
-
-	#
-	# Step 5: Prepare a ramdisk section.
-	#
-	if [ "x${ramdiskcount}" =3D "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ]; then
-		# Find and use the first initramfs image archive type we find
-		found=3D
-		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path=3D"${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAM=
E}.$img"
-			if [ -e "$initramfs_path" ]; then
-				bbnote "Found initramfs image: $initramfs_path"
-				found=3Dtrue
-				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
-				break
-			else
-				bbnote "Did not find initramfs image: $initramfs_path"
-			fi
-		done
-
-		if [ -z "$found" ]; then
-			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_=
NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
-		fi
-	fi
-
-	fitimage_emit_section_maint $1 sectend
-
-	# Force the first Kernel and DTB in the default config
-	kernelcount=3D1
-	if [ -n "$dtbcount" ]; then
-		dtbcount=3D1
-	fi
-
-	#
-	# Step 6: Prepare a configurations section
-	#
-	fitimage_emit_section_maint $1 confstart
-
-	# kernel-fitimage.bbclass currently only supports a single kernel (no l=
ess or
-	# more) to be added to the FIT image along with 0 or more device trees =
and
-	# 0 or 1 ramdisk.
-	# It is also possible to include an initramfs bundle (kernel and rootfs=
 in one binary)
-	# When the initramfs bundle is used ramdisk is disabled.
-	# If a device tree is to be part of the FIT image, then select
-	# the default configuration to be used is based on the dtbcount. If the=
re is
-	# no dtb present than select the default configuation to be based on
-	# the kernelcount.
-	if [ -n "$DTBS" ]; then
-		i=3D1
-		for DTB in ${DTBS}; do
-			dtb_ext=3D${DTB##*.}
-			if [ "$dtb_ext" =3D "dtbo" ]; then
-				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr=
 $i =3D $dtbcount`" "$default_dtb_image"
-			else
-				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" =
"$bootscr_id" "$setupcount" "`expr $i =3D $dtbcount`" "$default_dtb_image=
"
-			fi
-			i=3D`expr $i + 1`
-		done
-	else
-		defaultconfigcount=3D1
-		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$boot=
scr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
-	fi
-
-	fitimage_emit_section_maint $1 sectend
-
-	fitimage_emit_section_maint $1 fitend
-
-	#
-	# Step 7: Assemble the image
-	#
-	${UBOOT_MKIMAGE} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') =
else ''} \
-		-f $1 \
-		${KERNEL_OUTPUT_DIR}/$2
-
-	#
-	# Step 8: Sign the image
-	#
-	if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
-		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')=
 else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-r ${KERNEL_OUTPUT_DIR}/$2 \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
-	fi
-}
-
-do_assemble_fitimage() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		cd ${B}
-		fitimage_assemble fit-image.its fitImage-none ""
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
-			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
-		fi
-	fi
-}
-
-addtask assemble_fitimage before do_install after do_compile
-
-SYSROOT_DIRS:append =3D " /sysroot-only"
-do_install:append() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		[ "${UBOOT_SIGN_ENABLE}" =3D "1" ]; then
-		install -D ${B}/${KERNEL_OUTPUT_DIR}/fitImage-none ${D}/sysroot-only/f=
itImage
-	fi
-}
-
-do_assemble_fitimage_initramfs() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
-		cd ${B}
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
-			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
-		else
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAM=
FS_IMAGE} 1
-		fi
-	fi
-}
-
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_ini=
tramfs
-
-do_kernel_generate_rsa_keys() {
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "0" ] && [ "${FIT_GENERATE_KEYS}" =3D "=
1" ]; then
-		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is=
 set to 0. The keys will not be generated as they won't be used."
-	fi
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] && [ "${FIT_GENERATE_KEYS}" =3D "=
1" ]; then
-
-		# Generate keys to sign configuration nodes, only if they don't alread=
y exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
-		fi
-
-		# Generate keys to sign image nodes, only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
-		fi
-	fi
-}
-
-addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_co=
mpile
-
-kernel_deprecated_do_deploy[vardepsexclude] =3D "DATETIME"
-kernel_deprecated_do_deploy:append() {
-	# Update deploy directory
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
-			bbnote "Copying fit-image.its source file..."
-			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_=
FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its=
-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			bbnote "Copying linux.bin file..."
-			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL=
_FIT_NAME}${KERNEL_FIT_BIN_EXT}
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "=
$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
-			fi
-		fi
-
-		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fit=
Image-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
-			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its =
"$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-			fi
-
-			if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
-				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
-				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE=
} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL=
_FIT_BIN_EXT}"
-				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL=
_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_L=
INK_NAME}"
-				fi
-			fi
-		fi
-	fi
-}
diff --git a/meta-ti-bsp/classes/kernel_deprecated.bbclass b/meta-ti-bsp/=
classes/kernel_deprecated.bbclass
deleted file mode 100644
index 328a08fd..00000000
--- a/meta-ti-bsp/classes/kernel_deprecated.bbclass
+++ /dev/null
@@ -1,869 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit linux-kernel-base kernel-module-split
-
-COMPATIBLE_HOST =3D ".*-linux"
-
-KERNEL_PACKAGE_NAME ??=3D "kernel"
-KERNEL_DEPLOYSUBDIR ??=3D "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") =3D=
=3D "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
-
-PROVIDES +=3D "virtual/kernel"
-DEPENDS +=3D "virtual/cross-binutils virtual/cross-cc kmod-native bc-nat=
ive bison-native"
-DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzo=
p-native", "", d)}"
-DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4=
-native", "", d)}"
-DEPENDS +=3D "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zst=
d-native", "", d)}"
-PACKAGE_WRITE_DEPS +=3D "depmodwrapper-cross"
-
-do_deploy[depends] +=3D "depmodwrapper-cross:do_populate_sysroot gzip-na=
tive:do_populate_sysroot"
-do_clean[depends] +=3D "make-mod-scripts:do_clean"
-
-# CPE entries from NVD use linux_kernel, but the raw CVE entries from th=
e kernel CNA have
-# vendor: linux and product: linux. Note that multiple distributions use=
 "linux" as a product
-# name, so we need to fill vendor to avoid false positives
-CVE_PRODUCT ?=3D "linux_kernel linux:linux"
-
-S =3D "${STAGING_KERNEL_DIR}"
-B =3D "${WORKDIR}/build"
-KBUILD_OUTPUT =3D "${B}"
-OE_TERMINAL_EXPORTS +=3D "KBUILD_OUTPUT"
-
-# we include gcc above, we dont need virtual/libc
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-KERNEL_IMAGETYPE ?=3D "zImage"
-INITRAMFS_IMAGE ?=3D ""
-INITRAMFS_TASK ?=3D ""
-INITRAMFS_IMAGE_BUNDLE ?=3D ""
-INITRAMFS_DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR_IMAGE}"
-INITRAMFS_MULTICONFIG ?=3D ""
-
-# KERNEL_VERSION is extracted from source code. It is evaluated as
-# None for the first parsing, since the code has not been fetched.
-# After the code is fetched, it will be evaluated as real version
-# number and cause kernel to be rebuilt. To avoid this, make
-# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
-# LINUX_VERSION which is a constant.
-KERNEL_VERSION_NAME =3D "${@d.getVar('KERNEL_VERSION') or ""}"
-KERNEL_VERSION_NAME[vardepvalue] =3D "${LINUX_VERSION}"
-KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_name(d.getVar('KERNEL=
_VERSION'))}"
-KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
-
-python __anonymous () {
-    pn =3D d.getVar("PN")
-    kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
-
-    # XXX Remove this after bug 11905 is resolved
-    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
-    if kpn =3D=3D pn:
-        bb.warn("Some packages (E.g. *-dev) might be missing due to "
-                "bug 11905 (variable KERNEL_PACKAGE_NAME =3D=3D PN)")
-
-    # The default kernel recipe builds in a shared location defined by
-    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDD=
IR.
-    # Set these variables to directories under ${WORKDIR} in alternate
-    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel) so tha=
t they
-    # may build in parallel with the default kernel without clobbering.
-    if kpn !=3D "kernel":
-        workdir =3D d.getVar("WORKDIR")
-        sourceDir =3D os.path.join(workdir, 'kernel-source')
-        artifactsDir =3D os.path.join(workdir, 'kernel-build-artifacts')
-        d.setVar("STAGING_KERNEL_DIR", sourceDir)
-        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
-
-    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGET=
YPES
-    type =3D d.getVar('KERNEL_IMAGETYPE') or ""
-    alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
-    types =3D d.getVar('KERNEL_IMAGETYPES') or ""
-    if type not in types.split():
-        types =3D (type + ' ' + types).strip()
-    if alttype not in types.split():
-        types =3D (alttype + ' ' + types).strip()
-    d.setVar('KERNEL_IMAGETYPES', types)
-
-    # KERNEL_IMAGETYPES may contain a mixture of image types supported d=
irectly
-    # by the kernel build system and types which are created by post-pro=
cessing
-    # the output of the kernel build system (e.g. compressing vmlinux ->
-    # vmlinux.gz in kernel_deprecated_do_transform_kernel()).
-    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supporte=
d
-    # directly by the kernel build system.
-    if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
-        typeformake =3D set()
-        for type in types.split():
-            if type =3D=3D 'vmlinux.gz':
-                type =3D 'vmlinux'
-            typeformake.add(type)
-
-        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformak=
e)))
-
-    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
-    imagedest =3D d.getVar('KERNEL_IMAGEDEST')
-
-    for type in types.split():
-        if bb.data.inherits_class('nopackages', d):
-            continue
-        typelower =3D type.lower()
-        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
-        d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagede=
st + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + ty=
pe)
-        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (=3D ${EX=
TENDPKGV})' % (kname, typelower))
-        splitmods =3D d.getVar("KERNEL_SPLIT_MODULES")
-        if splitmods !=3D '1':
-            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (=3D $=
{EXTENDPKGV})' % kname)
-            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %=
s-modules-${KERNEL_VERSION_PKG_NAME} (=3D ${EXTENDPKGV})' % kname)
-            d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERS=
ION_PKG_NAME}' % kname)
-            d.appendVar('RPROVIDES:%s-modules' % kname, ' %s-modules-${K=
ERNEL_VERSION_PKG_NAME}' % kname)
-
-        d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
-        d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-
-        if d.getVar('KERNEL_IMAGETYPE_SYMLINK') =3D=3D '1':
-            d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower),=
 """set +e
-if [ -n "$D" ]; then
-    ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>=
&1
-else
-    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
-    if [ $? -ne 0 ]; then
-        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlink=
s, falling back to copied image (%s)."
-        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNE=
L_IMAGEDEST}/%s
-    fi
-fi
-set -e
-""" % (type, type, type, type, type, type, type))
-            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """se=
t +e
-if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
-    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
-fi
-set -e
-""" % (type, type, type))
-
-
-    image =3D d.getVar('INITRAMFS_IMAGE')
-    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is se=
t to 0,
-    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is b=
uilt
-    # standalone for use by wic and other tools.
-    if image:
-        if d.getVar('INITRAMFS_MULTICONFIG'):
-            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:${B=
B_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_comple=
te')
-        else:
-            d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRA=
MFS_IMAGE}:do_image_complete')
-    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))=
:
-        bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', =
'do_bundle_initramfs', d)
-
-    # NOTE: setting INITRAMFS_TASK is for backward compatibility
-    #       The preferred method is to set INITRAMFS_IMAGE, because
-    #       this INITRAMFS_TASK has circular dependency problems
-    #       if the initramfs requires kernel modules
-    image_task =3D d.getVar('INITRAMFS_TASK')
-    if image_task:
-        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
-}
-
-# Here we pull in all various kernel image types which we support.
-#
-# In case you're wondering why kernel.bbclass inherits the other image
-# types instead of the other way around, the reason for that is to
-# maintain compatibility with various currently existing meta-layers.
-# By pulling in the various kernel image types here, we retain the
-# original behavior of kernel.bbclass, so no meta-layers should get
-# broken.
-#
-# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
-# used to be the default behavior when only uImage was supported. This
-# variable can be appended by users who implement support for new kernel
-# image types.
-
-KERNEL_CLASSES ?=3D " kernel-uimage "
-inherit_defer ${KERNEL_CLASSES}
-
-# Old style kernels may set ${S} =3D ${WORKDIR}/git for example
-# We need to move these over to STAGING_KERNEL_DIR. We can't just
-# create the symlink in advance as the git fetcher can't cope with
-# the symlink.
-do_unpack[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KE=
RNEL_BUILDDIR}"
-do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KER=
NEL_BUILDDIR}"
-python do_symlink_kernsrc () {
-    s =3D d.getVar("S")
-    kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
-    if s !=3D kernsrc:
-        bb.utils.mkdirhier(kernsrc)
-        bb.utils.remove(kernsrc, recurse=3DTrue)
-        if s[-1] =3D=3D '/':
-            # drop trailing slash, so that os.symlink(kernsrc, s) doesn'=
t use s as
-            # directory name and fail
-            s =3D s[:-1]
-        if d.getVar("EXTERNALSRC"):
-            # With EXTERNALSRC S will not be wiped so we can symlink to =
it
-            os.symlink(s, kernsrc)
-        else:
-            import shutil
-            shutil.move(s, kernsrc)
-            os.symlink(kernsrc, s)
-}
-# do_patch is normally ordered before do_configure, but
-# externalsrc.bbclass deletes do_patch, breaking the dependency of
-# do_configure on do_symlink_kernsrc.
-addtask symlink_kernsrc before do_patch do_configure after do_unpack
-
-inherit kernel-arch deploy
-
-PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
-PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
-PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
-
-export OS =3D "${TARGET_OS}"
-export CROSS_COMPILE =3D "${TARGET_PREFIX}"
-
-KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
-
-# The directory where built kernel lies in the kernel tree
-KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"
-KERNEL_IMAGEDEST ?=3D "boot"
-KERNEL_DTBDEST ?=3D "${KERNEL_IMAGEDEST}"
-KERNEL_DTBVENDORED ?=3D "0"
-
-#
-# configuration
-#
-KERNEL_VERSION =3D "${@get_kernelversion_headers('${B}')}"
-
-# kernels are generally machine specific
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# U-Boot support
-UBOOT_ENTRYPOINT ?=3D "0x20008000"
-UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
-
-# Some Linux kernel configurations need additional parameters on the com=
mand line
-KERNEL_EXTRA_ARGS ?=3D ""
-
-EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
-EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
-EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
-# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r older kernels when building kernel and modules
-EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
-
-KERNEL_ALT_IMAGETYPE ??=3D ""
-
-copy_initramfs() {
-	echo "Copying initramfs into ./usr ..."
-	# In case the directory is not created yet from the first pass compile:
-	mkdir -p ${B}/usr
-	# Find and use the first initramfs image archive type we find
-	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst; d=
o
-		if [ -e "${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]=
; then
-			cp ${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/us=
r/.
-			case $img in
-			*gz)
-				echo "gzip decompressing image"
-				gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*lz4)
-				echo "lz4 decompressing image"
-				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/${INITRAMFS_I=
MAGE_NAME}.cpio
-				break
-				;;
-			*lzo)
-				echo "lzo decompressing image"
-				lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*lzma)
-				echo "lzma decompressing image"
-				lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*xz)
-				echo "xz decompressing image"
-				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*zst)
-				echo "zst decompressing image"
-				zstd -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			esac
-			break
-		fi
-	done
-	# Verify that the above loop found a initramfs, fail otherwise
-	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of =
initramfs into ./usr" || die "Could not find any ${INITRAMFS_DEPLOY_DIR_I=
MAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bund=
ling; INITRAMFS_IMAGE_NAME might be wrong."
-}
-
-do_bundle_initramfs () {
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =3D x1 ]=
; then
-		echo "Creating a kernel image with a bundled initramfs..."
-		copy_initramfs
-		# Backing up kernel image relies on its type(regular file or symbolic =
link)
-		tmp_path=3D""
-		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
-				linkpath=3D`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
-				realpath=3D`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
-				mv -f $realpath $realpath.bak
-				tmp_path=3D$tmp_path" "$imageType"#"$linkpath"#"$realpath
-			elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageTyp=
e.bak
-				tmp_path=3D$tmp_path" "$imageType"##"
-			fi
-		done
-		use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_=
IMAGE_NAME}.cpio
-		kernel_deprecated_do_compile
-		# Restoring kernel image
-		for tp in $tmp_path ; do
-			imageType=3D`echo $tp|cut -d "#" -f 1`
-			linkpath=3D`echo $tp|cut -d "#" -f 2`
-			realpath=3D`echo $tp|cut -d "#" -f 3`
-			if [ -n "$realpath" ]; then
-				mv -f $realpath $realpath.initramfs
-				mv -f $realpath.bak $realpath
-				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.init=
ramfs
-			else
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageTyp=
e.initramfs
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imag=
eType
-			fi
-		done
-	fi
-}
-do_bundle_initramfs[dirs] =3D "${B}"
-
-kernel_deprecated_do_transform_bundled_initramfs() {
-        # vmlinux.gz is not built by kernel
-	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
-		gzip -9cn < ${KERNEL_OUTPUT_DIR}/vmlinux.initramfs > ${KERNEL_OUTPUT_D=
IR}/vmlinux.gz.initramfs
-        fi
-}
-do_transform_bundled_initramfs[dirs] =3D "${B}"
-
-python do_package:prepend () {
-    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
-}
-
-python do_devshell:prepend () {
-    os.environ["LDFLAGS"] =3D ''
-}
-
-addtask bundle_initramfs after do_install before do_deploy
-
-KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
-
-kernel_deprecated_do_compile() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-
-	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
-	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
-	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
-	export PKG_CONFIG_SYSROOT_DIR=3D""
-
-	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0" ]=
; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%c=
t 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
-		export KCONFIG_NOTIMESTAMP=3D1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
-	else
-		ts=3D`LC_ALL=3DC date`
-		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
-	fi
-	# The $use_alternate_initrd is only set from
-	# do_bundle_initramfs() This variable is specifically for the
-	# case where we are making a second pass at the kernel
-	# compilation and we want to force the kernel build to use a
-	# different initramfs image.  The way to do that in the kernel
-	# is to specify:
-	# make ...args... CONFIG_INITRAMFS_SOURCE=3Dsome_other_initramfs.cpio
-	if [ "$use_alternate_initrd" =3D "" ] && [ "${INITRAMFS_TASK}" !=3D "" =
] ; then
-		# The old style way of copying an prebuilt image and building it
-		# is turned on via INTIRAMFS_TASK !=3D ""
-		copy_initramfs
-		use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_=
IMAGE_NAME}.cpio
-	fi
-	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_a=
lternate_initrd
-	done
-}
-
-kernel_deprecated_do_transform_kernel() {
-	# vmlinux.gz is not built by kernel
-	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
-		mkdir -p "${KERNEL_OUTPUT_DIR}"
-		gzip -9cn < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
-	fi
-}
-do_transform_kernel[dirs] =3D "${B}"
-addtask transform_kernel after do_compile before do_install
-
-do_compile_kernelmodules() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-
-	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
-	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
-	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
-	export PKG_CONFIG_SYSROOT_DIR=3D""
-
-	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
-		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
-		# be set....
-		if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0" ]=
; then
-			# The source directory is not necessarily a git repository, so we
-			# specify the git-dir to ensure that git does not query a
-			# repository in any parent directory.
-			SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%c=
t 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
-		fi
-
-		ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
-		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
-		export KCONFIG_NOTIMESTAMP=3D1
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
-	else
-		ts=3D`LC_ALL=3DC date`
-		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
-		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
-	fi
-	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
-		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
-
-		# Module.symvers gets updated during the
-		# building of the kernel modules. We need to
-		# update this in the shared workdir since some
-		# external kernel modules has a dependency on
-		# other kernel modules and will look at this
-		# file to do symbol lookups
-		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
-		# 5.10+ kernels have module.lds that we need to copy for external modu=
le builds
-		if [ -e "${B}/scripts/module.lds" ]; then
-			install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/s=
cripts/module.lds
-		fi
-	else
-		bbnote "no modules to compile"
-	fi
-}
-addtask compile_kernelmodules after do_compile before do_strip
-
-kernel_deprecated_do_install() {
-	#
-	# First install the modules
-	#
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
-		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware mo=
dules_install
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-		# Remove empty module directories to prevent QA issues
-		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] &=
& find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -typ=
e d -empty -delete
-	else
-		bbnote "no modules to install"
-	fi
-
-	#
-	# Install various kernel output (zImage, map file, config, module suppo=
rt files)
-	#
-	install -d ${D}/${KERNEL_IMAGEDEST}
-
-	#
-	# When including an initramfs bundle inside a FIT image, the fitImage i=
s created after the install task
-	# by do_assemble_fitimage_initramfs.
-	# This happens after the generation of the initramfs bundle (done by do=
_bundle_initramfs).
-	# So, at the level of the install task we should not try to install the=
 fitImage. fitImage is still not
-	# generated yet.
-	# After the generation of the fitImage, the deploy task copies the fitI=
mage from the build directory to
-	# the deploy folder.
-	#
-
-	for imageType in ${KERNEL_IMAGETYPES} ; do
-		if [ $imageType !=3D "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ] ; then
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDE=
ST}/$imageType-${KERNEL_VERSION}
-		fi
-	done
-
-	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL=
_VERSION}
-	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSIO=
N}
-	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSI=
ON}
-	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL=
_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-}
-
-# Must be ran no earlier than after do_kernel_checkout or else Makefile =
won't be in ${S}/Makefile
-do_kernel_version_sanity_check() {
-	if [ "x${KERNEL_VERSION_SANITY_SKIP}" =3D "x1" ]; then
-		exit 0
-	fi
-
-	# The Makefile determines the kernel version shown at runtime
-	# Don't use KERNEL_VERSION because the headers it grabs the version fro=
m aren't generated until do_compile
-	VERSION=3D$(grep "^VERSION =3D" ${S}/Makefile | sed s/.*=3D\ *//)
-	PATCHLEVEL=3D$(grep "^PATCHLEVEL =3D" ${S}/Makefile | sed s/.*=3D\ *//)
-	SUBLEVEL=3D$(grep "^SUBLEVEL =3D" ${S}/Makefile | sed s/.*=3D\ *//)
-	EXTRAVERSION=3D$(grep "^EXTRAVERSION =3D" ${S}/Makefile | sed s/.*=3D\ =
*//)
-
-	# Build a string for regex and a plain version string
-	reg=3D"^${VERSION}\.${PATCHLEVEL}"
-	vers=3D"${VERSION}.${PATCHLEVEL}"
-	if [ -n "${SUBLEVEL}" ]; then
-		# Ignoring a SUBLEVEL of zero is fine
-		if [ "${SUBLEVEL}" =3D "0" ]; then
-			reg=3D"${reg}(\.${SUBLEVEL})?"
-		else
-			reg=3D"${reg}\.${SUBLEVEL}"
-			vers=3D"${vers}.${SUBLEVEL}"
-		fi
-	fi
-	vers=3D"${vers}${EXTRAVERSION}"
-	reg=3D"${reg}${EXTRAVERSION}"
-
-	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
-		bbfatal "Package Version (${PV}) does not match of kernel being built =
(${vers}). Please update the PV variable to match the kernel source or se=
t KERNEL_VERSION_SANITY_SKIP=3D\"1\" in your recipe."
-	fi
-	exit 0
-}
-
-addtask shared_workdir after do_compile before do_compile_kernelmodules
-addtask shared_workdir_setscene
-
-do_shared_workdir_setscene () {
-	exit 1
-}
-
-emit_depmod_pkgdata() {
-	# Stash data for depmod
-	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
-	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod=
/${KERNEL_PACKAGE_NAME}-abiversion
-	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.=
map-${KERNEL_VERSION}
-}
-
-PACKAGEFUNCS +=3D "emit_depmod_pkgdata"
-
-do_shared_workdir[cleandirs] +=3D " ${STAGING_KERNEL_BUILDDIR}"
-do_shared_workdir () {
-	cd ${B}
-
-	kerneldir=3D${STAGING_KERNEL_BUILDDIR}
-	install -d $kerneldir
-
-	#
-	# Store the kernel version in sysroots for module-base.bbclass
-	#
-
-	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
-	echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-local=
version
-
-	# Copy files required for module builds
-	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
-	cp .config $kerneldir/
-	mkdir -p $kerneldir/include/config
-	cp include/config/kernel.release $kerneldir/include/config/kernel.relea=
se
-	if [ -e certs/signing_key.x509 ]; then
-		# The signing_key.* files are stored in the certs/ dir in
-		# newer Linux kernels
-		mkdir -p $kerneldir/certs
-		cp certs/signing_key.* $kerneldir/certs/
-	elif [ -e signing_key.priv ]; then
-		cp signing_key.* $kerneldir/
-	fi
-
-	# We can also copy over all the generated files and avoid special cases
-	# like version.h, but we've opted to keep this small until file creep s=
tarts
-	# to happen
-	if [ -e include/linux/version.h ]; then
-		mkdir -p $kerneldir/include/linux
-		cp include/linux/version.h $kerneldir/include/linux/version.h
-	fi
-
-	# As of Linux kernel version 3.0.1, the clean target removes
-	# arch/powerpc/lib/crtsavres.o which is present in
-	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
-	if [ ${ARCH} =3D "powerpc" ]; then
-		if [ -e arch/powerpc/lib/crtsavres.o ]; then
-			mkdir -p $kerneldir/arch/powerpc/lib/
-			cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres=
.o
-		fi
-	fi
-
-	if [ -d include/generated ]; then
-		mkdir -p $kerneldir/include/generated/
-		cp -fR include/generated/* $kerneldir/include/generated/
-	fi
-
-	if [ -d arch/${ARCH}/include/generated ]; then
-		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/includ=
e/generated/
-	fi
-
-	if (grep -q -i -e '^CONFIG_UNWINDER_ORC=3Dy$' $kerneldir/.config); then
-		# With CONFIG_UNWINDER_ORC (the default in 4.14), objtool is required =
for
-		# out-of-tree modules to be able to generate object files.
-		if [ -x tools/objtool/objtool ]; then
-			mkdir -p ${kerneldir}/tools/objtool
-			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
-		fi
-	fi
-
-	# When building with CONFIG_MODVERSIONS=3Dy and CONFIG_RANDSTRUCT=3Dy w=
e need
-	# to copy the build assets generated for the randstruct seed to
-	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
-	# generate those assets which will result in a different
-	# RANDSTRUCT_HASHED_SEED
-	if [ -d scripts/basic ]; then
-		mkdir -p ${kerneldir}/scripts
-		cp -r scripts/basic ${kerneldir}/scripts
-	fi
-
-	if [ -d scripts/gcc-plugins ]; then
-		mkdir -p ${kerneldir}/scripts
-		cp -r scripts/gcc-plugins ${kerneldir}/scripts
-	fi
-
-}
-
-# We don't need to stage anything, not the modules/firmware since those =
would clash with linux-firmware
-SYSROOT_DIRS =3D ""
-
-KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} olddefconfi=
g || oe_runmake -C ${S} O=3D${B} oldnoconfig"
-
-python check_oldest_kernel() {
-    oldest_kernel =3D d.getVar('OLDEST_KERNEL')
-    kernel_version =3D d.getVar('KERNEL_VERSION')
-    tclibc =3D d.getVar('TCLIBC')
-    if tclibc =3D=3D 'glibc':
-        kernel_version =3D kernel_version.split('-', 1)[0]
-        if oldest_kernel and kernel_version:
-            if bb.utils.vercmp_string(kernel_version, oldest_kernel) < 0=
:
-                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of th=
e kernel you are building is "%s" - therefore %s as built may not be comp=
atible with this kernel. Either set OLDEST_KERNEL to an older version, or=
 build a newer kernel.' % (d.getVar('PN'), oldest_kernel, kernel_version,=
 tclibc))
-}
-
-check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL KERNEL_VERSION"
-do_compile[postfuncs] +=3D "check_oldest_kernel"
-
-KERNEL_LOCALVERSION ??=3D ""
-
-# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
-# the local version. Having it empty means nothing will be added, and an=
y
-# value will be appended to the local kernel version. This replaces the
-# use of .scmversion file for setting a localversion without using
-# the CONFIG_LOCALVERSION option.
-#
-# Note: This class saves the value of localversion to a file
-# so other recipes like make-mod-scripts can restore it via the
-# helper function get_kernellocalversion_file
-export LOCALVERSION =3D "${KERNEL_LOCALVERSION}"
-
-kernel_deprecated_do_configure() {
-	# fixes extra + in /lib/modules/2.6.37+
-	# $ scripts/setlocalversion . =3D> +
-	# $ make kernelversion =3D> 2.6.37
-	# $ make kernelrelease =3D> 2.6.37+
-	# See kernel-arch.bbclass for post v6.3 removal of the extra
-	# + in localversion. .scmversion is no longer used, and the
-	# variable LOCALVERSION must be used
-	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
-		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
-		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
-	fi
-
-	if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.con=
fig" ]; then
-		mv "${S}/.config" "${B}/.config"
-	fi
-
-	# Copy defconfig to .config if .config does not exist. This allows
-	# recipes to manage the .config themselves in do_configure:prepend().
-	if [ -f "${UNPACKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
-		cp "${UNPACKDIR}/defconfig" "${B}/.config"
-	fi
-
-	${KERNEL_CONFIG_COMMAND}
-}
-
-inherit cml1 pkgconfig
-
-EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_ini=
tramfs do_install do_configure
-
-# kernel-base becomes kernel-${KERNEL_VERSION}
-# kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAM=
E}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
-FILES:${PN} =3D ""
-FILES:${KERNEL_PACKAGE_NAME}-base =3D "${nonarch_base_libdir}/modules/${=
KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VER=
SION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/mo=
dules.builtin.modinfo"
-FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
-FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/${KERNEL_IMAGEDEST}/System.map* /=
${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL=
_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D "/${KERNEL_IMAGEDEST}/vmlinux-$=
{KERNEL_VERSION_NAME}"
-FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
-FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/debug"
-RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D ${=
EXTENDPKGV})"
-# Allow machines to override this dependency if kernel image files are
-# not wanted in images as standard
-RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-ima=
ge (=3D ${EXTENDPKGV})"
-PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-RPROVIDES:${KERNEL_PACKAGE_NAME}-image +=3D "${KERNEL_PACKAGE_NAME}-imag=
e"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KER=
NEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTENDP=
KGV})', '', d)}"
-PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name(d.getVar('KERNEL_VERSION'))}"
-RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KER=
NEL_VERSION} ${KERNEL_PACKAGE_NAME}-base"
-ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
-ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
-ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
-ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
-DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta pack=
age"
-
-pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
-	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
-		mkdir -p $D/lib/modules/${KERNEL_VERSION}
-	fi
-	if [ -n "$D" ]; then
-		depmodwrapper -a -b $D ${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}
-	else
-		depmod -a ${KERNEL_VERSION}
-	fi
-}
-
-PACKAGESPLITFUNCS =3D+ "split_kernel_packages"
-
-python split_kernel_packages () {
-    do_split_packages(d, root=3D'${nonarch_base_libdir}/firmware', file_=
regex=3Dr'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern=3D'${KERNEL_PACKA=
GE_NAME}-firmware-%s', description=3D'Firmware for %s', recursive=3DTrue,=
 extra_depends=3D'')
-}
-
-# Many scripts want to look in arch/$arch/boot for the bootable
-# image. This poses a problem for vmlinux and vmlinuz based
-# booting. This task arranges to have vmlinux and vmlinuz appear
-# in the normalized directory location.
-do_kernel_link_images() {
-	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
-		mkdir ${B}/arch/${ARCH}/boot
-	fi
-	cd ${B}/arch/${ARCH}/boot
-	ln -sf ../../../vmlinux
-	if [ -f ../../../vmlinuz ]; then
-		ln -sf ../../../vmlinuz
-	fi
-	if [ -f ../../../vmlinuz.bin ]; then
-		ln -sf ../../../vmlinuz.bin
-	fi
-	if [ -f ../../../vmlinux.64 ]; then
-		ln -sf ../../../vmlinux.64
-	fi
-}
-addtask kernel_link_images after do_compile before do_strip
-
-python do_strip() {
-    import shutil
-
-    strip =3D d.getVar('KERNEL_STRIP')
-    extra_sections =3D d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
-    kernel_image =3D d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR')=
 + "/vmlinux"
-
-    if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST'=
) + '/vmlinux') !=3D -1):
-        kernel_image_stripped =3D kernel_image + ".stripped"
-        shutil.copy2(kernel_image, kernel_image_stripped)
-        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sect=
ions))
-        bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping=
 sections: " + \
-            extra_sections)
-}
-do_strip[dirs] =3D "${B}"
-
-addtask strip before do_sizecheck after do_kernel_link_images
-
-# Support checking the kernel size since some kernels need to reside in =
partitions
-# with a fixed length or there is a limit in transferring the kernel to =
memory.
-# If more than one image type is enabled, warn on any that don't fit but=
 only fail
-# if none fit.
-do_sizecheck() {
-	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-		invalid=3D`echo ${KERNEL_IMAGE_MAXSIZE} | sed 's/[0-9]//g'`
-		if [ -n "$invalid" ]; then
-			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be=
 an integer (The unit is Kbytes)"
-		fi
-		at_least_one_fits=3D
-		for imageType in ${KERNEL_IMAGETYPES} ; do
-			size=3D`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}=
'`
-			if [ $size -gt ${KERNEL_IMAGE_MAXSIZE} ]; then
-				bbwarn "This kernel $imageType (size=3D$size(K) > ${KERNEL_IMAGE_MAX=
SIZE}(K)) is too big for your device."
-			else
-				at_least_one_fits=3Dy
-			fi
-		done
-		if [ -z "$at_least_one_fits" ]; then
-			die "All kernel images are too big for your device. Please reduce the=
 size of the kernel by making more of it modular."
-		fi
-	fi
-}
-do_sizecheck[dirs] =3D "${B}"
-
-addtask sizecheck before do_install after do_strip
-
-inherit kernel-artifact-names
-
-kernel_deprecated_do_deploy() {
-	deployDir=3D"${DEPLOYDIR}"
-	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
-		deployDir=3D"${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
-		mkdir "$deployDir"
-	fi
-
-	for imageType in ${KERNEL_IMAGETYPES} ; do
-		baseName=3D$imageType-${KERNEL_IMAGE_NAME}
-
-		if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$=
baseName${KERNEL_IMAGE_BIN_EXT}
-		else
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName$=
{KERNEL_IMAGE_BIN_EXT}
-		fi
-		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
-			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNE=
L_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-		fi
-		if [ "${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
-			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType
-		fi
-	done
-
-	if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CONFIG_MODU=
LES=3Dy$' .config); then
-		mkdir -p ${D}${root_prefix}/lib
-		if [ -n "${SOURCE_DATE_EPOCH}" ]; then
-			TAR_ARGS=3D"--sort=3Dname --clamp-mtime --mtime=3D@${SOURCE_DATE_EPOC=
H}"
-		else
-			TAR_ARGS=3D""
-		fi
-		TAR_ARGS=3D"$TAR_ARGS --owner=3D0 --group=3D0"
-		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/mo=
dules-${MODULE_TARBALL_NAME}.tgz
-
-		if [ -n "${MODULE_TARBALL_LINK_NAME}" ] ; then
-			ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE=
_TARBALL_LINK_NAME}.tgz
-		fi
-	fi
-
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =3D x1 ]=
; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
-			if [ "$imageType" =3D "fitImage" ] ; then
-				continue
-			fi
-			initramfsBaseName=3D$imageType-${INITRAMFS_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/=
$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
-			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
-				ln -sf $initramfsBaseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageTy=
pe-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
-			fi
-		done
-	fi
-}
-
-# We deploy to filenames that include PKGV and PKGR, read the saved data=
 to
-# ensure we get the right values for both
-do_deploy[prefuncs] +=3D "read_subpackage_metadata"
-
-addtask deploy after do_populate_sysroot do_packagedata
-
-EXPORT_FUNCTIONS do_deploy
-
-# Add using Device Tree support
-inherit kernel-devicetree
--=20
2.25.1


