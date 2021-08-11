Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12617.1628710770487308013
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 12:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xkjc3HmM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17BJdPj5109280;
	Wed, 11 Aug 2021 14:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628710765;
	bh=vfvBNCdRnsT/a2WSH9axxysQRJ+6dm330NBpDK5AEp8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=xkjc3HmMUJ0hhoek9gvFeJdK9aPAQswdxZXoI0U5efhcw22GS5vB+1WkPAtHVdsmB
	 5f5Oi6PkIGrBinoBco+1t0LXRkqt4hLaU/QR9LkmQhW9cLePLiL5YSPz/T1bo2aU89
	 EPmHo4d1ng2iMuO52d9K2ht7WqOlg83qzE5GjrOc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17BJdP2m122856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Aug 2021 14:39:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 11
 Aug 2021 14:39:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 11 Aug 2021 14:39:24 -0500
Received: from [10.250.229.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17BJdLsC095772;
	Wed, 11 Aug 2021 14:39:22 -0500
Subject: Re: [meta-ti] [master][PATCH v3] meta-ti: convert to new override syntax in honister
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <1628637446-35725-1-git-send-email-denis@denix.org>
 <287ae2ec-e682-a561-fd29-00bae48d2ff1@ti.com>
 <20210811174831.GT1528@denix.org>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <479dce64-5f4f-0d98-85de-508148f32b5b@ti.com>
Date: Thu, 12 Aug 2021 01:09:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811174831.GT1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/08/21 11:18 pm, Denys Dmytriyenko wrote:
> On Wed, Aug 11, 2021 at 09:28:52PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
>>
>> Denys,
>>
>> On 11/08/21 4:47 am, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Upcoming "honister" release changes the override syntax to improve usability,
>>> speed and memory footprint. Update recipes with the new syntax and set layer
>>> compatibility to honister.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> Tested-by: Paul Barker <paul.barker@sancloud.com>
>>> ---
>>> v3:
>>> makefile_armv7 is a false-positive and shouldn't be converted
>>> pick up Paul's Tested-by: from v2
>>
>> To do all the override changes without any human errors,
>> is there a tool/script that you used? OR was it done manually?
>> Please share how this can be done for other layers as well.
> 
> Nikhil,
> 
> There's a generic script in OE-Core under scripts/contrib/convert-overrides.py
> that does a bunch of regexps on a layer:
> https://git.openembedded.org/openembedded-core/tree/scripts/contrib/convert-overrides.py
> 
> It is best suited for OE-Core, of course, as each layer usually brings tons of
> own overrides, especially BSP and Distro layers. So the script needs to be
> adjusted to each layer individually, but is a good start. And it usually takes
> several iterations and lots of reviews to get it almost right...
> 
> BTW, I'll be converting meta-arago next, but meta-ti is a high priority now
> and needs to be merged ASAP, as bitbake from master will refuse to parse most
> of the old override syntax.
> 

Thanks for this. I will plan for migration of meta-processor-sdk using this

Regards,
Nikhil D
