Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9941C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 23:42:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.41125.1673480562552364770
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 15:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=joHCfzyJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BNgceI102071;
	Wed, 11 Jan 2023 17:42:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673480558;
	bh=VmGHiUn6QbRRxkU22seUMPe0tTS6451XfGkVhNF+STA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=joHCfzyJrU3uSXLJ0k2RWTZnoMBqXKGX5CafdL23FxzaazKTfjn8MaAqE8z1Mjqtq
	 graIEnoGsx+o56zymwnpoTkXOAu+Tcg6+OB/78lUqPy1Gz5VwUwNDX5PN0EYHBT8Rw
	 375WttOd/bnps6/mosLNA+ggxCSBrrE6U5JU8uh0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BNgc6M053190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 17:42:38 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 17:42:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 17:42:38 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BNgbMk016540;
	Wed, 11 Jan 2023 17:42:38 -0600
Message-ID: <e805781a-3325-c9a6-9f5b-18db176c6605@ti.com>
Date: Wed, 11 Jan 2023 17:42:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH v2] ti-img-rogue-driver:
 AM62 Active power management
Content-Language: en-US
To: "Sapp, Randolph" <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230111221434.2399898-1-rs@ti.com>
 <20230111223349.GV22689@denix.org> <8IHCOR.GF30PD08UQID2@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <8IHCOR.GF30PD08UQID2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 30BNgceI102071
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 23:42:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15553



On 1/11/2023 17:34, Sapp, Randolph wrote:
> On Wed, Jan 11 2023 at 05:33:49 PM -0500, Denys Dmytriyenko=20
> <denis@denix.org> wrote:
>> On Wed, Jan 11, 2023 at 04:14:34PM -0600, Randolph Sapp via=20
>> lists.yoctoproject.org wrote:
>>> =C2=A0Bump source revision. Changelog from source:
>>> =C2=A0=C2=A0 - Cleanup the device initialization routine for all plat=
forms
>>> =C2=A0=C2=A0 - Add a power safeguard for multicore initialization
>>> =C2=A0=C2=A0 - Enable active power management for AM62 devices
>>>
>>> =C2=A0v2: This revision actually uses the correct commit hash. Not su=
re where
>>> =C2=A0I got the old one from.
>>
>> Thanks, but patch revision changes are usually listed after the ---=20
>> cut line
>> below to not get into the commit log history.
>>
>>
>>> =C2=A0Signed-off-by: Randolph Sapp <rs@ti.com>
>>> =C2=A0---
>>
>> Here.
>=20
> Ah, thanks. I'll keep that in mind. Do you want me to resubmit this pat=
ch?


Yes, please.


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

