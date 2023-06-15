Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94859EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:28:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.29073.1686860894740475424
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 13:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y+gpq3aP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKSDih116443;
	Thu, 15 Jun 2023 15:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686860893;
	bh=cAlVEqtN5eiYisxQpJTtXhrrFod71AhZPN+aXRvPdsg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Y+gpq3aPeYD2Ba7IIpK0c5WWw8BbkgbY8XOnqnXcXH4bDyEfEmz3Jwo7nxBmmpPbT
	 y1r15GIT4mj9955+8ZgaDup5DIDMHE4LY2pkQUU/yEi60C8eK6/cLOoTWIdFOS7GA/
	 RYum4Zab0cCkjUtjiWBF8MeCaK4hZetfvm4ozugk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKSDSl017842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:28:13 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:28:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:28:13 -0500
Received: from [10.247.25.76] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKSDHH119198;
	Thu, 15 Jun 2023 15:28:13 -0500
Message-ID: <1dc853f4-d803-32d1-147c-f65353dcc7f0@ti.com>
Date: Thu, 15 Jun 2023 15:28:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-sci-fw: Include the TIFS
 LPM stub with the rest of SYSFW
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230615201849.211619-1-afd@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230615201849.211619-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 20:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16737



On 6/15/2023 3:18 PM, Andrew Davis via lists.yoctoproject.org wrote:
> This firmware is shipped with the rest of ti-sysfw blobs, it shares
> the same versions too and so should be simply bundled with the same.
> 
> This stub is also built into U-Boot and not loaded during kernel
> runtime anymore, so remove the RDEPENDS in kernel.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 -
>   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
>   .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 23 -------------------
>   .../recipes-kernel/linux/kernel-rdepends.inc  |  4 ----
>   4 files changed, 1 insertion(+), 28 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 8e1b68c4..a3d43fd1 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -14,7 +14,6 @@ GOODIX_FW_VERSION = "1.0.0.0"
>   CADENCE_MHDP_FW_VERSION = "2.1.0"
>   IMG_DEC_FW_VERSION = "1.0"
>   CNM_WAVE521_FW_VERSION = "1.0.00"
> -TIFS_LPM_STUB_FW_VERSION = "08.06.04"
>   TI_DM_FW_VERSION = "08.06.04"
>   TI_SYSFW_VERSION = "08.06.04"
>   
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 6a4c03f9..5ad1e688 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -18,6 +18,7 @@ do_install() {
>   	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
>   	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
>   	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
> +	install -m 644 ${S}/ti-sysfw/ti-fs-stub-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
>   }
>   
>   FILES:${PN} = "${nonarch_base_libdir}/firmware"
> diff --git a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> deleted file mode 100644
> index 2db761ba..00000000
> --- a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "TI Foundational security Low Power Management Stub"
> -
> -require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> -
> -PV = "${TIFS_LPM_STUB_FW_VERSION}"
> -PR = "${INC_PR}.0"
> -
> -CLEANBROKEN = "1"
> -
> -COMPATIBLE_MACHINE = "am62xx|am62axx"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -TARGET = "ti-fs-stub-firmware-am62x-gp-signed.bin"
> -
> -do_install() {
> -	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw/
> -	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${nonarch_base_libdir}/firmware/ti-sysfw/${TARGET}
> -}
> -
> -FILES:${PN} = "${nonarch_base_libdir}/firmware"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 69796915..18984e80 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -31,7 +31,3 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
> -
> -# Add run-time dependency for TIFS Low Power Module stub
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx = " tifs-lpm-stub"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " tifs-lpm-stub"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16736): https://lists.yoctoproject.org/g/meta-ti/message/16736
> Mute This Topic: https://lists.yoctoproject.org/mt/99557243/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

