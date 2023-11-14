Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A361EC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 17:37:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1083.1699983422952441116
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 09:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BtUmEJNi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AEHaZSr019040;
	Tue, 14 Nov 2023 11:36:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699983395;
	bh=F3eB0hl9czs8mDxwx0akY0tVbvpdg6OfnQarXIfunhY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BtUmEJNitBXdGk5cfQY6kOMGDB84lhj4pEO7B6CKX2GDY4qGAPPcfzqK3Fyx5+elS
	 OYZTKaPJrBwZq1Y2cNXwqdtVE7WYVFsoBT1/ANto6Gi2IBBb+MZCc0QbAxjTx1Oj3c
	 iT5gYZUPPAhhhwQJYo8+CXR3kFbt3EPKdfALu7r8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AEHaZoA054339
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Nov 2023 11:36:35 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 14
 Nov 2023 11:36:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 14 Nov 2023 11:36:35 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AEHaZfq031047;
	Tue, 14 Nov 2023 11:36:35 -0600
Message-ID: <62161039-d848-4e58-a829-b866689754df@ti.com>
Date: Tue, 14 Nov 2023 11:36:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone] regression with rogue gpu
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>, Randolph Sapp <rs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Max Krummenacher <max.oss.09@gmail.com>, <max.krummenacher@toradex.com>,
        Nishanth Menon <nm@ti.com>
References: <20231023161538.1798206-1-max.oss.09@gmail.com>
 <ZVOdgoK/6uaA76cH@francesco-nb.int.toradex.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ZVOdgoK/6uaA76cH@francesco-nb.int.toradex.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Nov 2023 17:37:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17297



On 11/14/2023 10:17 AM, Francesco Dolcini wrote:
> Hello Randolph,
> 
> On Mon, Oct 23, 2023 at 01:15:38PM -0300, Max Krummenacher wrote:
>> On our weekly CI build we see glmark segfaulting on our AM625 based SoM.
>>
>> Reverting commit 9b6bce2c ("mesa-pvr: bump srcrev for sgx support") on
>> top of meta-ti @ 59edb4e8 ("linux-ti-staging_6.1: CI/CD Auto-Merger: cicd.kirkstone.202310191725")
>> fixes the segfault and glmark shows similar performance as before.
>>
>> It looks like the addition of the SGX GPU introduced a regression with
>> the Rogue GPU.
> 
> any feedback on this report? We would need to update meta-ti to get a
> fix on the DM firmware, however we are blocked because of this
> regression on the GPU.
> 
> Can you help figure out what's going on? Is there any dependency on the
> Linux kernel from your downstream branch we need to cherry-pick? Is this
> working on TI SK AM62?

I believe that this issue was fixed by this commit:

https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=kirkstone&id=00de85a06e252fa17ce004635ba30d055166aa5d

This is on the main kirkstone branch.  Please test it to make sure it 
does fix the issue.



> Thanks for your support,
> Francesco
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

