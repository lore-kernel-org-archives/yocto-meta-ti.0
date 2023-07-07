Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4C9EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 22:16:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7477.1688768168961085609
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 15:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n01vv9Zm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 367MG5QB097256;
	Fri, 7 Jul 2023 17:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688768165;
	bh=TWhXFXJMf26nVwkWZgYO3EfLjgTIGPfb/OFFoVfryls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n01vv9ZmhAE10AHLKuoO/wLVh57x6usu93+/fAIoLhMQ8vxwfM7jlDTQBZ6f8S8T2
	 Pq8Ou620xX1OjR8banwJbgF00V8elSKVsJkkHrzWFyymxsjDh2eXxEc3OZ0sGD97Nh
	 UigKGr7b/ROrEpgDpVC4u34ZDBHRPylPP/VDcNQ4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 367MG5b3040026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jul 2023 17:16:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jul 2023 17:16:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jul 2023 17:16:04 -0500
Received: from [10.249.33.12] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 367MG4S3010488;
	Fri, 7 Jul 2023 17:16:04 -0500
Message-ID: <08d3256c-e4e4-7d3f-0cf4-d5683cc6a0c5@ti.com>
Date: Fri, 7 Jul 2023 17:16:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5 multiconfig
 to baremetal
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20230706193122.1891075-1-denis@denix.org>
 <778da68c-e71d-5305-121a-51d0ab704ace@ti.com>
 <20230707205122.GH1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230707205122.GH1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 22:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16837



On 7/7/2023 3:51 PM, Denys Dmytriyenko wrote:
> On Fri, Jul 07, 2023 at 11:33:33AM -0500, Ryan Eatmon wrote:
>>
>>
>> On 7/6/2023 2:31 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> There are couple of k3r5 components that need to be built for the target
>>> and they are self-contained and don't use glibc. Moreover, when building
>>> a cross-compile toolchain for k3r5, there's no need to build glibc and
>>> all its dependencies. While build-time speed up is nice, the main benefit
>>> comes when packaging a nativesdk toolchain for distribution, reducing the
>>> number of packages and the resulting size of the toolchain installer.
>>>
>>> To avoid potential namespace conflict in package feeds between nativesdk
>>> binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the
>>> package suffix accordingly.
>>>
>>> This also requires a rather impactful change in the deployment structure,
> 
> Should have said disruptive here instead of impactful - may have caught more
> attention...
> 
> 
>>> which affects CIs and user experience. By default different TCLIBC builds
>>> (e.g. glibc and baremetal in this case) are built in separate TMPDIRs to
>>> avoid conflicts, especially on the nativesdk side. Also the default config
>>> has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can be
>>> changed by local.conf or <distro>.conf, which meta-ti-bsp has no control
>>> over. Unlike multiconfig-image-packager example that can access deployed
>>> artifacts across multiconfigs to package in an image, we use wic and its
>>> IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot
>>> access deployed artifacts across multiconfigs in separate TMPDIRs, as it
>>> uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need
>>> to set up a "common" deploy directory for images and sdks produced by
>>> multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLOY
>>> variable that can be changed or adjusted by distros as needed.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   meta-ti-bsp/conf/layer.conf            | 4 ++++
>>>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
>>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>>> index bb286c2b..db6f9de9 100644
>>> --- a/meta-ti-bsp/conf/layer.conf
>>> +++ b/meta-ti-bsp/conf/layer.conf
>>> @@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>>   "
>>>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
>>> +
>>> +TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
>>
>> During testing, this one threw me for a bit.  None of the build
>> scripts were copying anything...
> 
> Heh, that's the lengthy explanation in the commit log above... I guess nobody
> reads that anyway :)

I read the comment.  But knowing a wave is coming and experiencing the 
wave wash over you are two different things. =)

> 
>> I can deal with that.  But, we
>> pull a few things out of the deploy dir.  Images, sdk, ipk...
>> should we also have something that uses this new TI_COMMON_DEPLOY
>> for the ipk and licenses?
> 
> I only wanted to do the bare minimum here in meta-ti for all distros to work
> out of the box w/o breaking. As mentioned in the description above the correct
> place for this stuff is either in the distro configuration or local.conf. And
> I didn't want to get in the way of that. That said, it should be perfectly
> fine to completely switch over to this "combined" deploy dir for all the
> remaining pieces, but should be done in the distro, not here.

Agreed.  I was more asking from the stand point of should we pursue 
moving everything into deploy-ti.  Which is sounds like you are in 
support of it.  And I agree, that change belongs in meta-arago.


> 
>>> +DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>>> +SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
>>> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>>> index deb07210..04b9a746 100644
>>> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>>> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>>> @@ -1,5 +1,7 @@
>>>   MAINMACHINE := "${MACHINE}"
>>> -DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
>>> +DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>>>   MACHINE:append = "-k3r5"
>>> +TCLIBC = "baremetal"
>>> +SDKPKGSUFFIX = "k3r5-nativesdk"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

