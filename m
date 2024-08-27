Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F52C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 22:08:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.216.1724796509760003106
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hmyc2poY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RM8Ppp044752;
	Tue, 27 Aug 2024 17:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724796505;
	bh=MZV8CvrPe4cjlqBCbArJpfFQkZF5EXriWngtFNGK66g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hmyc2poYEf+pB6hL183k+0yQ22rnFSsedXVllkAm8LCaL84N3Ik+lwO/CYyeSP5cc
	 x2nfPwy+gWt/Nb4D1z+Ewt8LPEi5WEV4bMVkKWKrM7S0PDvUytPpNxym1QXj5S1ulO
	 +pKwcCpiAPWjKkPwJJKkrCPewcTv2fnKTurcwb14=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RM8PeW019163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 17:08:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 17:08:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 17:08:25 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RM8PBr062834;
	Tue, 27 Aug 2024 17:08:25 -0500
Message-ID: <eb7c1cd4-a25b-4073-a21f-c69505794465@ti.com>
Date: Tue, 27 Aug 2024 17:08:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a: Update
 to v2.11 release tag
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240816185307.15808-1-reatmon@ti.com>
 <20240827193849.GC17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240827193849.GC17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Aug 2024 22:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17954



On 8/27/2024 2:38 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 16, 2024 at 01:53:07PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Kamlesh Gurudasani <kamlesh@ti.com>
>>
>> Update to latest release tag, i.e. v2.11.
>>
>> Also update the LIC_FILES_CHKSUM since the license file changed since
>> the last SRCREV change.
> 
> Changed in what way? It is recommended to briefly describe license changes in
> the commit log - it forces one to review the changes to ensure there are no
> license incompatibilities or even in the worst case complete re-licensing of
> the product.

The license file for that project is a little goofy.  It has a big 
overall license, but then breaks out some specific features/blocks of 
code and lists additional license for those sections.  And that's what 
they changed.  They added some new items to that list.

I thought about pushing back on the project and using the begins/ends 
concept to selectively extract the main license, but then I thought 
about it realized that was not a good idea.

I'm open to suggestions about how to word a commit to handle this kind 
of thing in the future.

Here is the license file:

https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/refs/tags/v2.11/docs/license.rst

And here is the change that impacts this patch:

https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/584052c7f80b406666b9597447eeccef4d6deca4%5E%21/docs/license.rst


> In this case the changes were not too bad, but apparently the list of licenses
> did change - see this discussion:
> 
> https://lists.yoctoproject.org/g/meta-arm/topic/106488067#msg6004
> 
> 
>> Commit:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5173f74c0458736ec526276106097e
>>
>> Tag:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v2.11
>>
>> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
>> Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> index 291259c0..157bdbc5 100644
>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>> @@ -1,5 +1,6 @@
>> -PV:k3 = "2.10+git"
>> -SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
>> +PV:k3 = "2.11+git"
>> +SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
>> +LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
>>   SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>>   COMPATIBLE_MACHINE:k3 = "k3"
>>   TFA_BUILD_TARGET:k3 = "all"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

