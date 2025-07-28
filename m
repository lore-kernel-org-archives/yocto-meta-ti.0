Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD978C87FCB
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 20:33:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.91583.1753734807677266686
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 13:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=huy2bL+x;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SKXOmV2384382;
	Mon, 28 Jul 2025 15:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753734804;
	bh=Ks2ZLx1T4/iuQco+eCf66gClB0rNgX3j9HVCoK52KsE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=huy2bL+xoLZe2HDD/wTzCXBmOMdEGhMlTxaxyms6nc67hbY/CXEt4FFjsJAmjPNgJ
	 0MN8ghQIYOqVw1WxsVaI1Nmjfzuf6D/f1y6ehfFsknlQE8DleS3ya/AZKGHvIbKboH
	 scGMf0c12OX5gLPRBX0muUAJS1enUF8OyacJKKZ4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SKXOBH2262263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 15:33:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 15:33:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 15:33:23 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SKXNM62624966;
	Mon, 28 Jul 2025 15:33:23 -0500
Message-ID: <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
Date: Mon, 28 Jul 2025 15:33:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728165437.571427-1-afd@ti.com>
 <20250728165437.571427-3-afd@ti.com> <20250728182531.GJ24899@denix.org>
 <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org>
 <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 56SKXOmV2384382
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 20:33:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18849



On 7/28/2025 3:20 PM, Khem Raj via lists.yoctoproject.org wrote:
> On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@denix=
.org> wrote:
>>
>> On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
>>> On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
>>> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wro=
te:
>>>>
>>>> On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yoc=
toproject.org wrote:
>>>>> For all our platforms booting with EFI there is only one option tod=
ay.
>>>>> The timeout gives the user 3 seconds to choose a different option, =
but
>>>>> as there is only one, this just causes a needless 3 second delay in
>>>>> boot time. Remove this delay and boot the only option immediately.
>>>>> If we ever have more than one option we can always add this back.
>>>>
>>>> Well, menu delay in grub is not only used for selecting among availa=
ble
>>>> predefined options, but also for interactively editing the command l=
ine
>>>> on the fly before booting.
>>>>
>>>
>>> for development, this sounds good, for production not so much.
>>
>> Sure. And we also disable e.g. U-boot boot prompt delay all the time f=
or our
>> customers during production hardening stage, among many other similar =
items.
>> But it is done for the final product - I don't think it should be done=
 in a
>> generic BSP layer that many use for development.
>=20
> Right, it could be documented somewhere in README or some such would he=
lp
> the consumers of the layer.

Is there already something in the system that we could use to drive a=20
variable that we can stick into the file?  Like EXTRA_IMAGE_FEATURES?  I=20
know there used to be a debug-tweaks that got broken out into multiple=20
features.  Maybe create a new one?

TI_WKS_TIMEOUT =3D '${@bb.utils.contains("IMAGE_FEATURES",=20
"wks-debug-timeout", "3", "0 ",d)}'

bootloader --timeout=3D${TI_WKS_TIMEOUT} --append=3D"rootfstype=3Dext4=20
rootwait ${TI_WKS_BOOTLOADER_APPEND}"


Would that work?


>>
>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp=
/wic/sdimage-2part-efi.wks.in
>>>>> index 7252411c..c1089762 100644
>>>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>>>> @@ -3,6 +3,6 @@
>>>>>   # supports EFI.  Boot files are located in the first vfat partiti=
on with extra
>>>>>   # reserved space.  We cannot use a GPT here.
>>>>>
>>>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
>>>>> +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
>>>>>   part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVID=
ER}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixe=
d-size 128M
>>>>>   part / --source rootfs --fstype=3Dext4 --label root --align 1024 =
--use-uuid
>>>>> --
>>>>> 2.39.2
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#18848): https://lists.yoctoproject.org/g/meta-t=
i/message/18848
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/114416911/655105=
4
>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmo=
n@ti.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

