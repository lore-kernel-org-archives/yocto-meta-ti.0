Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4705.1618807870416590658
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 21:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q/TqAXhy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13J4p7dK020573;
	Sun, 18 Apr 2021 23:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618807867;
	bh=ML2gUan1Koeyz0lr7f09k3AXCsDtRkTwJKKX4msvhaM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Q/TqAXhyGnCSC3czZV91IUXInkjxVV3bY2kkPf8pzgC1dyBeDWXLUBQ/OkuU8R9XJ
	 zIw/DGbOEbEQNiD324qK7i+lw+rph7g4Thvgfia9oP5Zz+l4GrPbvOHT3zFhJ+XN86
	 AI1nuwCQLRWgSMTwyAfLK4LpXJl4GeMGgbHF+sKk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13J4p7L8092140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 18 Apr 2021 23:51:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 18
 Apr 2021 23:51:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 18 Apr 2021 23:51:07 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13J4p6kk053248;
	Sun, 18 Apr 2021 23:51:06 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210415051105.1626-1-praneeth@ti.com>
 <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
 <20210415182431.GU15937@denix.org>
 <3d8c8160-aadc-5442-a38a-b5ff8b60d57c@ti.com>
 <167621ADFB287AF6.32252@lists.yoctoproject.org>
 <20210416173537.GZ15937@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <46ee0999-a7ba-0417-754c-102d1ddcd437@ti.com>
Date: Sun, 18 Apr 2021 23:51:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210416173537.GZ15937@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/16/2021 12:35 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 15, 2021 at 04:22:20PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Apr 15, 2021 at 02:00:31PM -0500, Bajjuri, Praneeth wrote:
>>>
>>>
>>> On 4/15/2021 1:24 PM, Denys Dmytriyenko wrote:
>>>> On Thu, Apr 15, 2021 at 12:07:05PM -0500, praneeth via lists.yoctoproject.org wrote:
>>>>> Denys,
>>>>>
>>>>> On 4/15/2021 12:10 AM, praneeth@ti.com wrote:
>>>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>>>
>>>>>> The current ti-linux-5.10.y integration branch doesnt have support for
>>>>>> non base board dtb/o form the primary latest processor board on am65 and
>>>>>> j7* evms yet.
>>>>>>
>>>>>> Removing these dtb/o for enabling the builds to continue.
>>>>>> Plan to add these blob and overlays back once the equivalent support is
>>>>>> added in the integrated ti-linux-5.10.y kernel.
>>>>>>
>>>>>
>>>>> Need your recommendation if this is the right approach to enable the
>>>>> builds at this early stage of LTS migration (and re-enable the
>>>>> overlays once the support is added in kernel).
>>>>
>>>> That's kind of normal to start a new LTS with bare minimum of dtb/o support.
>>>>
>>>> But I have 2 concerns:
>>>>
>>>> 1. Maybe better to just push commit with removal, instead of reverting old
>>>> commits - it may get quite confusing soon with reverts of reverts...
>>>
>>> makes sense. will squash in v2.
>>>
>>>>
>>>> 2. Do you think it's still premature to make 5.10 as a default in meta-ti
>>>> dunfell branch? Since dunfell is kind of established stable (not a new LTS),
>>>> anyone who updates meta-ti will go from fully working 5.4 to a very minimal
>>>> and bare 5.10 - may be a bad user experience...
>>>
>>> Was thinking in similar line.
>>> So, till the 5.10 baseline matures i will continue to use
>>> dunfell-next to stage the patches and keep dunfell branch untouched
>>> w.r.t merging 5.10 specific changes.
> 
> Another approach could be to keep using core-next branding for a bit longer,
> leaving 5.4 as a default, until 5.10 is ready.

the final SDK release with 5.4 on dunfell has already been made so not 
aware of anyone using this combination for active development now.

and 5.10 needs to be getting to a better shape soon.
Thinking, it makes sense to switch to 5.10 and start addressing the 
regressions as we progress with development.

> 
> 
>>> Let me know if this a good approach, The only problem in that case
>>> is the graphics update for 5.10 that i recently pulled to dunfell
>>> branch. Need to revert it to keep 5.4 dunfell experience retained.
>>
>> Try those updates first with 5.4 before reverting them, mayve they'll work.
>>
>>
>>> Any other ideas?
>>>
>>>>
>>>>
>>>>>> Praneeth Bajjuri (6):
>>>>>>    Revert "conf: j7-evm: Add jailhouse dtbo"
>>>>>>    Revert "j7-evm: add new k3-j721e-proc-board-tps65917.dtb"
>>>>>>    Revert "j7-evm: add new infotainment DTBO file"
>>>>>>    Revert "j7-evm: add k3-j721e-pcie-backplane.dtbo"
>>>>>>    Revert "conf: machine: j7200-evm: Add Jailhouse overlay"
>>>>>>    conf/machine: am65xx: Remove non-existent dtb* from 5.10
>>>>>>
>>>>>>   conf/machine/include/am65xx.inc | 11 -----------
>>>>>>   conf/machine/j7-evm.conf        |  4 ----
>>>>>>   conf/machine/j7200-evm.conf     |  1 -
>>>>>>   3 files changed, 16 deletions(-)
>>>>>>
>>>>
> 
