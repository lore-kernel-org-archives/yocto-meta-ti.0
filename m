Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF11C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:46:29 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.15453.1664912787976329031
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hMJzLaHO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 294JkPTx019463;
	Tue, 4 Oct 2022 14:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664912785;
	bh=SZXaSVQRYxfpj3TvmhxDZol+UEo650XQ98YodkEKooI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hMJzLaHOYOHFWIUBjzfbPgb/3K9DwnplfNjIGBrkQTajgoGu4/+uFLpTAEmIWRZg7
	 rvUpD/Sn4SAKjSRs9ETWnX0GxQnJrjgfMbJzMIqP3GTmpqYEvyv8c9j/YweeSuewmC
	 rrh0SifJmQJWj1m7W9WPAGuFT98LtHLGJUEHeSIo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 294JkPMk115189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Oct 2022 14:46:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 4 Oct
 2022 14:46:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 4 Oct 2022 14:46:25 -0500
Received: from [10.250.32.190] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 294JkOQ9008417;
	Tue, 4 Oct 2022 14:46:25 -0500
Message-ID: <56965ade-a93e-edf8-a40d-77d104c88221@ti.com>
Date: Tue, 4 Oct 2022 14:46:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH 61/65] conf: machine: Make
 multi-certificate image the default
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20220913035541.2364351-1-denis@denix.org>
 <20220913035541.2364351-62-denis@denix.org>
 <91d1794f-ed22-7f0f-ad4a-b33ba93500f9@ti.com>
 <20221004194238.GZ18429@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221004194238.GZ18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15107

On 10/4/22 2:42 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 04, 2022 at 02:38:11PM -0500, Andrew Davis wrote:
>> On 9/12/22 10:55 PM, Denys Dmytriyenko wrote:
>>> From: Andrew Davis <afd@ti.com>
>>>
>>> Only the first two K3 devices do not support multi-cert boot so
>>> lets make multi-cert the default and only add back sysfw.itb
>>> for these two devices.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> Reviewed-by: lines be preserved?
>>
>> By who?..
> 
> That's how the original patch got merged :)
> 
> https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=038148a6d018c971e15a89c80192179fc04cf170
> 
> I'm guessing patchwork picked up part of our discussion.
> 
> https://patchwork.yoctoproject.org/project/ti/patch/20220801214007.25463-1-afd@ti.com/
> 

Ah, yup there it is :)

Also looks like this forward port dropped the removal of some lines in
j7.inc, but at this point I'll just clean that up after, this has been
in -next long enough and should just go in already..

Andrew

> 
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> 

