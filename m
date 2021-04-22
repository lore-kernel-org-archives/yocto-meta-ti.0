Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1638.1619130504752142327
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 15:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nj57hMUS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13MMSJ5A044105;
	Thu, 22 Apr 2021 17:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619130500;
	bh=1WdKDkd0GtnAUwUFirsQHR+D8JkYYaOGY/TECkM4tQI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=nj57hMUSyQsa+wQEcrusXUTCTFCBpmGkHxp+lMnmfD14t46Rs1/gC1cLr7dViSZO+
	 ePoGtnVk8wB6tklfoiwarmDxRctPg69jZjbnSqDsSMNY6nLqSS7EoEP08T7xM/qI1r
	 unxRkCDVPE5Q/G3gnX6QN1Aab+7wfV3W3WsdHovM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13MMSJV3119481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 17:28:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 17:28:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Apr 2021 17:28:19 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13MMSJTA043301;
	Thu, 22 Apr 2021 17:28:19 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210415051105.1626-1-praneeth@ti.com>
 <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
 <20210415182431.GU15937@denix.org>
 <3d8c8160-aadc-5442-a38a-b5ff8b60d57c@ti.com>
 <167621ADFB287AF6.32252@lists.yoctoproject.org>
 <20210416173537.GZ15937@denix.org>
 <46ee0999-a7ba-0417-754c-102d1ddcd437@ti.com>
 <20210422204833.GW15937@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <eaa0f889-eede-969e-1635-40ff8c827ea2@ti.com>
Date: Thu, 22 Apr 2021 17:28:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422204833.GW15937@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 4/22/2021 3:48 PM, Denys Dmytriyenko wrote:
> Praneeth,
> 
> On Sun, Apr 18, 2021 at 11:51:06PM -0500, praneeth via lists.yoctoproject.org wrote:
>> On 4/16/2021 12:35 PM, Denys Dmytriyenko wrote:
>>> On Thu, Apr 15, 2021 at 04:22:20PM -0400, Denys Dmytriyenko wrote:
>>>> On Thu, Apr 15, 2021 at 02:00:31PM -0500, Bajjuri, Praneeth wrote:
>>>>> On 4/15/2021 1:24 PM, Denys Dmytriyenko wrote:
>>>>>> On Thu, Apr 15, 2021 at 12:07:05PM -0500, praneeth via lists.yoctoproject.org wrote:
>>>>>>> Denys,
>>>>>>>
>>>>>>> On 4/15/2021 12:10 AM, praneeth@ti.com wrote:
>>>>>>>> From: Praneeth Bajjuri <praneeth@ti.com>
>>>>>>>>
>>>>>>>> The current ti-linux-5.10.y integration branch doesnt have support for
>>>>>>>> non base board dtb/o form the primary latest processor board on am65 and
>>>>>>>> j7* evms yet.
>>>>>>>>
>>>>>>>> Removing these dtb/o for enabling the builds to continue.
>>>>>>>> Plan to add these blob and overlays back once the equivalent support is
>>>>>>>> added in the integrated ti-linux-5.10.y kernel.
>>>>>>>>
>>>>>>>
>>>>>>> Need your recommendation if this is the right approach to enable the
>>>>>>> builds at this early stage of LTS migration (and re-enable the
>>>>>>> overlays once the support is added in kernel).
>>>>>>
>>>>>> That's kind of normal to start a new LTS with bare minimum of dtb/o support.
>>>>>>
>>>>>> But I have 2 concerns:
>>>>>>
>>>>>> 1. Maybe better to just push commit with removal, instead of reverting old
>>>>>> commits - it may get quite confusing soon with reverts of reverts...
>>>>>
>>>>> makes sense. will squash in v2.
>>>>>
>>>>>>
>>>>>> 2. Do you think it's still premature to make 5.10 as a default in meta-ti
>>>>>> dunfell branch? Since dunfell is kind of established stable (not a new LTS),
>>>>>> anyone who updates meta-ti will go from fully working 5.4 to a very minimal
>>>>>> and bare 5.10 - may be a bad user experience...
>>>>>
>>>>> Was thinking in similar line.
>>>>> So, till the 5.10 baseline matures i will continue to use
>>>>> dunfell-next to stage the patches and keep dunfell branch untouched
>>>>> w.r.t merging 5.10 specific changes.
>>>
>>> Another approach could be to keep using core-next branding for a bit longer,
>>> leaving 5.4 as a default, until 5.10 is ready.
>>
>> the final SDK release with 5.4 on dunfell has already been made so
>> not aware of anyone using this combination for active development
>> now.
>>
>> and 5.10 needs to be getting to a better shape soon.
>> Thinking, it makes sense to switch to 5.10 and start addressing the
>> regressions as we progress with development.
> 
> I see dunfell has been merged with "empty" 5.10 which is the default.

Can you help here, didnot understand this "merged with "empty" 5.10 
which is the default"

> What happened to keeping this to dunfell-next for now? As you said above:
> 
> | So, till the 5.10 baseline matures i will continue to use
> | dunfell-next to stage the patches and keep dunfell branch untouched
> | w.r.t merging 5.10 specific changes.
> 
> While I understand the need to migrate from 5.4 to 5.10 and get developers
> working on it, willingly introducing regressions into a stable branch is
> quite undesirable. Anyone developing a product for a TI part with meta-ti
> would normally pull the latest stable branch. And while last week it used
> to work perfectly fine, providing full-featured 5.4 experience, this week
> it appears to be very barebone and with limited features 5.10 experience by
> default...

The 5.4 stability on dunfell took longer and also a need to making 5.10 
migration ready on the same branch makes the ride not smoother too.

Few updates on the planned next steps (basically getting from barebone 
to complete features as per the product plan).

* non display overlays support will come in the next week.
* display overlays will take more than few weeks as the migration for 
this on kernel side has not started either.
* non-k3 devices fails to build today, but the fixes are in progress 
(testing them on dunfell-next branch now)
* jailhouse has been disabled temporarily. This feature is in review to 
be completely descoped too as desired by product teams. depending on the 
direction closure worst case we might have to remove jailhouse 
completely from meta-ti/meta-arago on dunfell and master.

Not the best choice, but the reason i pulled dunfell-next to dunfell is 
to initiate the system test and other automation job/build dependencies 
to have those ready for 2021LTS baseline too.

Have also kept -master untouched for this transitionary period. Will 
sync all patches to master once dunfell with 5.10 is featured.

> 
> Will be needing to advise people to pin down to 07.03.00.005 tag and not rush
> to the latest 2021.00.001 tag for now.

You are right, this is what i am advising the teams who need dunfell 
repository for more development on the top (Ex: processor-sdk) till 5.10 
is completely ready on dunfell.

Both jacinto and sitara processor-sdk are using the pinned config and 
adding any further recipe updates in the meta-processor-sdk* layer on 
top for time being.


> 
> 
>>>>> Let me know if this a good approach, The only problem in that case
>>>>> is the graphics update for 5.10 that i recently pulled to dunfell
>>>>> branch. Need to revert it to keep 5.4 dunfell experience retained.
>>>>
>>>> Try those updates first with 5.4 before reverting them, mayve they'll work.
>>>>
>>>>
>>>>> Any other ideas?
