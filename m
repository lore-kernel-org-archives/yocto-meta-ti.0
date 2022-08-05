Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09944C19F2D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 01:29:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.2077.1659662952115827562
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 18:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=cl0Q8J/e;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2751TAEw129671;
	Thu, 4 Aug 2022 20:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659662950;
	bh=sJlJmRv7TpMgjFVqIYrltB4e4RMDtF8iBCP0wC7oGt0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cl0Q8J/eitZ6fXN2Hn6DaMFLOZpKQt1zVgRdRoByeZa48IgD9CPqOs1bttamWxdEF
	 pFiLkBYOKeZUx+kCC/815MCy9eYew/CsxylKO8ZZ2DlFChYyQKM9N6c+esjJLjavhX
	 jxkWPGsYPCHPMo479OCvwE/9Ujkz8DeHVym6v8PA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2751TAal081184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 20:29:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 20:29:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 20:29:10 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2751TAbw022099;
	Thu, 4 Aug 2022 20:29:10 -0500
Message-ID: <cddecc59-7e16-1446-764b-7c62d1872c18@ti.com>
Date: Thu, 4 Aug 2022 20:29:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 0/3] Update to 08.04.01.001
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220804222959.17202-1-reatmon@ti.com>
 <70250faf-d8f3-35b3-18b4-8b55c062824b@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <70250faf-d8f3-35b3-18b4-8b55c062824b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 2751TAEw129671
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 01:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14926


That change was picked up by a CICD run earlier this week.


On 8/4/2022 17:53, Bajjuri, Praneeth wrote:
>=20
>=20
> On 8/4/2022 5:29 PM, Ryan Eatmon wrote:
>> Update linux, linux rt and ti-linux-fw to 08.04.01.001 tag
>>
>> Ryan Eatmon (3):
>> =C2=A0=C2=A0 linux-ti-staging: Bump to 08.04.01.001 release
>> =C2=A0=C2=A0 linux-ti-staging-rt: Bump to 08.04.01.001 release
>=20
> also u-boot?
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tag/?h=3D08.04.01.001
>=20
>=20
>> =C2=A0=C2=A0 ti-linux-fw: Bump to 08.04.01.001 release
>>
>> =C2=A0 recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>=20
> missing k3-image-gen from this include file ?
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen/tag/?h=3D08.04.01.001
>=20
>=20
>> =C2=A0 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
>> =C2=A0 recipes-kernel/linux/linux-ti-staging_5.10.bb=C2=A0=C2=A0=C2=A0=
 | 2 +-
>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

