Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E2BC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:39:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6085.1648557562821674251
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=coaYsXSw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdIYj101318;
	Tue, 29 Mar 2022 07:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557558;
	bh=fFCRcddKO/Qcc3BYU38rewMtIqxmeou5RZQtJw0TM3A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=coaYsXSwoyPjnENTkNFaEvsjaVXJLjTgjr+G+OSp5j5A7Vau9IqoXiPoHSummN+Bd
	 swt9Jq5PrPmjx9SB1iyO4t9ZwQE+H/ZOSXgs21o6adN7nmqvs05QSQ+oJSSnl9t55s
	 4iws8JF8BErbrTulXmMjag53yOaBhMtbuX4/L9RY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCdIC4008107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:39:18 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:39:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:39:18 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCdIZQ051846;
	Tue, 29 Mar 2022 07:39:18 -0500
Message-ID: <78eef027-a41c-a39b-39d9-066280bb1b75@ti.com>
Date: Tue, 29 Mar 2022 07:39:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][master][PATCH 2/4] meta-ti-bsp: add SoC families for
 the J7 SoCs
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325184151.16940-2-afd@ti.com> <20220329045016.GO23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329045016.GO23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14574



On 3/28/2022 11:50 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:41:49PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> This allows us to be more specific around what SoCs we support and
>> lets us add features based on the SoC family not just at the EVM or
>> whole J7family level.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Appled patch to master.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

