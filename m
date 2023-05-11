Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACBBC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:45:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6466.1683834338495985035
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MMyFH5j+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BJjXj4108797;
	Thu, 11 May 2023 14:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683834333;
	bh=02WGQsnW2CG9pqlQ8uR4tvAZoIDKg0Iwhc7fnHecMwU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MMyFH5j+nG4doJjVBVnNYNaL1h1y5MtXHhEZTsIk/kOyjlYjMQoxHWoZO9nduc1ka
	 FP4SoIbxmyoWAadtjdO2rovmDCt+r8qiZWpmUwl5/qtxRWPufd88ujnWso/gtvTVFY
	 bfPhXuV7M37eNZpq/Ikt07JX7horQEXmNVrEycOE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BJjX3n071653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 14:45:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 14:45:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 14:45:32 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BJjVUk050765;
	Thu, 11 May 2023 14:45:32 -0500
Message-ID: <cbe8ef09-9fce-8c60-be43-5345c1f6e011@ti.com>
Date: Thu, 11 May 2023 14:45:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/2] optee-os: only activate
 customizations for TI platforms
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230511184301.1075335-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230511184301.1075335-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16520


This does not apply against kirkstone cleanly because of the optee 
version change from 3.16 to % for master.  I'll fix it as I apply the 
patch, but I wanted to inform anyone trying it themselves.


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
>   .../{optee-os_%.bbappend => optee-os-ti.inc}  |   0
>   .../optee/optee-os_%.bbappend                 | 116 +-----------------
>   2 files changed, 3 insertions(+), 113 deletions(-)
>   copy meta-ti-bsp/recipes-security/optee/{optee-os_%.bbappend => optee-os-ti.inc} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> similarity index 100%
> copy from meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> copy to meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 4f052996..0067cdc7 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -1,114 +1,4 @@
> -# Use TI SECDEV for signing
> -inherit ti-secdev
> +OPTEE_TI = ""
> +OPTEE_TI:ti-soc = "optee-os-ti.inc"
>   
> -EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
> -
> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -
> -do_compile:append:k3() {
> -    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
> -    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
> -    cp ${B}/core/tee.elf ${B}/bl32.elf
> -}
> -
> -# Signing procedure for legacy HS devices
> -optee_sign_legacyhs() {
> -    ( cd ${B}/core/; \
> -        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
> -        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
> -        mv tee.bin.signed ${B}/$normfl.optee; \
> -    )
> -
> -    if [ "${OPTEEPAGER}" = "y" ]; then
> -        oe_runmake -C ${S} clean
> -        oe_runmake -C ${S} all CFG_TEE_TA_LOG_LEVEL=0 CFG_WITH_PAGER=y
> -        ( cd ${B}/core/; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
> -            normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
> -            mv tee.bin.signed ${B}/$normfl-pager.optee; \
> -        )
> -    fi
> -}
> -
> -do_compile:append:ti43x() {
> -    optee_sign_legacyhs
> -}
> -
> -do_compile:append:dra7xx() {
> -    optee_sign_legacyhs
> -}
> -
> -# Signing procedure for K3 devices
> -optee_sign_k3hs() {
> -    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
> -    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
> -    cp ${B}/core/tee.elf ${B}/bl32.elf
> -}
> -
> -do_compile:append:am65xx-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am64xx-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am62xx-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am62xx-lp-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am62axx-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j721e-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j7200-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j721s2-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j784s4-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_install:append:ti-soc() {
> -    install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
> -    install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
> -    install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/firmware/ || true
> -    install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
> -}
> -
> -optee_deploy_legacyhs() {
> -    cd ${DEPLOYDIR}/
> -    for f in optee/*.optee; do
> -        ln -sf $f ${DEPLOYDIR}/
> -    done
> -}
> -
> -do_deploy:append:ti43x() {
> -    optee_deploy_legacyhs
> -}
> -
> -do_deploy:append:dra7xx() {
> -    optee_deploy_legacyhs
> -}
> -
> -do_deploy:append:k3() {
> -    ln -sf optee/bl32.bin ${DEPLOYDIR}/
> -    ln -sf optee/bl32.bin.unsigned ${DEPLOYDIR}/
> -    ln -sf optee/bl32.elf ${DEPLOYDIR}/
> -}
> -
> -# This is needed for bl32.elf
> -INSANE_SKIP:${PN}:append:k3 = " textrel"
> +require ${OPTEE_TI}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16517): https://lists.yoctoproject.org/g/meta-ti/message/16517
> Mute This Topic: https://lists.yoctoproject.org/mt/98834089/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

