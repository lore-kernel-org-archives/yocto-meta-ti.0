Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798DDC87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 19:55:54 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.17775.1753818952225475355
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 12:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZrSnZZ02;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TJtmdX3073474;
	Tue, 29 Jul 2025 14:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753818948;
	bh=Dyr++qojEBp1AqiKgMikr6DnVxuXHQDRMGNVuhOGkuY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZrSnZZ02RaMhKk3pzG+2YggDrboOtaCiN6WMTzCSfhtJ9kJy9V/Rin6UfFu3U60tF
	 qJ5WCE9/zSA2uoVXvIuuWvxAIEKPx7oMiw6ncy0g2aRuzY9Y63VNB+HBDQEK8yYdau
	 bOAN1BETJNteM6EjuG+E8RZsviHB+pi1uPwfS/ro=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TJtmAf2675043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 14:55:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 14:55:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 14:55:48 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TJtm2m067841;
	Tue, 29 Jul 2025 14:55:48 -0500
Message-ID: <d10cdf83-288b-4da8-9ec8-3333cdc4a14d@ti.com>
Date: Tue, 29 Jul 2025 14:55:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <raj.khem@gmail.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728165437.571427-1-afd@ti.com>
 <20250728165437.571427-3-afd@ti.com> <20250728182531.GJ24899@denix.org>
 <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org>
 <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
 <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
 <20250728225942.GN24899@denix.org>
 <f1e99109-b715-48ca-bd70-1525f580319f@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f1e99109-b715-48ca-bd70-1525f580319f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56TJtmdX3073474
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Jul 2025 19:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18853



On 7/29/2025 1:03 PM, Andrew Davis wrote:
> On 7/28/25 5:59 PM, Denys Dmytriyenko wrote:
>> On Mon, Jul 28, 2025 at 03:33:23PM -0500, Ryan Eatmon wrote:
>>>
>>>
>>> On 7/28/2025 3:20 PM, Khem Raj via lists.yoctoproject.org wrote:
>>>> On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@de=
nix.org>=20
>>>> wrote:
>>>>>
>>>>> On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
>>>>>> On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
>>>>>> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org>=20
>>>>>> wrote:
>>>>>>>
>>>>>>> On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via=20
>>>>>>> lists.yoctoproject.org wrote:
>>>>>>>> For all our platforms booting with EFI there is only one option=20
>>>>>>>> today.
>>>>>>>> The timeout gives the user 3 seconds to choose a different=20
>>>>>>>> option, but
>>>>>>>> as there is only one, this just causes a needless 3 second delay=
 in
>>>>>>>> boot time. Remove this delay and boot the only option immediatel=
y.
>>>>>>>> If we ever have more than one option we can always add this back.
>>>>>>>
>>>>>>> Well, menu delay in grub is not only used for selecting among=20
>>>>>>> available
>>>>>>> predefined options, but also for interactively editing the=20
>>>>>>> command line
>>>>>>> on the fly before booting.
>>>>>>>
>>>>>>
>>>>>> for development, this sounds good, for production not so much.
>>>>>
>>>>> Sure. And we also disable e.g. U-boot boot prompt delay all the=20
>>>>> time for our
>>>>> customers during production hardening stage, among many other=20
>>>>> similar items.
>>>>> But it is done for the final product - I don't think it should be=20
>>>>> done in a
>>>>> generic BSP layer that many use for development.
>>>>
>>>> Right, it could be documented somewhere in README or some such would=
=20
>>>> help
>>>> the consumers of the layer.
>>>
>>> Is there already something in the system that we could use to drive
>>> a variable that we can stick into the file?=C2=A0 Like
>>> EXTRA_IMAGE_FEATURES?=C2=A0 I know there used to be a debug-tweaks th=
at
>>> got broken out into multiple features.=C2=A0 Maybe create a new one?
>>>
>>> TI_WKS_TIMEOUT =3D '${@bb.utils.contains("IMAGE_FEATURES",
>>> "wks-debug-timeout", "3", "0 ",d)}'
>>
>> Should probably make it more generic, not wks. I'd imagine it can be=20
>> shared
>> for U-boot and EFI/GRUB, so maybe bootloader-timeout or something?
>>
>=20
> Right now we have both a 2 second delay in U-Boot, and then a 3 second=20
> delay
> in the loaded EFI chainloader (GRUB). Which means after all the work we=
=20
> do to
> push down our boot times, we still just sit for 5 seconds waiting in=20
> case some
> developer has a terminal attached and wants to modify some option.. If =
you
> are a developer then you should know how to add back the boot delay, fo=
r
> everyone else it should be default disabled.

Agreed.  It would just be nice to have some nice easy way in the=20
local.conf to add the delay back in if you want.


> Having a "bootloader-timeout" var we can set would be nice, but it shou=
ld
> set the U-Boot timeout and the EFI timeout should still be default 0 IM=
HO.
> No reason for two different delays in boot to wait for extra dev uart=20
> input.
>=20
> I've got a patchset in the works to switch us away from GRUB to uefi-ke=
rnel
> anyway, which means direct kernel boot through EFI. No middle-man EFI
> chainloader like GRUB or systemd-boot needed. Just U-Boot -> Kernel lik=
e
> it should be on an embedded system.
>=20
> Andrew
>=20
>>
>>> bootloader --timeout=3D${TI_WKS_TIMEOUT} --append=3D"rootfstype=3Dext=
4
>>> rootwait ${TI_WKS_BOOTLOADER_APPEND}"
>>>
>>>
>>> Would that work?
>>>
>>>
>>>>>
>>>>>
>>>>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>>>>> ---
>>>>>>>> =C2=A0 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>>>>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in=20
>>>>>>>> b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>>>> index 7252411c..c1089762 100644
>>>>>>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>>>>> @@ -3,6 +3,6 @@
>>>>>>>> =C2=A0 # supports EFI.=C2=A0 Boot files are located in the first=
 vfat=20
>>>>>>>> partition with extra
>>>>>>>> =C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>>>>>>>>
>>>>>>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait=
=20
>>>>>>>> ${TI_WKS_BOOTLOADER_APPEND}"
>>>>>>>> +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait=
=20
>>>>>>>> ${TI_WKS_BOOTLOADER_APPEND}"
>>>>>>>> =C2=A0 part --source bootimg-efi=20
>>>>>>>> --sourceparams=3D"loader=3D${EFI_PROVIDER}" --fstype=3Dvfat --la=
bel=20
>>>>>>>> boot --active --align 1024 --use-uuid --fixed-size 128M
>>>>>>>> =C2=A0 part / --source rootfs --fstype=3Dext4 --label root --ali=
gn 1024=20
>>>>>>>> --use-uuid
>>>>>>>> --=20
>>>>>>>> 2.39.2
>>>>>>>>
>>>>>>>>
>>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>>> Links: You receive all messages sent to this group.
>>>>>>>> View/Reply Online (#18848):=20
>>>>>>>> https://lists.yoctoproject.org/g/meta-ti/message/18848
>>>>>>>> Mute This Topic:=20
>>>>>>>> https://lists.yoctoproject.org/mt/114416911/6551054
>>>>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>>>>>>> [reatmon@ti.com]
>>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

