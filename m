Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEEDC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:23:43 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.34972.1744399416939273054
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uwaAC4Ru;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BJNZRK2216579
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 14:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744399415;
	bh=UunErAV6vH0GV0HJmiF1162N3GkZtPsRNusmhJKQDJo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uwaAC4RuSogAVX/kgttyVb6vxbFIAR4gPNa0KngVsrb3RwLs+d9SPcE1HlcF2s+cL
	 SZv6A2fbSmDlZG5yOcLAVDXVFy6tm+DNEg62470GCmyEhjTe5sf3KFwXqd2lHMx4H/
	 9gFDM/nIsQWXN0ZgPu0n/8QHgXlM3ADrK3xx9Gs8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BJNZax011238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 14:23:35 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 14:23:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 14:23:35 -0500
Received: from [10.249.33.29] ([10.249.33.29])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BJNZoC017527;
	Fri, 11 Apr 2025 14:23:35 -0500
Message-ID: <c85a4b88-84a9-4143-859c-e63ecff19b96@ti.com>
Date: Fri, 11 Apr 2025 14:23:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH v1] bsp: fitimage-legacyhs: add default dtb
 support
To: <anshuld@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>
References: <20250411154418.2951391-1-anshuld@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250411154418.2951391-1-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18462


You need to specify which branch this patch is intended to apply to:

[meta-ti][master/scarthgap][PATCH v1] bsp: fitimage-legacyhs: add 
default dtb support
          ^^^^^^^^^^^^^^^^^^


On 4/11/2025 10:44 AM, Anshul Dalal via lists.yoctoproject.org wrote:
> FIT_CONF_DEFAULT_DTB config specifies the default dtb file for the
> FITimage when multiple ones are provided[1].
> 
> Legacyhs fitimage does not currently support this feature which is
> required for repurposing the same class for falcon boot.
> 
> This patch adds support for FIT_CONF_DEFAULT_DTB without affecting
> existing platforms that rely on legacyhs fitImage.
> 
> [1]:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-FIT_CONF_DEFAULT_DTB
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   .../classes/kernel-fitimage-legacyhs.bbclass  | 23 +++++++++++++------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> index 5e1fa56a..61813555 100644
> --- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> +++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
> @@ -316,6 +316,7 @@ EOF
>   # $4 ... ramdisk ID
>   # $5 ... config ID
>   # $6 ... tee ID/name
> +# $7 ... default DTB ID
>   fitimage_emit_section_config() {
>   
>   	conf_csum=${FITIMAGE_HASH_ALGO}
> @@ -370,6 +371,16 @@ fitimage_emit_section_config() {
>   		final_conf_desc="${conf_desc}"
>   	fi
>   
> +	default_dtb_count=${7}
> +	if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
> +		default_conf_name="${FIT_CONF_DEFAULT_DTB}"
> +	else
> +		default_conf_name="conf-${default_dtb_count}"
> +	fi
> +	cat << EOF >> ${1}
> +        default = "${default_conf_name}";
> +EOF
> +
>   	dtbcount=1
>   	for DTB in ${KERNEL_DEVICETREE}; do
>   		DTB=$(basename "${DTB}")
> @@ -386,12 +397,6 @@ fitimage_emit_section_config() {
>   			fdt_line="fdt = \"fdt-${dtbcount}\";"
>   		fi
>   
> -		if [ "x${dtbcount}" = "x1" ]; then
> -			cat << EOF >> ${1}
> -                default = "${conf_name}";
> -EOF
> -		fi
> -
>   # Generate a single configuration section
>   			cat << EOF >> ${1}
>                   ${conf_name} {
> @@ -524,6 +529,7 @@ fitimage_assemble() {
>   	ramdiskcount=${3}
>   	setupcount=""
>   	teecount=1
> +	default_dtb_count=1
>   	rm -f ${1} arch/${ARCH}/boot/${2}
>   
>   	fitimage_emit_fit_header ${1}
> @@ -544,6 +550,9 @@ fitimage_assemble() {
>   		dtbcount=1
>   		dtboaddress="${UBOOT_DTBO_LOADADDRESS}"
>   		for DTB in ${KERNEL_DEVICETREE}; do
> +			if [ "${DTB}" = "${FIT_CONF_DEFAULT_DTB}" ]; then
> +				default_dtb_count=${dtbcount}
> +			fi
>   			if echo ${DTB} | grep -q '/dts/'; then
>   				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
>   				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> @@ -660,7 +669,7 @@ fitimage_assemble() {
>   	else
>   		teeref="${teecount}"
>   	fi
> -	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}"
> +	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}" "${default_dtb_count}"
>   
>   	fitimage_emit_section_maint ${1} sectend
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18461): https://lists.yoctoproject.org/g/meta-ti/message/18461
> Mute This Topic: https://lists.yoctoproject.org/mt/112212856/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

