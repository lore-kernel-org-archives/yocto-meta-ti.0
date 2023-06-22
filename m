Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F0AEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 11:46:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9231.1687434380023976961
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 04:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xy5KYC3B;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MBkI9s003006;
	Thu, 22 Jun 2023 06:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687434378;
	bh=8ath3ZCEuQ5yfN/rfbA5hM7X0XcJtxQlDrZeopnGJps=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Xy5KYC3B0SiPSAKTo8LtrRZBFoLqEeWEkKcFII3Ffy3F12U26BHMnaV2GGEKn/G1n
	 uGhrF1P54wYWPvyQTErcw9WNiq0RE7z5um7zRX0iazSrJd+kYvDYS78UieuL4vaUBl
	 mIlh7d2/M3/2dg0S5BFNp3x3ET4pObJwvvhLMfL0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MBkIts110272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 06:46:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 06:46:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 06:46:18 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MBkI8Q056755;
	Thu, 22 Jun 2023 06:46:18 -0500
Message-ID: <2fddcfef-5776-a9d2-e56a-6c7f1b3b39b4@ti.com>
Date: Thu, 22 Jun 2023 06:46:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [master/kirkstone][PATCH v3] pruhsr-fw: SR2.0: Add new firmware
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>, <praneeth@ti.com>
References: <20230622070336.10002-1-r-gunasekaran@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230622070336.10002-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 11:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16774



On 6/22/2023 2:03 AM, Ravi Gunasekaran wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> We need to package up new HSR firmware for am65x-sr2.  Add dependencies
> for them on the correct platforms.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> Changes in v3:
> --------------
> Filename "pruhsr-fw_am65x-sr2_git.bb" and package name "pruhsr-fw-am65x-sr2"
> were mismatching. Fixed the filename similar to switch firmware
> "prusw-fw-am65x-sr2_git.bb"

Thanks.  It was first on my list this morning to test my patch, but you 
beat me to the punch and found my issue.  Much appreciated.


> Changes in v2:
> --------------
> Names of firmware were changed to match existing filenames.
> 
>   .../pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb      | 34 +++++++++++++++++++
>   .../recipes-kernel/linux/kernel-rdepends.inc  |  4 +--
>   2 files changed, 36 insertions(+), 2 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> new file mode 100644
> index 00000000..c31af832
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "PRU HSR firmware for AM65xx SR2.0"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +CLEANBROKEN = "1"
> +
> +COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = " \
> +    am65x-sr2-pru0-pruhsr-fw.elf \
> +    am65x-sr2-pru1-pruhsr-fw.elf \
> +    am65x-sr2-rtu0-pruhsr-fw.elf \
> +    am65x-sr2-rtu1-pruhsr-fw.elf \
> +    am65x-sr2-txpru0-pruhsr-fw.elf \
> +    am65x-sr2-txpru1-pruhsr-fw.elf \
> +"
> +
> +do_install() {
> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> +	for f in ${TARGET}; do
> +		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
> +	done
> +}
> +
> +FILES:${PN} = "${nonarch_base_libdir}/firmware"
> +
> +INSANE_SKIP:${PN} = "arch"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index d2dcc3e5..7c8f3171 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -16,8 +16,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
>   
>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
>   RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

