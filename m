Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010FDC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:05:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.13580.1647972298638648524
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YJgQ9gdB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MI4tIK120818;
	Tue, 22 Mar 2022 13:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972295;
	bh=krsN1QmjeGjq7BKvKll2T+o6jm69qS4AztfWUTE27Gk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YJgQ9gdBNNFYuz4XbBttd9wMPHWCRczi4SWnr8lyV8QtiU1y94OKpx8TWYQuydwjJ
	 y/2VE8qqwo1P1qMyBtEjeKLHjXsRLGXUbEreITMUEGQcStaScv2mOb8RCyl1zwYomD
	 QJn6i19QOeitCFYy6PybZmzcaw8blm+A1Wa0nL0I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MI4tJj045549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:04:55 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:04:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:04:54 -0500
Received: from [10.249.37.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MI4s9o013349;
	Tue, 22 Mar 2022 13:04:54 -0500
Message-ID: <3044afc6-bc25-5893-9eee-887395d1ee4f@ti.com>
Date: Tue, 22 Mar 2022 13:04:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][dunfell][PATCH 06/11] recipes-bsp: lpm-demo: Introduce
 low power mode demo package
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <nikhil.nd@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220322162528.15298-1-reatmon@ti.com>
 <20220322162528.15298-7-reatmon@ti.com> <20220322175947.GL23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220322175947.GL23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 18:04:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14527



On 3/22/2022 12:59, Denys Dmytriyenko wrote:
> On Tue, Mar 22, 2022 at 11:25:23AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> On am62xx-evm, for low power validation, the system boot using
>> an initramfs.
>>
>> Package the tisdk-tiny-image.cpio file in the /boot of the
>> default filesystem to enable the demo.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   recipes-bsp/lpm-demo/files/GPL-2     | 340 +++++++++++++++++++++++++++
>>   recipes-bsp/lpm-demo/lpm-demo_1.0.bb |  28 +++
>>   2 files changed, 368 insertions(+)
>>   create mode 100644 recipes-bsp/lpm-demo/files/GPL-2
>>   create mode 100644 recipes-bsp/lpm-demo/lpm-demo_1.0.bb
>>
>> diff --git a/recipes-bsp/lpm-demo/files/GPL-2 b/recipes-bsp/lpm-demo/files/GPL-2
>> new file mode 100644
>> index 00000000..d60c31a9
>> --- /dev/null
>> +++ b/recipes-bsp/lpm-demo/files/GPL-2
> 
> <snip>
> 
>> diff --git a/recipes-bsp/lpm-demo/lpm-demo_1.0.bb b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
>> new file mode 100644
>> index 00000000..56b04d56
>> --- /dev/null
>> +++ b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "Low power mode demo"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +COMPATIBLE_MACHINE = "am62xx-evm"
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>> +S = "${WORKDIR}"
>> +
>> +# We need to have the license file from some source. In this case, there
>> +# is no source. Hence pointing to the license file only
>> +SRC_URI = "file://GPL-2"
> 
> That's an incorrect way of doing it.
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb#n3
> 
> Also, default license for OpenEmbedded metadata is MIT, not GPLv2. Any
> specific reason for the change?
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb#n3

Copying Nikhil, the original author to answer those questions.


> 
>> +LPM_RAMFS_IMAGE ?= "tisdk-tiny-image"
>> +
>> +do_install() {
>> +	install -d ${D}/boot
>> +	if [ -f ${DEPLOY_DIR_IMAGE}/${LPM_RAMFS_IMAGE}-${MACHINE}.cpio ]; then
>> +		install -m 0644 ${DEPLOY_DIR_IMAGE}/${LPM_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>> +	else
>> +		bberror "Could not find LPM ramfs image (${LPM_RAMFS_IMAGE}-${MACHINE}.cpio) in deploy dir!"
>> +	fi
>> +}
>> +
>> +do_install[depends] = "${LPM_RAMFS_IMAGE}:do_image_complete"
>> +
>> +FILES_${PN} = "/boot"
>> -- 
>> 2.17.1
>>
> 

-- 
Ryan Eatmon
reatmon@ti.com

