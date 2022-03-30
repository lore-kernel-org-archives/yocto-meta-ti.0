Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB9DC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 13:46:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7413.1648647971656775636
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 06:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rz+5lU3Q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UDk5ig034769;
	Wed, 30 Mar 2022 08:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648647965;
	bh=NvhLCWxnsxHuNrzJt+5KnRYp1JZsNd+8Bl2m9/6G5C0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=rz+5lU3Q+wBg22QxAGl2heZ1o27ufV1TKcAf17XqsZEzdZre4s4hmFu60CnLX33nA
	 RR8qC18T06zKNpoSov3lVU0aaDC5+nvoPZhglhmjlUTxaDG111YqzqKOycJWkKSike
	 CSkq9JUXHLZJ+gW951RFTt5lhtGvNcmyB2uPh8Yc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UDk5VA075262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Mar 2022 08:46:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 08:46:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 08:46:05 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UDk5ne018984;
	Wed, 30 Mar 2022 08:46:05 -0500
Message-ID: <994002bd-a60c-bcf7-6bef-2c5b91b04b3a@ti.com>
Date: Wed, 30 Mar 2022 08:46:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti] [master][PATCH v2] ti-cgt-pru: Update to version 2.3.3
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
        <meta-ti@lists.yoctoproject.org>
References: <cdfe0adb-7e51-27b0-2193-8d9f4e2aaf5d@ti.com>
 <20220330130856.10404-1-alessio.bogani@elettra.eu>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220330130856.10404-1-alessio.bogani@elettra.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 13:46:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14586



On 3/30/2022 8:08 AM, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu > ---
>   .../devtools/{ti-cgt-pru_2.3.2.bb => ti-cgt-pru_2.3.3.bb} | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-ti-extras/recipes-ti/devtools/{ti-cgt-pru_2.3.2.bb => ti-cgt-pru_2.3.3.bb} (82%)


Applied patch to master.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

