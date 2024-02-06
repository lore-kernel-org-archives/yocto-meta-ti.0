Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E37C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:20:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.24029.1707232855442168991
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uc90yaTr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 416FKpYs067333;
	Tue, 6 Feb 2024 09:20:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707232851;
	bh=UijFzLcD4EDAavHkfPjmYXX1po7Hg/kTHkzdOSOF/WU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uc90yaTrqgQ9Xie8vYNBKa5btYXmtaBQ7dhvmnrliNzy3ERzLEjt4n6Cwrqgi/EPM
	 MPC0XjQTuusJtyUXegNoFlUR4vDn838QtRLecyScDX44GmxE8UwFLrt7tHxRDNm2rp
	 nVeE1C9GiF6Qg1O9iLSdVs1WATCyEG6NlStgN/4o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 416FKp95027179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 09:20:51 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 09:20:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 09:20:51 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 416FKpeD078714;
	Tue, 6 Feb 2024 09:20:51 -0600
Message-ID: <29b7420f-1e20-42c6-8aea-dbfce5d548e5@ti.com>
Date: Tue, 6 Feb 2024 09:20:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] cairo: remove cairo append and include
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Res Sapp <res.sapp@gmail.com>
CC: <rs@ti.com>, <detheridge@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240206000254.2916314-1-rs@ti.com>
 <20240206002757.GD15614@denix.org>
 <4281236a-08b6-4d91-9855-21ba43fd3345@gmail.com>
 <20240206082328.GG15614@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240206082328.GG15614@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17450



On 2/6/2024 2:23 AM, Denys Dmytriyenko wrote:
> On Tue, Feb 06, 2024 at 12:18:04AM -0600, Res Sapp wrote:
>> On 2/5/24 18:27, Denys Dmytriyenko wrote:
>>> NAK
>>>
>>> On Mon, Feb 05, 2024 at 06:02:54PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Cairo versions >= 1.17.8 dropped all GL render backends entirely,
>>>> invalidating both the opengl and glesv2 PACKAGECONFIGS. As such this
>>>> override is no longer necessary.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>   meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
>>>>   meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
>>>>   2 files changed, 6 deletions(-)
>>>>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>>>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>>> deleted file mode 100644
>>>> index 459d8d09..00000000
>>>> --- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>>> +++ /dev/null
>>>> @@ -1 +0,0 @@
>>>> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
>>>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>>>> deleted file mode 100644
>>>> index b41f1a01..00000000
>>>> --- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>>>> +++ /dev/null
>>>> @@ -1,5 +0,0 @@
>>>> -# This is required since cairo expects the opengl distro feature to refer to
>>>> -# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
>>>> -
>>>> -PACKAGECONFIG:remove = "opengl"
>>>> -PACKAGECONFIG:append = " glesv2"
>>>> -- 
>>>> 2.43.0
>>
>> Alright, what's wrong with it? Oe-core is currently using cairo
>> 1.18, this append currently just introduces a warning. Are you
>> already carrying this in a private branch?
> 
> https://patchwork.yoctoproject.org/project/ti/patch/20240201173635.2591975-1-denis@denix.org/
> 
> Seems there's a bit of a backlog for master...

Yes.  The churn in oe-core and other repos lately is causing our master 
builds to take forever...  It's hard to find quiet time to test all of 
the patches.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

