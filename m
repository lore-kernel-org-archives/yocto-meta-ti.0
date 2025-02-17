Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C71C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 15:20:10 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.54263.1739805610119637505
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 07:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=yjeBz0fV;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HFK6n0542183
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 09:20:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739805606;
	bh=VU1/R5Iu+qzF3OLJ8ZOV5zFHYPlyL5CLRjJolEeKIas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yjeBz0fV2DZ+/4jRYrGPU5SAc+JIHWRlIH0yI7IYnE0NfK+lStCl8geLZdOwDSpWy
	 HQNvwylJDuXahB88BEbxfR7kR803izv+wRWKuu2shEanIL9/SkSv55vL3QsXpWho5+
	 MXdhcpZzJcUy8JfBlJUb3ju46P9sB2quD6R9FMwc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HFK6vW006362;
	Mon, 17 Feb 2025 09:20:06 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 09:20:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 09:20:06 -0600
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HFK5cY064706;
	Mon, 17 Feb 2025 09:20:05 -0600
Message-ID: <94e0ba53-a3b9-4767-8340-8acf158923df@ti.com>
Date: Mon, 17 Feb 2025 09:20:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: j722s: Change overlay
 in KERNEL_DEVICETREE_PREFIX
To: "Dutta, Anurag" <a-dutta@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <denys@konsulko.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <c-shilwant@ti.com>, <a-limaye@ti.com>
References: <20250211055530.16704-1-a-dutta@ti.com>
 <20250211202744.GT21608@denix.org>
 <bed17678-2deb-4c9e-9862-8adf94f581dc@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bed17678-2deb-4c9e-9862-8adf94f581dc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 51HFK6n0542183
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2025 15:20:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18325



On 2/16/2025 11:27 PM, Dutta, Anurag wrote:
>=20
> On 12-02-2025 01:57, Denys Dmytriyenko wrote:
>> Is it really scarthgap-specific?
> Yes, this patch is scarthgap-specific because overlays are not upstream=
ed.

scarthgap and master are just two branches for the yocto project.  This=20
has nothing to do with the upstream kernel.  I already applied this=20
patch to master as well.  But in the future, this kind of patch should=20
be made for both the current LTS and the master branch.


>> On Tue, Feb 11, 2025 at 11:25:30AM +0530, Anurag Dutta via=20
>> lists.yoctoproject.org wrote:
>>> Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
>>> of j722s is "k3-j7200-evm-mcspi-loopback" which is incorrect. Change
>>> the overlay to "k3-am625-sk-mcspi-loopback.dtso" in order to carry
>>> out SPI loopback tests successfully.
>>>
>>> Fixes: 13b691a9bc2d ("conf: machine: j722s: Add overlay to
>>> KERNEL_DEVICETREE_PREFIX")
>>>
>>> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
>>> ---
>>>
>>> Test link:=20
>>> https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd3144499=
48
>>>
>>> =C2=A0 meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf=20
>>> b/meta-ti-bsp/conf/machine/j722s-evm.conf
>>> index 8f42866c..52a6cfbd 100644
>>> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
>>> @@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-mcspi-loopback \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>> =C2=A0 "
>>> --=20
>>> 2.34.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

