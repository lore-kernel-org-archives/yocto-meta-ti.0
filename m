Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B05CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 04:07:22 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.46300.1759118823784151584
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 21:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=GzhzA0ys;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: vigneshr@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58T472en2101289;
	Sun, 28 Sep 2025 23:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759118822;
	bh=RqUJHcc0Xq52UP2id69z7HrWrUUy4lkZWFKbMdv12kI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GzhzA0ysv85qVNTadaPHbBBsYDk5FAxSD3ic75M/opakHFoI4dpE2bg6OiXdBLlY3
	 OoL+XKCEiRD5jpX48m4saSQufBndcKplEn+H2Trd4GP/c0csCyx54viT2Ivia2geEL
	 VjxgncW6yQVnGCZR0DWsiqMmWRoyaWdrSdGxPf28=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58T472Eg2037125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 28 Sep 2025 23:07:02 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 28
 Sep 2025 23:07:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 28 Sep 2025 23:07:01 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58T46vmJ841828;
	Sun, 28 Sep 2025 23:06:58 -0500
Message-ID: <a4c1ea7c-b3cb-4bae-86e6-6bd7f1b0f11a@ti.com>
Date: Mon, 29 Sep 2025 09:36:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB
 config for TI platforms
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, Moteen Shah <m-shah@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>, <bb@ti.com>,
        <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
 <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
 <88e41345-a0a5-4897-afaf-ba1435be5758@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <88e41345-a0a5-4897-afaf-ba1435be5758@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58T472en2101289
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 04:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19069



On 25/09/25 22:53, Andrew Davis wrote:
> On 9/23/25 4:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>>> Add a new grub config for TI specific platforms. While,
>>> only supporting to boot linux from filesystem on MMCSD, it
>>> will support booting linux and initrd image from eMMC, OSPI,
>>> UFS later down the line. Hence, make a new config altogether
>>> for easier development.
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>> =C2=A0 meta-ti-bsp/wic/ti-grub.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>> =C2=A0 2 files changed, 10 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg
>>>
>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/
>>> wic/sdimage-2part-efi.wks.in
>>> index ae38daa7..11912606 100644
>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> @@ -3,6 +3,6 @@
>>> =C2=A0 # supports EFI.=C2=A0 Boot files are located in the first vfat=
 partition
>>> with extra
>>> =C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4
>>> ${TI_WKS_BOOTLOADER_APPEND}"
>>> +bootloader --configfile=3D"ti-grub.cfg"
>>
>> Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used for
>> am64 to specify the serial console.=C2=A0 This likely needs to be bett=
er
>> tested before we just make blanket changes like that.
>>
>=20
> Just a side note on this, AM64 needs "console=3DttyS2,115200n8" passed =
in
> on the kernel
> command line or you will not get kernel output. This is something we ca=
n
> pass to all
> K3 boards (although not strictly needed for other boards, it is safe/
> correct to do
> for them all).=20

> Non-K3 boards will want "console=3DttyS0,115200n8" (note
> theS0). So
> having this selectable per-SoC/family is still useful.

AM62L would use  "console=3DttyS0,115200n8" as well.


>=20
> Andrew

[...]

--=20
Regards
Vignesh
https://ti.com/opensource


