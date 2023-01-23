Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2E7C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:55:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.42434.1674482124927144510
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 05:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZWrDw8iK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NDtKrV110359;
	Mon, 23 Jan 2023 07:55:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674482120;
	bh=UPGcg5OKDifkKY5bqftXgI+jvPjecyCAs1Y+vM5ioTE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZWrDw8iKRgpysuA/O0bSALw3icAeGShXXrtW3ZPaLQdONTFeM9YVH4PKrcP12f6w+
	 UfKZHVDT/bFfuXFvwwQg/xp5cF5RjFqxhJwWwKq8DLLYtH2BB8c/a5817QQeL3sM2W
	 YHOIWz1xZ965Gn6SC+zGsqCIAxEWmtqPcQrsWCFU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NDtKJb123750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 07:55:20 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 07:55:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 07:55:20 -0600
Received: from [10.250.32.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NDtJD9025224;
	Mon, 23 Jan 2023 07:55:19 -0600
Message-ID: <57166e0b-f24f-f278-24b7-3a2c9f4a4650@ti.com>
Date: Mon, 23 Jan 2023 07:55:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [master/kirkstone][PATCH] all: Graphics recipe overhaul
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, "Sapp, Randolph" <rs@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230119204026.1297616-1-rs@ti.com>
 <20230120182636.GP22689@denix.org> <SBSSOR.I33PHI6LU4AA@ti.com>
 <20230120221120.GR22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230120221120.GR22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 13:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15621

On 1/20/23 4:11 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 20, 2023 at 12:50:16PM -0600, Sapp, Randolph wrote:
>> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
>> <denis@denix.org> wrote:
>>> E.g. if you are copying the entire Mesa set of recipes, include
>>> files and
>>> patches, it should have been a separate patch with just that w/o any
>>> modifications, clearly stating that this is a verbatim copy and
>>> specify which
>>> repo and branch/tag they are being picked up from -
>>> openembedded-core repo,
>>> kirkstone branch.
>>>
>>> But then I would argue that a simple mesa_%.bbappend is smaller
>>> and much
>>> easire to review. For example, I took your previous v4 revision of
>>> the patch
>>> and dropped all copies of upstream Mesa, replacing it with a bbappend:
>>> https://patchwork.yoctoproject.org/project/ti/patch/20230119010333.3414485-1-denis@denix.org/
>>
>> Right, sorry about that. You are correct that the duplication of
>> mesa and mesa patches should have occurred in a separate patch,
>> however it should not be a blanket BB appends. The reason this
>> duplication exists is that upstream mesa will move faster than our
>> modified versions (as much as I would like to avoid it) and this
>> will prevent things from silently creeping forward and breaking. The
>> umlibs are still dependent on particular, patched releases of mesa.
> 
> Well, there are pros and cons to both approaches. And I would be more inclined
> to agree with you that it is necessary to copy over the entire Mesa recipes,
> if you were trying to apply patches on top of the upstream version. But, you
> are completely changing SRC_URI and SRCREV anyway to point to your own tree,
> so it doesn't matter very much what underlying version of the recipe you start
> with. I do believe it would just work for the master with 22.2.3 version.
> Sure, recipes sometimes change significantly and break your bbappend, but
> that's when it will be the time to consider carrying the full set of older
> version, sometime in the future.
> 
> As an example, we've been carrying bbappends in meta-ti for upstream optee and
> trunsted-firmware-a recipes from meta-arm - sometimes we fall behind and stick
> to an older version, but sometimes we update to a newer version earlier than
> upstream. That's been working for several years and quite successful for the
> most part...
> 
> On the other side of the spectrum, there's ltp-ddt recipe that is based on top
> of the upstream ltp recipe of a specific version. It's not exactly a bbappend,
> but close enough. When upstream upgrades to a newer version, we end up copying
> the specific previous version locally side-by-side. Later, when we rebase
> ltp-ddt and catch up with the ltp version upstream, we can remove the
> duplicate.
> 
> In other words, *IF* we end up duplicating Mesa recipes locally, I'd argue we
> should keep them unmodified and apply any modifications through bbappend. If
> needed, you can make it version-specific, e.g. mesa_22.0.%.bbappend. That way
> in kirkstone you only need this bbappend, but in langdale/mickledore you may
> end up having a local copy of *unmodified* mesa_22.0.3.bb from kirkstone along
> with this mesa_22.0.%.bbappend on top. In other words - if you refrain from
> modifying the local duplicates of upstream files and keep them intact, it
> would be much easier to maintain long term...
> 
> 
>> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
>> <denis@denix.org> wrote:
>>> I looked at this repo - it's a personal copy of upstream Mesa with
>>> Imagination
>>> PVR patches applied on top. Was it reviewed and approved by OSRB?
>>> Were the
>>> patches made public before and/or permitted to be
>>> published/distributed?
>>
>> Those patches inherited the license of mesa and therefore did not
>> need approval from OSRB.
> 
> Oh, you can never ever assume anything when it comes to legal matters!
> That's why OSRB was formed in the first place and I was around back then
> and indirectly involved in that...
> 
> 
>> I did, however, get IMG's grace to release them anyway.
> 
> Ok, this is great!
> 
> 
>> The reason why it's a personal repo is there is certain
>> functionality that I believe can be upstreamed and I believe hosting
>> that process on freedesktop will help reduce friction and be a
>> little more transparent about our efforts.
> 
> As far as I know, OSRB requires a special exception for official TI software
> to be hosted in personal repos. Please do due diligence and run it by the
> OSRB/Legal! Always CYA... :)
> 
> 
>> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
>> <denis@denix.org> wrote:
>>> Only rogue?
>>
>> Only rogue. I added all the necessary hooks for sgx but it still
>> needs work before it can fall in line with my changes. The mesa
>> layer needs some TLC and the umlibs will need some packaging
>> changes. Thankfully SGX can now be disabled until we have it working
>> by removing powervr-sgx-graphics from the distro features string.
> 
> Well, the massive Beagle community would have to suffer longer... :(
> 

They should be used to it by now :D

But really that shouldn't happen, the updated SGX umlibs I sent last
week should (tested with Poky, Arago needs some more patches still..)
get things back working on Kirkstone.

Plus once we finalize the strategy here with this Mesa shim stuff
we already have the SGX version of the Mesa side staged and ready,
should be a quick switchover at that point.

Andrew

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15615): https://lists.yoctoproject.org/g/meta-ti/message/15615
> Mute This Topic: https://lists.yoctoproject.org/mt/96386295/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

