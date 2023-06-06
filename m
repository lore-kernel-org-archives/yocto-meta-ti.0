Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F3EC7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:53:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1785.1686088403255885383
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=qWvD3u6r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356LrIfO089237;
	Tue, 6 Jun 2023 16:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686088398;
	bh=N66FQGvM4SStii+gDlva9dXFuNUkA9mTvxs8K0f4Jv8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qWvD3u6r339skEDyBc4y75TrIF0e/7W6Av7QCfaKOkrNQEahpDjmHNVJu2Uop5XDe
	 A91/iUCZwDOYEjEIes5QF1fOjwKLwNFCwtAnAkg1lKEbtPInpxVo2p7JcFlPv5mY4x
	 FvsH15pgkrINZeldUlpmBN430fo5h6Qxt1clvRtM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356LrI9F119325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 16:53:18 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 16:53:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 16:53:18 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356LrIFc045089;
	Tue, 6 Jun 2023 16:53:18 -0500
Message-ID: <2663be52-e034-2a0e-7f97-0b61c729eccb@ti.com>
Date: Tue, 6 Jun 2023 16:53:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove the
 ttyS0 definition
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230606193353.910110-1-rs@ti.com>
 <215e6086-67bc-388e-f8d4-34657553ec56@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <215e6086-67bc-388e-f8d4-34657553ec56@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 356LrIfO089237
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:53:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16683

On 6/6/23 16:21, Andrew Davis wrote:
> On 6/6/23 2:33 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Adding serial consoles to this variable makes systemd attempt to start=
 a
>> Getty instance on them. Getty has no retry limit and no retry timout.
>> I'm sure you can guess where this is going.
>>
>> This fixes the endless start / stop Getty on ttyS0/ttyS3 messages that
>> will flood the log until it's full.
>>
>> In the case of Jailhouse demos, the getty systemd service should be
>> invoked upon demo start and stopped upon end of the demo. It should no=
t
>> be listed as a system serial interface since it will not be present
>> during normal device operation.
>>
>> Before anyone asks, SERIAL_CONSOLES_CHECK only works on the sysVinit
>> script so it's not worth discussing as a solution here.
>>
>=20
> serial-getty-generator does work on Kirkstone, lets just go with that:
>=20
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend=20
> b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index 9e49ac69..1f2513c4 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -2,7 +2,7 @@ PR:append =3D ".arago6"
>=20
>  =C2=A0FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>=20
> -PACKAGECONFIG:append =3D " networkd resolved"
> +PACKAGECONFIG:append =3D " networkd resolved serial-getty-generator"
>  =C2=A0USERADD_PARAM:${PN} +=3D "--system -d / -M --shell /bin/nologin=20
> systemd-network;"
>  =C2=A0USERADD_PARAM:${PN} +=3D "--system -d / -M --shell /bin/nologin=20
> systemd-resolve;"
>=20
> Andrew
>=20

Yeah, I've got a patch to enable it and revert all serial definitions to=20
sysVinit only fields. Didn't mean to send this again, was on the wrong=20
branch when I invoked git send-email.

>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
>> =C2=A0 2 files changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index c98da5f5..1274d3b5 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -25,6 +25,3 @@ TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>> -
>> -# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use=20
>> ttyS3, so try both
>> -SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS3"
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>> b/meta-ti-bsp/conf/machine/include/k3.inc
>> index c6b55239..97c6da94 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -55,5 +55,5 @@ WKS_FILE ?=3D=20
>> "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.
>> =C2=A0 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
>> =C2=A0 do_image_complete[mcdepends] +=3D "mc::k3r5:ti-sci-fw:do_deploy=
"
>> -SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>> +SERIAL_CONSOLES =3D "115200;ttyS2"
>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"


