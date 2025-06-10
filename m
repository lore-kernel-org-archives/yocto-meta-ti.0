Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9666C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 12:43:36 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.85403.1749559413691220315
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 05:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dwBV41Bj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AChWCo2289246;
	Tue, 10 Jun 2025 07:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749559412;
	bh=aqd5Sn6P0bkLxsiHL33PBsig8h/fvvIBAkGUrjfPlXQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dwBV41Bj/Hg8gna2A/l7b11b6FvSa/bNR4JXEF183xeu6yMHvrEaNMMWPauUqnzhb
	 wWsX8KMqESkUnVosx08gciX+R0avqovXXcroqx1Qgzx0Rt+b4HsOuCma1m0IfPpnss
	 pUGecU/uCENSW/m7xm68iPukBFpWMRKb+8bucj60=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AChWsF911408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 07:43:32 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 07:43:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 07:43:32 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AChV2S3063339;
	Tue, 10 Jun 2025 07:43:31 -0500
Message-ID: <e1d2c523-994e-4cec-8f80-39d33acb6363@ti.com>
Date: Tue, 10 Jun 2025 07:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] linux: Temporarily backport previous
 fitimage classes
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <18478693C9344D46.11623@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18478693C9344D46.11623@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18633



On 6/9/2025 7:22 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent set of changes on oe-core has dramatically revamped the
> fitimage generation code.  It is initially unclear how to fold those
> change into our flow, so in the short term we will copy the previous
> versions of the kernel bbclass files from a commit before [1] any
> changes to the class files.
> 
> As soon as we figure it out, these files will be removed.  This just
> help unblock anyone trying to build on master including meta-ti-bsp.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=fdb0a51598156f99aa91f7495d7eada92a459e97
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../kernel-fitimage-deprecated.bbclass        | 839 +++++++++++++++++
>   .../classes/kernel-fitimage-legacyhs.bbclass  |   2 +-
>   .../classes/kernel-uboot-deprecated.bbclass   |  51 +
>   meta-ti-bsp/classes/kernel_deprecated.bbclass | 869 ++++++++++++++++++
>   meta-ti-bsp/conf/machine/include/k3.inc       |   2 +-
>   .../conf/machine/include/ti-falcon.inc        |   2 +-
>   .../linux/linux-ti-mainline_git.bb            |   2 +-
>   .../linux/linux-ti-staging_6.1.bb             |   2 +-
>   .../linux/linux-ti-staging_6.12.bb            |   2 +-
>   .../linux/linux-ti-staging_6.6.bb             |   2 +-


Denys,

Initial testing shows that the meta-beagle boards are also imapcted. 
I'll send a v2 with those recipes updated as well.


