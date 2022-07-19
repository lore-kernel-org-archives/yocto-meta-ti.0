Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447B0C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:15:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.45551.1658261715246450422
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hr0DGmv3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26JKFBw7071631;
	Tue, 19 Jul 2022 15:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658261711;
	bh=iXTOue/jtmfYlNKzwaL7C9qOfvuORBLN8TW8/yvVbzI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hr0DGmv3k30eR/31E2l2ZpgwvtBdHKqpGbIzQGUnLiwX+ODAYHY+1e+Jr5DFwjoFy
	 MY4IyA0EbN8XORbckGWOCYnF+O7v190+rH7PG9qtJ+DVgcaj99Fm5OaItJDhnEDbpY
	 Z7y76TR+idb6l1kWycIWCBMPirWG5XSnUPz7Bjgk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26JKFBYH031540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Jul 2022 15:15:11 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 15:15:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 15:15:10 -0500
Received: from [10.250.32.190] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26JKFA9x007211;
	Tue, 19 Jul 2022 15:15:10 -0500
Message-ID: <5834094d-b9fc-c45d-3442-45d6208534b5@ti.com>
Date: Tue, 19 Jul 2022 15:15:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti] [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Nishanth Menon <nm@ti.com>
CC: Drew Fustini <dfustini@baylibre.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
 <20220719031841.GY18692@denix.org> <20220719132201.2r73plviktkkxnkf@wrecker>
 <20220719195102.GE18692@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220719195102.GE18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14885

On 7/19/22 2:51 PM, Denys Dmytriyenko wrote:
> On Tue, Jul 19, 2022 at 08:22:01AM -0500, Nishanth Menon wrote:
>> On 23:18-20220718, Denys Dmytriyenko wrote:
>>> I was thinking that instead of keying off of ARAGO_BRAND=mainline, which
>>> is very specific to Arago distro, long term we should instead key off of
>>> PREFERRED_PROVIDER_virtual/kernel=linux-ti-mainline, that is specific to
>>> meta-ti... Thoughts?
>>
>>
>> We'd want mainline kernel, u-boot, tf-a, optee ..... as many upstream
>> components as possible. is there a way to create a virtual package group
>> that points to all upstream base components?
>>
>> I am looking for ways we can enable this beyond just arago brand.
> 
> My understanding is that tf-a and optee were initially forked for K3
> development, but these days are pretty much the same as upstream.
> 
> And optee is already pulling code from upstream, just pinning down to a
> specific version and doing some extra TI-specific signing on top.
> 
> As of tf-a, I'd recommend dropping git.ti.com fork completely and pulling
> from upstream, if possible.
> 
Great minds.., 26998f43 :)

Andrew

> But kernel/U-boot is a bit more involved. Those are done as multiple
> providers and require switching corresponding PREFERRED_PROVIDER
> variables.
> 
> Either way, for testing which kernel is being built (ti-staging or mainline)
> and which U-boot (ti-staging or mainline), checking PREFERRED_PROVIDER
> should be doable and Distro-agnostic.
> 
> As of creating a virtual package group, it might be a bit challenging.
> Since if you try building linux-ti-mainline w/o switching preferred provider,
> you'd get an error saying there's a conflict between 2 kernels.
> 
> It would be more involved to solve this w/o simply switching providers,
> maybe with multiconfig, or something like that...
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14883): https://lists.yoctoproject.org/g/meta-ti/message/14883
> Mute This Topic: https://lists.yoctoproject.org/mt/92158565/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

