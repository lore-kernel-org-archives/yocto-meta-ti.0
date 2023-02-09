Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A8AC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 00:29:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2258.1675902558669790918
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 16:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VJzKn7IY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3190TGkQ063536;
	Wed, 8 Feb 2023 18:29:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675902556;
	bh=Urmnqh+Jnr8jvPbTeE1b5aqD4WrqgnohbqPPbvtaotk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=VJzKn7IY459ZnL8QBpmY+43EGiuB3bc8Za/rXuh2J7uN2WXKurokBBkWFKqTTMrfA
	 of+THFZmiq54qjc+lvCRrHQOJwu3VbVgiBM1QuMcNfjkAF+b0inLcfjRbh84hgNt6K
	 AVFt/tZEEKDq/re1f9zwAm0A67ETOL2G5BNHThHM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3190TGjL115694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 18:29:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 18:29:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 18:29:16 -0600
Received: from [10.250.32.73] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3190TF58023206;
	Wed, 8 Feb 2023 18:29:15 -0600
Message-ID: <f1938ab3-ca5d-7f82-976f-767201605304@ti.com>
Date: Wed, 8 Feb 2023 18:29:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] optee-os: Use ti-k3-secdev
 if TI_SECURE_DEV_PKG_K3 is not defined
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230208231031.16363-1-afd@ti.com>
 <20230208231031.16363-2-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230208231031.16363-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 00:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15767


I had to hand apply the patch to master since the file names for 
optee_os differ between the two branches due to this kirkstone patch:

https://lists.yoctoproject.org/g/meta-ti/message/15331


On 2/8/2023 17:10, Andrew Davis wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment. This allows us to use these tools
> unconditionally. Remove the checks for the script and do the signing
> for all K3 machines. The signature is automatically stripped from
> the binaries on non-HS devices at boot time as needed so this change
> is harmless for GP devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../optee/optee-os_3.16%.bbappend             | 44 +++++--------------
>   1 file changed, 12 insertions(+), 32 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> index 6913851b..5a693247 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> @@ -1,6 +1,14 @@
>   PV:ti-soc = "3.19.0+git${SRCPV}"
>   SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
>   
> +# Use default package TI SECDEV is one is not provided
> +DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> +
> +# set a default value for TI_K3_SECDEV_INSTALL_DIR
> +export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> +include recipes-ti/includes/ti-paths.inc
> +TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> +
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
>   EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> @@ -35,20 +43,6 @@ optee_sign_legacyhs() {
>       fi
>   }
>   
> -# Signing procedure for K3 HS devices
> -optee_sign_k3hs() {
> -    ( cd ${B}/core/; \
> -        if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
> -        else \
> -            echo "Warning: TI_SECURE_DEV_PKG not set, OP-TEE not signed."; \
> -            cp tee-pager_v2.bin tee-pager.bin.signed; \
> -        fi; \
> -        mv tee-pager.bin.signed ${B}/bl32.bin; \
> -        cp tee.elf ${B}/bl32.elf; \
> -    )
> -}
> -
>   do_compile:append:ti43x() {
>       optee_sign_legacyhs
>   }
> @@ -57,24 +51,10 @@ do_compile:append:dra7xx() {
>       optee_sign_legacyhs
>   }
>   
> -do_compile:append:am65xx-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am64xx-evm() {
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
> +# Signing procedure for K3 devices
> +do_compile:append:k3() {
> +    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
> +    cp ${B}/core/tee.elf ${B}/bl32.elf
>   }
>   
>   do_install:append:ti-soc() {

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

