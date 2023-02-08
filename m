Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EEBC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:45:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6873.1675881955307030598
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 10:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=sgO3iV/8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318IjsAo130022;
	Wed, 8 Feb 2023 12:45:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675881954;
	bh=Gl8C/PvX6KdL2D0nUXCghdmYnyQP04ILLeY5+BMqYM0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sgO3iV/8jNA+vXUKu34fDFJY+veOxB0vTUdbCBWZjMlL91MbFvBXqjoeZEi77c7rx
	 p+iQPS5tHifEzbG+jLsVxY7FvwGSAAT0UmQKZKg40Plc+VXbWxM8LAw4PBUIyF7Gly
	 ERO/Hx1nC0WjGihxnqR8x7gnR9n8tq5zsJ6I3H7s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318IjsiI118742
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 12:45:54 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 12:45:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 12:45:54 -0600
Received: from [10.250.32.73] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318Ijriv070128;
	Wed, 8 Feb 2023 12:45:54 -0600
Message-ID: <6de90508-7a11-18cc-60ae-fee82c0672fe@ti.com>
Date: Wed, 8 Feb 2023 12:45:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <sinthu.raja@mistralsolutions.com>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>
CC: <denys@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sinthu Raja <sinthu.raja@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
 <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
 <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
 <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
 <4c12871e-0da5-423b-be26-6263ddc3ec03@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <4c12871e-0da5-423b-be26-6263ddc3ec03@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 318IjsAo130022
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 18:45:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15756



On 2/8/2023 12:28, Andrew Davis wrote:
> On 2/8/23 11:08 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
>> On Wed, Feb 8, 2023 at 10:31 PM Bajjuri, Praneeth <praneeth@ti.com>=20
>> wrote:
>>>
>>>
>>>
>>> On 2/8/2023 10:37 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>>
>>>> On 2/7/2023 9:13, Sinthu Raja wrote:
>>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>
>>>>> The AM68 SK has PWM output pins connected to its RPi headers. Add
>>>>> overlay file to enable PWM pins.
>>>>>
>>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> Address review comment:
>>>>> =C2=A0=C2=A0 - Remove extra space
>>>>>
>>>>> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
>>>>> =C2=A0=C2=A0 conf/machine/j721s2-evm.conf | 1 +
>>>>> =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/conf/machine/j721s2-evm.conf=20
>>>>> b/conf/machine/j721s2-evm.conf
>>>>> index 7c120dcc..f1127ed5 100644
>>>>> --- a/conf/machine/j721s2-evm.conf
>>>>> +++ b/conf/machine/j721s2-evm.conf
>>>>> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE =3D " \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-csi2-ov5640.d=
tbo \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-rpi-cam-imx21=
9.dtbo \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-fpdlink-fusion.d=
tbo \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-som-ddr_mem_carv=
eout.dtbo \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm-=
0-0.dtbo \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm-=
0-1.dtbo \
>>>>
>>>>
>>>> This file does not exists in the kernel (yet?).=C2=A0 I'm assuming t=
hat you
>>>> all have put in the patch for it and we are just playing a waiting=20
>>>> game?
>>>>
>>>> If that is the case, then I would appreciate (in the future) not
>>>> submitting these patches to the meta-ti mailing list until the kerne=
l
>>>> .dtb changes have been accepted into the kernel.=C2=A0 This is the s=
econd
>>>> patch in recent weeks that I'm having to sit on until the kernel=20
>>>> catches
>>>> up...
>>>>
>>>> It makes it really hard to test these patches if the kernel part is =
not
>>>> there, and I do not have the bandwidth to keep checking daily if the
>>>> change has made it into the public/cicd branches.
>>>>
>>>
>>> Agreed here.
>>> Sinthu, Please post the associated meta-ti change only once the kerne=
l
>>> dts change is merged to cicd build.
>>>
>> Agreed.
>>
>=20
> I'm going to slightly disagree, I don't see an issue with getting some
> early reviews. Just as long as you only post it as an "RFC" and only
> post the real "PATCH" when ready.

If the patch is doing more than just adding a dtb, or changing a SRCREV,=20
or anything that depends on an external repo to be updated then I would=20
agree.  Posting the change under the RFC banner (and clearly stating=20
that it will not build yet), it a great thing.


> I'd also like to poke again the idea of pulling in DTB/DTBO files based
> on some pattern matching instead of manually adding each time. I know t=
he
> idea got shot down, but I think this is going to be a growing problem a=
s
> we start to increase our usage of DT Overlays in the near future..

The one annoying with making all of the DTBs being patterns is that we=20
have to implement the logic to expand the wildcarding and set=20
KERNEL_DEVICETREE.  If anyone tries to point to a different kernel (say=20
an upstream version) then nothing from meta-ti will work.  And that may=20
not be a show stopper issue, it's just the one that popped up in my head=20
when you first brought up the idea for doing it for all platforms.

Maybe this would be a good feature to promote to bitbake to support?=20
And alternative to KERNEL_DEVICETREE?  A different variable?

> Andrew
>=20
>>> from what i see, the kernel patch is still under review.
>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15752):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/15752
>> Mute This Topic: https://lists.yoctoproject.org/mt/96808923/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

