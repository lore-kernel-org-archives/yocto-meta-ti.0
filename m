Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A90CD4939
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 00:31:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5511.1695256286633613755
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 17:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fAMgZihV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38L0VMdh092766;
	Wed, 20 Sep 2023 19:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695256282;
	bh=Zz92vzrAqMPU31H5ApcyNOO1VkqMaoIhVnCJUJGb31M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fAMgZihVRKZJU6rVDYQGmC1gxpTm6X0zWpz1A1WNwlLCZSPSbN83BXyHPD8EZBrru
	 lh5op1hMJjzJut8VgFgSshcSW8CqSVWI51MFCRVYlIZz6FhBhkSXBuPOPkQRF43sLt
	 mCE9Iay60WWfPzLRdvrb6CP9ej4lp9I3OAdF7Alc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38L0VMtb100616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Sep 2023 19:31:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Sep 2023 19:31:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Sep 2023 19:31:21 -0500
Received: from [10.247.18.57] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38L0VKtD105858;
	Wed, 20 Sep 2023 19:31:20 -0500
Message-ID: <f2798126-7540-8a94-4c1f-4387d0504124@ti.com>
Date: Wed, 20 Sep 2023 19:31:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: "Balagopalakrishnan, Anand" <anandb@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon,
 Ryan" <reatmon@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Gupta,
 Gyan" <g-gupta@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Pothukuchi,
 Vijay" <vijayp@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org> <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
 <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
 <20230915164245.GB7013@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230915164245.GB7013@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Sep 2023 00:31:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16999



On 9/15/2023 11:42 AM, Denys Dmytriyenko wrote:
> On Fri, Sep 15, 2023 at 11:17:11AM -0500, Bajjuri, Praneeth wrote:
>>
>>
>> On 9/14/2023 8:47 PM, Balagopalakrishnan, Anand wrote:
>>> Hi Denys,
>>>
>>> This is only needed for v7 platforms like AM3 / AM4 and possibly AM57x also. CONFIG_PREEMPT is enabled by default on arm64 platforms like AM65x.
>>>
>>> Praneeth will send a kernel patch for TI kernel. This meta-ti patch is meant to unblock anyone who wants to enable SGX drive in the meanwhile.
>>
>>
>> This patch can be abandoned .
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.1.y-cicd&id=e025e31126fff01ded59d901af916abe87646ca6
>> enables CONFIG_PREEMPT
> 
> Praneeth,
> 
> Slight offtopic, but I was wondering what are the rules now for changes like
> this modifying upstream multi_v7_defconfig directly, vs. going into one of the
> config fragments in kernel/configs/?

Sorry for the delayed reply.

As you can see here:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/arch/arm/configs/multi_v7_defconfig?h=ti-linux-6.1.y

we have recently added few more configurations.
I Plan to send all of these configurations to mainline
(Since these are drivers already in upstream and preference is to have 
the config as well)

Similar to plan for drivers that are upstream complete for v8 platforms thru
arch/arm64/configs/defconfig

The general direction for kernel/configs/* fragments is for placeholder 
prune configurations for faster builds and debug configurations and for 
certain configurations which are certain that cannot be in mainline 
default configuration yet.

Hope it clarifies.


> 

