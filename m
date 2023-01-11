Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A8BC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 19:37:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.34159.1673465864573521340
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 11:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XhbZZvQK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BJbfX1053909;
	Wed, 11 Jan 2023 13:37:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673465861;
	bh=vR3dz1kJtHX4AYRWzcfqXQ1w+gX3ZNylN/TBokEZi0M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XhbZZvQKl426HYyA0fI0xD7wH71TADBpB3bTJhm2iZLzpWgNQLrBIphJ/qMOjPX8z
	 r2yWnQP1+y7OUwIR1GyWt8GNB2KQFwdscsoGwVK2eWiUJr8ATfDy3X0knzqPQxtYx8
	 iG9vdfBIXWK2IfQtg3c1spI+xwUBGLW+gjKmTVEk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BJbeDv046699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 13:37:41 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 13:37:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 13:37:40 -0600
Received: from [10.250.34.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BJbb39003783;
	Wed, 11 Jan 2023 13:37:38 -0600
Message-ID: <022bd03e-be86-3fd9-d638-5dfdf08e3d5e@ti.com>
Date: Wed, 11 Jan 2023 13:37:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [EXTERNAL] Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics
 recipe overhaul
To: "Sapp, Randolph" <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com> <MY9NMR.KA5B9Y124SPL2@ti.com>
 <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com> <J3EWMR.6Q68HWA4M8303@ti.com>
 <20221219213235.GX22689@denix.org> <7Q29NR.T2R7VR8YUI2B2@ti.com>
 <20221222224746.GC22689@denix.org> <2OBKNR.ERO28SJCKO2E2@ti.com>
 <20230104230752.GO22689@denix.org> <7B6COR.0OP8M9KYKL9S3@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <7B6COR.0OP8M9KYKL9S3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 19:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15549

On 1/11/23 1:33 PM, Sapp, Randolph wrote:
> On Wed, Jan 4 2023 at 06:07:52 PM -0500, Denys Dmytriyenko <denis@denix.org> wrote:
>> Please list all the machine features you plan to add/rename/remove in
>> order to support all these use cases. Thanks.
> 
> On further inspection I believe adding these as distro features may be a better idea than machine features.
> 
> I believe the best course of action would be to re-evaluate all recipes that utilize the "gpu" machine feature and either switch it to use distro features and PACKAGECONFIGS (my gstreamer-plugins example should actually be removed as it is a pointless override).
> 
> Either x11 or wayland distro features should be enough to pull in software rendering toolkits and graphics frameworks like Qt so any overrides we had to prevent that should be dropped. That seems to be the way upstream intends that to work.
> 
> The rgx-gpu / sgx-gpu features will be added to switch mesa configs, pull in according kernel modules, and tweak other packages as necessary. There will need to be a preliminary check though to make sure sgx-gpu and rgx-gpu features aren't both included as currently these will clash.
> 

The SGX/RGX recipes have COMPATIBLE_MACHINE lists that do not have any device in both sets.
That should be a good enough check that both(or wrong one) are not selected.

Andrew

> Please feel free to correct me though. Unfortunately Yocto gives us too much freedom here.
> 
> Regards,
> Randolph Sapp
> 
> 

