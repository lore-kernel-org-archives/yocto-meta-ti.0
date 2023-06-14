Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F94EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:57:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18134.1686761843831124705
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pCzivlLJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EGvBi9053959;
	Wed, 14 Jun 2023 11:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686761831;
	bh=RmgMcMuny/5ntmDTjemekbV3K/c3EjUKb+Er8XsaDYQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pCzivlLJ9MmvL6eOlq4pXkRdIbsmdGz5FWRm+qrQQ4neAtfkMNp9O0gjAEku1oxfC
	 KkxrV0C0YnOjB+4GG0nXpSRAcIvvMqbPlWeabdWKghBm4BjKZux5bzj6fQqcq8C7io
	 ihQ+w9j4DhRwIgR+2lPNFKYVlZix7Xr88elqsmuI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EGvBRp000326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 11:57:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 11:57:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 11:57:10 -0500
Received: from [10.249.129.148] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EGv4cA015880;
	Wed, 14 Jun 2023 11:57:05 -0500
Message-ID: <e9d8598c-5718-2fb7-5e05-dd517467d20c@ti.com>
Date: Wed, 14 Jun 2023 22:27:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <a-bhatia1@ti.com>, <j-luthra@ti.com>, <khasim@ti.com>,
        <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>, <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com> <20230614145436.GW9226@denix.org>
 <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
 <20230614155146.GX9226@denix.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20230614155146.GX9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 16:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16725



On 14/06/23 21:21, Denys Dmytriyenko wrote:
> On Wed, Jun 14, 2023 at 08:53:07PM +0530, Devarsh Thakkar wrote:
>> Hi Denys,
>>
>> Thanks for the review,
>>
>> On 14/06/23 20:24, Denys Dmytriyenko wrote:
>>> On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
>>>> Early splash screen support for AM62x has been enabled in u-boot
>>>> and it requires bitmap tarball to be present in boot partition
>>>> as per the default environment settings done in u-boot [1].
>>>>
>>>> Copy the ti logo bitmap tarball to boot partition of wic image in order
>>>> to enable out of box early display on AM62x.
>>>>
>>>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
>>>>
>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>> ---
>>>> V2: Rename ti logo tarball as per suggested changes (same is being
>>>>      done in ti-u-boot too)
>>>> ---
>>>>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> index e6da84cb..c948e1ed 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
>>>>   
>>>>   SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>>>   
>>>> +do_install:append:am62xx() {
>>>> +	install -d ${D}/boot
>>>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
>>>> +}
>>>> +
>>>> +do_deploy:append:am62xx() {
>>>> +	install -d ${DEPLOYDIR}
>>>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
>>>
>>> Any specific reason you also need to deploy this loose file?
>>>
>>
>> I think the boot partition script which is ran as part of do_image_wic expects
>> IMAGE_BOOTFILES to be present in deploy directory, I remember getting below
>> error without doing so :
>>
>> | ERROR: _exec_cmd: install -m 0644 -D
>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz
>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/tmp-wic/hdd/boot/ti.gz
>> returned '1' instead of 0
>> | output: install: cannot stat
>> '/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz':
>> No such file or directory
>> | WARNING:
>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/run.do_image_wic.1581619:162
>> exit 1 from 'BUILDDIR="/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build"
>> PSEUDO_UNLOAD=1 wic create "$wks" --vars
>> "/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/sysroots/am62xx-evm/imgdata/"
>> -e "tisdk-default-image" -o "$build_wic/" -w "$tmp_wic"'
> 
> So, is this logo expected by U-boot to reside in the boot partition of SD
> card, or in the /boot directory of the rootfs?
> The first is handled by do_deploy and IMAGE_BOOTFILES, while the second is
> handled by do_install. I wonder if doing both is going to be confusing...
> 
> 

Yes, this logo is expected to reside in boot partition of SD only per 
current implementation in ti-u-boot.

Regards
Devarsh

>> One more reason to do so was to allow user ease of use, to copy the logo too
>> from deploy folder along with other boot files (if not flashing from wic
>> image) since the same is set in am62x.env and if logo is not present in boot
>> partition then it throws some error message although the device still boots.

