Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C86C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 14:31:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14274.1708439480304572468
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 06:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uRYXHhu2;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KEVGAb025715;
	Tue, 20 Feb 2024 08:31:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708439476;
	bh=QS+uZwsEYOguZow4YWqCfh/wX+9LSrVRENgQ47jxfl0=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=uRYXHhu2WyDt+q9V1eVIy4jQq9oLJiLTzm/noe6qzsicrr/eK0fxo5EbBLAV3fPXq
	 GAq0v/eJnmng1WfI7GFOgjCJ/TcZkjSqGhmM166exzqre4pPhsdJTxDoWbrDck5SYz
	 SIZVbqOZiFo+M/gRmSlP+RnV1XHS5R55QrOLgdvA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KEVGul118106
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Feb 2024 08:31:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 08:31:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 08:31:16 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KEVFOQ004308;
	Tue, 20 Feb 2024 08:31:15 -0600
Message-ID: <d7c539d7-f9ff-46e4-9ae8-ca825e8f3fd1@ti.com>
Date: Tue, 20 Feb 2024 08:31:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: Use
 Cortex-A53/A72 CPU tune
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240215212613.57012-1-afd@ti.com>
 <20240216202300.GC1572@denix.org>
Content-Language: en-US
In-Reply-To: <20240216202300.GC1572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Feb 2024 14:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17488

On 2/16/24 2:23 PM, Denys Dmytriyenko wrote:
> Unfortunately, NAK.
> 
> This is considered an antisocial behavior for a BSP in the Yocto Project
> world. And the performance benefit is questionable with 1%-2%, if at all.
> 

This stated when a potential customer noticed building and running some
benchmarks (linpack for instance) on our SDK were being out-performed by
some other vendors. Even though on paper our platforms should have been
the better performing ones.

After investigating it turns out these other vendors have these tune
options in  their BSP layers, causing the performance discrepancy.

So the performance here, even of a couple percent, is very important.

> The proper place for any extra optimization tunes is in a distro config. Maybe
> even by end customer's final product, not a reference distro.
> 
> Consider a distro that supports multiple HW platforms and uses multiple BSPs
> besides meta-ti - YoE, AGL, etc. You do want a common denominator tunes in
> order to get the most binary re-use across the platforms.
> 

If one wants binary re-use they can override the tune. Otherwise maybe
they should be using Debian or some other binary distro. The main selling
point for Yocto IMHO is customizing like this. The best part of rebuilding
everything from scratch every time for every machine is we can have these
machine specific tunings.

> For example, AGL goes to some extreme lengths to override such custom tunes
> set by misbehaving BSPs and it's quite ugly.
>

Then we should work to make it easier to override for those folks, not simply
leave this performance on the table.

> And moreover, we've gone through this motion in the past many years ago when
> we had our ARMv7 platforms set to their corresponding cortex-a8/a9/a15 tunes
> by default, but eventually ended up setting a common ARMv7 tune:
> 
> DEFAULTTUNE ?= "armv7athf-neon"
> 
> So, you should either leave the current arch-arm64.inc inclusion as is, or if
> you insist on including tune-cortexa72-cortexa53.inc, set the default tune
> back to plain aarch64:
> 
> DEFAULTTUNE ?= "aarch64"
> 

I see our friends over in meta-xilinx are doing machine specific DEFAULTTUNEs.
I was thinking of matching that to keep our BSP performance competitive. But
as a compromise and to avoid "antisocial behavior" as you say, I think I can
live with DEFAULTTUNE ?= "aarch64".

Will resend with that.

Andrew

> 
> On Thu, Feb 15, 2024 at 03:26:13PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> All current K3 devices use either A53 or A72. Use the compile tune
>> configuration specific for these to allow the compiler to make
>> better optimizations.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 2415f0ba..7c3579af 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -3,7 +3,7 @@
>>   require conf/machine/include/ti-soc.inc
>>   SOC_FAMILY:append = ":k3"
>>   
>> -require conf/machine/include/arm/arch-arm64.inc
>> +require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
>>   
>>   BBMULTICONFIG += "k3r5"
>>   
>> -- 
>> 2.39.2