>   10 files changed, 1766 insertions(+), 7 deletions(-)
>   create mode 100644 meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass
>   create mode 100644 meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass
>   create mode 100644 meta-ti-bsp/classes/kernel_deprecated.bbclass
> 
> diff --git a/meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass b/meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass
> new file mode 100644
> index 00000000..b1705818
> --- /dev/null
> +++ b/meta-ti-bsp/classes/kernel-fitimage-deprecated.bbclass
> @@ -0,0 +1,839 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit kernel-uboot-deprecated kernel-artifact-names uboot-config
> +require conf/image-fitimage.conf
> +
> +def get_fit_replacement_type(d):
> +    kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
> +    replacementtype = ""
> +    if 'fitImage' in kerneltypes.split():
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "arm64":
> +            replacementtype = "Image"
> +        elif uarch == "riscv":
> +            replacementtype = "Image"
> +        elif uarch == "mips":
> +            replacementtype = "vmlinuz.bin"
> +        elif uarch == "x86":
> +            replacementtype = "bzImage"
> +        elif uarch == "microblaze":
> +            replacementtype = "linux.bin"
> +        else:
> +            replacementtype = "zImage"
> +    return replacementtype
> +
> +KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
> +DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
> +
> +python __anonymous () {
> +    # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> +    # to kernel.bbclass . We have to override it, since we pack zImage
> +    # (at least for now) into the fitImage .
> +    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
> +    if 'fitImage' in typeformake.split():
> +        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
> +
> +    image = d.getVar('INITRAMFS_IMAGE')
> +    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
> +        if d.getVar('INITRAMFS_MULTICONFIG'):
> +            mc = d.getVar('BB_CURRENT_MC')
> +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
> +        else:
> +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +
> +    #check if there are any dtb providers
> +    providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
> +    if providerdtb:
> +        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
> +        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
> +        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
> +}
> +
> +#
> +# Emit the fitImage ITS header
> +#
> +# $1 ... .its filename
> +fitimage_emit_fit_header() {
> +	cat << EOF >> $1
> +/dts-v1/;
> +
> +/ {
> +        description = "${FIT_DESC}";
> +        #address-cells = <${FIT_ADDRESS_CELLS}>;
> +EOF
> +}
> +
> +#
> +# Emit the fitImage section bits
> +#
> +# $1 ... .its filename
> +# $2 ... Section bit type: imagestart - image section start
> +#                          confstart  - configuration section start
> +#                          sectend    - section end
> +#                          fitend     - fitimage end
> +#
> +fitimage_emit_section_maint() {
> +	case $2 in
> +	imagestart)
> +		cat << EOF >> $1
> +
> +        images {
> +EOF
> +	;;
> +	confstart)
> +		cat << EOF >> $1
> +
> +        configurations {
> +EOF
> +	;;
> +	sectend)
> +		cat << EOF >> $1
> +	};
> +EOF
> +	;;
> +	fitend)
> +		cat << EOF >> $1
> +};
> +EOF
> +	;;
> +	esac
> +}
> +
> +#
> +# Emit the fitImage ITS kernel section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to kernel image
> +# $4 ... Compression type
> +fitimage_emit_section_kernel() {
> +
> +	kernel_csum="${FIT_HASH_ALG}"
> +	kernel_sign_algo="${FIT_SIGN_ALG}"
> +	kernel_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
> +
> +	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
> +	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> +		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
> +			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
> +	fi
> +
> +	cat << EOF >> $1
> +                kernel-$2 {
> +                        description = "Linux kernel";
> +                        data = /incbin/("$3");
> +                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
> +                        arch = "${UBOOT_ARCH}";
> +                        os = "linux";
> +                        compression = "$4";
> +                        load = <${UBOOT_LOADADDRESS}>;
> +                        entry = <$ENTRYPOINT>;
> +                        hash-1 {
> +                                algo = "$kernel_csum";
> +                        };
> +                };
> +EOF
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$kernel_sign_keyname" ] ; then
> +		sed -i '$ d' $1
> +		cat << EOF >> $1
> +                        signature-1 {
> +                                algo = "$kernel_csum,$kernel_sign_algo";
> +                                key-name-hint = "$kernel_sign_keyname";
> +                        };
> +                };
> +EOF
> +	fi
> +}
> +
> +#
> +# Emit the fitImage ITS DTB section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to DTB image
> +fitimage_emit_section_dtb() {
> +
> +	dtb_csum="${FIT_HASH_ALG}"
> +	dtb_sign_algo="${FIT_SIGN_ALG}"
> +	dtb_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
> +
> +	dtb_loadline=""
> +	dtb_ext=${DTB##*.}
> +	if [ "${dtb_ext}" = "dtbo" ]; then
> +		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
> +			dtb_loadline="load = <${UBOOT_DTBO_LOADADDRESS}>;"
> +		fi
> +	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> +		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> +	fi
> +	cat << EOF >> $1
> +                fdt-$2 {
> +                        description = "Flattened Device Tree blob";
> +                        data = /incbin/("$3");
> +                        type = "flat_dt";
> +                        arch = "${UBOOT_ARCH}";
> +                        compression = "none";
> +                        $dtb_loadline
> +                        hash-1 {
> +                                algo = "$dtb_csum";
> +                        };
> +                };
> +EOF
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$dtb_sign_keyname" ] ; then
> +		sed -i '$ d' $1
> +		cat << EOF >> $1
> +                        signature-1 {
> +                                algo = "$dtb_csum,$dtb_sign_algo";
> +                                key-name-hint = "$dtb_sign_keyname";
> +                        };
> +                };
> +EOF
> +	fi
> +}
> +
> +#
> +# Emit the fitImage ITS u-boot script section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to boot script image
> +fitimage_emit_section_boot_script() {
> +
> +	bootscr_csum="${FIT_HASH_ALG}"
> +	bootscr_sign_algo="${FIT_SIGN_ALG}"
> +	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
> +
> +        cat << EOF >> $1
> +                bootscr-$2 {
> +                        description = "U-boot script";
> +                        data = /incbin/("$3");
> +                        type = "script";
> +                        arch = "${UBOOT_ARCH}";
> +                        compression = "none";
> +                        hash-1 {
> +                                algo = "$bootscr_csum";
> +                        };
> +                };
> +EOF
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$bootscr_sign_keyname" ] ; then
> +		sed -i '$ d' $1
> +		cat << EOF >> $1
> +                        signature-1 {
> +                                algo = "$bootscr_csum,$bootscr_sign_algo";
> +                                key-name-hint = "$bootscr_sign_keyname";
> +                        };
> +                };
> +EOF
> +	fi
> +}
> +
> +#
> +# Emit the fitImage ITS setup section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to setup image
> +fitimage_emit_section_setup() {
> +
> +	setup_csum="${FIT_HASH_ALG}"
> +	setup_sign_algo="${FIT_SIGN_ALG}"
> +	setup_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
> +
> +	cat << EOF >> $1
> +                setup-$2 {
> +                        description = "Linux setup.bin";
> +                        data = /incbin/("$3");
> +                        type = "x86_setup";
> +                        arch = "${UBOOT_ARCH}";
> +                        os = "linux";
> +                        compression = "none";
> +                        load = <0x00090000>;
> +                        entry = <0x00090000>;
> +                        hash-1 {
> +                                algo = "$setup_csum";
> +                        };
> +                };
> +EOF
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$setup_sign_keyname" ] ; then
> +		sed -i '$ d' $1
> +		cat << EOF >> $1
> +                        signature-1 {
> +                                algo = "$setup_csum,$setup_sign_algo";
> +                                key-name-hint = "$setup_sign_keyname";
> +                        };
> +                };
> +EOF
> +	fi
> +}
> +
> +#
> +# Emit the fitImage ITS ramdisk section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to ramdisk image
> +fitimage_emit_section_ramdisk() {
> +
> +	ramdisk_csum="${FIT_HASH_ALG}"
> +	ramdisk_sign_algo="${FIT_SIGN_ALG}"
> +	ramdisk_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
> +	ramdisk_loadline=""
> +	ramdisk_entryline=""
> +
> +	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
> +		ramdisk_loadline="load = <${UBOOT_RD_LOADADDRESS}>;"
> +	fi
> +	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
> +		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
> +	fi
> +
> +	cat << EOF >> $1
> +                ramdisk-$2 {
> +                        description = "${INITRAMFS_IMAGE}";
> +                        data = /incbin/("$3");
> +                        type = "ramdisk";
> +                        arch = "${UBOOT_ARCH}";
> +                        os = "linux";
> +                        compression = "none";
> +                        $ramdisk_loadline
> +                        $ramdisk_entryline
> +                        hash-1 {
> +                                algo = "$ramdisk_csum";
> +                        };
> +                };
> +EOF
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$ramdisk_sign_keyname" ] ; then
> +		sed -i '$ d' $1
> +		cat << EOF >> $1
> +                        signature-1 {
> +                                algo = "$ramdisk_csum,$ramdisk_sign_algo";
> +                                key-name-hint = "$ramdisk_sign_keyname";
> +                        };
> +                };
> +EOF
> +	fi
> +}
> +
> +#
> +# echoes symlink destination if it points below directory
> +#
> +# $1 ... file that's a potential symlink
> +# $2 ... expected parent directory
> +symlink_points_below() {
> +	file="$2/$1"
> +	dir=$2
> +
> +	if ! [ -L "$file" ]; then
> +		return
> +	fi
> +
> +	realpath="$(realpath --relative-to=$dir $file)"
> +	if [ -z "${realpath%%../*}" ]; then
> +		return
> +	fi
> +
> +	echo "$realpath"
> +}
> +
> +#
> +# Emit the fitImage ITS configuration section
> +#
> +# $1 ... .its filename
> +# $2 ... Linux kernel ID
> +# $3 ... DTB image name
> +# $4 ... ramdisk ID
> +# $5 ... u-boot script ID
> +# $6 ... config ID
> +# $7 ... default flag
> +# $8 ... default DTB image name
> +fitimage_emit_section_config() {
> +
> +	conf_csum="${FIT_HASH_ALG}"
> +	conf_sign_algo="${FIT_SIGN_ALG}"
> +	conf_padding_algo="${FIT_PAD_ALG}"
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
> +		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +	fi
> +
> +	its_file="$1"
> +	kernel_id="$2"
> +	dtb_image="$3"
> +	ramdisk_id="$4"
> +	bootscr_id="$5"
> +	config_id="$6"
> +	default_flag="$7"
> +	default_dtb_image="$8"
> +
> +	# Test if we have any DTBs at all
> +	sep=""
> +	conf_desc=""
> +	conf_node="${FIT_CONF_PREFIX}"
> +	kernel_line=""
> +	fdt_line=""
> +	ramdisk_line=""
> +	bootscr_line=""
> +	setup_line=""
> +	default_line=""
> +	compatible_line=""
> +
> +	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
> +	if [ -z "$dtb_image_sect" ]; then
> +		dtb_image_sect=$dtb_image
> +	fi
> +
> +	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
> +	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
> +		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
> +		if [ -n "$compat" ]; then
> +			compatible_line="compatible = \"$compat\";"
> +		fi
> +	fi
> +
> +	dtb_image=$(echo $dtb_image | tr '/' '_')
> +	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
> +
> +	# conf node name is selected based on dtb ID if it is present,
> +	# otherwise its selected based on kernel ID
> +	if [ -n "$dtb_image" ]; then
> +		conf_node=$conf_node$dtb_image
> +	else
> +		conf_node=$conf_node$kernel_id
> +	fi
> +
> +	if [ -n "$kernel_id" ]; then
> +		conf_desc="Linux kernel"
> +		sep=", "
> +		kernel_line="kernel = \"kernel-$kernel_id\";"
> +	fi
> +
> +	if [ -n "$dtb_image" ]; then
> +		conf_desc="$conf_desc${sep}FDT blob"
> +		sep=", "
> +		fdt_line="fdt = \"fdt-$dtb_image_sect\";"
> +	fi
> +
> +	if [ -n "$ramdisk_id" ]; then
> +		conf_desc="$conf_desc${sep}ramdisk"
> +		sep=", "
> +		ramdisk_line="ramdisk = \"ramdisk-$ramdisk_id\";"
> +	fi
> +
> +	if [ -n "$bootscr_id" ]; then
> +		conf_desc="$conf_desc${sep}u-boot script"
> +		sep=", "
> +		bootscr_line="bootscr = \"bootscr-$bootscr_id\";"
> +	fi
> +
> +	if [ -n "$config_id" ]; then
> +		conf_desc="$conf_desc${sep}setup"
> +		setup_line="setup = \"setup-$config_id\";"
> +	fi
> +
> +	if [ "$default_flag" = "1" ]; then
> +		# default node is selected based on dtb ID if it is present,
> +		# otherwise its selected based on kernel ID
> +		if [ -n "$dtb_image" ]; then
> +			# Select default node as user specified dtb when
> +			# multiple dtb exists.
> +			if [ -n "$default_dtb_image" ]; then
> +				default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
> +			else
> +				default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
> +			fi
> +		else
> +			default_line="default = \"${FIT_CONF_PREFIX}$kernel_id\";"
> +		fi
> +	fi
> +
> +	cat << EOF >> $its_file
> +                $default_line
> +                $conf_node {
> +                        description = "$default_flag $conf_desc";
> +                        $compatible_line
> +                        $kernel_line
> +                        $fdt_line
> +                        $ramdisk_line
> +                        $bootscr_line
> +                        $setup_line
> +                        hash-1 {
> +                                algo = "$conf_csum";
> +                        };
> +EOF
> +
> +	if [ -n "$conf_sign_keyname" ] ; then
> +
> +		sign_line="sign-images = "
> +		sep=""
> +
> +		if [ -n "$kernel_id" ]; then
> +			sign_line="$sign_line${sep}\"kernel\""
> +			sep=", "
> +		fi
> +
> +		if [ -n "$dtb_image" ]; then
> +			sign_line="$sign_line${sep}\"fdt\""
> +			sep=", "
> +		fi
> +
> +		if [ -n "$ramdisk_id" ]; then
> +			sign_line="$sign_line${sep}\"ramdisk\""
> +			sep=", "
> +		fi
> +
> +		if [ -n "$bootscr_id" ]; then
> +			sign_line="$sign_line${sep}\"bootscr\""
> +			sep=", "
> +		fi
> +
> +		if [ -n "$config_id" ]; then
> +			sign_line="$sign_line${sep}\"setup\""
> +		fi
> +
> +		sign_line="$sign_line;"
> +
> +		cat << EOF >> $its_file
> +                        signature-1 {
> +                                algo = "$conf_csum,$conf_sign_algo";
> +                                key-name-hint = "$conf_sign_keyname";
> +                                padding = "$conf_padding_algo";
> +                                $sign_line
> +                        };
> +EOF
> +	fi
> +
> +	cat << EOF >> $its_file
> +                };
> +EOF
> +}
> +
> +#
> +# Assemble fitImage
> +#
> +# $1 ... .its filename
> +# $2 ... fitImage name
> +# $3 ... include ramdisk
> +fitimage_assemble() {
> +	kernelcount=1
> +	dtbcount=""
> +	DTBS=""
> +	ramdiskcount=$3
> +	setupcount=""
> +	bootscr_id=""
> +	default_dtb_image=""
> +	rm -f $1 arch/${ARCH}/boot/$2
> +
> +	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> +		bbfatal "Keys used to sign images and configuration nodes must be different."
> +	fi
> +
> +	fitimage_emit_fit_header $1
> +
> +	#
> +	# Step 1: Prepare a kernel image section.
> +	#
> +	fitimage_emit_section_maint $1 imagestart
> +
> +	uboot_prep_kimage
> +	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
> +
> +	#
> +	# Step 2: Prepare a DTB image section
> +	#
> +
> +	if [ -n "${KERNEL_DEVICETREE}" ]; then
> +		dtbcount=1
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo $DTB | grep -q '/dts/'; then
> +				bbwarn "$DTB contains the full path to the the dts file, but only the dtb name should be used."
> +				DTB=`basename $DTB | sed 's,\.dts$,.dtb,g'`
> +			fi
> +
> +			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
> +			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_DEVICETREE}/${DTB} ]; then
> +				continue
> +			fi
> +
> +			DTB_PATH="${KERNEL_OUTPUT_DIR}/dts/$DTB"
> +			if [ ! -e "$DTB_PATH" ]; then
> +				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
> +			fi
> +
> +			# Strip off the path component from the filename
> +			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
> +				DTB=`basename $DTB`
> +			fi
> +
> +			# Set the default dtb image if it exists in the devicetree.
> +			if [ "${FIT_CONF_DEFAULT_DTB}" = "$DTB" ];then
> +				default_dtb_image=$(echo "$DTB" | tr '/' '_')
> +			fi
> +
> +			DTB=$(echo "$DTB" | tr '/' '_')
> +
> +			# Skip DTB if we've picked it up previously
> +			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
> +
> +			DTBS="$DTBS $DTB"
> +			DTB=$(echo $DTB | tr '/' '_')
> +			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
> +		done
> +	fi
> +
> +	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
> +		dtbcount=1
> +		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
> +		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
> +			# Set the default dtb image if it exists in the devicetree.
> +			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
> +				default_dtb_image=$(echo "$DTB" | tr '/' '_')
> +			fi
> +
> +			DTB=$(echo "$DTB" | tr '/' '_')
> +
> +			# Skip DTB/DTBO if we've picked it up previously
> +			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
> +
> +			DTBS="$DTBS $DTB"
> +
> +			# Also skip if a symlink. We'll later have each config section point at it
> +			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && continue
> +
> +			DTB=$(echo $DTB | tr '/' '_')
> +			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
> +		done
> +	fi
> +
> +	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then
> +		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device trees."
> +	fi
> +
> +	#
> +	# Step 3: Prepare a u-boot script section
> +	#
> +
> +	if [ -n "${FIT_UBOOT_ENV}" ]; then
> +		cp ${UNPACKDIR}/${FIT_UBOOT_ENV} ${B}
> +		bootscr_id="${FIT_UBOOT_ENV}"
> +		fitimage_emit_section_boot_script $1 "$bootscr_id" ${FIT_UBOOT_ENV}
> +	fi
> +
> +	#
> +	# Step 4: Prepare a setup section. (For x86)
> +	#
> +	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
> +		setupcount=1
> +		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin
> +	fi
> +
> +	#
> +	# Step 5: Prepare a ramdisk section.
> +	#
> +	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> +		# Find and use the first initramfs image archive type we find
> +		found=
> +		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
> +			initramfs_path="${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
> +			if [ -e "$initramfs_path" ]; then
> +				bbnote "Found initramfs image: $initramfs_path"
> +				found=true
> +				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
> +				break
> +			else
> +				bbnote "Did not find initramfs image: $initramfs_path"
> +			fi
> +		done
> +
> +		if [ -z "$found" ]; then
> +			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
> +		fi
> +	fi
> +
> +	fitimage_emit_section_maint $1 sectend
> +
> +	# Force the first Kernel and DTB in the default config
> +	kernelcount=1
> +	if [ -n "$dtbcount" ]; then
> +		dtbcount=1
> +	fi
> +
> +	#
> +	# Step 6: Prepare a configurations section
> +	#
> +	fitimage_emit_section_maint $1 confstart
> +
> +	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
> +	# more) to be added to the FIT image along with 0 or more device trees and
> +	# 0 or 1 ramdisk.
> +	# It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
> +	# When the initramfs bundle is used ramdisk is disabled.
> +	# If a device tree is to be part of the FIT image, then select
> +	# the default configuration to be used is based on the dtbcount. If there is
> +	# no dtb present than select the default configuation to be based on
> +	# the kernelcount.
> +	if [ -n "$DTBS" ]; then
> +		i=1
> +		for DTB in ${DTBS}; do
> +			dtb_ext=${DTB##*.}
> +			if [ "$dtb_ext" = "dtbo" ]; then
> +				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`" "$default_dtb_image"
> +			else
> +				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`" "$default_dtb_image"
> +			fi
> +			i=`expr $i + 1`
> +		done
> +	else
> +		defaultconfigcount=1
> +		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
> +	fi
> +
> +	fitimage_emit_section_maint $1 sectend
> +
> +	fitimage_emit_section_maint $1 fitend
> +
> +	#
> +	# Step 7: Assemble the image
> +	#
> +	${UBOOT_MKIMAGE} \
> +		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> +		-f $1 \
> +		${KERNEL_OUTPUT_DIR}/$2
> +
> +	#
> +	# Step 8: Sign the image
> +	#
> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
> +		${UBOOT_MKIMAGE_SIGN} \
> +			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> +			-F -k "${UBOOT_SIGN_KEYDIR}" \
> +			-r ${KERNEL_OUTPUT_DIR}/$2 \
> +			${UBOOT_MKIMAGE_SIGN_ARGS}
> +	fi
> +}
> +
> +do_assemble_fitimage() {
> +	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
> +		cd ${B}
> +		fitimage_assemble fit-image.its fitImage-none ""
> +		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> +			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> +		fi
> +	fi
> +}
> +
> +addtask assemble_fitimage before do_install after do_compile
> +
> +SYSROOT_DIRS:append = " /sysroot-only"
> +do_install:append() {
> +	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
> +		[ "${UBOOT_SIGN_ENABLE}" = "1" ]; then
> +		install -D ${B}/${KERNEL_OUTPUT_DIR}/fitImage-none ${D}/sysroot-only/fitImage
> +	fi
> +}
> +
> +do_assemble_fitimage_initramfs() {
> +	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
> +		test -n "${INITRAMFS_IMAGE}" ; then
> +		cd ${B}
> +		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> +			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
> +			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> +		else
> +			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
> +		fi
> +	fi
> +}
> +
> +addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
> +
> +do_kernel_generate_rsa_keys() {
> +	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
> +		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
> +	fi
> +
> +	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
> +
> +		# Generate keys to sign configuration nodes, only if they don't already exist
> +		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
> +			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
> +
> +			# make directory if it does not already exist
> +			mkdir -p "${UBOOT_SIGN_KEYDIR}"
> +
> +			bbnote "Generating RSA private key for signing fitImage"
> +			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
> +				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
> +			"${FIT_SIGN_NUMBITS}"
> +
> +			bbnote "Generating certificate for signing fitImage"
> +			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
> +				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
> +				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
> +		fi
> +
> +		# Generate keys to sign image nodes, only if they don't already exist
> +		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
> +			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
> +
> +			# make directory if it does not already exist
> +			mkdir -p "${UBOOT_SIGN_KEYDIR}"
> +
> +			bbnote "Generating RSA private key for signing fitImage"
> +			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
> +				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
> +			"${FIT_SIGN_NUMBITS}"
> +
> +			bbnote "Generating certificate for signing fitImage"
> +			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
> +				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
> +				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
> +		fi
> +	fi
> +}
> +
> +addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
> +
> +kernel_deprecated_do_deploy[vardepsexclude] = "DATETIME"
> +kernel_deprecated_do_deploy:append() {
> +	# Update deploy directory
> +	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
> +
> +		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> +			bbnote "Copying fit-image.its source file..."
> +			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
> +			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> +				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
> +			fi
> +
> +			bbnote "Copying linux.bin file..."
> +			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
> +			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> +				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
> +			fi
> +		fi
> +
> +		if [ -n "${INITRAMFS_IMAGE}" ]; then
> +			bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> +			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
> +			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> +				ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
> +			fi
> +
> +			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
> +				bbnote "Copying fitImage-${INITRAMFS_IMAGE} file..."
> +				install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
> +				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> +					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
> +				fi
> +			fi
> +		fi
> +	fi
> +}
> diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> index 61813555..ca133457 100644
> --- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> +++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> @@ -1,4 +1,4 @@
> -inherit ti-secdev kernel-uboot uboot-sign-legacyhs
> +inherit ti-secdev kernel-uboot-deprecated uboot-sign-legacyhs
>   
>   FITIMAGE_HASH_ALGO ?= "sha1"
>   FITIMAGE_PACK_TEE ?= "0"
> diff --git a/meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass b/meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass
> new file mode 100644
> index 00000000..6d4aff6b
> --- /dev/null
> +++ b/meta-ti-bsp/classes/kernel-uboot-deprecated.bbclass
> @@ -0,0 +1,51 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# fitImage kernel compression algorithm
> +FIT_KERNEL_COMP_ALG ?= "gzip"
> +FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
> +
> +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
> +UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
> +
> +uboot_prep_kimage() {
> +	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> +		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> +		linux_suffix=""
> +		linux_comp="none"
> +	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
> +		rm -f linux.bin
> +		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
> +		vmlinux_path=""
> +		linux_suffix=""
> +		linux_comp="none"
> +	else
> +		vmlinux_path="vmlinux"
> +		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
> +		# As per the implementation in kernel.bbclass.
> +		# See do_bundle_initramfs function
> +		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
> +			vmlinux_path="vmlinux.initramfs"
> +		fi
> +		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
> +		linux_comp="${FIT_KERNEL_COMP_ALG}"
> +	fi
> +
> +	[ -n "${vmlinux_path}" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
> +
> +	if [ "${linux_comp}" != "none" ] ; then
> +		if [ "${linux_comp}" = "gzip" ] ; then
> +			gzip -9 linux.bin
> +		elif [ "${linux_comp}" = "lzo" ] ; then
> +			lzop -9 linux.bin
> +		elif [ "${linux_comp}" = "lzma" ] ; then
> +			xz --format=lzma -f -6 linux.bin
> +		fi
> +		mv -f "linux.bin${linux_suffix}" linux.bin
> +	fi
> +
> +	echo "${linux_comp}"
> +}
> diff --git a/meta-ti-bsp/classes/kernel_deprecated.bbclass b/meta-ti-bsp/classes/kernel_deprecated.bbclass
> new file mode 100644
> index 00000000..328a08fd
> --- /dev/null
> +++ b/meta-ti-bsp/classes/kernel_deprecated.bbclass
> @@ -0,0 +1,869 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit linux-kernel-base kernel-module-split
> +
> +COMPATIBLE_HOST = ".*-linux"
> +
> +KERNEL_PACKAGE_NAME ??= "kernel"
> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> +
> +PROVIDES += "virtual/kernel"
> +DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
> +PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> +
> +do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
> +do_clean[depends] += "make-mod-scripts:do_clean"
> +
> +# CPE entries from NVD use linux_kernel, but the raw CVE entries from the kernel CNA have
> +# vendor: linux and product: linux. Note that multiple distributions use "linux" as a product
> +# name, so we need to fill vendor to avoid false positives
> +CVE_PRODUCT ?= "linux_kernel linux:linux"
> +
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/build"
> +KBUILD_OUTPUT = "${B}"
> +OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
> +
> +# we include gcc above, we dont need virtual/libc
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +KERNEL_IMAGETYPE ?= "zImage"
> +INITRAMFS_IMAGE ?= ""
> +INITRAMFS_TASK ?= ""
> +INITRAMFS_IMAGE_BUNDLE ?= ""
> +INITRAMFS_DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR_IMAGE}"
> +INITRAMFS_MULTICONFIG ?= ""
> +
> +# KERNEL_VERSION is extracted from source code. It is evaluated as
> +# None for the first parsing, since the code has not been fetched.
> +# After the code is fetched, it will be evaluated as real version
> +# number and cause kernel to be rebuilt. To avoid this, make
> +# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
> +# LINUX_VERSION which is a constant.
> +KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
> +KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
> +KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> +KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
> +
> +python __anonymous () {
> +    pn = d.getVar("PN")
> +    kpn = d.getVar("KERNEL_PACKAGE_NAME")
> +
> +    # XXX Remove this after bug 11905 is resolved
> +    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
> +    if kpn == pn:
> +        bb.warn("Some packages (E.g. *-dev) might be missing due to "
> +                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
> +
> +    # The default kernel recipe builds in a shared location defined by
> +    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
> +    # Set these variables to directories under ${WORKDIR} in alternate
> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
> +    # may build in parallel with the default kernel without clobbering.
> +    if kpn != "kernel":
> +        workdir = d.getVar("WORKDIR")
> +        sourceDir = os.path.join(workdir, 'kernel-source')
> +        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
> +
> +    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
> +    type = d.getVar('KERNEL_IMAGETYPE') or ""
> +    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> +    types = d.getVar('KERNEL_IMAGETYPES') or ""
> +    if type not in types.split():
> +        types = (type + ' ' + types).strip()
> +    if alttype not in types.split():
> +        types = (alttype + ' ' + types).strip()
> +    d.setVar('KERNEL_IMAGETYPES', types)
> +
> +    # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
> +    # by the kernel build system and types which are created by post-processing
> +    # the output of the kernel build system (e.g. compressing vmlinux ->
> +    # vmlinux.gz in kernel_deprecated_do_transform_kernel()).
> +    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supported
> +    # directly by the kernel build system.
> +    if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
> +        typeformake = set()
> +        for type in types.split():
> +            if type == 'vmlinux.gz':
> +                type = 'vmlinux'
> +            typeformake.add(type)
> +
> +        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformake)))
> +
> +    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
> +    imagedest = d.getVar('KERNEL_IMAGEDEST')
> +
> +    for type in types.split():
> +        if bb.data.inherits_class('nopackages', d):
> +            continue
> +        typelower = type.lower()
> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
> +        d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= ${EXTENDPKGV})' % (kname, typelower))
> +        splitmods = d.getVar("KERNEL_SPLIT_MODULES")
> +        if splitmods != '1':
> +            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= ${EXTENDPKGV})' % kname)
> +            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= ${EXTENDPKGV})' % kname)
> +            d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
> +            d.appendVar('RPROVIDES:%s-modules' % kname, ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
> +
> +        d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> +        d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
> +
> +        if d.getVar('KERNEL_IMAGETYPE_SYMLINK') == '1':
> +            d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
> +if [ -n "$D" ]; then
> +    ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +else
> +    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
> +        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
> +    fi
> +fi
> +set -e
> +""" % (type, type, type, type, type, type, type))
> +            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
> +if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
> +    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
> +fi
> +set -e
> +""" % (type, type, type))
> +
> +
> +    image = d.getVar('INITRAMFS_IMAGE')
> +    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> +    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
> +    # standalone for use by wic and other tools.
> +    if image:
> +        if d.getVar('INITRAMFS_MULTICONFIG'):
> +            d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
> +        else:
> +            d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
> +        bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
> +
> +    # NOTE: setting INITRAMFS_TASK is for backward compatibility
> +    #       The preferred method is to set INITRAMFS_IMAGE, because
> +    #       this INITRAMFS_TASK has circular dependency problems
> +    #       if the initramfs requires kernel modules
> +    image_task = d.getVar('INITRAMFS_TASK')
> +    if image_task:
> +        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
> +}
> +
> +# Here we pull in all various kernel image types which we support.
> +#
> +# In case you're wondering why kernel.bbclass inherits the other image
> +# types instead of the other way around, the reason for that is to
> +# maintain compatibility with various currently existing meta-layers.
> +# By pulling in the various kernel image types here, we retain the
> +# original behavior of kernel.bbclass, so no meta-layers should get
> +# broken.
> +#
> +# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
> +# used to be the default behavior when only uImage was supported. This
> +# variable can be appended by users who implement support for new kernel
> +# image types.
> +
> +KERNEL_CLASSES ?= " kernel-uimage "
> +inherit_defer ${KERNEL_CLASSES}
> +
> +# Old style kernels may set ${S} = ${WORKDIR}/git for example
> +# We need to move these over to STAGING_KERNEL_DIR. We can't just
> +# create the symlink in advance as the git fetcher can't cope with
> +# the symlink.
> +do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> +do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> +python do_symlink_kernsrc () {
> +    s = d.getVar("S")
> +    kernsrc = d.getVar("STAGING_KERNEL_DIR")
> +    if s != kernsrc:
> +        bb.utils.mkdirhier(kernsrc)
> +        bb.utils.remove(kernsrc, recurse=True)
> +        if s[-1] == '/':
> +            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
> +            # directory name and fail
> +            s = s[:-1]
> +        if d.getVar("EXTERNALSRC"):
> +            # With EXTERNALSRC S will not be wiped so we can symlink to it
> +            os.symlink(s, kernsrc)
> +        else:
> +            import shutil
> +            shutil.move(s, kernsrc)
> +            os.symlink(kernsrc, s)
> +}
> +# do_patch is normally ordered before do_configure, but
> +# externalsrc.bbclass deletes do_patch, breaking the dependency of
> +# do_configure on do_symlink_kernsrc.
> +addtask symlink_kernsrc before do_patch do_configure after do_unpack
> +
> +inherit kernel-arch deploy
> +
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
> +
> +export OS = "${TARGET_OS}"
> +export CROSS_COMPILE = "${TARGET_PREFIX}"
> +
> +KERNEL_RELEASE ?= "${KERNEL_VERSION}"
> +
> +# The directory where built kernel lies in the kernel tree
> +KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
> +KERNEL_IMAGEDEST ?= "boot"
> +KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
> +KERNEL_DTBVENDORED ?= "0"
> +
> +#
> +# configuration
> +#
> +KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
> +
> +# kernels are generally machine specific
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +# U-Boot support
> +UBOOT_ENTRYPOINT ?= "0x20008000"
> +UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
> +
> +# Some Linux kernel configurations need additional parameters on the command line
> +KERNEL_EXTRA_ARGS ?= ""
> +
> +EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
> +EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
> +EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
> +# Only for newer kernels (5.19+), native pkg-config variables are set for older kernels when building kernel and modules
> +EXTRA_OEMAKE += ' HOSTPKG_CONFIG="pkg-config-native"'
> +
> +KERNEL_ALT_IMAGETYPE ??= ""
> +
> +copy_initramfs() {
> +	echo "Copying initramfs into ./usr ..."
> +	# In case the directory is not created yet from the first pass compile:
> +	mkdir -p ${B}/usr
> +	# Find and use the first initramfs image archive type we find
> +	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst; do
> +		if [ -e "${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
> +			cp ${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
> +			case $img in
> +			*gz)
> +				echo "gzip decompressing image"
> +				gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
> +			*lz4)
> +				echo "lz4 decompressing image"
> +				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +				break
> +				;;
> +			*lzo)
> +				echo "lzo decompressing image"
> +				lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
> +			*lzma)
> +				echo "lzma decompressing image"
> +				lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
> +			*xz)
> +				echo "xz decompressing image"
> +				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
> +			*zst)
> +				echo "zst decompressing image"
> +				zstd -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
> +				break
> +				;;
> +			esac
> +			break
> +		fi
> +	done
> +	# Verify that the above loop found a initramfs, fail otherwise
> +	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
> +}
> +
> +do_bundle_initramfs () {
> +	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +		echo "Creating a kernel image with a bundled initramfs..."
> +		copy_initramfs
> +		# Backing up kernel image relies on its type(regular file or symbolic link)
> +		tmp_path=""
> +		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +			if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
> +				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
> +				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
> +				mv -f $realpath $realpath.bak
> +				tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
> +			elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
> +				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
> +				tmp_path=$tmp_path" "$imageType"##"
> +			fi
> +		done
> +		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +		kernel_deprecated_do_compile
> +		# Restoring kernel image
> +		for tp in $tmp_path ; do
> +			imageType=`echo $tp|cut -d "#" -f 1`
> +			linkpath=`echo $tp|cut -d "#" -f 2`
> +			realpath=`echo $tp|cut -d "#" -f 3`
> +			if [ -n "$realpath" ]; then
> +				mv -f $realpath $realpath.initramfs
> +				mv -f $realpath.bak $realpath
> +				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +			else
> +				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
> +			fi
> +		done
> +	fi
> +}
> +do_bundle_initramfs[dirs] = "${B}"
> +
> +kernel_deprecated_do_transform_bundled_initramfs() {
> +        # vmlinux.gz is not built by kernel
> +	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> +		gzip -9cn < ${KERNEL_OUTPUT_DIR}/vmlinux.initramfs > ${KERNEL_OUTPUT_DIR}/vmlinux.gz.initramfs
> +        fi
> +}
> +do_transform_bundled_initramfs[dirs] = "${B}"
> +
> +python do_package:prepend () {
> +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
> +}
> +
> +python do_devshell:prepend () {
> +    os.environ["LDFLAGS"] = ''
> +}
> +
> +addtask bundle_initramfs after do_install before do_deploy
> +
> +KERNEL_DEBUG_TIMESTAMPS ??= "0"
> +
> +kernel_deprecated_do_compile() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +
> +	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
> +	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
> +	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
> +	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> +	export PKG_CONFIG_SYSROOT_DIR=""
> +
> +	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> +		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> +		# be set....
> +		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> +			# The source directory is not necessarily a git repository, so we
> +			# specify the git-dir to ensure that git does not query a
> +			# repository in any parent directory.
> +			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> +		fi
> +
> +		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> +		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		export KCONFIG_NOTIMESTAMP=1
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +	else
> +		ts=`LC_ALL=C date`
> +		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +	fi
> +	# The $use_alternate_initrd is only set from
> +	# do_bundle_initramfs() This variable is specifically for the
> +	# case where we are making a second pass at the kernel
> +	# compilation and we want to force the kernel build to use a
> +	# different initramfs image.  The way to do that in the kernel
> +	# is to specify:
> +	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
> +	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
> +		# The old style way of copying an prebuilt image and building it
> +		# is turned on via INTIRAMFS_TASK != ""
> +		copy_initramfs
> +		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
> +	fi
> +	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +	done
> +}
> +
> +kernel_deprecated_do_transform_kernel() {
> +	# vmlinux.gz is not built by kernel
> +	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> +		mkdir -p "${KERNEL_OUTPUT_DIR}"
> +		gzip -9cn < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
> +	fi
> +}
> +do_transform_kernel[dirs] = "${B}"
> +addtask transform_kernel after do_compile before do_install
> +
> +do_compile_kernelmodules() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +
> +	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
> +	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
> +	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
> +	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> +	export PKG_CONFIG_SYSROOT_DIR=""
> +
> +	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> +		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> +		# be set....
> +		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> +			# The source directory is not necessarily a git repository, so we
> +			# specify the git-dir to ensure that git does not query a
> +			# repository in any parent directory.
> +			SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> +		fi
> +
> +		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> +		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		export KCONFIG_NOTIMESTAMP=1
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +	else
> +		ts=`LC_ALL=C date`
> +		export KBUILD_BUILD_TIMESTAMP="$ts"
> +		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +	fi
> +	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
> +		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
> +
> +		# Module.symvers gets updated during the
> +		# building of the kernel modules. We need to
> +		# update this in the shared workdir since some
> +		# external kernel modules has a dependency on
> +		# other kernel modules and will look at this
> +		# file to do symbol lookups
> +		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> +		# 5.10+ kernels have module.lds that we need to copy for external module builds
> +		if [ -e "${B}/scripts/module.lds" ]; then
> +			install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
> +		fi
> +	else
> +		bbnote "no modules to compile"
> +	fi
> +}
> +addtask compile_kernelmodules after do_compile before do_strip
> +
> +kernel_deprecated_do_install() {
> +	#
> +	# First install the modules
> +	#
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> +		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
> +		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> +		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> +		# Remove empty module directories to prevent QA issues
> +		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
> +	else
> +		bbnote "no modules to install"
> +	fi
> +
> +	#
> +	# Install various kernel output (zImage, map file, config, module support files)
> +	#
> +	install -d ${D}/${KERNEL_IMAGEDEST}
> +
> +	#
> +	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
> +	# by do_assemble_fitimage_initramfs.
> +	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
> +	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
> +	# generated yet.
> +	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
> +	# the deploy folder.
> +	#
> +
> +	for imageType in ${KERNEL_IMAGETYPES} ; do
> +		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> +			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> +		fi
> +	done
> +
> +	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
> +	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
> +	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
> +	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
> +}
> +
> +# Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
> +do_kernel_version_sanity_check() {
> +	if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
> +		exit 0
> +	fi
> +
> +	# The Makefile determines the kernel version shown at runtime
> +	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
> +	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
> +	PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +	SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +	EXTRAVERSION=$(grep "^EXTRAVERSION =" ${S}/Makefile | sed s/.*=\ *//)
> +
> +	# Build a string for regex and a plain version string
> +	reg="^${VERSION}\.${PATCHLEVEL}"
> +	vers="${VERSION}.${PATCHLEVEL}"
> +	if [ -n "${SUBLEVEL}" ]; then
> +		# Ignoring a SUBLEVEL of zero is fine
> +		if [ "${SUBLEVEL}" = "0" ]; then
> +			reg="${reg}(\.${SUBLEVEL})?"
> +		else
> +			reg="${reg}\.${SUBLEVEL}"
> +			vers="${vers}.${SUBLEVEL}"
> +		fi
> +	fi
> +	vers="${vers}${EXTRAVERSION}"
> +	reg="${reg}${EXTRAVERSION}"
> +
> +	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
> +		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKIP=\"1\" in your recipe."
> +	fi
> +	exit 0
> +}
> +
> +addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir_setscene
> +
> +do_shared_workdir_setscene () {
> +	exit 1
> +}
> +
> +emit_depmod_pkgdata() {
> +	# Stash data for depmod
> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> +	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
> +}
> +
> +PACKAGEFUNCS += "emit_depmod_pkgdata"
> +
> +do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
> +do_shared_workdir () {
> +	cd ${B}
> +
> +	kerneldir=${STAGING_KERNEL_BUILDDIR}
> +	install -d $kerneldir
> +
> +	#
> +	# Store the kernel version in sysroots for module-base.bbclass
> +	#
> +
> +	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
> +	echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-localversion
> +
> +	# Copy files required for module builds
> +	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> +	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
> +	cp .config $kerneldir/
> +	mkdir -p $kerneldir/include/config
> +	cp include/config/kernel.release $kerneldir/include/config/kernel.release
> +	if [ -e certs/signing_key.x509 ]; then
> +		# The signing_key.* files are stored in the certs/ dir in
> +		# newer Linux kernels
> +		mkdir -p $kerneldir/certs
> +		cp certs/signing_key.* $kerneldir/certs/
> +	elif [ -e signing_key.priv ]; then
> +		cp signing_key.* $kerneldir/
> +	fi
> +
> +	# We can also copy over all the generated files and avoid special cases
> +	# like version.h, but we've opted to keep this small until file creep starts
> +	# to happen
> +	if [ -e include/linux/version.h ]; then
> +		mkdir -p $kerneldir/include/linux
> +		cp include/linux/version.h $kerneldir/include/linux/version.h
> +	fi
> +
> +	# As of Linux kernel version 3.0.1, the clean target removes
> +	# arch/powerpc/lib/crtsavres.o which is present in
> +	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
> +	if [ ${ARCH} = "powerpc" ]; then
> +		if [ -e arch/powerpc/lib/crtsavres.o ]; then
> +			mkdir -p $kerneldir/arch/powerpc/lib/
> +			cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
> +		fi
> +	fi
> +
> +	if [ -d include/generated ]; then
> +		mkdir -p $kerneldir/include/generated/
> +		cp -fR include/generated/* $kerneldir/include/generated/
> +	fi
> +
> +	if [ -d arch/${ARCH}/include/generated ]; then
> +		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
> +	fi
> +
> +	if (grep -q -i -e '^CONFIG_UNWINDER_ORC=y$' $kerneldir/.config); then
> +		# With CONFIG_UNWINDER_ORC (the default in 4.14), objtool is required for
> +		# out-of-tree modules to be able to generate object files.
> +		if [ -x tools/objtool/objtool ]; then
> +			mkdir -p ${kerneldir}/tools/objtool
> +			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
> +		fi
> +	fi
> +
> +	# When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
> +	# to copy the build assets generated for the randstruct seed to
> +	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
> +	# generate those assets which will result in a different
> +	# RANDSTRUCT_HASHED_SEED
> +	if [ -d scripts/basic ]; then
> +		mkdir -p ${kerneldir}/scripts
> +		cp -r scripts/basic ${kerneldir}/scripts
> +	fi
> +
> +	if [ -d scripts/gcc-plugins ]; then
> +		mkdir -p ${kerneldir}/scripts
> +		cp -r scripts/gcc-plugins ${kerneldir}/scripts
> +	fi
> +
> +}
> +
> +# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
> +SYSROOT_DIRS = ""
> +
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
> +
> +python check_oldest_kernel() {
> +    oldest_kernel = d.getVar('OLDEST_KERNEL')
> +    kernel_version = d.getVar('KERNEL_VERSION')
> +    tclibc = d.getVar('TCLIBC')
> +    if tclibc == 'glibc':
> +        kernel_version = kernel_version.split('-', 1)[0]
> +        if oldest_kernel and kernel_version:
> +            if bb.utils.vercmp_string(kernel_version, oldest_kernel) < 0:
> +                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of the kernel you are building is "%s" - therefore %s as built may not be compatible with this kernel. Either set OLDEST_KERNEL to an older version, or build a newer kernel.' % (d.getVar('PN'), oldest_kernel, kernel_version, tclibc))
> +}
> +
> +check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
> +do_compile[postfuncs] += "check_oldest_kernel"
> +
> +KERNEL_LOCALVERSION ??= ""
> +
> +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
> +# the local version. Having it empty means nothing will be added, and any
> +# value will be appended to the local kernel version. This replaces the
> +# use of .scmversion file for setting a localversion without using
> +# the CONFIG_LOCALVERSION option.
> +#
> +# Note: This class saves the value of localversion to a file
> +# so other recipes like make-mod-scripts can restore it via the
> +# helper function get_kernellocalversion_file
> +export LOCALVERSION = "${KERNEL_LOCALVERSION}"
> +
> +kernel_deprecated_do_configure() {
> +	# fixes extra + in /lib/modules/2.6.37+
> +	# $ scripts/setlocalversion . => +
> +	# $ make kernelversion => 2.6.37
> +	# $ make kernelrelease => 2.6.37+
> +	# See kernel-arch.bbclass for post v6.3 removal of the extra
> +	# + in localversion. .scmversion is no longer used, and the
> +	# variable LOCALVERSION must be used
> +	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> +		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> +	fi
> +
> +	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
> +		mv "${S}/.config" "${B}/.config"
> +	fi
> +
> +	# Copy defconfig to .config if .config does not exist. This allows
> +	# recipes to manage the .config themselves in do_configure:prepend().
> +	if [ -f "${UNPACKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
> +		cp "${UNPACKDIR}/defconfig" "${B}/.config"
> +	fi
> +
> +	${KERNEL_CONFIG_COMMAND}
> +}
> +
> +inherit cml1 pkgconfig
> +
> +EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
> +
> +# kernel-base becomes kernel-${KERNEL_VERSION}
> +# kernel-image becomes kernel-image-${KERNEL_VERSION}
> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> +FILES:${PN} = ""
> +FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> +FILES:${KERNEL_PACKAGE_NAME}-image = ""
> +FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> +FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> +FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> +FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> +RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
> +# Allow machines to override this dependency if kernel image files are
> +# not wanted in images as standard
> +RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
> +PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> +RPROVIDES:${KERNEL_PACKAGE_NAME}-image += "${KERNEL_PACKAGE_NAME}-image"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
> +PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> +RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}-base"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> +DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
> +
> +pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> +	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> +		mkdir -p $D/lib/modules/${KERNEL_VERSION}
> +	fi
> +	if [ -n "$D" ]; then
> +		depmodwrapper -a -b $D ${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}
> +	else
> +		depmod -a ${KERNEL_VERSION}
> +	fi
> +}
> +
> +PACKAGESPLITFUNCS =+ "split_kernel_packages"
> +
> +python split_kernel_packages () {
> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex=r'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> +}
> +
> +# Many scripts want to look in arch/$arch/boot for the bootable
> +# image. This poses a problem for vmlinux and vmlinuz based
> +# booting. This task arranges to have vmlinux and vmlinuz appear
> +# in the normalized directory location.
> +do_kernel_link_images() {
> +	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
> +		mkdir ${B}/arch/${ARCH}/boot
> +	fi
> +	cd ${B}/arch/${ARCH}/boot
> +	ln -sf ../../../vmlinux
> +	if [ -f ../../../vmlinuz ]; then
> +		ln -sf ../../../vmlinuz
> +	fi
> +	if [ -f ../../../vmlinuz.bin ]; then
> +		ln -sf ../../../vmlinuz.bin
> +	fi
> +	if [ -f ../../../vmlinux.64 ]; then
> +		ln -sf ../../../vmlinux.64
> +	fi
> +}
> +addtask kernel_link_images after do_compile before do_strip
> +
> +python do_strip() {
> +    import shutil
> +
> +    strip = d.getVar('KERNEL_STRIP')
> +    extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
> +    kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
> +
> +    if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
> +        kernel_image_stripped = kernel_image + ".stripped"
> +        shutil.copy2(kernel_image, kernel_image_stripped)
> +        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
> +        bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
> +            extra_sections)
> +}
> +do_strip[dirs] = "${B}"
> +
> +addtask strip before do_sizecheck after do_kernel_link_images
> +
> +# Support checking the kernel size since some kernels need to reside in partitions
> +# with a fixed length or there is a limit in transferring the kernel to memory.
> +# If more than one image type is enabled, warn on any that don't fit but only fail
> +# if none fit.
> +do_sizecheck() {
> +	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
> +		invalid=`echo ${KERNEL_IMAGE_MAXSIZE} | sed 's/[0-9]//g'`
> +		if [ -n "$invalid" ]; then
> +			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integer (The unit is Kbytes)"
> +		fi
> +		at_least_one_fits=
> +		for imageType in ${KERNEL_IMAGETYPES} ; do
> +			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`
> +			if [ $size -gt ${KERNEL_IMAGE_MAXSIZE} ]; then
> +				bbwarn "This kernel $imageType (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
> +			else
> +				at_least_one_fits=y
> +			fi
> +		done
> +		if [ -z "$at_least_one_fits" ]; then
> +			die "All kernel images are too big for your device. Please reduce the size of the kernel by making more of it modular."
> +		fi
> +	fi
> +}
> +do_sizecheck[dirs] = "${B}"
> +
> +addtask sizecheck before do_install after do_strip
> +
> +inherit kernel-artifact-names
> +
> +kernel_deprecated_do_deploy() {
> +	deployDir="${DEPLOYDIR}"
> +	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> +		deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
> +		mkdir "$deployDir"
> +	fi
> +
> +	for imageType in ${KERNEL_IMAGETYPES} ; do
> +		baseName=$imageType-${KERNEL_IMAGE_NAME}
> +
> +		if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
> +			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
> +		else
> +			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
> +		fi
> +		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
> +			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
> +		fi
> +		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
> +			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType
> +		fi
> +	done
> +
> +	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> +		mkdir -p ${D}${root_prefix}/lib
> +		if [ -n "${SOURCE_DATE_EPOCH}" ]; then
> +			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
> +		else
> +			TAR_ARGS=""
> +		fi
> +		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
> +		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
> +
> +		if [ -n "${MODULE_TARBALL_LINK_NAME}" ] ; then
> +			ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
> +		fi
> +	fi
> +
> +	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +		for imageType in ${KERNEL_IMAGETYPES} ; do
> +			if [ "$imageType" = "fitImage" ] ; then
> +				continue
> +			fi
> +			initramfsBaseName=$imageType-${INITRAMFS_NAME}
> +			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
> +			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
> +				ln -sf $initramfsBaseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${INITRAMFS_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
> +			fi
> +		done
> +	fi
> +}
> +
> +# We deploy to filenames that include PKGV and PKGR, read the saved data to
> +# ensure we get the right values for both
> +do_deploy[prefuncs] += "read_subpackage_metadata"
> +
> +addtask deploy after do_populate_sysroot do_packagedata
> +
> +EXPORT_FUNCTIONS do_deploy
> +
> +# Add using Device Tree support
> +inherit kernel-devicetree
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 8d45a329..ec9a8944 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -10,7 +10,7 @@ require conf/machine/include/ti-bsp.inc
>   
>   KERNEL_IMAGETYPE = "Image"
>   KERNEL_IMAGETYPES = "Image fitImage"
> -KERNEL_CLASSES += "kernel-fitimage"
> +KERNEL_CLASSES += "kernel-fitimage-deprecated"
>   
>   UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x81000000"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> index 0b938470..252fb28a 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> @@ -1,5 +1,5 @@
>   IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
> -KERNEL_CLASSES:remove = "kernel-fitimage"
> +KERNEL_CLASSES:remove = "kernel-fitimage-deprecated"
>   KERNEL_CLASSES += "kernel-fitimage-legacyhs"
>   UBOOT_DTB_LOADADDRESS = "0x88000000"
>   UBOOT_LOADADDRESS = "0x82000000"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index b4ec47bc..4e9ae3a1 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "Mainline Linux kernel for TI devices"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
> -inherit kernel
> +inherit kernel_deprecated
>   
>   require recipes-kernel/linux/ti-kernel.inc
>   
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 8208e930..7c91a3d4 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
>   inherit ti-secdev
> -inherit kernel
> +inherit kernel_deprecated
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index c250a9a2..03a3746a 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
>   inherit ti-secdev
> -inherit kernel
> +inherit kernel_deprecated
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index 17bcd300..1eaa859d 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
>   inherit ti-secdev
> -inherit kernel
> +inherit kernel_deprecated
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/ti-kernel.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18631): https://lists.yoctoproject.org/g/meta-ti/message/18631
> Mute This Topic: https://lists.yoctoproject.org/mt/113561430/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

