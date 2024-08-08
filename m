Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26484C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 19:28:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.68398.1723145291739379548
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Aug 2024 12:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gzM0Hc9X;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478JSAuJ127471;
	Thu, 8 Aug 2024 14:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723145290;
	bh=i1FVT31A2W3BA6USbjcfNT5V6uR6SweVTLVLtYZhkt8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=gzM0Hc9Xe0zHtmTlSdN+U1IEZmqOZIkSskMcjxSQbgYkYg2eVg+1k7kLD36CXOIOb
	 FqyUjDR+Xo2pkhmX0SL67zSTM0dpAYsxCM6vCq8djX1iUD5RleIzO3/qZrpX8q50Dc
	 vK1OBoaym+Civ+FBYvzjvs1hK+0O//encwjlQzss=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478JSA9F093128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 14:28:10 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 14:28:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 14:28:10 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478JSA9O074861;
	Thu, 8 Aug 2024 14:28:10 -0500
Message-ID: <1aba4217-a90b-449e-9269-ca6656da5e7f@ti.com>
Date: Thu, 8 Aug 2024 14:28:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] u-boot-ti.inc: Refactor
 overrides to match changes in oe-core
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17E9D76C9018E00B.19172@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E9D76C9018E00B.19172@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Aug 2024 19:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17932



On 8/8/2024 2:26 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in oe-core [1] to refactor the uboot flow allows for a more
> targeted refactoring of our override code as well.
> 
> Additionally, fix the UBOOT_CONFIG code to work correctly for k3r5
> builds.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=e29d006a118643b276c6977cb70b0fb56635fc33

