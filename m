Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0297DEB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:39:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1404.1688578764734613355
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 10:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dVwQqsbl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365HdN3H128733
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 12:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688578763;
	bh=+IlsGX/xjXbrxA7guNpwQ1sxyAf8XzaxZODsrHD/tGg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dVwQqsbl4FzTZGp5FdK2DlOWiSxFMT6650MEbm3+HZeIVOAi8oQo2MMVYN9M3Q7Zd
	 OMyx9U0RpkEggO02VsaaWmhydEgm+vi2hwck34Gy8LakPYyMZfscWIP0YhKJYPY3RZ
	 49Vdj4zvp0dGJd7z6S/oSTapciJ+v6QVzZOMn0Hw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365HdNwf091306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 12:39:23 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 12:39:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 12:39:23 -0500
Received: from [10.249.35.108] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365HdNII027375;
	Wed, 5 Jul 2023 12:39:23 -0500
Message-ID: <9e8bba71-6cba-c170-453b-bf2ff07de017@ti.com>
Date: Wed, 5 Jul 2023 12:39:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [kirkstone/master PATCH] pru-icss_git.bb: update to PSSP v6.2.0
Content-Language: en-US
To: <praneeth@ti.com>, Nick Saulnier <nsaulnier@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230703184405.2603-1-praneeth@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230703184405.2603-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 17:39:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16813


This patch fails to build:

Building file: pru_adc_firmware.c
Invoking: PRU Compiler
/scratch/jenkins_builds/arago-kirkstone-next/build/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/pru-icss/6.2.0-r1/recipe-sysroot-native/usr/share/ti/cgt-pru/bin/clpru 
--include_path=/scratch/jenkins_builds/arago-kirkstone-next/build/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/pru-icss/6.2.0-r1/recipe-sysroot-native/usr/share/ti/cgt-pru/include 
--include_path=../../../include --include_path=../../../include/am335x 
-v3 -O2 --display_error_number --endian=little --hardware_mac=on 
--obj_directory=gen --pp_directory=gen -ppd -ppa -fe 
gen/pru_adc_firmware.object pru_adc_firmware.c
"pru_adc_firmware.c", line 123: warning #169-D: argument of type "char 
*" is incompatible with parameter of type "int32_t"
"pru_adc_firmware.c", line 123: error #141: too many arguments in 
function call
"pru_adc_firmware.c", line 249: warning #552-D: variable "data" was set 
but never used
1 error detected in the compilation of "pru_adc_firmware.c".

 >> Compilation failure




On 7/3/2023 1:44 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Upgrade to v6.2.0 version.
> This release supports Linux kernel 6.1.
> The RPMsg library in previous versions of the PSSP will not work with
> the PRU RPMsg drivers in Linux kernel 6.1.
> 
> Other changes in this version:
>   * Bug fixes:
>       - Getting Started Labs, fix "zero" command clearing too many bytes
>       - Include files, add a missing parentheses to pru_cfg, pru_ctrl, pru_ecap
>   * Update ReadMe files to point to the latest URLs
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index 3b0805d9..66fd8000 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
>   
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
> +SRCREV = "cde50f7d16f04ab8dc3510a3f22d3750b1037978"
>   
> -PV = "6.1.0"
> -PR = "r0"
> +PV = "6.2.0"
> +PR = "r1"
>   
>   require recipes-ti/includes/ti-paths.inc
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

