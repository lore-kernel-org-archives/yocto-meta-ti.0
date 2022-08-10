Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BC8C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:05:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.156.1660147538926619148
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 09:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=OIUxGCFR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27AG5bRL112263;
	Wed, 10 Aug 2022 11:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660147537;
	bh=t/jRYvx366XrbWX+HMMFLTtEZX7d3FJI+ArGVblNcJ8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=OIUxGCFR6HlTlQpLt7tyuVfqU0fgrKyUJ5xSq27XC1wuMc9Lj5RBL4zxd6ZoyqKxh
	 Hl1OUOSVWpcMY0DeGL0HYbsJ01gTY7g/ulthm0ji8fyaTODx6BLQ+yQBSReZEhEqXW
	 RgkQfLXniAfrXj2RArAhgNyd8jHaqwTaBByHX6Qw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27AG5bGL129525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Aug 2022 11:05:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 10
 Aug 2022 11:05:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 10 Aug 2022 11:05:36 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27AG5ahA075794;
	Wed, 10 Aug 2022 11:05:36 -0500
Message-ID: <3b4b1686-b356-35fe-bbe1-93f0b00024c3@ti.com>
Date: Wed, 10 Aug 2022 11:05:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220810144708.14171-1-afd@ti.com>
 <e01176e5-f142-b877-e8e1-8476a25b9be5@ti.com>
 <88910a44-8681-5c1a-efac-9fa7d118eb8c@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <88910a44-8681-5c1a-efac-9fa7d118eb8c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 27AG5bRL112263
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 16:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14944



On 8/10/2022 11:00, Andrew Davis wrote:
> On 8/10/22 10:58 AM, Ryan Eatmon wrote:
>>
>>
>> On 8/10/2022 9:47, Andrew Davis wrote:
>>> If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fa=
il
>>> if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
>>> set we assume the builder is only interested in the GP boards, so fak=
e
>>> generating the HS SYSFW images. These will be non-functional on HS
>>> boards, but they would have been just as non-functional if built
>>> without TI_SECURE_DEV_PKG set.
>>
>>
>> Have you tested what happens if they do not have it set and build the=20
>> "dummy" files, and then realize their mistake, set the variable and=20
>> build again?=C2=A0 Do the files then build correctly, or does the ssta=
te=20
>> cache prevent them from getting the correct thing without clearing the=
=20
>> cache and rebuilding everything?
>>
>>
>=20
> Yes, changing the value of the TI_SECURE_DEV_PKG causes all packages=20
> that use
> it to get rebuilt. I was surprised bitbake was smart enough to do that=20
> but seems
> like it is.

Nice!


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