Just so everyone is aware, this change is not quite on master/scarthgap 
branches yet, but it is required for this patch to work.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 392 +++++++++----------
>   1 file changed, 192 insertions(+), 200 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 4e6825a8..bb50e1e9 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -115,104 +115,115 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
>   UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
>   UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
>   
> -do_compile:append:k3r5 () {
> -	if [ -n "${UBOOT_CONFIG}" ];
> -	then
> -		for config in ${UBOOT_MACHINE}; do
> -			i=$(expr $i + 1);
> -			for type in ${UBOOT_CONFIG}; do
> -				j=$(expr $j + 1);
> -				if [ $j -eq $i ];
> -				then
> -					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
> -						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
> -					fi
> -				fi
> -			done
> -			unset  j
> -		done
> -		unset  i
> -	else
> -		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> -			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
> -		fi
> -	fi
> +uboot_compile:append () {
> +    if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> +        ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
> +    fi
>   }
>   
> -do_install:append () {
> -	if [ -n "${UBOOT_CONFIG}" ]
> -	then
> -		for config in ${UBOOT_MACHINE}; do
> -			i=$(expr $i + 1);
> -			for type in ${UBOOT_CONFIG}; do
> -				j=$(expr $j + 1);
> -				if [ $j -eq $i ]
> -				then
> -					if [ "x${SPL_UART_BINARY}" != "x" ]; then
> -						install ${B}/${config}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
> -						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}-${type}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}-${type}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}-${type}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}-${type}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}
> -					fi
> -				fi
> -			done
> -			unset  j
> -		done
> -		unset  i
> -	else
> -		if [ "x${SPL_UART_BINARY}" != "x" ]; then
> -			install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> -			ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
> -		fi
> -		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
> -			install ${B}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}
> -			ln -sf ${SPL_HS_MLO_IMAGE} ${D}/boot/${SPL_HS_MLO_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
> -			ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
> -			ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}
> -			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
> +uboot_compile_config_copy_binary:k3r5 () {
> +    config=$1
> +    type=$2
> +    binary=$3
> +
> +    if ! [ -L ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ] && ! [ -f ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ]; then
> +        ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> +    fi
> +
> +    if ! [ -L ${B}/${config}/${binary} ] && ! [ -f ${B}/${config}/${binary} ]; then
> +        ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${binary}
> +    fi
> +}
> +
> +uboot_install_config:append () {
> +    if [ "x${SPL_UART_BINARY}" != "x" ]; then
> +        install ${B}/${config}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
> +        install ${B}/${config}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}-${type}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}-${type}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}-${type}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}-${type}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}
> +    fi
> +}
> +
> +uboot_install:append () {
> +    if [ "x${SPL_UART_BINARY}" != "x" ]; then
> +        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> +        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
> +    fi
> +    if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
> +        install ${B}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}
> +        ln -sf ${SPL_HS_MLO_IMAGE} ${D}/boot/${SPL_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
> +    fi
> +}
> +
> +do_deploy:append:k3r5 () {
> +	rm ${DEPLOYDIR}/u-boot-initial-env* || true
> +	rm ${DEPLOYDIR}/${PN}-initial-env* || true
> +	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}* || true
> +	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}* || true
> +	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}* || true
> +	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}* || true
> +}
> +
> +uboot_deploy_config:append:k3r5 () {
> +    for f in ${B}/${config}/tiboot3-*.bin; do
> +		if [ -f "$f" ]; then
> +            f_base=$(basename $f)
> +			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
> +            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
>   		fi
> -		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
> -			ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
> +	done
> +
> +	for f in ${B}/${config}/sysfw*.itb; do
> +		if [ -f "$f" ]; then
> +            f_base=$(basename $f)
> +			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
> +            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
>   		fi
> -	fi
> +	done
>   }
>   
> -do_deploy:append:k3r5 () {
> -	for f in ${B}/tiboot3-*.bin; do
> +uboot_deploy:append:k3r5 () {
> +    for f in ${B}/tiboot3-*.bin; do
>   		if [ -f "$f" ]; then
>   			install -m 644 $f ${DEPLOYDIR}/
>   		fi
> @@ -223,117 +234,98 @@ do_deploy:append:k3r5 () {
>   			install -m 644 $f ${DEPLOYDIR}/
>   		fi
>   	done
> +}
>   
> -	rm ${DEPLOYDIR}/u-boot-initial-env || true
> -	rm ${DEPLOYDIR}/${PN}-initial-env || true
> -	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} || true
> -	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
> -	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} || true
> -	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
> +uboot_deploy_config:append () {
> +    cd ${DEPLOYDIR}
> +    if [ "x${SPL_UART_BINARY}" != "x" ]; then
> +        install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${type}
> +        rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
> +        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
> +    fi
> +    if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
> +        install ${B}/${config}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}-${type}
> +        rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}-${type}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}-${type}
> +        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
> +        rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}-${type}
> +        rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}-${type}
> +        rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
> +    fi
> +    if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
> +        install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}-${type}
> +        rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}-${type}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}
> +    fi
>   }
>   
> -do_deploy:append () {
> -	if [ -n "${UBOOT_CONFIG}" ]
> -	then
> -		for config in ${UBOOT_MACHINE}; do
> -			i=$(expr $i + 1);
> -			for type in ${UBOOT_CONFIG}; do
> -				j=$(expr $j + 1);
> -				if [ $j -eq $i ]
> -				then
> -					cd ${DEPLOYDIR}
> -					if [ "x${SPL_UART_BINARY}" != "x" ]; then
> -						install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${type}
> -						rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
> -						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
> -					fi
> -					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
> -						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}-${type}
> -						rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}-${type}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}-${type}
> -						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
> -						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}-${type}
> -						rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}-${type}
> -						rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
> -					fi
> -					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
> -						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}-${type}
> -						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}-${type}
> -						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}
> -					fi
> -				fi
> -			done
> -			unset  j
> -		done
> -		unset  i
> -	else
> -		cd ${DEPLOYDIR}
> -		if [ "x${SPL_UART_BINARY}" != "x" ]; then
> -			install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
> -			rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
> -			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
> -			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
> -		fi
> -		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
> -			install ${B}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}
> -			rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
> -			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_SYMLINK}
> -			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
> -			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
> -			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
> -			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
> -			rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
> -			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
> -			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
> -			rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
> -			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
> -			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
> -		fi
> -		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
> -			install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
> -			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
> -			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
> -			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
> -		fi
> -	fi
> +uboot_deploy:append () {
> +    cd ${DEPLOYDIR}
> +    if [ "x${SPL_UART_BINARY}" != "x" ]; then
> +        install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
> +        rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
> +        ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
> +        ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
> +    fi
> +    if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
> +        install ${B}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}
> +        rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
> +        ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_SYMLINK}
> +        ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
> +        rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
> +        ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
> +        rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
> +        ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
> +        rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
> +        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
> +    fi
> +    if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
> +        install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
> +        rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
> +        ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
> +    fi
>   }
>   
>   do_install:append:am62xx() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17930): https://lists.yoctoproject.org/g/meta-ti/message/17930
> Mute This Topic: https://lists.yoctoproject.org/mt/107796186/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

