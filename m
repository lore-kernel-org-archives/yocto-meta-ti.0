Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEFD0E01632
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:04:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QF4WCn016157;
	Thu, 26 Sep 2013 10:04:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QF4WI1012114;
	Thu, 26 Sep 2013 10:04:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 10:04:32 -0500
Received: from [172.24.81.142] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QF4StY002031;
	Thu, 26 Sep 2013 10:04:29 -0500
Message-ID: <52444CFB.2000807@ti.com>
Date: Thu, 26 Sep 2013 20:34:27 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1380138591-17071-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597510CF@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597510CF@DLEE11.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Rini,
	Tom" <trini@ti.com>
Subject: Re: [PATCHv2 4/4] ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2013 15:04:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/26/2013 5:29 PM, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>

Just a question - is it possible to override the KERNEL_IMAGETYPE in a
branding.inc file? In general, we want to move to zImage for GLSDK but
some customers who might want to stay on uImage as they ramp.

Otherwise, no comments.

Acked-by: Siddharth Heroor <heroor@ti.com>

> 
> 
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>> Sent: Wednesday, September 25, 2013 2:50 PM
>> To: meta-ti@yoctoproject.org
>> Cc: Rini, Tom
>> Subject: [meta-ti] [PATCHv2 4/4] ti43x, omap-a15: switch
>> KERNEL_IMAGETYPE to zImage by default
>>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> * To be used with latest u-boot, that prefers zImage over uImage
>> * ti33x will follow as soon as u-boot changes its default for that
>> platform
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Cc: Tom Rini <trini@ti.com>
>> ---
>> v2 - don't change the default for ti33x yet, wait for u-boot
>>
>> conf/machine/include/omap-a15.inc | 2 +-
>> conf/machine/include/ti43x.inc    | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/machine/include/omap-a15.inc
>> b/conf/machine/include/omap-a15.inc
>> index 623f2df..aba122a 100644
>> --- a/conf/machine/include/omap-a15.inc
>> +++ b/conf/machine/include/omap-a15.inc
>> @@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-
>> staging"
>> PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>> PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>>
>> -KERNEL_IMAGETYPE = "uImage"
>> +KERNEL_IMAGETYPE = "zImage"
>>
>> UBOOT_ARCH = "arm"
>> UBOOT_ENTRYPOINT = "0x80008000"
>> diff --git a/conf/machine/include/ti43x.inc
>> b/conf/machine/include/ti43x.inc
>> index 62da105..adb66e3 100644
>> --- a/conf/machine/include/ti43x.inc
>> +++ b/conf/machine/include/ti43x.inc
>> @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-
>> staging"
>> PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>> PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>>
>> -KERNEL_IMAGETYPE = "uImage"
>> +KERNEL_IMAGETYPE = "zImage"
>>
>> UBOOT_ARCH = "arm"
>> UBOOT_MACHINE = "am43xx_evm_config"
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


