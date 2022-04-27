Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213B3C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:20:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.8798.1651069219662406573
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 07:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eE7F9jLc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23REKIvu047477
	for <meta-ti@lists.yoctoproject.org>; Wed, 27 Apr 2022 09:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651069218;
	bh=WsbtgYRwsDXXz3PlRNcSC2Y9/EH+P+0esA0VHjJ8rbQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eE7F9jLcx6wZdBwjHdWJxecmbTp90lMTmn5AcqxT4gbgoIabyS121pgcebLNafOA/
	 J7PEp1uQpZ8Giy4DRa5FzTBiju9URIo1VZciK9skmY61Ev25r/16HySK4qt+UCAKNU
	 0iik+oCnJmojbQz5lAL4GzmuBsMmy94AxE9wAExk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23REKHTS072091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 27 Apr 2022 09:20:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 09:20:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 09:20:17 -0500
Received: from [172.24.219.78] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23REKE8v080042;
	Wed, 27 Apr 2022 09:20:15 -0500
Message-ID: <851dcd0d-5a62-bf19-2c86-f228ccccede8@ti.com>
Date: Wed, 27 Apr 2022 19:50:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti][dunfell][PATCH] u-boot-ti: Use SRCREV to get short
 commit ID
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>, <vigneshr@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <a-m1@ti.com>
References: <20220419154734.6346-1-devarsht@ti.com>
 <20220419233421.ngbixhxdyjqr7hbc@penholder>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20220419233421.ngbixhxdyjqr7hbc@penholder>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Apr 2022 14:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14620


On 20/04/22 05:04, Nishanth Menon wrote:
> On 21:17-20220419, Devarsh Thakkar wrote:
>> Due to recent security update in git, we are
>> not able to fetch revision currently using existing method:
>> https://github.blog/2022-04-12-git-security-vulnerability-announced/
>>
>> So instead, use the SRCREV to parse the short commit ID
>> and set the UBOOT_LOCALVERSION variable.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>  recipes-bsp/u-boot/u-boot-ti.inc | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
>> index 231b7647..cc775e2e 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -1,14 +1,6 @@
>>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>>  # U-boot version string.  such as the commit id
>> -def get_git_revision(p):
>> -    import subprocess
>> -
>> -    try:
>> -        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
>
> I see a similar logic in
> recipes-kernel/linux/setup-defconfig.inc as well.
>
> Considering similar problem
>
> https://lore.kernel.org/all/20220413155249.3458236-2-raj.khem@gmail.com/
>
> was wondering as to what might be a better way to solve this?
>
> There is also git rev-parse HEAD instances in oe-core as well and
> bitbake(lib/layerindexlib/cooker.py) as well.
>
> I wonder since we know cwd=p, could we use that to set
> https://git-scm.com/docs/git/2.35.2#Documentation/git.txt-codeGITCEILINGDIRECTORIEScode
>  (which if my understanding is right, came in around v1.5.5.1-319-g0454dd93bfb2)
>
> OR maybe just set it to the base conf similar to what was done on
> master oe-core/meta/conf/bitbake.conf (commit
> 02ecf3e2a98a614805f6f2574c2bf14162192d01 "bitbake.conf: Prevent git from
> detecting parent repo in recipe")?
>
> I am not sure if we should considering just side stepping this issue via
> just not using the git to get the version string.. just my 2 cents.

My top level understanding was the security update was suggesting to avoid

doing what we were doing already i.e. calling git from

a sub-process through a recipe due to security concerns and so avoided
using git

and also I think below change also achieves same what was achieved
before with SRCREV, I have

similar fix on the kernel bb too which was failing with same error.

>> -    except OSError:
>> -        return None
>> -
>> -UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
>> +UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"
>>  
>>  UBOOT_SUFFIX ?= "img"
>>  SPL_BINARY ?= "MLO"
>> -- 
>> 2.17.1
>>

