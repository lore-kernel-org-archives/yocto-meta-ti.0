Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC69C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:00:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.50373.1683208830280961029
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 May 2023 07:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jW8+Zg6B;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 344E0Ou2077396;
	Thu, 4 May 2023 09:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683208824;
	bh=eRplOFDnzjJ5k7Zf+RTkahBt0KFfit/IbCFTWbraFeg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jW8+Zg6BXdc1xe65rvsa3BwieuCdZwFdLag6g0QSXZZfqgZf2EY7X/C5cMrAM9Sik
	 do7Cx1EK7ioobm6dx0uLsVKKPirKEdq/Y8APJt2/RspeuOc6GwhADumPLmeSY3Pi+O
	 JLFh2SuzJwdUOOWiSv22TaZVeF5s6U5aORZCQpSM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 344E0Nfi048647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 May 2023 09:00:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 09:00:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 May 2023 09:00:23 -0500
Received: from [10.250.35.77] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 344E0N7b002203;
	Thu, 4 May 2023 09:00:23 -0500
Message-ID: <a4efdf2f-1989-2121-22d4-513c1bba715f@ti.com>
Date: Thu, 4 May 2023 09:00:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-ti][master/kirkstone][RFC 4/9] u-boot-bb.org: Remove this
 recipe
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230425172345.12293-1-afd@ti.com>
 <20230425172345.12293-5-afd@ti.com> <20230427203108.GO9226@denix.org>
 <3276c7f1-37bc-c35b-5ffc-44c3e0296c42@ti.com>
 <20230502193800.GC9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230502193800.GC9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 May 2023 14:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16485

On 5/2/23 2:38 PM, Denys Dmytriyenko wrote:
> On Fri, Apr 28, 2023 at 10:13:26AM -0500, Andrew Davis wrote:
>> On 4/27/23 3:31 PM, Denys Dmytriyenko wrote:
>>> On Tue, Apr 25, 2023 at 12:23:40PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> This will no longer build after we switch away from k3-image-gen. Remove
>>>> this version until it can be rebased on the latest U-Boot with binman
>>>> support.
>>>
>>>> For now switch current users of this over to u-boot-ti v2021.01.
>>>
>>> This comment is not very clear - aren't you also removing that here?
>>
>> Not here, I do that in the *next* patch :)
>>
>> I usually sort my patches from least to most controversial, so the first
>> 3-4 can be taken stopping here without breaking as much.
>>
>>> Would it be possible to preserve at least Beagle build flows intact? Can
>>> the existing ti-sci-fw recipe that uses k3-image-gen be kept for now
>>> alongside the new one, e.g. move it to ti-sci-fw-legacy or something?
>>
>> I have found no such way :(
>>
>> All the multiconf and deploy logic expects k3-image-gen and now needs
>> moved over to the new way. Supporting both would mean forking almost
>> everything removed by this series.
> 
> But on the other hand, BBAI64 and BeaglePlay only support GP and don't set any
> additional multiconfigs besides the main k3r5. I feel like creating a separate
> ti-sci-fw-bb.org with k3-image-gen might be possible. But I haven't tried that
> myself yet...
> 
> 
>> The benefit is not there IMHO since the beagle platforms should boot
>> almost exactly the same on our TI tree as the bb.org version.
>>
>> Moving forward, bb.org will also have to make this migration as
>> k3-image-gen will soon be deprecated. When they do, if we still want
>> their fork in meta-ti we can bring it back in.
> 
> The issue is that it will take time for bb.org to switch over to the latest TI
> 6.1 kernel and 2023 U-boot with binman. Moreover, they only support Debian, so
> don't expect timely OE recipe updates. And in all this potentially long time
> there won't be any OE support for BB platforms. But there are active OE BB
> users here and I'm trying to find a way to not throw them under the bus...
> 

This will only force them to use 2023 U-boot, which seems to boot the BB boards
just fine already. The kernel can remain 5.10 until bb.org upgrades.

Andrew

