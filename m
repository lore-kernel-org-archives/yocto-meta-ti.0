Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BD6C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:53:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.124334.1698076373600650662
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wyb3zxei;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NFqnQD056279;
	Mon, 23 Oct 2023 10:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698076369;
	bh=ku/6ERRGaZnNbgmSBO1z4ryfQn2N73n+pSRA57ObvvU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wyb3zxei6kM4EB0lTEIBWdTSPpVwnAj8H+9zvJa9RB/bCToMpDDABRXCGnSFckzCJ
	 55aFb6QDit8+SQhFVdoiEfsURIZtd7KnXl+H6T1ZczT+FOCpuAWAerQVYvG4WuhNaw
	 JBGN0HQMzpoAi+YgWdARc2s6KmKzOqFBSAq6ZgX0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NFqnjb073260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 10:52:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 10:52:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 10:52:49 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NFqnf2022158;
	Mon, 23 Oct 2023 10:52:49 -0500
Message-ID: <4ce5d40f-3e97-4266-a695-b76be040e967@ti.com>
Date: Mon, 23 Oct 2023 10:52:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone][PATCH 5/5] conf: beagle*: recommend
 essential FW images for Beagle devices
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-5-denis@denix.org>
 <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 39NFqnQD056279
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:53:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17168



On 10/23/2023 10:50 AM, Andrew Davis via lists.yoctoproject.org wrote:
> On 10/20/23 3:44 PM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommend=
ed
>> essential FW images to be added to rootfs by default.
>>
>> Correct beagle-x15 to pull devicetrees and kernel image as well.
>>
>=20
> Would it be better to have the bb.org kernel pull in=20
> `kernel-rdepends.inc` like
> the other kernels and get all these RDEPENDS/RRECOMMENDS from that?

Someone submitted that patch earlier and I was hoping that Denys was=20
going to address it as part of this series.


> Andrew
>=20
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/beagle-x15.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 ++
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 ++
>> =C2=A0 meta-ti-bsp/conf/machine/beagleplay.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 3 +++
>> =C2=A0 4 files changed, 10 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf=20
>> b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> index be27705c..3b857165 100644
>> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
>> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> @@ -19,3 +19,5 @@ MACHINE_GUI_CLASS =3D "bigscreen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
>> =C2=A0 UBOOT_MACHINE =3D "am57xx_evm_config"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-zimage"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 2f9c7288..3f5a027e 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
>> =C2=A0 "
>> =C2=A0 MACHINE_GUI_CLASS =3D "bigscreen"
>> +
>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-image"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone.conf
>> index 2d811d0d..45944ce8 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
>> @@ -23,3 +23,5 @@ MACHINE_FEATURES +=3D "screen"
>> =C2=A0 SERIAL_CONSOLES =3D "115200;ttyS0"
>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-zimage"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf=20
>> b/meta-ti-bsp/conf/machine/beagleplay.conf
>> index 6a0f697f..4dd550a1 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
>> =C2=A0 "
>> =C2=A0 MACHINE_GUI_CLASS =3D "bigscreen"
>> +
>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree=20
>> kernel-image-image"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D ""
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17166): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17166
> Mute This Topic: https://lists.yoctoproject.org/mt/102089684/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

