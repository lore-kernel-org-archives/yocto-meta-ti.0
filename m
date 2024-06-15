Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96923C27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 13:01:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12076.1718456490997453563
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Jun 2024 06:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hmo4ChET;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45FD1N9T016277;
	Sat, 15 Jun 2024 08:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718456483;
	bh=2CnfpeJiZQ7Ki01TlEV5p+2qdTCao5TVhiMwA6Z3jRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hmo4ChETWtViVI3qgAxF2cFlu2whc5z7VF3m08fbQgWYEtL64/l8VvyoCHyJx46wC
	 krhKm8mgPTcftLP5BVLTAATTEDJ2ijlToj/X43gM3yA9o99BDAaT67Bc0Le+ouex2W
	 2l5iWMiiG69YEKf8B44Coizh345P8DTx58QOnPm0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45FD1Nre089927
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 15 Jun 2024 08:01:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 15
 Jun 2024 08:01:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 15 Jun 2024 08:01:23 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45FD1NI0094567;
	Sat, 15 Jun 2024 08:01:23 -0500
Message-ID: <d5054cda-4085-49d6-be0a-55956c9c70f9@ti.com>
Date: Sat, 15 Jun 2024 08:01:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] check-layer failures for meta-ti
To: Denys Dmytriyenko <denis@denix.org>, <alexandre.belloni@bootlin.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240508215222b967f0db@mail.local>
 <20240614151329915a52aa@mail.local> <20240614161756.GW21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240614161756.GW21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Jun 2024 13:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17748


The offending patch has been reverted and pushed to master.  You should 
be able re-enable the nightly testing from the perspective of this issue.


On 6/14/2024 11:17 AM, Denys Dmytriyenko wrote:
> Thanks Alexandre
> 
> And sorry this has taken longer than expected to get it fixed.
> 
> As I explained last time, we were holding until nanbield got EOL-ed in May,
> since the component in question python3-yamllint was added to OE-Core since
> scarthgap and meta-ti doesn't have a separate nanbield branch. Anyway, I just
> sent patches to remove the recipe and nanbield compatibility:
> https://patchwork.yoctoproject.org/project/ti/patch/20240614155606.792020-1-denis@denix.org/
> https://patchwork.yoctoproject.org/project/ti/patch/20240614155606.792020-2-denis@denix.org/
> 
> But honestly, there's been a lot of breakage in master caused by the UNPACKDIR
> fallout and other changes slowly propagating to other layers - Ryan hasn't
> been able to get green CI builds for many weeks now and meta-ti patches have
> been piling up in next and wip branches w/o being tested. E.g. meta-arm is
> only now unlocking master:
> https://patchwork.yoctoproject.org/project/arm/list/?series=25549
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17736): https://lists.yoctoproject.org/g/meta-ti/message/17736
> Mute This Topic: https://lists.yoctoproject.org/mt/105990588/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

