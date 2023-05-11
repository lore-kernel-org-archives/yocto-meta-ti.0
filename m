Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12490C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:46:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6482.1683834376316564541
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BYlUdyd/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BJkBe8022850;
	Thu, 11 May 2023 14:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683834371;
	bh=GOSeA2p5+fu2vY86iNnod3FpfuVm1ROUCQsoiPWFedA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BYlUdyd/cGpVy1Jm3pBH1P/dW0pJQfuTaKEuH6bxe2YUMib1OQuSU8kXpQ70yrT7w
	 PFj8oRnRMOPAtz3A38ew2DbgW7YTQ02bciMIU7DrZPt5eIdUwrVkNmoWTwQm6ApSHu
	 nMnBDXPoOZnkrOb8w+ELltrok5v51xQ+EA1wPbR0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BJkBrX093696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 14:46:11 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 14:46:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 14:46:11 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BJkBAZ000616;
	Thu, 11 May 2023 14:46:11 -0500
Message-ID: <9470a393-2241-bf48-41cf-77d14ec79ae7@ti.com>
Date: Thu, 11 May 2023 14:46:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] trusted-firmware-a: only
 activate customizations for TI platforms
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230511184301.1075335-1-denis@denix.org>
 <20230511184301.1075335-2-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230511184301.1075335-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16521


This does not apply against kirkstone cleanly because of a patch applied 
to the master recipe that is not in kirkstone.  I'll fix it as I apply 
the patch, but I wanted to inform anyone trying it themselves.


On 5/11/2023 1:43 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Avoid inheriting ti-secdev class and adding unconditional dependency
> on TI_SECURE_DEV_PKG and other variables, when meta-ti-bsp is in the
> bblayers.conf stack, but not building for TI platforms. This solves
> yocto-check-layer signature test for Yocto Project compliance.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   ...a_%.bbappend => trusted-firmware-a-ti.inc} |  0
>   .../trusted-firmware-a_%.bbappend             | 72 +------------------
>   2 files changed, 3 insertions(+), 69 deletions(-)
>   copy meta-ti-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_%.bbappend => trusted-firmware-a-ti.inc} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> similarity index 100%
> copy from meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> copy to meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 4ea63205..00d08a51 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,70 +1,4 @@
> -PV:k3 = "2.8+git${SRCPV}"
> -SRCREV_tfa:k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
> -SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> -COMPATIBLE_MACHINE:k3 = "k3"
> -TFA_BUILD_TARGET:k3 = "all"
> -TFA_INSTALL_TARGET:k3 = "bl31"
> -TFA_SPD:k3 = "opteed"
> +TFA_TI = ""
> +TFA_TI:k3 = "trusted-firmware-a-ti.inc"
>   
> -SRC_URI:append:k3 = " file://rwx-segments-ti.patch"
> -FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> -
> -# Use TI SECDEV for signing
> -inherit ti-secdev
> -
> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> -
> -# Signing procedure for K3 HS devices
> -tfa_sign_k3hs() {
> -	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
> -	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
> -}
> -
> -do_compile:append:am65xx-hs-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:am64xx-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:am62xx-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:am62xx-lp-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:am62axx-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:j721e-hs-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:j7200-hs-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:j721s2-hs-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_compile:append:j784s4-hs-evm() {
> -    tfa_sign_k3hs
> -}
> -
> -do_install:append:k3() {
> -    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
> -        echo "Install bl31.bin.unsigned"
> -        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
> -        ${D}/firmware/bl31.bin.unsigned
> -    else
> -        echo "Install bl31.bin.unsigned"
> -        install -m 0644 ${BUILD_DIR}/bl31.bin \
> -        ${D}/firmware/bl31.bin.unsigned
> -    fi
> -}
> +require ${TFA_TI}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16518): https://lists.yoctoproject.org/g/meta-ti/message/16518
> Mute This Topic: https://lists.yoctoproject.org/mt/98834090/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

