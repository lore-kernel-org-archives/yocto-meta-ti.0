Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8CACA0FE8
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:51:09 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.43734.1756140666013928689
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 09:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tRnheS3a;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PGp5v7856102
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 11:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756140665;
	bh=ZevdMUgrt7malfu0zzBuczl+A9tUWSAaQXsXz9HR6bM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tRnheS3aTALtklwDpNow3HYnDfhBMXpS7aWYAxKwYR3K0KnI3Cg2XX/UxpDosq9OK
	 KXpZHYAVwl/lqXxMf9cTSXcrhv1ObfKaNmy9BC+M4lWfzLkOKx0Qz5F6Gc/wpgIAL/
	 zcaRM7sKThVrJQ5XLR/plf/JE/cld2TJbXMTExbU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PGp517745211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 11:51:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 11:51:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 11:51:05 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PGp4Gu022295;
	Mon, 25 Aug 2025 11:51:04 -0500
Message-ID: <60eca568-fabf-41cf-90e2-dbd715d0db61@ti.com>
Date: Mon, 25 Aug 2025 11:51:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev
 rules for VPU and JPEG encoder symlinks
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <afd@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
References: <20250821160944.845890-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250821160944.845890-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 16:51:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18969



On 8/21/2025 11:09 AM, Thorsten Lannynd wrote:
> This patch introduces udev rules to ensure consistent device naming for
> VPU decoders, encoders, and the JPEG encoder. These rules are essential
> for enabling hardware-accelerated video decoding in Chromium using the
> V4L2 Stateful decoder.
> 
> The following udev rules are added:
> - Map vpu and vpu0 to /dev/video-dec0 and /dev/video-enc0.
> - Map vpu1 to /dev/video-dec1 and /dev/video-enc1.
> - Map the JPEG encoder to /dev/jpeg-enc0.
> 
> These changes ensure proper operation of the VPU and JPEG encoder,
> especially when other video devices are connected, avoiding mismatches.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> Reviewed-by: Andrew Davis <afd@ti.com>
> ---
> 
> v2:
> - Split patch into seperate master and scarthgap patches
> - Added SUMMARY to bitbake recipe
> 
>   .../recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb        |  2 ++
>   .../ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb    |  2 ++
>   .../ti-multimedia-udev/files/67-multimedia.rules      |  5 +++++
>   .../ti-multimedia-udev/ti-multimedia-udev.bb          | 11 +++++++++++
>   4 files changed, 20 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
>   create mode 100644 meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 6a65992f..95bfd01a 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -27,3 +27,5 @@ do_install() {
>   	install -d ${D}${nonarch_base_libdir}/firmware/cnm
>   	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${nonarch_base_libdir}/firmware/cnm/${TARGET_WAVE521C}
>   }
> +
> +RDEPENDS:${PN} += "ti-multimedia-udev"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> index f73f59fa..cdcf4af0 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> @@ -19,3 +19,5 @@ SRCREV = "0bcbb20af32ea13275b452f0e84f5a49966d0bf6"
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   
>   EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> +
> +RDEPENDS:${PN} += "ti-multimedia-udev"
> diff --git a/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
> new file mode 100644
> index 00000000..5239d1ef
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
> @@ -0,0 +1,5 @@
> +SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/*210000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU decoder", SYMLINK+="video-dec0"
> +SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/*210000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU encoder", SYMLINK+="video-enc0"
> +SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/4220000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU decoder", SYMLINK+="video-dec1"
> +SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/4220000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU encoder", SYMLINK+="video-enc1"
> +SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/fd20000.jpeg-encoder/video4linux/video*", ATTR{name}=="e5010", SYMLINK+="jpeg-enc0"
> diff --git a/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
> new file mode 100644
> index 00000000..40b0db8e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Udev rules for device naming of VPU devices and JPEG encoder"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI += "file://67-multimedia.rules"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/67-multimedia.rules ${D}${sysconfdir}/udev/rules.d/
> +}


This recipe is throwing warnings and errors out on master.  Please test 
your patches on both branches when sending them in.

The warning is:

WARNING: ti-multimedia-udev-1.0-r0 do_unpack: ti-multimedia-udev: the 
directory ${UNPACKDIR}/${BP} 
(/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/aarch64-oe-linux/ti-multimedia-udev/1.0/sources/ti-multimedia-udev-1.0) 
pointed to by the S variable doesn't exist - please set S within the 
recipe to point to where the source has been unpacked to

This is because your recipe does not actually have anything to unpack 
(tarball, or git repo).  In the case where a recipe only refers to files 
located in the meta layer, you need to add this:

S = "${UNPACKDIR}"

The error is:
| install: cannot stat 
'/scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/aarch64-oe-linux/ti-multimedia-udev/1.0/67-multimedia.rules': 
No such file or directory

This is because you refer to WORKDIR in the do_install.  That needs to 
be pointing to UNAPCKDIR dir instead.  This is a change in master.

     install -m 0644 ${UNPACKDIR}/67-multimedia.rules 
${D}${sysconfdir}/udev/rules.d/


Please fix the master patch and send a v3.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

