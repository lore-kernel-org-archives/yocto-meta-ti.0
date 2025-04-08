Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4AFC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:41:30 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.75508.1744119684579070370
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 06:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jqzY7Fct;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538DfKB41224290
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 08:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744119680;
	bh=/gtYjsZhczExifbSSsGNmfxoNNGJSLJUoT2zdGUjaUg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jqzY7Fct9I7SnrlvLqWOE7HI/8sPvJ4bQGkQpeIWpK78MZp9YL/DWwDpBAFc99Cny
	 qTKzzwwooQUXPKBKlcxmHB588Gw4FFbgRTQI0vtVW3WRgXIsPJfg+p8bn6ooSxicAO
	 Z2VoqLjYg9QJWqjY79dc24VlSRWDweejUgfKTyTs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538DfK7m113344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 08:41:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 08:41:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 08:41:20 -0500
Received: from [10.249.32.251] ([10.249.32.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538DfKnt099973;
	Tue, 8 Apr 2025 08:41:20 -0500
Message-ID: <a07bcf18-88a2-4eb4-b1f6-d0bad9fcf96f@ti.com>
Date: Tue, 8 Apr 2025 08:41:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] optee-client: remove patch that got
 accepted upstream
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250408030807.1978102-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250408030807.1978102-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Apr 2025 13:41:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18449


I was unsure about doing this...

meta-arm added a second optee recipe version.  So both exist:
optee-client_4.3.0.bb
optee-client_4.4.0.bb

So "theoretically" the build should prefer the newer version, right?

But for some reason, our builds keep loading the 4.3.0 recipe and then 
our bbappend bumps the version to 4.4.0.  The 4.3.0 recipe has this 
offending patch, but the 4.4.0 version does not.

I've been trying to figure out why our builds keep locking into 4.3.0 
when the 4.4.0 is sitting right there...

I agree that this patch is a good work around, but I'm not 100% sure 
it's the final best fix.




On 4/7/2025 10:08 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> meta-arm adds a patch that was sent and accepted upstream, remove
> it since mta-ti pulls a more recent verstion.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 2c8977dd..a628e446 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,6 @@
>   PV = "4.4.0+git"
>   SRCREV = "d221676a58b305bddbf97db00395205b3038de8e"
> +
> +SRC_URI:remove = " \
> +    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch \
> +"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18447): https://lists.yoctoproject.org/g/meta-ti/message/18447
> Mute This Topic: https://lists.yoctoproject.org/mt/112146993/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

