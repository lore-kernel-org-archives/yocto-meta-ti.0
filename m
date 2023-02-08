Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6D1C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:01:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3545.1675875710041090453
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 09:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=soEq3Wsc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318H1nKv005551;
	Wed, 8 Feb 2023 11:01:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675875709;
	bh=1TvIzl04qreL81pynp5yXSDO0I8YIAZyWBhkuGIsRs8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=soEq3WscD0d9tvtIAReulNu9THE0aasZxQ992twNWANYhdcFij5gToE96tzJW1pVT
	 mi8nCAMA2tKzhvwtmY+dN7VSDPiRPkUYDkZSvtrQXbAsGQ128W8cMOBzhMzctoLAXT
	 jxUjmQdOsFGB9x4tTD+rKuu40KO0jjhwEsUykvCc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318H1nnx054973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 11:01:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 11:01:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 11:01:48 -0600
Received: from [10.247.18.194] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318H1mVH110019;
	Wed, 8 Feb 2023 11:01:48 -0600
Message-ID: <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
Date: Wed, 8 Feb 2023 11:01:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Content-Language: en-US
To: <reatmon@ti.com>, Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>,
        "Kumar, Udit" <u-kumar1@ti.com>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
 <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 318H1nKv005551
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 17:01:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15751



On 2/8/2023 10:37 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/7/2023 9:13, Sinthu Raja wrote:
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> The AM68 SK has PWM output pins connected to its RPi headers. Add
>> overlay file to enable PWM pins.
>>
>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> ---
>>
>> Changes in v2:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Address review comment:
>> =C2=A0 - Remove extra space
>>
>> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
>> =C2=A0 conf/machine/j721s2-evm.conf | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.co=
nf
>> index 7c120dcc..f1127ed5 100644
>> --- a/conf/machine/j721s2-evm.conf
>> +++ b/conf/machine/j721s2-evm.conf
>> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-fpdlink-fusion.dtbo \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am68-sk-som-ddr_mem_carveout.dtbo=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo =
\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo =
\
>=20
>=20
> This file does not exists in the kernel (yet?).=C2=A0 I'm assuming that=
 you=20
> all have put in the patch for it and we are just playing a waiting game=
?
>=20
> If that is the case, then I would appreciate (in the future) not=20
> submitting these patches to the meta-ti mailing list until the kernel=20
> .dtb changes have been accepted into the kernel.=C2=A0 This is the seco=
nd=20
> patch in recent weeks that I'm having to sit on until the kernel catche=
s=20
> up...
>=20
> It makes it really hard to test these patches if the kernel part is not=
=20
> there, and I do not have the bandwidth to keep checking daily if the=20
> change has made it into the public/cicd branches.
>=20

Agreed here.
Sinthu, Please post the associated meta-ti change only once the kernel=20
dts change is merged to cicd build.

from what i see, the kernel patch is still under review.

>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15750): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15750
> Mute This Topic: https://lists.yoctoproject.org/mt/96808923/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695566/216=
7429/1935739249/xyzzy [praneeth@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

