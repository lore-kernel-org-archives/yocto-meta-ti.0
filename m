Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523CBC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:39:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6094.1648557583945116806
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HdPYlUpw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdfP9031275;
	Tue, 29 Mar 2022 07:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557581;
	bh=H3FkrAAiuZ0ndQNkYDlSuXJEwtYRUA/dxPl2KojXi8I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HdPYlUpwLNtUDultF7dFFwVm8LdyTjsQW4eGnZE4mRcpFNPt4rqsWJQY16ILzNEZ9
	 JJbd0jxgD3swFSkJo8gCSG+HqKaz63WRYcRbkVvd74uKzybVO7vVVe/cqyHJQ1oux7
	 DW/ZeSEnwsWo+s87nj/2r1qa0PnGL2/ccTjHomuY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCdfPI044559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:39:41 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:39:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:39:41 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdfOM052346;
	Tue, 29 Mar 2022 07:39:41 -0500
Message-ID: <8c7cb757-e0a5-4506-3c3b-f7c6385bfb7e@ti.com>
Date: Tue, 29 Mar 2022 07:39:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][master][PATCH 3/4] ti-img-rogue-umlibs: only the j721e
 SoC is currently supported
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325184151.16940-3-afd@ti.com> <20220329045034.GP23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329045034.GP23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:39:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14576



On 3/28/2022 11:50 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:41:50PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> There are now three SoCs in the J7 family, but only the j721e variant
>> is currently supported. Be specific here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Appled patch to master.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

