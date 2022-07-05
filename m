Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97BCC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 15:28:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.85487.1657034893877973924
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 08:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b7Elb/Qv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 265FSAgq094101;
	Tue, 5 Jul 2022 10:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657034890;
	bh=sBP7qeRldrjb0odDidXPMEYsWISQGvWsZH9uwoK+DUA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=b7Elb/QvjgtfVQm+90Btw9zbiDF4PCBAQ1u0o2bt4XV+YzjjlylDuDho1PUTi29Et
	 CIul6u1sSYO7m9UyaKoy6DdAfoLi75rLCWqOqGdgcbysBCSMrkqwdjQldT0D8ntOZl
	 vcesEb37SNpS3GsZ7UtNEq/FjHpv4PFKrtfS+6VY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 265FSA8J054446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Jul 2022 10:28:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Jul 2022 10:28:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Jul 2022 10:28:09 -0500
Received: from [10.250.33.129] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 265FS9Cm026657;
	Tue, 5 Jul 2022 10:28:09 -0500
Message-ID: <b2eba87d-9c9b-ffdc-8cf4-22fa9c6cf4a8@ti.com>
Date: Tue, 5 Jul 2022 10:28:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][RFC 0/6] HS SDK on GP EVM support
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220701220228.5449-1-afd@ti.com>
 <20220702224335.GC18692@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220702224335.GC18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Jul 2022 15:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14873

On 7/2/22 5:43 PM, Denys Dmytriyenko wrote:
> On Fri, Jul 01, 2022 at 05:02:22PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Hello all,
>>
>> Still some changes pending in the k3-image-gen and u-boot projects
>> but wanted to get some comments on this early. Plan is to remove
>> the GP SDK. Have the HS SDK work on GP SoCs with minimal effort
>> and have HS become the default single SDK type (starting only
>> with AM64x and working out from there so don't panic (yet)).
> 
> So, quick question - does this set have any chance to get merged this year
> into dunfell before kirkstone becomes the current base?
> 

Was hoping this (for AM64x only) could be ready for merge in the next week or so..

> Reason being is that I've been mulling over a much better and granular
> grouping of platforms in master/kirkstone into different categories, such
> as legacy (ARMv7) HS vs. K3 HS, legacy vs. multi-cert boot, GPU vs headless,
> etc.
> 
> This would be the best use of those new groupings...
> 

Does sound interesting, I'm game for re-working this series for
master/kirkstone as needed too.

Is this new grouping still in the mulling stage only, or do you
have some details on what this new grouping scheme might look like?

Most categories feel orthogonal already, (any can be GPU vs headless, etc.),
only the "Legacy vs K3" being a top level that would have some specifics
under it,

  * legacy
    - GP / HS
  * K3
    - non-combined / multi-cert boot
    - combined / split SYSFW
    - GP / HS   <- this one I'd like to go away making it a legacy-only
                   category and not a purely orthogonal one like before.

Andrew

> 
>> Thanks,
>> Andrew
>>
>> Andrew Davis (6):
>>    conf: machine: Make multi-certificate image the default
>>    ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR to simplify recipe
>>    ti-sci-fw: Deploy all SYSFW firmware types
>>    ti-sci-fw: Use SYSFW_TIBOOT3 to point to the SYSFW image
>>    machine: am64xx-k3r5: The output of u-boot is not used
>>    ti-sci-fw: Deploy GP version of tiboot3.bin with HS SDK
>>
>>   conf/machine/am64xx-evm-k3r5.conf      |   7 +
>>   conf/machine/am64xx-hs-evm-k3r5.conf   |   7 +
>>   conf/machine/am64xx-hs-evm.conf        |   2 +
>>   conf/machine/include/am62xx.inc        |   3 -
>>   conf/machine/include/am64xx.inc        |   3 -
>>   conf/machine/include/am65xx.inc        |   5 +-
>>   conf/machine/include/j7.inc            |   2 -
>>   conf/machine/include/k3.inc            |   5 +-
>>   conf/machine/j7-evm.conf               |   3 +
>>   conf/machine/j7-hs-evm.conf            |   1 -
>>   conf/machine/j7200-evm.conf            |   3 -
>>   conf/machine/j721s2-evm.conf           |   3 -
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 334 +++++++++----------------
>>   recipes-bsp/u-boot/u-boot-ti.inc       |  10 -
>>   14 files changed, 149 insertions(+), 239 deletions(-)
>>   rewrite recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb (72%)
>>
>> -- 
>> 2.36.1

