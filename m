Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587CFEE01E4
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 16:43:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1714.1694623387653416183
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 09:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZBFz62gi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38DGh1FL118855;
	Wed, 13 Sep 2023 11:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694623381;
	bh=FDwvt+66dkC7sa2L/G7VEFXzSgx2HRlYV07wERWrEYk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZBFz62giE6Vrgg0jy3NGsXUgUAkfi8VtIiW0mIrfgtrOokebSvvOO6FnosLvR9Nu5
	 +SJUScSQ7zEFS14zSLAUBCjereGg3x8jPptCDKT5RIlClZ8wBh1IugWt+ZzTRgGm3V
	 OaJVHdhC7cJx1rcvfwuUVwtnyNhFg4xhpps+ZOiE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38DGh0LC022606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Sep 2023 11:43:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Sep 2023 11:43:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Sep 2023 11:43:00 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38DGgv6m125857;
	Wed, 13 Sep 2023 11:42:58 -0500
Message-ID: <bd28e092-e4f0-0f5a-e1ef-3ba0c03cf7f7@ti.com>
Date: Wed, 13 Sep 2023 22:12:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [EXTERNAL] Re: [meta-ti][master/kirkstone][PATCH 1/2]
 recipes-bsp: u-boot: Add u-boot-mergeconfig.inc to handle fragment u-boot
 config
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>
References: <20230908203004.2764200-1-c-shilwant@ti.com>
 <20230912200403.GH3359@denix.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230912200403.GH3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 16:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16963

On 13/09/23 01:34, Denys Dmytriyenko wrote:
> On Sat, Sep 09, 2023 at 02:00:04AM +0530, Chirag Shilwant wrote:
>> - Add a new file u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs
>> using a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment u-boot config
>> to be used.
> Would be nice to provide extra details here in the commit message about config
> fragment support in U-boot and its recipe. E.g.:
>
> * U-boot recipe in OE-Core supports out-of-tree config fragments that are
> passed via SRC_URI and automatically merges all *.cfg files as fragments.
> This makes specifying config fragments in the machine configuration a bit
> difficult.
>
> * U-boot itself supports in-tree config fragments and recently been adding
> fragments with *.config extension (first in configs/ dir, but will be moving
> to the corresponding board/ dir), so adding a way to specify and pass those.

Sure, will update the commit message & provide extra details in my v2 
PATCH.

>
>> - Include u-boot-mergeconfig.inc in u-boot-ti.inc
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
>>   2 files changed, 8 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>> new file mode 100644
>> index 00000000..69db6260
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>> @@ -0,0 +1,7 @@
>> +do_compile:prepend () {
> Should be done in do_configure instead. Tasks should be self-contained and
> granular. Plus, do_compile can be repeated w/o do_configure. If you are
> re-configuring every time and generate a new .config file in do_compile,
> that would probably trigger full re-compile due to make tracking file
> timestamps...
>
Yes, we can update this to happen in do_configure. I believe 
do_configure:append should be good & will work. Will handle this in v2.

>> +   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
> Multiple fragments are supported, so maybe call it UBOOT_CONFIG_FRAGMENTS
> plural?
>
>
>> +   then
>> +       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
>> +       oe_runmake -C ${S} O=${B} olddefconfig
>> +   fi
> So, this basically repeats configuration done in u-boot-configure.inc in
> OE-Core. But it also ignores UBOOT_CONFIG support for multiple (def-)configs.
> While I realize you just want to address a single use-case, making it a bit
> future-proof shouldn't be overlooked.
>
> Think of supporting both UBOOT_CONFIG and UBOOT_CONFIG_FRAGMENTS at the same
> time. Probably completely rewriting do_configure from u-boot-configure.inc
> would be needed...
>
> BTW, UBOOT_CONFIG naming is unfortunate - it has nothing to do with config
> fragments. While UBOOT_MACHINE specifies a single defconfig, UBOOT_CONFIG
> takes a list of defconfigs and iterates through them building each separately.
>
Thanks for your suggestions. I appreciate your idea to cover all use 
cases with u-boot-mergeconfig.inc, but I have few concerns due to the 
current release situation we are into.

As far as I know, meta-ti does not have a use case for UBOOT_CONFIG 
itself. We are using UBOOT_MACHINE for handling the base defconfig, 
which works well for our needs. The concept of having u-boot fragments 
was introduced recently in ti-u-boot after we got a feedback from 
upstream uboot as around 90% of configs were same between am62xx-evm & 
am62xxsip-evm. This was a valid input and hence we considered in 
ti-u-boot. In order to support that I had to find a quick way to handle 
this in Yocto it with UBOOT_MACHINE along with UBOOT_CONFIG_FRAGMENT 
logic, which I had also discussed with you on the syncup call.
Considering that the am62xxsip-evm release is only two weeks away, can 
we consider the fragments approach for now and avoid any potential risks 
or delays. I will work with you in coming weeks to make this better by 
handling all the cases of uboot-config and fragments.

Please let me know if I you agree with my views and if I can proceed 
with fixing the other issues you highlighted, they are trivial I can 
submit a patch tomorrow.

>> +}
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index f3285c23..5292517b 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
>>   
>>   require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>>   require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>> +require u-boot-mergeconfig.inc
>>   
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
>>   
>> -- 
>> 2.34.1

