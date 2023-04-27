Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFEFC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 23:58:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8012.1682639916252797547
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 16:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l9xCM82v;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RNwXHM015715;
	Thu, 27 Apr 2023 18:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682639913;
	bh=/3eNwmdHahmoGCDE+cvukx4895xXw489NeLgRi9hznk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l9xCM82vfDsFhRD9utPsqNlO4epEe0DP7QQY2sT0l1q8Rs6+qIcB0ef/f/0sGU7Ul
	 35Tp3mX6xoHwKxmlSYv/t2OtHgGNojpEZsLxzMav4b3WJ1NEQBpjJN+JgXNsAUIWk9
	 zBDGi0cKuClTvPkAn2gxpBL6hE+EEfITskBdAOPc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RNwXMr075524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 18:58:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 18:58:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 18:58:32 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RNwWo9020187;
	Thu, 27 Apr 2023 18:58:32 -0500
Message-ID: <f6e872f1-982f-6d3a-9554-1385b08b77e7@ti.com>
Date: Thu, 27 Apr 2023 18:58:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-ti][kirkstone][PATCHv2 0/4] Enable vulkan
 proper
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230427210746.1915362-1-rs@ti.com>
 <20230427215039.GQ9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230427215039.GQ9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 23:58:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16452

On 4/27/23 16:50, Denys Dmytriyenko wrote:
> On Thu, Apr 27, 2023 at 04:07:42PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Properly enable Vulkan with all WSI extensions enabled. Attempt some
>> light packaging changes to the graphics umlibs recipe so we can decrease
>> the number of check we have to skip, and the checks become a little more
>> targeted.
>>
>> This version uses a cairo append that conditionally tweaks PACKAGECONFIG
>> flags based on the GPU driver that is selected. We're using this driver
>> flag instead of a machine feature because the open source driver will
>> add a whole new set of preferred configs that will be optimized later.
> 
> LGTM. Is it kirkstone-specific? Any plans for master?

Actually, disregard that last response. It'll apply cleanly to master if 
you also cherry-pick the following patches from kirkstone:
c994d48021664d328ced52829542a3b1b86c4e02
2cc7895ebfea1df4afc2229f9762f129946b0b06
b86fb13fb9638635bf957156833bccc10ddf5393

I must have incorrectly assumed those wouldn't apply to master when I 
submitted them originally. My bad, they apply fine.

> 
>> Randolph Sapp (4):
>>    ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
>>    pvr-mesa: add new vulkan configuration options and wsi
>>    cairo: resolve opengl version
>>    ti-img-rogue-umlibs: package firmware separately
>>
>>   .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
>>   .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
>>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
>>   .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
>>   4 files changed, 37 insertions(+), 8 deletions(-)
>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc


