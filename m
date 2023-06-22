Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403F6EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 20:57:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.22648.1687467434128773210
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 13:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u9d2q0TT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MKvDHa123874
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687467433;
	bh=YlHcUTKmvrSAbGaexH1IgO2M+vbcg3LVWKEtg2Th8tA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=u9d2q0TTqZYU+AvEKG32I/MOn1jEedr8T+wkRmc18WJT7Z+vN6iA34RfK+0yzaWZi
	 FYXtay4rdGnydbH5zuYMo9LcVrfGUWfWD10Ex6tbLsyohWyEafoOYEPSoIOrzhzpp0
	 L4QhAevMkCLZbHXouYp1qMyrBfF/NByP2M0lg8Z8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MKvDeO050639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:57:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 15:57:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 15:57:12 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MKvCll110190
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:57:12 -0500
Message-ID: <0e9fb4ca-e3b9-92a8-a556-9e779e2f27f4@ti.com>
Date: Thu, 22 Jun 2023 15:57:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH]
 ti-img-rogue-umlibs: fix yocto package cache issue
Content-Language: en-US, en-US-large
To: <meta-ti@lists.yoctoproject.org>
References: <176B14D1E642206C.16817@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176B14D1E642206C.16817@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 20:57:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16779

On 6/22/23 15:22, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> There's a weird issue with Yocto's caching system (though it may be
> intentional behavior). Changing the package config won't always update
> the package contents when you are directly modifying the recipe's deploy
> directory if there is a cached build.
> 
> Oddly enough, if you edit the source directory before do_install touches
> the deploy directory, it seems to correctly reevaluate the cache.
> 
> Fixes:
> 1705f6d3 (ti-img-rogue-umlibs: make all components optional, 2023-06-21)
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Ugh. Disregard this. Apparently it's a one-off issue I found. I can't 
reproduce it anymore.

