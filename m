Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0FBEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 15:00:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.738.1687359595578393295
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eY/Ugwfe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LExssx121697;
	Wed, 21 Jun 2023 09:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687359594;
	bh=7L+dEPb1VnyB37YjIfwaIvwf1j6F+KtUvohqyr5ylcs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=eY/UgwfenAMclh00Z4w3ug8rRzgzS4NFgFPHcZ+iyBzM/1wuEFD9GexlnGX/4mHJo
	 wyhHNe09mDiNBecJAIux8t93NoR5W1DuSy6sioA2rt283VW5iO8vnPcf2qYXJkDbew
	 ZeadFLqHInawOpUWODY6mAvmenRCNTXEhV1fCTJE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LExsZQ045911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 09:59:54 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 09:59:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 09:59:53 -0500
Received: from [10.250.37.10] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LExr3j114549;
	Wed, 21 Jun 2023 09:59:53 -0500
Message-ID: <addccf44-0b38-4acc-8b86-e412b33c03a5@ti.com>
Date: Wed, 21 Jun 2023 09:59:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2] pruhsr-fw: SR2.0: Add new
 firmware
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620221555.4561-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230620221555.4561-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 15:00:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16759

On 6/20/23 5:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We need to package up new HSR firmware for am65x-sr2.  Add dependencies
> for them on the correct platforms.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Names of firmware were changed to match existing filenames.
> 
>   .../pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb      | 34 +++++++++++++++++++
>   .../recipes-kernel/linux/kernel-rdepends.inc  |  4 +--
>   2 files changed, 36 insertions(+), 2 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
> new file mode 100644
> index 00000000..c31af832
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
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

Is this needed? I don't think the package changes based on machine here.

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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16754): https://lists.yoctoproject.org/g/meta-ti/message/16754
> Mute This Topic: https://lists.yoctoproject.org/mt/99665494/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

