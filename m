Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A72C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 19:53:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.86064.1670010792641184425
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 11:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n5AAeHWs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B2Jr7n4123882;
	Fri, 2 Dec 2022 13:53:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670010787;
	bh=EeXiiqhHIZEiJfQ+o9eLnK2khvVPCa3J5OdprYpimIw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n5AAeHWsFv82NGwcGmfWSC6yHFi/IYgQ/5uBW1yf9JzN5lQGVv4bZcg+eiHvbARdJ
	 cWUIf2KNOvj1U3fmFvHnDe7i9LAqCGX712R9s64D+vQQH3IlvWNGDpNDHkOehC1WRv
	 2UVwrKellANPIIR3xsEoR1LwKnNwWD2joblDfkGs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B2Jr7dw105333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Dec 2022 13:53:07 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 13:53:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 13:53:07 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B2Jr6Pq064311;
	Fri, 2 Dec 2022 13:53:06 -0600
Message-ID: <63882f90-dd71-3e01-578c-23c36b405e07@ti.com>
Date: Fri, 2 Dec 2022 13:53:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti] [PATCH] linux-ti: Drop unneeded update_data calls
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20221201064805.2094474-1-raj.khem@gmail.com>
 <20221201143643.GT22689@denix.org>
 <CAMKF1sq=gYbvmiNYZyCf6oYDO4B0zELWF0F-hgBhVgW9KwXjZA@mail.gmail.com>
 <d95ec770-88d8-c27d-008c-7cfd6b706ed2@ti.com>
 <CAMKF1sqAJXscBK=bYq_2ML3jNo-ZEtXOX=5LeguEP9P9sAor6w@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1sqAJXscBK=bYq_2ML3jNo-ZEtXOX=5LeguEP9P9sAor6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 19:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15391


I saw those, but we don't have the QA issue for patch-fuzz turned on as 
an error.  Just warnings.  I'll take a look.


On 12/2/2022 12:57, Khem Raj wrote:
> Ryan
> 
> Thanks for applying the fixes. I am seeing another issue
> 
> 2022-12-02T17:26:17.8104311Z ERROR:
> linux-ti-staging-5.10.145+gitAUTOINC+8b51d20b6e-0b do_patch: Fuzz
> detected:
> 2022-12-02T17:26:17.8105197Z
> 2022-12-02T17:26:17.8106282Z Applying patch
> init_disassemble_info-signature-changes-causes-compile-failures.patch
> 2022-12-02T17:26:17.8107676Z patching file tools/perf/util/annotate.c
> 2022-12-02T17:26:17.8108593Z Hunk #1 succeeded at 1685 with fuzz 2.
> 2022-12-02T17:26:17.8109470Z Hunk #2 succeeded at 1739 with fuzz 2.
> 2022-12-02T17:26:17.8109999Z
> 2022-12-02T17:26:17.8110016Z
> 2022-12-02T17:26:17.8110542Z The context lines in the patches can be
> updated with devtool:
> 2022-12-02T17:26:17.8111180Z
> 2022-12-02T17:26:17.8117818Z     devtool modify linux-ti-staging
> 2022-12-02T17:26:17.8118351Z     devtool finish --force-patch-refresh
> linux-ti-staging <layer_path>
> 2022-12-02T17:26:17.8118625Z
> 2022-12-02T17:26:17.8118872Z Don't forget to review changes done by devtool!
> 2022-12-02T17:26:17.8119097Z
> 2022-12-02T17:26:17.8126616Z ERROR:
> linux-ti-staging-5.10.145+gitAUTOINC+8b51d20b6e-0b do_patch: QA Issue:
> Patch log indicates that patches do not apply cleanly. [patch-fuzz]
> 
> 
> Do you have a patch for this too ?
> 
> On Thu, Dec 1, 2022 at 12:48 PM Ryan Eatmon <reatmon@ti.com> wrote:
>>
>>
>> On 12/1/2022 11:40, Khem Raj wrote:
>>> On Thu, Dec 1, 2022 at 6:36 AM Denys Dmytriyenko <denis@denix.org> wrote:
>>>>
>>>> NAK
>>>>
>>>> cmem is being removed:
>>>> https://patchwork.yoctoproject.org/project/ti/patch/20221104224653.1223044-51-denis@denix.org/
>>>>
>>>> ti-unpack is being patched already:
>>>> https://patchwork.yoctoproject.org/project/ti/patch/20221125230020.5316-1-reatmon@ti.com/
>>>>
>>>> It's just getting longer to get the patches merged due to other breakages
>>>> in master...
>>>
>>> Can we expedite these two fixes or atleast my cosmetic change ? this
>>> will fix CI breakages for distros
>>> living on master.
>>
>> Just updated master-wip -> master.  So your issue should be fixed now.
>>
>>
>>>>
>>>> --
>>>> Denys
>>>>
>>>>
>>>> On Wed, Nov 30, 2022 at 10:48:05PM -0800, Khem Raj wrote:
>>>>>    datastore works dynamically we don't need the update_data calls
>>>>>    anymore, so far they were no-ops, now bitbake has recently dropped this
>>>>>    API and hence compile fails with core/master
>>>>>
>>>>>    Fixes
>>>>>     *** 0052:        bb.data.update_data(localdata)
>>>>>        0053:
>>>>>        0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>>>>>        0055:
>>>>>        0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
>>>>> Exception: AttributeError: module 'bb.data' has no attribute 'update_data'
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>>    meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
>>>>>    meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
>>>>>    2 files changed, 3 deletions(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>>>> index fd913f6c..f560932c 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
>>>>> @@ -49,7 +49,6 @@ python do_unpack() {
>>>>>            # Create copy of data for additional override
>>>>>            localdata = bb.data.createCopy(d)
>>>>>            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
>>>>> -        bb.data.update_data(localdata)
>>>>>
>>>>>            cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>>>>>
>>>>> @@ -67,7 +66,6 @@ python do_setup_cmem() {
>>>>>                # Create copy of data for additional override
>>>>>                localdata = bb.data.createCopy(d)
>>>>>                localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
>>>>> -            bb.data.update_data(localdata)
>>>>>
>>>>>                # Get source directory and dtsi filename
>>>>>                src_dir  = localdata.getVar('WORKDIR')
>>>>> diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>>>> index 46bfb957..13068843 100644
>>>>> --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>>>> +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
>>>>> @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
>>>>>            bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
>>>>>
>>>>>        localdata = bb.data.createCopy(d)
>>>>> -    bb.data.update_data(localdata)
>>>>>
>>>>>        binfile  = localdata.getVar('BINFILE')
>>>>>        binfile  = bb.data.expand(binfile, localdata)
>>>>> --
>>>>> 2.38.1
>>>>>
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#15383): https://lists.yoctoproject.org/g/meta-ti/message/15383
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/95376959/6551054
>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

