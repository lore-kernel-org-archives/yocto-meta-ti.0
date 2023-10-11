Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DBACD6E7C
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:46:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18417.1697035574211156573
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 07:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E7JBpRIb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39BEk9cw121098;
	Wed, 11 Oct 2023 09:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697035569;
	bh=GRAovJwcz2waVX/+iBSj6G4l3Okd/ZaPWdHt9ccDzKs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=E7JBpRIbfUDvDU1pq2GAofSSgUbz6tKzj/BfwssDIO9tq8IobieGvU2VzwhMsFxtB
	 cznOvtlSqXJtSl68nY3LxlN1oKux5nDHyY415jj//1snpoauXNE/aPd3LRIfm0xDoE
	 bx4CZi9IuOSMSoCLtOEYlzsctLnAhmVv8jnu8uq0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39BEk9sU068845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Oct 2023 09:46:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Oct 2023 09:46:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Oct 2023 09:46:09 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39BEk9Lu024314;
	Wed, 11 Oct 2023 09:46:09 -0500
Message-ID: <9c1a5c94-e499-45e9-884d-4b5715b62733@ti.com>
Date: Wed, 11 Oct 2023 09:46:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] TI_COMMON_DEPLOY: wrong default value?
Content-Language: en-US
To: Lisandro Damian Nicanor Perez Meyer <perezmeyer@gmail.com>,
        <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <CA+QPbz0JEs2cFDm81AZmsODgHgsiVhcKe4ASQyTK9-xEeJjwJg@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CA+QPbz0JEs2cFDm81AZmsODgHgsiVhcKe4ASQyTK9-xEeJjwJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Oct 2023 14:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17091



On 10/11/2023 7:44 AM, Lisandro Damian Nicanor Perez Meyer wrote:
> Hi!
> 
> In https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp?id=4dcc70a8778e9fe53ca43bda22b144edcf1dd7c8
> Denys set:
> 
> TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
> 
> Now it is customary that the deploy directory ends up in
> ${TOPDIR}/tmp/, so probably that should have been:
> 
> TI_COMMON_DEPLOY ?= "${TMPDIR}/deploy-ti"
> 
> Regards, Lisandro.

As part of our meta-arago layer we added support for creating the 
secondary toolchain SDK.  This also created the addition of a second tmp 
directory for the baremetal tools.  The issue came down to needing to 
create a single deploy directory for all of the things produced by our 
builds.

You can read more about it in the commit message you referenced above.


> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17090): https://lists.yoctoproject.org/g/meta-ti/message/17090
> Mute This Topic: https://lists.yoctoproject.org/mt/101895482/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

