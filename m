Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A49EED618
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 16:17:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.25154.1694794636923539481
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 09:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L6lTHg+A;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38FGHCAv126772;
	Fri, 15 Sep 2023 11:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694794632;
	bh=wEP+ZOFKOCDmBxxRTm/oEfx9KklNv0g9QI3wdqO5QoE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L6lTHg+A6ZIK/UZWJRifKxnr9gKaI596Ac8CAVl/wzXn9yRjzGkgxeC0lbW3weDBZ
	 vKrJAHwweV5eTvkH3J/9pjkavKwvqLqGmNa8DAKRweoXvsRnKMG3gEcZg4kJjACDNa
	 fAh5EZORLkaP/nRga/rQZEvXj4XmanfwLKvAYPEs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38FGHCQE045193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Sep 2023 11:17:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Sep 2023 11:17:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Sep 2023 11:17:11 -0500
Received: from [10.247.18.57] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38FGHBJa016452;
	Fri, 15 Sep 2023 11:17:11 -0500
Message-ID: <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
Date: Fri, 15 Sep 2023 11:17:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Content-Language: en-US
To: "Balagopalakrishnan, Anand" <anandb@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Pothukuchi, Vijay" <vijayp@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org> <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 16:17:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16987



On 9/14/2023 8:47 PM, Balagopalakrishnan, Anand wrote:
> Hi Denys,
> 
> This is only needed for v7 platforms like AM3 / AM4 and possibly AM57x also. CONFIG_PREEMPT is enabled by default on arm64 platforms like AM65x.
> 
> Praneeth will send a kernel patch for TI kernel. This meta-ti patch is meant to unblock anyone who wants to enable SGX drive in the meanwhile.


This patch can be abandoned .
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.1.y-cicd&id=e025e31126fff01ded59d901af916abe87646ca6 
enables CONFIG_PREEMPT


> 
> Regards,
> Anand
> 
> -----Original Message-----
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Friday, September 15, 2023 1:25 AM
> To: Balagopalakrishnan, Anand <anandb@ti.com>
> Cc: meta-ti@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Gupta, Gyan <g-gupta@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Pothukuchi, Vijay <vijayp@ti.com>; Bajjuri, Praneeth <praneeth@ti.com>
> Subject: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add config preempt for am335x and am437x
> 
> On Thu, Sep 14, 2023 at 03:36:18PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Sep 14, 2023 at 10:40:26PM +0530, Anand Balagopalakrishnan via lists.yoctoproject.org wrote:
>>> SGX needs a preemptible kernel. CONFIG_PREEMPT has always been
>>> enabled on TI Linux kernels upto K5.1.
>>>
>>> This is enabled on AM65x by default but missed out AM335x and AM437x.
>>> Add a kernel config fragment to enable config preempt.
>>
>> Hi, Anand,
>>
>> Is this only needed for am335x and am437x, as the subject suggests? If
>> so, why the code adds the config fragment to all platforms?
>>
>> Second question - historically this has been enabled in the TI kernel itself.
>> Why not do it like that again, why add the fragment to the OE metadata
>> instead of keeping it in-tree? How the distro-agnostic approach would be handled?
>>
>>
>>> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
>>> ---
>>>   .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
>>>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
>>>   2 files changed, 13 insertions(+)
>>>   create mode 100644
>>> meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
>>>
>>> diff --git
>>> a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
>>> b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
>>> new file mode 100644
>>> index 00000000..c1e5ad7d
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.
>>> +++ cfg
>>
>> This is not the right location for the file. You want to add to the
>> linux-ti-staging-rt-6.1/ directory, since you are only using it from
>> the corresponding linux-ti-staging_6.1.bb recipe.
> 
> Sorry, typo here - linux-ti-staging-6.1/ directory, if it's not RT-specific.
> 
>>
>>> @@ -0,0 +1,12 @@
>>> +CONFIG_PREEMPT_BUILD=y
>>> +# CONFIG_PREEMPT_NONE is not set
>>> +CONFIG_PREEMPT=y
>>> +CONFIG_PREEMPT_COUNT=y
>>> +CONFIG_PREEMPTION=y
>>> +CONFIG_PREEMPT_RCU=y
>>> +CONFIG_TASKS_RCU_GENERIC=y
>>> +CONFIG_TASKS_RCU=y
>>> +CONFIG_UNINLINE_SPIN_UNLOCK=y
>>> +# CONFIG_CEC_GPIO is not set
>>> +CONFIG_DEBUG_PREEMPT=y
>>> +# CONFIG_PREEMPT_TRACER is not set
>>> diff --git
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>>> index 8a883878..0ee63358 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>>> @@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
>>>   
>>>   KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>>>   KERNEL_GIT_PROTOCOL = "https"
>>> +KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/config-preempt.cfg"
>>
>> Since this file is out-of-tree and in the OE metadata, it would also
>> require listing it in SRC_URI.
>>
>>
>>>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>>>               file://defconfig"
>>>   
>>> --
>>> 2.34.1

