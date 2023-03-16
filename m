Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C690BC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 00:04:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1015.1678925034248092665
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 17:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GrtrxrX6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32G03lq5062124;
	Wed, 15 Mar 2023 19:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678925027;
	bh=19+ZL8ZlPUreWMSc8/ubQE90PYootjJ1E8wVE97vIQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GrtrxrX6XalYdcn9FlbyM+9OpO23wKax7TDZFY/FjUy3u+FJ6CLdapq6/ru0SInvh
	 +C5RsYZ9Yt0WwxHow7WJP8DDgC6R54lspvYpNzZ4URwPaRraHA+W4/mUyRrEb5cabp
	 8+DiMbwgWL7I3ieYwEwrkb8yV7S+I5qnAAnl/O/8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32G03lEW063277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Mar 2023 19:03:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Mar 2023 19:03:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Mar 2023 19:03:47 -0500
Received: from [10.247.30.6] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32G03lfh019635;
	Wed, 15 Mar 2023 19:03:47 -0500
Message-ID: <3c6d687b-160f-d2de-69ae-68bff7aa0f1e@ti.com>
Date: Wed, 15 Mar 2023 19:03:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti] [kirkstone PATCH] u-boot-ti-staging: upgrade to 2023.01
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
References: <20230315234025.5531-1-praneeth@ti.com>
 <249580c9-1d6a-c93c-5d70-e20284426346@ti.com>
 <20230315235547.GB18050@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230315235547.GB18050@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 00:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15987



On 3/15/2023 6:55 PM, Denys Dmytriyenko wrote:
> I haven't seen the original patch on the list and nothing is in Patchwork:
> 
> https://patchwork.yoctoproject.org/project/ti/list/

weird, let me check my settings.


> 
> 
> On Wed, Mar 15, 2023 at 06:42:21PM -0500, praneeth via lists.yoctoproject.org wrote:
>> On 3/15/2023 6:40 PM, Praneeth Bajjuri wrote:
>>> upgrade to 2023.01 and make 2021.01 recipe as not
>>> default version.
>>
>> build and sanity boot tested bootloader on am62xx gp.
> 
> What about other platforms?

Ryan, Can you fire a build with kirkstone-next and let me know 
observation based on wider platforms.

since this recipe is based on v2023.01 uboot , any platforms that were 
mainlined till that tag should boot ( ex: j721e, am64xx, j7200 ..)


> 
> 
>>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>>> ---
>>>   .../recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb      | 2 ++
>>>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb      | 9 +++++++++
>>>   2 files changed, 11 insertions(+)
>>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>>> index 1640d042..df428dfa 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
>>> @@ -7,3 +7,5 @@ PR = "r33"
>>>   BRANCH = "ti-u-boot-2021.01"
>>>   SRCREV = "78a217ca9ea687ee5c3e7dd3a339a1f7d136e93d"
>>> +
>>> +DEFAULT_PREFERENCE = "-1"
> 
> You don't need to do this - by default bitbake prefers any higher/newer
> version available.
> 
> 
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
>>> new file mode 100644
>>> index 00000000..f1867e73
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
>>> @@ -0,0 +1,9 @@
>>> +require u-boot-ti.inc
>>> +
>>> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
>>> +
>>> +PR = "r0"
>>> +
>>> +BRANCH = "ti-u-boot-2023.01"
>>> +
>>> +SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"

