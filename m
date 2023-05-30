Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBA3C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 18:19:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1608.1685470742762328418
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 11:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=QoPNQB7p;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UIIxnE095813;
	Tue, 30 May 2023 13:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685470739;
	bh=NaQWSJBjqDFQ9jzzKDcAtzxbOWvNwDLOoKL5xR6bzmU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QoPNQB7pH63nyqTXLwKb4D7wEDYRaITNfe06d/IqTIp2Zzbe1Cb0fozvcp0qrUSPf
	 vifT7Tzr41q3vthSpOOxs0la9EKFcyzkzJXycxJfRH/M28TELq7NotjDU+hYxgg3Q/
	 NTuh3ZM4lxm0ZPbO4YeOfsQXd5OYRR4vIjsAq2LQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UIIxjv032490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 13:18:59 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 13:18:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 13:18:59 -0500
Received: from [10.250.34.213] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UIIwgI111067;
	Tue, 30 May 2023 13:18:58 -0500
Message-ID: <b3117ae0-ed42-07b7-2ee6-326332d82443@ti.com>
Date: Tue, 30 May 2023 13:18:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove
 extra ttyS* definitions
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <p-bhagat@ti.com>, <reatmon@ti.com>,
        <denis@denix.org>, <detheridge@ti.com>, <bb@ti.com>, <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230524200310.131510-1-rs@ti.com>
 <e2e7ae5c-25b0-5b71-5c91-40b6f49124ca@ti.com>
 <3ceb0e2a-7155-2a48-0391-3f3b71257897@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3ceb0e2a-7155-2a48-0391-3f3b71257897@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 34UIIxnE095813
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 18:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16632

On 5/30/23 1:11 PM, Randolph Sapp wrote:
> On 5/30/23 13:03, Andrew Davis wrote:
>> On 5/24/23 3:03 PM, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Adding serial consoles to this variable makes systemd attempt to star=
t a
>>> Getty instance on them. Getty has no retry limit and no retry timout.
>>> I'm sure you can guess where this is going.
>>>
>>> This fixes the endless start / stop Getty on ttyS0/ttyS3 messages tha=
t
>>> will flood the log until it's full.
>>>
>>> In the case of Jailhouse demos, the getty systemd service should be
>>> invoked upon demo start and stopped upon end of the demo. It should n=
ot
>>> be listed as a system serial interface since it will not be present
>>> during normal device operation.
>>>
>>> Before anyone asks, SERIAL_CONSOLES_CHECK only works on the sysVinit
>>> script so it's not worth discussing as a solution here.
>>>
>>
>> Sounds like the better solution then is to fix systemd to timeout
>> on SERIAL_CONSOLES_CHECK. We are not the only board with multiple
>> possible terminals in OE right now. Making systemd match sysv here
>> is something worth doing.
>>
>=20
> No, if a user logs out the serial-getty instance is restarted. If the c=
onsole isn't present when the service first starts then the service shoul=
d be restarted until it is. It's functioning as intended, do not edit tha=
t service.
>=20

If a user logs out it will return 0 and will be restarted "on-success".
If the console is not present the service *should* fail as it was told
to start on a non-existent console.

If you want to handle the case of a late attaching tty device, you
can have the service try again on attach, that functionality is part
of systemd/udev already.

The current behavior in this service does not match sysv nor what
SERIAL_CONSOLES_CHECK is meant for, and so should be fixed.

Andrew

>> Not tested but a bbappends that changes the service reset might do:
>>
>> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.serv=
ice
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.serv=
ice
>> @@ -32,7 +32,7 @@ Before=3Drescue.service
>> =C2=A0=C2=A0Environment=3D"TERM=3D@TERM@"
>> =C2=A0=C2=A0ExecStart=3D-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
>> =C2=A0=C2=A0Type=3Didle
>> -Restart=3Dalways
>> +Restart=3Don-success
>> =C2=A0=C2=A0UtmpIdentifier=3D%I
>> =C2=A0=C2=A0TTYPath=3D/dev/%I
>> =C2=A0=C2=A0TTYReset=3Dyes
>>
>> Andrew
>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
>>> =C2=A0 2 files changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bs=
p/conf/machine/include/am62xx.inc
>>> index c98da5f5..1274d3b5 100644
>>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>>> @@ -25,6 +25,3 @@ TFA_BOARD =3D "lite"
>>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>>> -
>>> -# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use t=
tyS3, so try both
>>> -SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS3"
>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/co=
nf/machine/include/k3.inc
>>> index c6b55239..97c6da94 100644
>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>> @@ -55,5 +55,5 @@ WKS_FILE ?=3D "${@bb.utils.contains("MACHINE_FEATUR=
ES", "efi", "sdimage-2part-efi.
>>> =C2=A0 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
>>> =C2=A0 do_image_complete[mcdepends] +=3D "mc::k3r5:ti-sci-fw:do_deplo=
y"
>>> -SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>>> +SERIAL_CONSOLES =3D "115200;ttyS2"
>>> =C2=A0 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>=20

