Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22832C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:37:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.210.1751384212911489807
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 08:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LTqL5cTH;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561FapaR3672069;
	Tue, 1 Jul 2025 10:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751384211;
	bh=QcupmYeBWcO05O6Y5G3tCWAA2MDEW5l7AOCQnkC7tg0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LTqL5cTH6yZdaJOQ1q3QKftzqLLDaUjTO8ZpUDQfv27yfijXm29pLyryOlRSrIaCH
	 1kVGpDjbSSz1xykMJQY3TYfHFAfx7/W15az4yGhFVn9yOteCWSqCAscO5c1N/mNUCl
	 fbmcitr1KDyn6Ho2kL9Zt31qD7PVbrrzAKpx0qRQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561Fapdu3036604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 10:36:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 10:36:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 10:36:50 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561FaoAH1529296;
	Tue, 1 Jul 2025 10:36:50 -0500
Message-ID: <f9ca9342-db29-4e23-ba74-3df526ed8f13@ti.com>
Date: Tue, 1 Jul 2025 10:36:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-bsp: Add all
 tiboot3.bin variants by wildcard
To: Andrew Davis <afd@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        "Raghavendra, Vignesh"
	<vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
References: <20250627193003.575911-1-afd@ti.com>
 <20250627193003.575911-2-afd@ti.com>
 <112eaca7-e4ba-411a-847c-cb352eae23da@ti.com>
 <ee5285d3-965a-4fb2-9877-5fff5045f8eb@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ee5285d3-965a-4fb2-9877-5fff5045f8eb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 561FapaR3672069
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 15:37:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18744



On 7/1/2025 8:25 AM, Andrew Davis wrote:
> On 7/1/25 7:06 AM, Chirag Shilwant wrote:
>> Hi Andrew,
>> On 28/06/25 01:00, Andrew Davis via lists.yoctoproject.org wrote:
>>> U-Boot generates all the valid versions of tiboot3.bin and picks the
>>> default based on the board's binman files. No need to duplicate this
>>> logic here, simply deploy what U-Boot gives us.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62axx.inc |=C2=A0 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62dxx.inc |=C2=A0 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62pxx.inc |=C2=A0 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc=C2=A0 |=C2=A0 9 --=
-------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am64xx.inc=C2=A0 |=C2=A0 9 --=
-------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc=C2=A0 |=C2=A0 2 --
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am68.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am69.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j7200.inc=C2=A0=C2=A0 | 15 --=
-------------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc=C2=A0=C2=A0 |=C2=A0=
 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j721s2.inc=C2=A0 |=C2=A0 9 --=
-------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j722s.inc=C2=A0=C2=A0 |=C2=A0=
 6 ------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j742s2.inc=C2=A0 |=C2=A0 6 --=
----
>>> =C2=A0 meta-ti-bsp/conf/machine/include/j784s4.inc=C2=A0 |=C2=A0 9 --=
-------
>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
>>> =C2=A0 15 files changed, 1 insertion(+), 101 deletions(-)
>>>
>>
>> <snip>
>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>>> b/meta-ti-bsp/conf/machine/include/k3.inc
>>> index 9b85f867..d0f0bd62 100644
>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>> @@ -44,6 +44,7 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ex=
t2=20
>>> alsa pci optee-ftpm"
>>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>>> =C2=A0 IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX=
}=20
>>> tiboot3.bin"
>>> +IMAGE_BOOT_FILES +=3D "tiboot3-*-evm.bin"
>>
>>
>> This commit seems to undo the effect of [0] which resolved SITSW-7159
>> There was a request to not package tiboot3-am62ax-gp-evm.bin inside=20
>> vfat boot partition of wic image
>> but k3-am62a-sk-binman.dtsi [1] would still have it for Astc/vlab=20
>> folks who know how to use the u-boot sources.
>>
>>
>> Hence, even if this approach to ship all tiboot3.bin generated by=20
>> u-boot build seems logically correct
>> but it ends up deploying tiboot3 for GP samples which were only used=20
>> internally for initial device bring-up
>> & not available publicly.
>>
>=20
> Then that version of tiboot3.bin should not be generated by U-Boot,=20
> keeping the logic of
> which tiboot3.bin variants are valid or not shouldn't be put in each=20
> distro, let's drop
> that version from U-Boot binman if it has no reason to be.

Agreed.


> Andrew
>=20
>>
>> [0]=20
>> https://git.yoctoproject.org/meta-ti/commit/?h=3Dscarthgap-next&id=3D4=
92a9aa4a92787185b41023e1026369d4028c1eb
>>
>> [1]=20
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-am62a=
-sk-binman.dtsi?h=3D11.01.04#n104
>>
>>
>> Chirag
>>
>>
>>> =C2=A0 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
>>> =C2=A0 EFI_PROVIDER ?=3D "grub-efi"
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#18710):=20
>>> https://lists.yoctoproject.org/g/meta-ti/message/18710
>>> Mute This Topic: https://lists.yoctoproject.org/mt/113867726/7030289
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>> [c-shilwant@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

