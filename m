Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A34C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 06:17:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10241.1710310635737680315
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 23:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hmukT466;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42D6HEZt124308;
	Wed, 13 Mar 2024 01:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710310634;
	bh=Vo5ZC/nY+32dD3EsV1tn9SnMXmmkSuIzB8QiR3ta7+A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hmukT466S6rY1BiG7/b0WfiP2AHLX6zv0pyS+MH3ktlXOSh2r9+qyyYhUuF/LQCVP
	 RB7DgRm2XvUnl3sx9bVtC0ao5LOMBmxhfDJOAdZDTM1ZdzlTG/ZK0HXwi6ue+iQplc
	 0VaY6oOFewjTF5gOyUHtYKZSpH4vzQKghquShGnI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42D6HE53037065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Mar 2024 01:17:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Mar 2024 01:17:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Mar 2024 01:17:14 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42D6HCku056482;
	Wed, 13 Mar 2024 01:17:12 -0500
Message-ID: <1d50816d-65fc-4eb8-8d2a-bc044b90471d@ti.com>
Date: Wed, 13 Mar 2024 11:47:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master][PATCH 1/5] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240312154243.17627-1-afd@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240312154243.17627-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17522

On 12/03/24 21:12, Andrew Davis via lists.yoctoproject.org wrote:
> Most firmware does not run on the host and is therefor not 
> architecture specific, at least as far as the package manager is 
> concerned. Although the firmware might not be useful on some machines, 
> the package itself is not machine specific. Remove
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Most firmware does not run on the host and is therefor not architecture
s/therefor/therefore
> specific, at least as far as the package manager is concerned. Although
> the firmware might not be useful on some machines, the package itself
> is not machine specific. Remove PACKAGE_ARCH.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 --
>   meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 2 --
>   meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     | 1 -
>   meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb             | 2 --
>   meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 2 --
>   meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 2 --
>   meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb   | 2 --
>   meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 2 --
>   meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 2 --
>   meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb              | 1 -
>   meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           | 1 -
>   11 files changed, 19 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index d88bca6e..ed1c7817 100644
> --- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = "mhdp8546.bin"
>   
>   do_install() {
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index d1b99979..1a2e911c 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -12,8 +12,6 @@ PR = "${INC_PR}.1"
>   
>   COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|am62axx|am62pxx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET_WAVE521C = "wave521c_codec_fw.bin"
>   
>   SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
> diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 61b1b986..95ba1e2d 100755
> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -4,7 +4,6 @@ LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
>   
>   PV = "6.2+git"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit update-alternatives
>   
> diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> index e58f2d58..ee3a94dc 100644
> --- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "dra7xx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>   TARGET = "goodix_9271_cfg.bin"
>   
> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 2c0736ed..4b6ef75d 100644
> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = " \
>       am65x-sr2-pru0-prueth-fw.elf \
>       am65x-sr2-pru1-prueth-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> index 8b15ab7f..20b2bfb9 100644
> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "am65xx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = " \
>       am65x-pru0-prueth-fw.elf \
>       am65x-pru1-prueth-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> index ea39d73d..bc731094 100644
> --- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = " \
>       am65x-sr2-pru0-pruhsr-fw.elf \
>       am65x-sr2-pru1-pruhsr-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> index 63c2d311..6e296e7c 100644
> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = " \
>       am65x-sr2-pru0-prusw-fw.elf \
>       am65x-sr2-pru1-prusw-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> index d295a1c1..74729c16 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -9,8 +9,6 @@ PR = "${INC_PR}.0"
>   
>   COMPATIBLE_MACHINE = "j721e"
>   
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>   TARGET = "pvdec_full_bin.fw"
>   
>   do_install() {
> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> index 7d16ae39..4ec09a70 100644
> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> @@ -3,7 +3,6 @@ LICENSE = "TI-TSPA"
>   LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
>   
>   COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   PR = "r1"
>   
> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> index 2452d111..8af49577 100644
> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> @@ -4,7 +4,6 @@ LICENSE = "TI-TSPA"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
>   
>   COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
>   SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
> -- 
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17516): https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/message/17516__;!!G3vK!SOWH7xa4sXTpNoXJeNKUQ88iApWOwwFwJtcOijUMYwpuP_T9_QszPWk8CoNoG_d9HQ2hWNbH6aUMkVuEet7_K6qiBRhQ$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/104886932/7030289__;!!G3vK!SOWH7xa4sXTpNoXJeNKUQ88iApWOwwFwJtcOijUMYwpuP_T9_QszPWk8CoNoG_d9HQ2hWNbH6aUMkVuEet7_KyWG9S8P$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!SOWH7xa4sXTpNoXJeNKUQ88iApWOwwFwJtcOijUMYwpuP_T9_QszPWk8CoNoG_d9HQ2hWNbH6aUMkVuEet7_K5vyG5Av$  [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

