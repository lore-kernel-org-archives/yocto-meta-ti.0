Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E0AC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:10:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9285.1675887025525568083
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=T94EciPX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318KAOMc043437;
	Wed, 8 Feb 2023 14:10:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675887024;
	bh=3qX5fEEM7aB1qvriTnvtCWiW6mtLq9uMmOjRuPQe7U8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=T94EciPXPFRQYMSe/pyD73f3ST0E4RgDk9Jwvo3iNezgemf7e1AMrwsDWMU0npSWZ
	 1pl9DJ2tgMjTy6hlPGTzAvrjXzAuLKoGNTA8yjvn6U/cGWPrumfa9QJMI3lCc7Xgei
	 mtz2fwTr2EBuTSnq4L+8tJsTrXwH+qhVgL9r4P/g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318KAOiI036610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 14:10:24 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 14:10:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 14:10:24 -0600
Received: from [10.250.32.98] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318KANAn086047;
	Wed, 8 Feb 2023 14:10:23 -0600
Message-ID: <831db73d-5100-9b5c-3f7e-4c62cd055d7a@ti.com>
Date: Wed, 8 Feb 2023 14:10:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, <sinthu.raja@mistralsolutions.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <sinthu.raja@mistralsolutions.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
CC: <denys@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sinthu Raja <sinthu.raja@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
 <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
 <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
 <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
 <4c12871e-0da5-423b-be26-6263ddc3ec03@ti.com>
 <6de90508-7a11-18cc-60ae-fee82c0672fe@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <6de90508-7a11-18cc-60ae-fee82c0672fe@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 318KAOMc043437
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15759

On 2/8/23 12:45 PM, Ryan Eatmon wrote:
>=20
>=20
> On 2/8/2023 12:28, Andrew Davis wrote:
>> On 2/8/23 11:08 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
>>> On Wed, Feb 8, 2023 at 10:31 PM Bajjuri, Praneeth <praneeth@ti.com> w=
rote:
>>>>
>>>>
>>>>
>>>> On 2/8/2023 10:37 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>>
>>>>>
>>>>> On 2/7/2023 9:13, Sinthu Raja wrote:
>>>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>>>
>>>>>> The AM68 SK has PWM output pins connected to its RPi headers. Add
>>>>>> overlay file to enable PWM pins.
>>>>>>
>>>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> Address review comment:
>>>>>> =C2=A0=C2=A0 - Remove extra space
>>>>>>
>>>>>> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
>>>>>> =C2=A0=C2=A0 conf/machine/j721s2-evm.conf | 1 +
>>>>>> =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-ev=
m.conf
>>>>>> index 7c120dcc..f1127ed5 100644
>>>>>> --- a/conf/machine/j721s2-evm.conf
>>>>>> +++ b/conf/machine/j721s2-evm.conf
>>>>>> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE =3D " \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-csi2-ov5640.=
dtbo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-rpi-cam-imx2=
19.dtbo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-fpdlink-fusion.=
dtbo \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-som-ddr_mem_car=
veout.dtbo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm=
-0-0.dtbo \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm=
-0-1.dtbo \
>>>>>
>>>>>
>>>>> This file does not exists in the kernel (yet?).=C2=A0 I'm assuming =
that you
>>>>> all have put in the patch for it and we are just playing a waiting =
game?
>>>>>
>>>>> If that is the case, then I would appreciate (in the future) not
>>>>> submitting these patches to the meta-ti mailing list until the kern=
el
>>>>> .dtb changes have been accepted into the kernel.=C2=A0 This is the =
second
>>>>> patch in recent weeks that I'm having to sit on until the kernel ca=
tches
>>>>> up...
>>>>>
>>>>> It makes it really hard to test these patches if the kernel part is=
 not
>>>>> there, and I do not have the bandwidth to keep checking daily if th=
e
>>>>> change has made it into the public/cicd branches.
>>>>>
>>>>
>>>> Agreed here.
>>>> Sinthu, Please post the associated meta-ti change only once the kern=
el
>>>> dts change is merged to cicd build.
>>>>
>>> Agreed.
>>>
>>
>> I'm going to slightly disagree, I don't see an issue with getting some
>> early reviews. Just as long as you only post it as an "RFC" and only
>> post the real "PATCH" when ready.
>=20
> If the patch is doing more than just adding a dtb, or changing a SRCREV=
, or anything that depends on an external repo to be updated then I would=
 agree.=C2=A0 Posting the change under the RFC banner (and clearly statin=
g that it will not build yet), it a great thing.
>=20

Fair, but in this case, even this simple change had an issue
and needed a v2, what might be trivial to us might need review
for folks new to all this. :)

>=20
>> I'd also like to poke again the idea of pulling in DTB/DTBO files base=
d
>> on some pattern matching instead of manually adding each time. I know =
the
>> idea got shot down, but I think this is going to be a growing problem =
as
>> we start to increase our usage of DT Overlays in the near future..
>=20
> The one annoying with making all of the DTBs being patterns is that we =
have to implement the logic to expand the wildcarding and set KERNEL_DEVI=
CETREE.=C2=A0 If anyone tries to point to a different kernel (say an upst=
ream version) then nothing from meta-ti will work.=C2=A0 And that may not=
 be a show stopper issue, it's just the one that popped up in my head whe=
n you first brought up the idea for doing it for all platforms.
>=20
> Maybe this would be a good feature to promote to bitbake to support? An=
d alternative to KERNEL_DEVICETREE?=C2=A0 A different variable?
>=20

That is an option, no need to make it TI specific, I'd imagine wildcard
filtering would be useful for many other's bsp layers.

Andrew

>> Andrew
>>
>>>> from what i see, the kernel patch is still under review.
>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#15752): https://lists.yoctoproject.org/g/meta-ti/=
message/15752
>>> Mute This Topic: https://lists.yoctoproject.org/mt/96808923/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>=20

