Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0111FC4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 21:07:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1540.1714165653526227852
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 14:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VxUwjJrD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43QL7US0121801;
	Fri, 26 Apr 2024 16:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714165650;
	bh=GKjclrEm5ciqZFDdKv8+kDpyOo170opnZe54x/z+UBc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VxUwjJrD6VueMfGWl1SJU5vMRfGV09XZtO2iMMGCOivIgw6IBt++gVQdv4HywovbC
	 uf129aCRTbwgAhxDEcy5kBui5sOFjjwSg4vHvgTyHvvPEWb0+egbh7Qn/vzAHT5aeD
	 NMAgVYiLESqNOrOhiBXyJJnALvjxW3UMWMEs8GnE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43QL7UGN028298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Apr 2024 16:07:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Apr 2024 16:07:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Apr 2024 16:07:29 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43QL7TWi034610;
	Fri, 26 Apr 2024 16:07:29 -0500
Message-ID: <13dd8e70-9479-4ace-83d8-1502a09fec99@ti.com>
Date: Fri, 26 Apr 2024 16:07:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap/kirkstone][PATCH v2] wic: prevent
 boot FAT partition mounting under /boot
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240424223624.1938639-1-denis@denix.org>
 <CADL8D3axA893RdRHLVLjhiUyAnX0XHRXtxx993J_U4LhAewpyw@mail.gmail.com>
 <20240426190214.GK28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240426190214.GK28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 43QL7US0121801
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Apr 2024 21:07:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17606


Yes.  I was just finishing up another thing and about to get back to this.


On 4/26/2024 2:02 PM, Denys Dmytriyenko wrote:
> Ryan,
>=20
> Will you be able to pick up v2 of this? Thanks.
>=20
>=20
> On Wed, Apr 24, 2024 at 12:46:48PM -1000, Jon Cormier wrote:
>> Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
>>
>> On Wed, Apr 24, 2024, 12:36=E2=80=AFPM Denys Dmytriyenko via lists.yoc=
toproject.org
>> <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>>
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Separate FAT boot partition holds SPL, SYSFW and U-boot images, while
>>> rootfs places kernel images and DTBs into /boot directory. So it is n=
ot
>>> desirable to mount boot FAT partition into /boot directory of the roo=
tfs
>>> and shadow its original content - adjust corresponding entry in wic
>>> templates.
>>>
>>> While at it, remove unused ondisk parameter when using use-uuid, whic=
h
>>> takes precedence and is more flexible.
>>>
>>> Note: boot FAT partition will be automounted at /run/media/boot-mmcbl=
k0p1/
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>> v2 changes:
>>> * remove <mountpoint> from boot partition to avoid undocumented behav=
ior
>>> * add explicit size specifier to --fixed-size 128M
>>>
>>>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 3 ++-
>>>   meta-ti-bsp/wic/sdimage-2part.wks        | 4 ++--
>>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/w=
ic/
>>> sdimage-2part-efi.wks.in
>>> index 2213a348..ca042be1 100644
>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> @@ -2,6 +2,7 @@
>>>   # long-description: Creates a partitioned SD card image for TI plat=
forms
>>> that
>>>   # supports EFI.  Boot files are located in the first vfat partition=
 with
>>> extra
>>>   # reserved space.  We cannot use a GPT here.
>>> +
>>>   bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4"
>>> -part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PRO=
VIDER}"
>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size
>>> 128M
>>> +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}=
"
>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size
>>> 128M
>>>   part / --source rootfs --fstype=3Dext4 --label root --align 1024 --=
use-uuid
>>> diff --git a/meta-ti-bsp/wic/sdimage-2part.wks
>>> b/meta-ti-bsp/wic/sdimage-2part.wks
>>> index 3eab9407..5073176e 100644
>>> --- a/meta-ti-bsp/wic/sdimage-2part.wks
>>> +++ b/meta-ti-bsp/wic/sdimage-2part.wks
>>> @@ -2,5 +2,5 @@
>>>   # long-description: Creates a partitioned SD card image for TI plat=
forms.
>>>   # Boot files are located in the first vfat partition with extra res=
erved
>>> space.
>>>
>>> -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvf=
at
>>> --label boot --active --align 1024 --fixed-size 128 --use-uuid
>>> -part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root
>>> --align 1024 --use-uuid
>>> +part --source bootimg-partition --fstype=3Dvfat --label boot --activ=
e
>>> --align 1024 --use-uuid --fixed-size 128M
>>> +part / --source rootfs --fstype=3Dext4 --label root --align 1024 --u=
se-uuid
>>> --
>>> 2.25.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

