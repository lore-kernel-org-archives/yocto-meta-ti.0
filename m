Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EB8C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:33:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.53887.1742221987976226758
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 07:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=irUMeNYW;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HEX0ap2295158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 09:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742221980;
	bh=wsCN//GnVG4h4F6zdM7LBhzxCSrWX/YVO/wmoDilFa4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=irUMeNYW2n4IdR2z2t/X4e4Jlc42tW2jrRKWRzyE30FVwMpu6BfkHEo0XsXlQlTgU
	 MUgZgu4h92qu8Wx1QoL0kqqOoo9oSkxF6GKPdPEw56ThruoCQmQu1vFR9OpJDcY+7e
	 oOg4pq6Cy7k3sjOi1h/Y9q+mhW/5NShh5ZGZBuK8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HEX0hu091372;
	Mon, 17 Mar 2025 09:33:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 09:32:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 09:32:59 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HEWxwA117427;
	Mon, 17 Mar 2025 09:32:59 -0500
Message-ID: <be90cd32-da8f-40b5-b8e8-f1d3cb0728ea@ti.com>
Date: Mon, 17 Mar 2025 09:32:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] jailhouse: revert changes for
 am62lxx
To: <p-bhagat@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <jweyer@aecontrols.com>
References: <20250315014726.2806459-1-denis@denix.org>
 <c195321b-c9d3-4666-8818-83246c9d1fca@ti.com>
 <96a6f98f-bf48-4654-96a0-0818a5aca256@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <96a6f98f-bf48-4654-96a0-0818a5aca256@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 52HEX0ap2295158
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 14:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18394



On 3/17/2025 1:09 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
> Hi Denys and Chirag,
>=20
> On 15/03/25 19:20, Chirag Shilwant wrote:
>> Hi Paresh & Denys,
>>
>> On 15/03/25 07:17, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> This reverts commit 31b423275aa2bc685a1348218bda16894a35ad8b.
>>>
>>> This uses an unpublished/uncommitten change - more details:
>>> https://lists.yoctoproject.org/g/meta-ti/topic/111318869
>>
>>
>>
>> Instead of reverting the entire commit which enabled
>> Jailhouse support in AM62L, can't we just update
>> the SRCREV to point to a valid commit under ti-jailhouse?
>>
>> Something that Jared tried to suggest at [0]
>>
>>
>> [0]: https://lists.yoctoproject.org/g/meta-ti/message/18333
>>
>>
>=20
> Due to some last min changes, I had to force push which caused the=20
> commit to change. Additionally, the commits for Jailhouse branches in=20
> meta-ti are usually an older version since Jailhouse updates are done=20
> after a RC tag (in meta-tisdk). I can send a patch to correct the commi=
t=20
> instead of reverting current changes.

It is generally almost always a bad idea to force push a "prod" branch=20
for any repo.  We should get out of the habit of doing that.  Just=20
commit new changes to fix whatever issue you are trying to fix.  You=20
never know what all is pointing at a commit that will be torpedoed by a=20
force push.


>=20
> Thanks
>=20
>> --=20
>> Chirag
>>
>>
>>
>>> Cc: Paresh Bhagat <p-bhagat@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/am62lxx-evm.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc=C2=A0=C2=A0=C2=
=A0 | 10 +++++-----
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |=C2=A0 4=
 ----
>>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc |=C2=A0 5=
 ++---
>>> =C2=A0 6 files changed, 17 insertions(+), 23 deletions(-)
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18392): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18392
> Mute This Topic: https://lists.yoctoproject.org/mt/111711058/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

