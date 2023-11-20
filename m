Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55996C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:41:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18609.1700520083250004253
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 14:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GOhZaK81;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AKMfI0w070449;
	Mon, 20 Nov 2023 16:41:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700520078;
	bh=Ik+HJgvxFvE+V9iaZocN2/EoKQhMHyjMLTPFV6e58ao=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GOhZaK81G43Xx4wBjN1swAQoWg/sJ1R+ohiQTLOYSEP0yl/jcXIY33yVYlhuT9xa/
	 4wRHp+SWaxn0LkZ1mVwYvqIbT3LklevYtuZqkn89Zp2wc5okQ6ZtBFtvBB5ioNC25b
	 Q/mJzuH5TLDgzF6YKO+8GCiAwvoz122hdrtGYoRE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AKMfIf2121250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Nov 2023 16:41:18 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Nov 2023 16:41:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Nov 2023 16:41:18 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AKMfISd038267;
	Mon, 20 Nov 2023 16:41:18 -0600
Message-ID: <fe201d56-0e74-4c6d-b1a5-d46519a8be1f@ti.com>
Date: Mon, 20 Nov 2023 16:41:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone][PATCH] k3r5: ensure separate TMPDIR
 used for this multiconfig
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <1796F5B6A516DB9F.29291@lists.yoctoproject.org>
 <20231120201743.GU2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231120201743.GU2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 22:41:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17318


There was a question for you.  I was waiting for you to respond.


On 11/20/2023 2:17 PM, Denys Dmytriyenko wrote:
> Ping.
> 
> 
> On Sun, Nov 12, 2023 at 07:07:43PM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> This k3r5 multiconfig builds baremetal components (and corresponding native,
>> nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal". The
>> expectation is that those components and tools will use a separate TMPDIR
>> to isolate from the main Linux build that uses "glibc" TCLIBC and to avoid
>> potential conflicts.
>>
>> OE-Core "nodistro" default configuration already sets TCLIBCAPPEND facility
>> to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal" temp
>> directory for this multiconfig and "tmp-glibc" for the main Linux one. Other
>> distros like Arago follow this convention and even extend a bit (e.g. Arago
>> also adds TCMODE suffix to TMPDIR for external toolchain support separation).
>>
>> But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPEND and
>> result in a combined TMPDIR, leading to potential conflicts, such as:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15273
>>
>> And that's just the beginning, there were other conflicts observed later in
>> the build, e.g. during nativesdk builds - that's why we also set a unique
>> SDKPKGSUFFIX here.
>>
>> To force a separate TMPDIR for k3r5 multiconfig, we have to directly append
>> a suffix to it. Multiple other options were tested in hopes of making it
>> slightly cleaner, but they either didn't work or were dismissed. For example,
>> trying to override TCLIBCAPPEND getting cleared by a distro would require
>> using a machine/soc-override, which doesn't have enough scope (nativesdk)
>> or forcing it with :forcevariable would also change the main Linux TMPDIR
>> and affect existing CI flows. Also, using TCLIBC itself as a suffix to add
>> to TMPDIR may result in getting it appended twice (tmp-baremetal-baremetal)
>> when normal TCLIBCAPPEND facility is used. Hence the least invasive/confusing
>> option is to always append "-k3r5" suffix to this multiconfig TMPDIR. That
>> results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while OE-Core
>> "nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and "tmp-glibc"
>> for the main).
>>
>> Also note, meta-ti-bsp layer.conf sets up images and sdks to be deployed
>> into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY variable
>> that controls it is set weakly, allowing to be modified from a distro
>> configuration or local.conf. It means that all images and sdks can be
>> deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
>> the final destination, by using := for immediate variable expansion:
>> TI_COMMON_DEPLOY := "${TMPDIR}/deploy"
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> index 04b9a746..e36c87ed 100644
>> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>>   
>>   MACHINE:append = "-k3r5"
>>   TCLIBC = "baremetal"
>> +TMPDIR:append = "-k3r5"
>> +
>>   SDKPKGSUFFIX = "k3r5-nativesdk"
>> -- 
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17316): https://lists.yoctoproject.org/g/meta-ti/message/17316
>> Mute This Topic: https://lists.yoctoproject.org/mt/102547765/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

