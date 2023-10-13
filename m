Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107ECCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:05:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.41026.1697209496518806717
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 08:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YK3+V4aj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DF4tGm065766
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 10:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697209495;
	bh=F9NoDoD6Yopy2dKDweU5bULcllyMFi5EKv2p9ZBY1Jo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YK3+V4aj1T4gLXNQ4IbitSGHFLgFrhrGM4t8ptOKx7VV0PdZyTz7QLG38H7MYgZBI
	 s17wWm656FOelqqDPzzNQRa2qk7Vd+vR4FWpTH+74yBvdg43eiU0kF51QOL+nH57dG
	 a35SQJ2R/uTNVhWBvVPqbPol6Yv6njtIeKGvTXs8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DF4tY0011971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 10:04:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 10:04:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 10:04:55 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DF4t81057557;
	Fri, 13 Oct 2023 10:04:55 -0500
Message-ID: <56a62a33-87b3-4dea-a090-47e98ca93ba7@ti.com>
Date: Fri, 13 Oct 2023 10:04:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
Content-Language: en-US
To: "Limaye, Aniket" <a-limaye@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
 <20231012172947.1359231-2-a-limaye@ti.com>
 <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
 <f902e28bfd21435a9b11abd44af2425f@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f902e28bfd21435a9b11abd44af2425f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 15:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17109

On 10/12/23 10:38 PM, Limaye, Aniket wrote:
> Hi Andrew,
> 
> We need those files to be packaged in the tisdk-core-bundle... So that it can be packaged in the installer we release on ti.com. We package these, ti-dm and the u-boot sources used, to enable u-boot builds in the installer with the same sources used for our build.
> 

You can fetch those firmware out of their normal install directory.

Andrew

> Regards,
> Aniket
> 
> -----Original Message-----
> From: Davis, Andrew <afd@ti.com>
> Sent: Friday, October 13, 2023 2:37 AM
> To: Limaye, Aniket <a-limaye@ti.com>; meta-ti@lists.yoctoproject.org
> Cc: Eatmon, Ryan <reatmon@ti.com>; Gole, Dhruva <d-gole@ti.com>; Shilwant, Chirag <c-shilwant@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Raghavendra, Vignesh <vigneshr@ti.com>
> Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove COMPATIBLE_MACHINE and extend recipe to k3 machines
> 
> On 10/12/23 12:29 PM, Aniket Limaye via lists.yoctoproject.org wrote:
>> Revert ebcf15bf0f31208e87ce60a4696e585940b46777 :
>>     "recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MACHINE"
>>
>> Extend recipe to k3 machines too, to provide ti-fs-stub-* firmware for
>> u-boot aarch64 build.
>>
>> Update do_deploy() to allow multiconfig builds for k3 machines
>>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>>    meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++++--
>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 801c8768..2ad93a5d 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -4,7 +4,6 @@ inherit deploy
>>    
>>    require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>    
>> -COMPATIBLE_MACHINE = "k3r5"
>>    PACKAGE_ARCH = "${MACHINE_ARCH}"
>>    
>>    CFLAGS[unexport] = "1"
>> @@ -26,7 +25,10 @@ do_install() {
>>    
>>    FILES:${PN} = "${nonarch_base_libdir}/firmware"
>>    
>> -do_deploy() {
>> +do_deploy(){
>> +}
>> +
>> +do_deploy:k3r5() {
>>    	install -d ${DEPLOYDIR}/ti-sysfw
>>    	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
>>    	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
> 
> Why do we need to deploy these files in ${DEPLOYDIR}/ at all?
> 
> Andrew
> 
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17097):
>> https://lists.yoctoproject.org/g/meta-ti/message/17097
>> Mute This Topic: https://lists.yoctoproject.org/mt/101923272/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
>> [afd@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

