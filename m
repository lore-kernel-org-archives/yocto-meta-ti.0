Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D900C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 20:47:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.169858.1680814060418166117
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 13:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NRQdy5Eq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336KldNo021762;
	Thu, 6 Apr 2023 15:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680814059;
	bh=vnEbxiUjWLRFiTbNeHRF0F++fVmJ8Fo2GmGz4Lff71w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NRQdy5EqNk9kcu60Bc6K+3Xl5hiUJ2ct1b+xVRAmNj0WOAZF1UZjG0Bh4myzcH1xW
	 tjeLxER1D1jg1Gs1VpLAz2V2hcfuzYsr9N86i0P1UFY3e/wtZ832zngGZVCkI/JUFv
	 JrboFbD5vcVBwNy5D27Sf7zTwnGX6usjw6ys/UhI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336KldDv111836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 15:47:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 15:47:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 15:47:38 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336Klcsh126297;
	Thu, 6 Apr 2023 15:47:38 -0500
Message-ID: <a13070a9-c2fd-20ae-b57f-024452b01472@ti.com>
Date: Thu, 6 Apr 2023 15:47:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 5/5] meta-ti-bsp: graphics:
 Correct dependency chain
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230406192847.7934-1-afd@ti.com>
 <20230406192847.7934-5-afd@ti.com>
 <d8c7efd9-900a-152e-aab8-cd123ac96681@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d8c7efd9-900a-152e-aab8-cd123ac96681@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 20:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16311

On 4/6/23 3:28 PM, Randolph Sapp wrote:
> On 4/6/23 14:28, Andrew Davis wrote:
>> Previously the virtual/gpudriver provider would point to the kernel-mode
>> driver, which would cause Mesa libraries to depend on those and not the
>> user-mode driver. It is the user-mode driver that should depend on the
>> kernel-mode driver, not the other way around. The logical dependency
>> chain should be:
>>
>> App -> virtual/libgl -> Mesa -> virtual/gpudriver -> IMG-UM -> IMG-KM
> 
> We already talked about this so I'm fine with it.
> 
>>
>> Flip the dependency chain so it matches the above. While here make
>> the UM driver depend on, not just recommend, the KM driver as it is
>> not functional with out it.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> ...
> 
>> -RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
>> +RDEPENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> 
> I have issues with making this a full dependency here. We're adding the PVR components to mesa, software rendering is still there as a fallback. If someone wishes to remove the powervr umlibs with OPKG having this as a hard dependency will break a lot of things.

Not sure I'd agree that is what "depends" and "recommends" means for
a version of Mesa specifically built to use SGX/RGX hardware accel..

For now I'll drop this part of the patch for v2, at least until we
can sync on this.

Andrew

