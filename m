Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3916C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 18:04:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.15129.1753812237436946743
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 11:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ueEhT1bx;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TI3rT23056222;
	Tue, 29 Jul 2025 13:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753812233;
	bh=7QmQ1Q/M/f95tNmJza651MiF9QyO29/v3odbVmCBYno=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ueEhT1bxb/U16Mfxu1pVPhvdnr0HHcKvEdVWjOKywxHlY8g+7slM1CRPUWKdVY1c+
	 yOMDBfggvK1hKR+5eULf3raa5P4omyPjl95qi1Mhm/Y4EWh+26IdPXB3/YTyBj4O8+
	 e3wEQpwhzGSRmqXa5QzoU2zJjegMcWOSYA3MdUFE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TI3rGl2624939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 13:03:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 13:03:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 13:03:53 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TI3qiL3834310;
	Tue, 29 Jul 2025 13:03:53 -0500
Message-ID: <f1e99109-b715-48ca-bd70-1525f580319f@ti.com>
Date: Tue, 29 Jul 2025 13:03:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <raj.khem@gmail.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728165437.571427-1-afd@ti.com>
 <20250728165437.571427-3-afd@ti.com> <20250728182531.GJ24899@denix.org>
 <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org>
 <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
 <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
 <20250728225942.GN24899@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250728225942.GN24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56TI3rT23056222
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Jul 2025 18:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18852

On 7/28/25 5:59 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 28, 2025 at 03:33:23PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 7/28/2025 3:20 PM, Khem Raj via lists.yoctoproject.org wrote:
>>> On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@den=
ix.org> wrote:
>>>>
>>>> On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
>>>>> On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
>>>>> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> w=
rote:
>>>>>>
>>>>>> On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.y=
octoproject.org wrote:
>>>>>>> For all our platforms booting with EFI there is only one option t=
oday.
>>>>>>> The timeout gives the user 3 seconds to choose a different option=
, but
>>>>>>> as there is only one, this just causes a needless 3 second delay =
in
>>>>>>> boot time. Remove this delay and boot the only option immediately.
>>>>>>> If we ever have more than one option we can always add this back.
>>>>>>
>>>>>> Well, menu delay in grub is not only used for selecting among avai=
lable
>>>>>> predefined options, but also for interactively editing the command=
 line
>>>>>> on the fly before booting.
>>>>>>
>>>>>
>>>>> for development, this sounds good, for production not so much.
>>>>
>>>> Sure. And we also disable e.g. U-boot boot prompt delay all the time=
 for our
>>>> customers during production hardening stage, among many other simila=
r items.
>>>> But it is done for the final product - I don't think it should be do=
ne in a
>>>> generic BSP layer that many use for development.
>>>
>>> Right, it could be documented somewhere in README or some such would =
help
>>> the consumers of the layer.
>>
>> Is there already something in the system that we could use to drive
>> a variable that we can stick into the file?  Like
>> EXTRA_IMAGE_FEATURES?  I know there used to be a debug-tweaks that
>> got broken out into multiple features.  Maybe create a new one?
>>
>> TI_WKS_TIMEOUT =3D '${@bb.utils.contains("IMAGE_FEATURES",
>> "wks-debug-timeout", "3", "0 ",d)}'
>=20
> Should probably make it more generic, not wks. I'd imagine it can be sh=
ared
> for U-boot and EFI/GRUB, so maybe bootloader-timeout or something?
>=20

Right now we have both a 2 second delay in U-Boot, and then a 3 second de=
lay
in the loaded EFI chainloader (GRUB). Which means after all the work we d=
o to
push down our boot times, we still just sit for 5 seconds waiting in case=
 some
developer has a terminal attached and wants to modify some option.. If yo=
u
are a developer then you should know how to add back the boot delay, for
everyone else it should be default disabled.

Having a "bootloader-timeout" var we can set would be nice, but it should
set the U-Boot timeout and the EFI timeout should still be default 0 IMHO.
No reason for two different delays in boot to wait for extra dev uart inp=
ut.

I've got a patchset in the works to switch us away from GRUB to uefi-kern=
el
anyway, which means direct kernel boot through EFI. No middle-man EFI
chainloader like GRUB or systemd-boot needed. Just U-Boot -> Kernel like
it should be on an embedded system.

Andrew

>=20
>> bootloader --timeout=3D${TI_WKS_TIMEOUT} --append=3D"rootfstype=3Dext4
>> rootwait ${TI_WKS_BOOTLOADER_APPEND}"
>>
>>
>> Would that work?
>>
>>
>>>>
>>>>
>>>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>>>> ---
>>>>>>>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-b=
sp/wic/sdimage-2part-efi.wks.in
>>>>>>> index 7252411c..c1089762 100644
>>>>>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>>> @@ -3,6 +3,6 @@
>>>>>>>   # supports EFI.  Boot files are located in the first vfat parti=
tion with extra
>>>>>>>   # reserved space.  We cannot use a GPT here.
>>>>>>>
>>>>>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait =
${TI_WKS_BOOTLOADER_APPEND}"
>>>>>>> +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait =
${TI_WKS_BOOTLOADER_APPEND}"
>>>>>>>   part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROV=
IDER}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fi=
xed-size 128M
>>>>>>>   part / --source rootfs --fstype=3Dext4 --label root --align 102=
4 --use-uuid
>>>>>>> --
>>>>>>> 2.39.2
>>>>>>>
>>>>>>>
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#18848): https://lists.yoctoproject.org/g/meta=
-ti/message/18848
>>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/114416911/6551=
054
>>>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reat=
mon@ti.com]
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>>


