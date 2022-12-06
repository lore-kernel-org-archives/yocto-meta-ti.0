Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E70C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 18:16:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.55817.1670350596842287056
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 10:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MsLmh8wp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6IGVId056112;
	Tue, 6 Dec 2022 12:16:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670350591;
	bh=w83JMIdJKgBRK2QKh66ens2Hl2VRqF80OQ7eCWNS3d0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MsLmh8wp+1QSHZPTNzywfwVnGOoyDQm6QAweu5bV6ZI77UJb1ZNyFaL0k0+HMstAR
	 pNg4mE3Hdchg5u2WRFwXQxvZyEqCI70OXTL1jaTz/W8dksmpuif6AeRzoHrQcODxEC
	 vwK6sfAicYKfmHgY5SQaeGGtpSIrtYGlTJZjJ+WQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6IGVTp002249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Dec 2022 12:16:31 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 12:16:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 12:16:31 -0600
Received: from [10.250.35.27] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6IGVuS119965;
	Tue, 6 Dec 2022 12:16:31 -0600
Message-ID: <70ea8a7a-d3cf-3824-6f34-e26fb4c6e1d3@ti.com>
Date: Tue, 6 Dec 2022 12:16:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti] check-layer failures for meta-ti
Content-Language: en-US
To: <alexandre.belloni@bootlin.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <Y49uhpn5sKBKaElF@mail.local>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <Y49uhpn5sKBKaElF@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 18:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15415


Could this be because the include crosses layers?

ti-sci-fw_git.bb is in meta-ti-bsp

ti-paths.inc is in meta-ti-extras




On 12/6/2022 10:32, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#builders/121/builds/1046/steps/19/logs/stdio
> 
> Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could not include required file recipes-ti/includes/ti-paths.inc
> ERROR: Parsing halted due to errors, see error messages above
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15412): https://lists.yoctoproject.org/g/meta-ti/message/15412
> Mute This Topic: https://lists.yoctoproject.org/mt/95496694/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

