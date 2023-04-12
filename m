Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3132FC77B6C
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 21:42:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2470.1681335752368192849
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 14:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V/D0NaGv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CLgRUm084473;
	Wed, 12 Apr 2023 16:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681335747;
	bh=d2T6VCRoYXundOc+AqjxUAjcp90M5lm1EE8zMGsNK2A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V/D0NaGvRxUhCa4mDR7ULLIXdKx/Fr4ihzwiRlXiE7qY0ZQ7evBEKQzSiXk7MZxAJ
	 yKNP8xQWULbgdSoOAvvxtcfvNihquPx8jph3cZXR8dwz694uDXHn2HCUxObcVoxHda
	 VYglAkVSUGnxN81VKhiz4BZuLDJJOTqvIgzABq1g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CLgRxN097293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 16:42:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 16:42:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 16:42:27 -0500
Received: from [10.249.34.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CLgQ2m024063;
	Wed, 12 Apr 2023 16:42:26 -0500
Message-ID: <352d789c-4bac-187d-0800-6762496bd641@ti.com>
Date: Wed, 12 Apr 2023 16:42:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 6/6] meta-ti-bsp: graphics:
 Rename SGX driver recipes to match Rogue
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <nm@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-6-afd@ti.com> <20230412202119.GI9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230412202119.GI9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 21:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16388

On 4/12/23 3:21 PM, Denys Dmytriyenko wrote:
> On Wed, Apr 12, 2023 at 01:42:42PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> The names we use for the GPU components are not consistent nor do the
>> intuitively describe their function. Let's fix that.
>>
>> We do 3 things, first powervr-drivers/ contains only the kernel-mode
>> half of the driver, for GPUs most of the driver lives in userspace,
>> and the "PowerVR" name is no longer correct for the latest GPUs. Rename
>> this to ti-img-gpu-km/ which matches better with our naming for the
>> user-mode half and the TI/IMG codecs.
>>
>> Next, ti-img-rogue-driver is renamed ti-img-rogue-km, same reasoning
>> as above and matches the SGX version of the same.
>>
>> The usermode driver lives in a directory named "libgles", but the
>> driver does not just provide libgles, it also can provide OpenCL,
>> DRI, and Vulkan. Rename to match the kernel-mode half.
>>
>> Lastly, the acronym "DDK" is short for "Driver Development Kit".
>> This kit is provided by Imagination to TI and is what we use to
>> "Develop" the "Driver". What we ship is not the DDK, it is the
>> driver itself. The name DDK seems to have just been passed through.
>> Remove use of "ddk" where we can.
>>
>> To summarize:
>>
>>   * powervr-drivers     -> ti-img-gpu-km
>>   * ti-img-rogue-driver -> ti-img-rogue-km
>>   * ti-sgx-ddk-km       -> ti-img-sgx-km
>>   * libgles             -> ti-img-gpu-umlibs
>>   * ti-sgx-ddk-um       -> ti-img-sgx-umlibs
> 
> Renaming recipes will have a huge impact downstream! Last time we renamed
> omap5-sgx-ddk-um-linux to ti-sgx-ddk-um, there's been a lot of breakage and
> tons of complaints from customers and the community at large (in public and
> even more so in private)...
> 
> First of all, you are only advised to do such thing in master (and not right
> before the next release, which is now), definitely not in a stable branch,
> especially not in a LTS branch (e.g. kirkstone).
> 

That's fine, this last patch doesn't need to go to kirkstone, I'll post
it separately for master branch only.

> Second, do it during the version bump - keep the old version under the old
> name, add a new version with the new name.
> 
> Third, you have to provide backward compatibility and setup corresponding
> preemption/replacement policy (at least RPROVIDES, RREPLACES, RCONFLICTS).
> But that alone won't help with downstream layers adding their bbappends.
> 
> Just checking a few public OEM layers that are downstream to meta-ti (and
> that's just the tip of the iceberg, as majority of customer layers are not
> even public!):
> 
> Phytec:
> https://github.com/phytec/meta-phytec/blob/kirkstone/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bbappend
> 
> Toradex (seems to be a bit outdated, I'm guessing they pin to specific SHA):
> https://git.toradex.com/cgit/meta-toradex-ti.git/tree/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bbappend?h=kirkstone-6.x.y
> https://git.toradex.com/cgit/meta-toradex-ti.git/tree/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bbappend?h=kirkstone-6.x.y
> 
> Variscite:
> Their meta-variscite-bsp-ti layer doesn't appear to touch graphics and is
> still on dunfell...
> 
> SanCloud:
> Also doesn't appear to modify graphics recipes directly.
> 
> AGL:
> https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/meta-agl.git;a=blob;f=meta-agl-bsp/meta-ti-bsp/recipes-bsp/ti-sgx-ddk-km/ti-sgx-ddk-km_%25.bbappend;hb=HEAD
> https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/meta-agl.git;a=blob;f=meta-agl-bsp/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_%25.bbappend;hb=HEAD
> 

All three changes to the KM above are for adding compiler name support
which is only needed due to our odd way of detection arch. That
can be fixed then these should go away. The other two for UM are
easy enough to fix and we should fix them in meta-ti for them.

Meta-ti is the upstream, fixes should go upstream. I get not doing
this to the LTS branch, but for master branch we do need to make
forward progress and clean things up like this patch does.

> These are just bbappends, but I'm sure there are other references to these
> current names in configs and/or their recipes...
> 
> AFAIK, AGL, for example, hasn't yet fully recovered from the latest graphics
> changes separating Mesa - there's work in progress going on right now.
> 

Well SGX isn't working at all right now now in kirkstone, so not sure what
they are trying to fix at the moment..

> I fully understand the desire to simplify and unify things, like directory
> and recipe names. But it comes with a lot of complications and require extra
> thought put into how not to break things for everyone around...
> 
> Yocto Project guidelines for public BSPs are much stricter than those for
> Distros or customer/product layers. It may be convenient to think of meta-ti
> as a "leaf" of the project, but it is actually quite a large "branch" with
> other "branches" and "leaves" downstream depending on it...
> 

