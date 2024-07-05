Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15A7C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 04:52:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10698.1720155115278985017
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jul 2024 21:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DV+a+RsP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4654psXY035535
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Jul 2024 23:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720155114;
	bh=RTKF/7xVTWxBnhPpn7n17f22xOpxnmEBSHUEkMZKcI4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DV+a+RsPLMuSlseIX82EJ4TboDvyPbKmmeUz/rhefUTYqaLbq/I69S1CcegtT7lZZ
	 ZZ2NO+Vzz7uzLLX/tJwR63RSlFd7pRGvdRd/6Y3OioTz5Iz6/DAeaL7csASgcwv2KS
	 /namNZxRgzmeLLMDg4i6pfT2Hsi3079w+7Lp2R28=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4654ps6J024751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Jul 2024 23:51:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Jul 2024 23:51:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Jul 2024 23:51:54 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4654ppdn113777;
	Thu, 4 Jul 2024 23:51:52 -0500
Message-ID: <51ff6257-56c4-415e-b330-bd8e597c7c2c@ti.com>
Date: Fri, 5 Jul 2024 10:21:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 am62pxx-evm for multi-BSP support
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        "Raghavendra,
 Vignesh" <vigneshr@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Khasim,
 Syed Mohammed" <khasim@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20240704071935.840815-1-c-shilwant@ti.com>
 <ad6c5c84-e01e-4a5d-4847-4832b4d30e93@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <ad6c5c84-e01e-4a5d-4847-4832b4d30e93@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jul 2024 04:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17822

Hi,
On 04/07/24 16:35, Devarsh Thakkar wrote:
> Hi Chirag,
>
> Thanks for the patch.
> On 04/07/24 12:49, Chirag Shilwant wrote:
>> - In ti-u-boot-2024.04, the config fragment to disable splashscreen
>> is now renamed to am62x_evm_prune_splashscreen.config [1]
>> Hence, update UBOOT_CONFIG_FRAGMENTS for the same.
>>> - Add UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 which ensures that
>> am62pxx-evm machine configuration still supports Display Cluster usecase [2]
>> with ti-u-boot-2023.04
>>
>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=981eddc83dfdbbf176a4984977f9779dc1d56f87
>>
>> [2]: https://software-dl.ti.com/mcu-plus-sdk/esd/AM62PX/09_01_00_39/exports/docs/api_guide_am62px/EXAMPLES_DRIVERS_DSS_DISPLAY_SHARE.html
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>
>
> On a side-note,
> The uEnv.txt also needs to be updated as need to prefix ti in name_overlays as
> otherwise we get below error :
>
> [2024-07-04 15:57:12.135] Failed to load
> '/boot/dtb/k3-am62p5-sk-microtips-mf101hie-panel.dtbo'
> [2024-07-04 15:57:12.151] Failed to load
> '/boot/dtb/k3-am62p5-sk-dss-shared-mode.dtbo'
> [2024-07-04 15:57:12.151] ## Flattened Device Tree blob at 88000000
>
> After setting as below, it works fine :
>
> setenv name_overlays ti/k3-am62p5-sk-microtips-mf101hie-panel.dtbo
> ti/k3-am62p5-sk-dss-shared-mode.dtbo $name_overlay
>
> Above can go as a separate patch and there could be multiple platforms
> affected, please verify.



Just a clarification for folks in mailing list,

The uEnv.txt only for Display Cluster usecase of AM62P is updated in 
meta-tisdk [1]
& is independent of meta-arago. Will take an action to update the 
uEnv.txt in meta-tisdk
post we have this patch integrated to master/scarthgap.

For other platforms, by default the uEnv.txt is empty & it comes from 
meta-arago [2].
So, rest all platforms aren't affected!


[1]: 
https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/tree/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv-am62p-display-cluster.txt?h=scarthgap

[2]: 
https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt?h=scarthgap


---

Regards,
Chirag




> Regards
> Devarsh
>
>> ---
>>   meta-ti-bsp/conf/machine/am62pxx-evm.conf | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> index fab96bd8..8d94c2b4 100644
>> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> @@ -22,5 +22,7 @@ UBOOT_MACHINE = "am62px_evm_a53_defconfig"
>>   # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>>   # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
>> -# Hence, disable the A53 based splash screen using the am62px_evm_prune_splashscreen.config fragment present in ti-u-boot tree
>> -UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
>> +# Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
>> +UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
>> +
>> +UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"

