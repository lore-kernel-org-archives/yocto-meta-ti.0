Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F794C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:39:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6090.1648557577959664897
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G94rb3fF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdYwj031249;
	Tue, 29 Mar 2022 07:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557574;
	bh=frayGCGw1ZPqvcYphbkZ7dwyX+V0EoHeeklvvAYp5mc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G94rb3fFkVTAJiPnPESbzBBTrgX8zbRTCuZ6ZoIkQs1toAwNH1BNXtcHm1/GbDafn
	 XAHfN1AYoxkpugzcs3/tsD5FSLoh8TRWSkX89MzDMbr1DQ7pVe9CrieqGrexMfY5wv
	 uYtZm1tFlVHHrj0Nzy+t2IzaqhEZ02I4JcWkshCQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCdYt5008120
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:39:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:39:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:39:34 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdYRx085707;
	Tue, 29 Mar 2022 07:39:34 -0500
Message-ID: <c12e24f5-2a97-3d6d-39af-88d517d1accc@ti.com>
Date: Tue, 29 Mar 2022 07:39:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][master][PATCH 4/4] ti-sgx-ddk-um: only the am65xx
 member of the k3 family is supported
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325184151.16940-4-afd@ti.com> <20220329045051.GQ23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329045051.GQ23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:39:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14575



On 3/28/2022 11:50 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:41:51PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> The AM65xx is the only member of the K3 family with an SGX GPU.
>> Be specific here to avoid confusion.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Appled patch to master.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

