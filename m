Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8130BEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:23:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15313.1686756197091096282
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 08:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y1gzTEKK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EFNCqG125499;
	Wed, 14 Jun 2023 10:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686756192;
	bh=X4J7Ro5ZT59IC3sOuXXJhUa5Ic4qT3r3odoMEDQNVN8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y1gzTEKKRcEFxDD/5JUjN2p/f6d6vxdo70KJZe/2tZ9yvytqQrM6XGG7WUEKf1qKi
	 mLsjjek2Je/jRSpNB4HIfcngxB47Ofrj+98chDmM1kq5eUZSQ9aLTPnkTu1Iof82h1
	 fGNvkhB42/oLMlh03YnxK6UtcdaSYGtNtOxEEWqs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EFNCRo114743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 10:23:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 10:23:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 10:23:12 -0500
Received: from [172.24.145.199] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EFN829122348;
	Wed, 14 Jun 2023 10:23:08 -0500
Message-ID: <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
Date: Wed, 14 Jun 2023 20:53:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20230614145436.GW9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 15:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16723

Hi Denys,

Thanks for the review,

On 14/06/23 20:24, Denys Dmytriyenko wrote:
> On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
>> Early splash screen support for AM62x has been enabled in u-boot
>> and it requires bitmap tarball to be present in boot partition
>> as per the default environment settings done in u-boot [1].
>>
>> Copy the ti logo bitmap tarball to boot partition of wic image in order
>> to enable out of box early display on AM62x.
>>
>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V2: Rename ti logo tarball as per suggested changes (same is being
>>     done in ti-u-boot too)
>> ---
>>  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> index e6da84cb..c948e1ed 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
>>  
>>  SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>  
>> +do_install:append:am62xx() {
>> +	install -d ${D}/boot
>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
>> +}
>> +
>> +do_deploy:append:am62xx() {
>> +	install -d ${DEPLOYDIR}
>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> 
> Any specific reason you also need to deploy this loose file?
> 

I think the boot partition script which is ran as part of do_image_wic expects
IMAGE_BOOTFILES to be present in deploy directory, I remember getting below
error without doing so :

| ERROR: _exec_cmd: install -m 0644 -D
/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz
/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/tmp-wic/hdd/boot/ti.gz
returned '1' instead of 0
| output: install: cannot stat
'/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/deploy/images/am62xx-evm/ti.gz':
No such file or directory
| WARNING:
/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/run.do_image_wic.1581619:162
exit 1 from 'BUILDDIR="/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build"
PSEUDO_UNLOAD=1 wic create "$wks" --vars
"/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-default-glibc/sysroots/am62xx-evm/imgdata/"
-e "tisdk-default-image" -o "$build_wic/" -w "$tmp_wic"'


One more reason to do so was to allow user ease of use, to copy the logo too
from deploy folder along with other boot files (if not flashing from wic
image) since the same is set in am62x.env and if logo is not present in boot
partition then it throws some error message although the device still boots.

Regards
Devarsh

