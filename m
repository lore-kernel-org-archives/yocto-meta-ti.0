Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4559.1604008429081250764
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 14:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gDqQF+lI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TLrlwm010268;
	Thu, 29 Oct 2020 16:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604008427;
	bh=/7O0p5HQq07u4w8ULEIu1SfhTVnyqsiEeb2aoGcWzOU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=gDqQF+lIdCrbSKwChK+G80N2lOuN2vN2TZQbPBj5j6xg2dEGjK2LsYZ/XZOD8zk1G
	 uIuhFuwwq1/21QzaQpTDQZye66HU5Ltiv8/WDgvvYCaBd8v6gYm2U4ygeUAC95+S+G
	 N5ukKz3NPjm6qlSfzC8MzCIuSC5IRHJoFUeCgQzY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TLrlJj117668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 16:53:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 16:53:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 16:53:47 -0500
Received: from [10.250.64.251] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TLrkTh130675;
	Thu, 29 Oct 2020 16:53:46 -0500
Subject: Re: [meta-ti] [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201025065934.3308920-2-raj.khem@gmail.com>
 <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
 <CAMKF1so1wH-hQQQ1L3E6dAFLEAxdXkbDjpd9xRzt3tjjdDqPrg@mail.gmail.com>
 <1641B95DDCF93CD1.11545@lists.yoctoproject.org>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <901c3d55-d2a0-81d2-e01e-865d1fa2e2bb@ti.com>
Date: Thu, 29 Oct 2020 16:53:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1641B95DDCF93CD1.11545@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/26/20 9:45 PM, Suman Anna via lists.yoctoproject.org wrote:
> On 10/26/20 9:30 PM, Khem Raj wrote:
>> On Mon, Oct 26, 2020 at 7:19 PM Suman Anna <s-anna@ti.com> wrote:
>>>
>>> Hi Raj,
>>>
>>> On 10/25/20 1:59 AM, Khem Raj wrote:
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
>>>> index b41e68eb..d08031cb 100644
>>>> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
>>>> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
>>>> @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>>>>  PV = "0.1.0+git${SRCPV}"
>>>>
>>>>  S = "${WORKDIR}/git"
>>>> +
>>>> +COMPATIBLE_HOST ?= "null"
>>>> +COMPATIBLE_HOST_ti-soc = "(.*)"
>>>>
>>>
>>> This looks ok, but I am trying to understand why this is needed in general (am
>>> still getting familiar with OE). Aren't the recipes processed only on
>>> packagegroups that include them?
>>
>> on image builds yes. however in yoe distro CI builds we test multi-BSP
>> setups and do world builds which catch
>> such issues, where BSP layers are exposing general packages which are
>> not compatible with other BSPs.
> 
> Thanks for the clarification!

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman
