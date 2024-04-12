Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89434C04FF8
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 14:24:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.48267.1712931862446077676
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 07:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BVtr0eBp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43CEOIjf032531;
	Fri, 12 Apr 2024 09:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712931858;
	bh=TnQjZtb2SOFIBT/Qs/EanoKlRV43ZXFsdMYIsfvkVtc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=BVtr0eBpJUt5oNY0UCZ62aswFl4eXFXorisfmL5Ji9W0kSOti3jmqTZnj93owJZFx
	 65H0NbIsV/OaXkCvPBK5jQSL88XKQeU6GW8UX0ge/5e0TDqW6a7qQWnK+zc0Cs6g4P
	 U5WbviWhKZ+PdqD58lQy/V4UNJVaV9+328OUNWac=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43CEOIqh107269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Apr 2024 09:24:18 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Apr 2024 09:24:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 12 Apr
 2024 09:24:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Apr 2024 09:24:17 -0500
Received: from [10.247.18.240] (lt5cg925bjv2.dhcp.ti.com [10.247.18.240])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43CEOGJV074005;
	Fri, 12 Apr 2024 09:24:17 -0500
Message-ID: <21132769-cb58-44ef-b0d2-2f0ee360dbaa@ti.com>
Date: Fri, 12 Apr 2024 09:24:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] yocto linux development for AM3359 ICE development
 board
To: SasiKumar E <sasikumar.e@fdss.co.in>, <meta-ti@lists.yoctoproject.org>
References: <ytOh.1712929615014828166.fCvm@lists.yoctoproject.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <ytOh.1712929615014828166.fCvm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Apr 2024 14:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17566



On 4/12/2024 8:46 AM, SasiKumar E wrote:
> Hi Team,
> I am new to microprocessor development, and I want to start working with the AM3359 development board, I have done the quick build for QEMU and now trying to configure for the AM3359 development board, I am going through the https://docs.yoctoproject.org/, is there any referral document for AM3359 development board
> 
> 

The best starting point would be to review the processor-sdk offering.
https://software-dl.ti.com/processor-sdk-linux/esd/AM335X/09_01_00_001/exports/docs/linux/Release_Specific_Supported_Platforms_and_Versions.html#release-specific-supported-platforms-and-versions 


go to https://e2e.ti.com/ for support.


> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17565): https://lists.yoctoproject.org/g/meta-ti/message/17565
> Mute This Topic: https://lists.yoctoproject.org/mt/105482536/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

