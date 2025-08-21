Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69882CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10282.1755784989165567172
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 07:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LpEaXFbA;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LE38qe025425
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755784988;
	bh=WnrxbgBwO/OqR8b2cZs1hJVUeSACj9lR4HOjDUUlVdM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LpEaXFbAlub/Cf6qj81I16wmsvSfbTSsmVvP5oa11HNoygt3WSUKlwHOo8ztFxBeS
	 YcbNQ5xMwQ6zLGXj/4TQU6L4kVFFA70qw9ccp6NtiU6Cj3aB25Or6doL42iamOr3Al
	 PiZ46N62LMUz5ZmzfQGnaSbomsQ71+yhpw8t/kD8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LE38uX2869620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:03:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 09:03:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 09:03:08 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LE38RF2263734;
	Thu, 21 Aug 2025 09:03:08 -0500
Message-ID: <4773c9a8-b218-4f4e-a2e4-e9d95d5f2c2b@ti.com>
Date: Thu, 21 Aug 2025 09:03:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia:
 Add udev rules for VPU and JPEG encoder symlinks
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
References: <20250821032055.388954-1-t-lannynd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250821032055.388954-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 14:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18947

On 8/20/25 10:20 PM, Thorsten Lannynd wrote:
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
> ---
>   meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb   | 2 ++
>   .../ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb       | 2 ++
>   .../ti-multimedia-udev/files/67-multimedia.rules         | 5 +++++
>   .../ti-multimedia-udev/ti-multimedia-udev.bb             | 9 +++++++++
>   4 files changed, 18 insertions(+)
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
> index 9a3b6bfd..3ffde870 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> @@ -21,3 +21,5 @@ TARGET_PRODUCT:j721e = "j721e_linux"
>   S = "${WORKDIR}/git"
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
> index 00000000..24c25b1a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
> @@ -0,0 +1,9 @@

You'll probably need a proper SUMMARY = "Rules to ensure consistent device naming for.." here.

Rest of the patch looks fine,

Reviewed-by: Andrew Davis <afd@ti.com>

> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI += "file://67-multimedia.rules"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/67-multimedia.rules ${D}${sysconfdir}/udev/rules.d/
> +}


