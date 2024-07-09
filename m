Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87F1C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:36:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1294.1720539375607852166
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 08:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=psDS7lH9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469FaCAd002524;
	Tue, 9 Jul 2024 10:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720539372;
	bh=DLFG1ZQcbRxIO7eaF0vGbmC3sKrbT1EMZFdjJYU+VvE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=psDS7lH9K7PoJ652zRFvuLzE2G+ARdaYXLhZBDhuNEEjsd6f3dRJL7o/SFZ8kuuvT
	 Y5IppciHr1H+3nouXuPvxbKjZu8vAYNrqfsEKsTmY83ZDvkfjqu55jbvjaVodAvI7z
	 YL+/PNS4/xATGFKhT4BaKlUNrCxXIyoAGNwH1cRo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469FaCqW019142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 10:36:12 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 10:36:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 10:36:12 -0500
Received: from [10.250.34.81] ([10.250.34.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469FaCVK067230;
	Tue, 9 Jul 2024 10:36:12 -0500
Message-ID: <681b4b17-3cc1-4376-ac9c-0fc66c29eb00@ti.com>
Date: Tue, 9 Jul 2024 10:36:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] recipes-ti: jailhouse: Update
 jailhouse for scarthgap
To: Denys Dmytriyenko <denis@denix.org>, <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
References: <20240709123359.3086351-1-p-bhagat@ti.com>
 <20240709150627.GO18231@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240709150627.GO18231@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 15:36:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17848



On 7/9/2024 10:06 AM, Denys Dmytriyenko wrote:
> On Tue, Jul 09, 2024 at 06:03:59PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
>> Update SRCREV for jailhouse which incorporates makefile changes for
>> scarthgap.
>> Add ${ARAGO_IMAGE_SUFFIX} so that jailhouse can pick correct inmate
> 
> NAK - this is meta-ti, no Arago specifics here.

Good catch.  I missed that.


> 
>> image for RT build.
>> Skip QA checks for usrmerge and buildpath. This is required to package
>> jailhouse in image.
>> Update FILES:${PN}.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../recipes-ti/jailhouse/jailhouse_git.bb     | 20 +++++++++----------
>>   .../recipes-ti/jailhouse/ti-jailhouse.inc     |  2 +-
>>   2 files changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> index 98ec0e9e..32e94dd0 100644
>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> @@ -51,11 +51,11 @@ do_install() {
>>   	install -d ${D}/boot
>>   	if [ -n "${JH_RAMFS_IMAGE}" ]
>>   	then
>> -		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ]
>>   		then
>> -			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ${D}/boot
>>   		else
>> -			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>> +			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio)!"
>>   			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
>>   		fi
>>   	fi
>> @@ -68,7 +68,7 @@ do_install() {
>>   		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>>   			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>>   			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>> -			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>> +			-i ${D}/boot/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio \
>>   			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>>   			${DEPLOY_DIR_IMAGE}/Image \
>>   			| tr -cd '\11\12\15\40-\176' \
>> @@ -96,7 +96,8 @@ RDEPENDS:pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
>>   
>>   RRECOMMENDS:${PN} = "${PN}-tools"
>>   
>> -INSANE_SKIP:${PN} = "ldflags"
>> +INSANE_SKIP:${PN} = "ldflags usrmerge"
>> +INSANE_SKIP:${PN}-dbg = "usrmerge buildpaths"
>>   
>>   KERNEL_MODULE_AUTOLOAD += "jailhouse"
>>   
>> @@ -117,10 +118,7 @@ python __anonymous () {
>>   }
>>   
>>   FILES:${PN} = " \
>> -    /boot/* \
>> -    /usr/libexec \
>> -    /usr/sbin/* \
>> -    /usr/libexec/* \
>> -    /usr/share/* \
>> -    /lib/firmware/* \
>> +    /boot \
>> +    /usr \
>> +    /lib \
>>   "
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>> index 6faf16b8..2831e560 100644
>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>>   COMPATIBLE_MACHINE = "am62xx|am62pxx"
>>   TARGET_CC_ARCH += "${LDFLAGS}"
>>   PV = "0.12+git"
>> -SRCREV = "603819ef9a771a3c253a141220daab8e61751a43"
>> +SRCREV = "9b494ddf4bd8845a2c1063352d08a274ef61777b"
>>   BRANCH = "master"
>>   SRC_URI = " \
>>       git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

