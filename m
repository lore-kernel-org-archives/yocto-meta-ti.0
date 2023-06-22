Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C820EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 20:24:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.21928.1687465461848674997
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 13:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a1OpIpIN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MKOK7t124891
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687465460;
	bh=pSGhP4QMBqRZ6u3fdVSitcMhqyvxpVQs6hFbXpEtaBU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=a1OpIpINubiY9yy90n5iU4SoouEFnHQpWshs0te0ILGMVALWGx09B+Wk/C8yDanoT
	 5zqtVjjhM6leIp0qQOXgQkLFpfFxgZxnaZaH7LITHj2gWpzxst6UaVvl+IgcbQif3H
	 nbCL+9c00x3qzNmgYWFqM/CBu+bPYBcuUMZK90As=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MKOK8v031395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:24:20 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 15:24:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 15:24:20 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MKOKXv010179
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:24:20 -0500
Message-ID: <98e65c77-81e0-d368-d2ca-14a1c3fbaaa2@ti.com>
Date: Thu, 22 Jun 2023 15:24:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] Re: [meta-ti][master/kirkstone][PATCH]
 ti-img-rogue-umlibs: make all components optional
Content-Language: en-US, en-US-large
To: <meta-ti@lists.yoctoproject.org>
References: <176ABFE0C4405DCC.15842@lists.yoctoproject.org>
 <176B13F4DF238F78.20970@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176B13F4DF238F78.20970@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 20:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16778

On 6/22/23 15:07, Randolph Sapp via lists.yoctoproject.org wrote:
> On 6/21/23 13:26, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Bumping into the limitations of the binary_package class. This change
>> allows all rogue components to be optionally packaged without blowing
>> out the dependency chain.
>>
>> Add a python function to fetch file paths from the FILE vars for each
>> component so we don't end up double tracking files. Add variables to
>> track component packages if things split up more later. Add a package
>> config string to set runtime dependencies and recommendations. Change
>> all logic to revolve around the PACKAGECONFIG instead of distro
>> features.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
> 
> Wait, don't merge this. Just realized it introduces a weird issue with 
> Yocto's caching system. Changing the package config won't always update 
> the package contents when you are directly modifying the recipe's deploy 
> directory if there is a cached build.
> 
> Oddly enough, if you make it do_install:prepend and edit the source 
> directory it seems to correctly reevaluate the cache. Denys, any idea 
> why this is?
> 

Rats. It's already in next. Posted a patch.

