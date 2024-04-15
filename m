Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CC0C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:26:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.20982.1713187611208935279
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 06:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jZFwPs++;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43FDQkeX125144;
	Mon, 15 Apr 2024 08:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713187606;
	bh=VdbglgvgLbmPRjTIA1mnZkrbV/3yFiunh51KlTBDKHA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jZFwPs++p/oeqPTFoFz7+QyaC38OwLGFntIjLHe66IpMeb5zkz6psGiJZxbb+DcWo
	 D1XTA7JQKN+xKCtcaU9p6T2w/dFqGZpB1Jf0yJ8CQLlaitbN0WAhnYGqkwnWie060u
	 I4GGKlYW0lM9uqUepsUiERsm122s7idfZiOIh7q0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43FDQkVp038828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Apr 2024 08:26:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 08:26:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 08:26:46 -0500
Received: from [10.247.18.240] (lt5cg925bjv2.dhcp.ti.com [10.247.18.240])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43FDQkgx092559;
	Mon, 15 Apr 2024 08:26:46 -0500
Message-ID: <c8bda4fa-f68c-4bb1-ab93-504976b58cf7@ti.com>
Date: Mon, 15 Apr 2024 08:26:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] yocto linux development for AM3359 ICE development
 board
To: SasiKumar E <sasikumar.e@fdss.co.in>, <meta-ti@lists.yoctoproject.org>
References: <21132769-cb58-44ef-b0d2-2f0ee360dbaa@ti.com>
 <22488.1713154044174996671@lists.yoctoproject.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <22488.1713154044174996671@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:26:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17569



On 4/14/2024 11:07 PM, SasiKumar E wrote:
> Hi Praneeth,
> we are starting the design with AM3359 development board but for the final custom board we are intended to design with AM5729 microprocessor, thus TI provides different SDK for both processors we thought working in yocto will provide a greater advantage since it does not provide a specific setup for each processor.
> I have done the quick build for QEMU but then switching to machine specific the example provided is for altera board and I am going through the docs provided by yocto"https://docs.yoctoproject.org/", this is a lengthy procedure. if I had any documents relating to implementing the yocto in AM3359 boards it would be good.
> 

meta-ti@list is primarily intended for community code reviews.

 From documentation perspective: Request you to read the am335x and 
am57x yocto build configuration steps from TI SDK release notes and 
raise necessary support query at e2e.ti.com (This question doesnt belong 
in meta-ti mailing list). There are similar related queries posted and 
answered there already.

All supported machine names are here (including am335x , am57x): 
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine?h=master



> Thank you
> Sasikumar E
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17567): https://lists.yoctoproject.org/g/meta-ti/message/17567
> Mute This Topic: https://lists.yoctoproject.org/mt/105482536/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

