Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AC3C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 20:48:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.56894.1669927699413294220
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 12:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VXFvsx0P;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B1KmDxD021819;
	Thu, 1 Dec 2022 14:48:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669927693;
	bh=JeTCyJzEwGW4LP8QBkrPOWxiOFyBUoQb5xpTG96pkrk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VXFvsx0PcyyTP4FbYQIvntrJztKm5/A+jtHKmIW1kj+YQeIFQgc1C7W3E6w9nYGhR
	 EEEwBU8dv09sqNSSVRW/ZLnO4I60oTWJ16/xPSC9YyiZU1DP/p/ff1/onlnf42daCa
	 +Tn72azuu81EG1FTRdPybTJNt1iDEKdWSd+8o8fM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B1KmDhh049886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Dec 2022 14:48:13 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 1
 Dec 2022 14:48:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 1 Dec 2022 14:48:13 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B1KmDri036128;
	Thu, 1 Dec 2022 14:48:13 -0600
Message-ID: <d95ec770-88d8-c27d-008c-7cfd6b706ed2@ti.com>
Date: Thu, 1 Dec 2022 14:48:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti] [PATCH] linux-ti: Drop unneeded update_data calls
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20221201064805.2094474-1-raj.khem@gmail.com>
 <20221201143643.GT22689@denix.org>
 <CAMKF1sq=gYbvmiNYZyCf6oYDO4B0zELWF0F-hgBhVgW9KwXjZA@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1sq=gYbvmiNYZyCf6oYDO4B0zELWF0F-hgBhVgW9KwXjZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Dec 2022 20:48:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15384


On 12/1/2022 11:40, Khem Raj wrote:
> On Thu, Dec 1, 2022 at 6:36 AM Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> NAK
>>
>> cmem is being removed:
>> https://patchwork.yoctoproject.org/project/ti/patch/20221104224653.1223044-51-denis@denix.org/
>>
>> ti-unpack is being patched already:
>> https://patchwork.yoctoproject.org/project/ti/patch/20221125230020.5316-1-reatmon@ti.com/
>>
>> It's just getting longer to get the patches merged due to other breakages
>> in master...
> 
> Can we expedite these two fixes or atleast my cosmetic change ? this
> will fix CI breakages for distros
> living on master.

Just updated master-wip -> master.  So your issue should be fixed now.


>>
>> --
>> Denys
>>
>>
>> On Wed, Nov 30, 2022 at 10:48:05PM -0800, Khem Raj wrote:
>>>   datastore works dynamically we don't need the update_data calls
>>>   anymore, so far they were no-ops, now bitbake has recently dropped this
>>>   API and hence compile fails with core/master
>>>
>>>   Fixes
>>>    *** 0052:        bb.data.update_data(localdata)
>>>       0053:
>>>       0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>>>       0055:
>>>       0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
>>> Exception: AttributeError: module 'bb.data' has no attribute 'update_data'
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
>>>   meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
>>>   2 files changed, 3 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>> index fd913f6c..f560932c 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>> @@ -49,7 +49,6 @@ python do_unpack() {
>>>           # Create copy of data for additional override
>>>           localdata = bb.data.createCopy(d)
>>>           localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
>>> -        bb.data.update_data(localdata)
>>>
>>>           cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>>>
>>> @@ -67,7 +66,6 @@ python do_setup_cmem() {
>>>               # Create copy of data for additional override
>>>               localdata = bb.data.createCopy(d)
>>>               localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
>>> -            bb.data.update_data(localdata)
>>>
>>>               # Get source directory and dtsi filename
>>>               src_dir  = localdata.getVar('WORKDIR')
>>> diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>> index 46bfb957..13068843 100644
>>> --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>> +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>> @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
>>>           bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
>>>
>>>       localdata = bb.data.createCopy(d)
>>> -    bb.data.update_data(localdata)
>>>
>>>       binfile  = localdata.getVar('BINFILE')
>>>       binfile  = bb.data.expand(binfile, localdata)
>>> --
>>> 2.38.1
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#15383): https://lists.yoctoproject.org/g/meta-ti/message/15383
>>> Mute This Topic: https://lists.yoctoproject.org/mt/95376959/6551054
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

