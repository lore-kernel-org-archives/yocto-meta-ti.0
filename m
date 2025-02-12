Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD0AC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 22:42:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1624.1739400149945781058
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 14:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=x6B2J0aj;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: jm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CMgS1r3990316
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Feb 2025 16:42:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739400149;
	bh=h3elNP/HZaTYGe+uGnBs1LL4AL2rNnYW7mJABDRB3o4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=x6B2J0aj6CAdfDv19bYf6+r48egZ0mFql+/dXy9cMUjhW4bnjhH2UtjBybkSZBteC
	 e6P3k9Ih1Y9L7oUvVAFM+eJ70NTqREDAXYIjx3YvsOBheZPhnD0RS2qKoApDywzIep
	 wHm38QjdOXVMeMpKKGXvUQbiHEWoJk5hS6TZvOKs=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CMgSOi046307;
	Wed, 12 Feb 2025 16:42:28 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 16:42:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 16:42:28 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CMgS5C045263;
	Wed, 12 Feb 2025 16:42:28 -0600
Message-ID: <9c0b57a7-99a7-4944-8eef-49f0ad3f602e@ti.com>
Date: Wed, 12 Feb 2025 16:42:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] HACK: conf: machine: am64x: Use new
 sdimage efti wks template
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <reatmon@ti.com>
References: <20250211231115.139972-1-jm@ti.com>
 <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 51CMgS1r3990316
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 22:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18306

Hi Andrew,

On 2/12/25 1:42 PM, Andrew Davis wrote:
> On 2/11/25 5:11 PM, Mendez, Judith via lists.yoctoproject.org wrote:
>> Currently am64x boards are failing SD card boot since standard
>> boot is the current boot method for the boards. With standard
>> boot, the grub shell is invoked and the grub.cfg used to pass
>> kernel parameters to Linux. Normally we would like to use grub
>> class to modify the kernel parameters passed to Linux but
>> since this is not currently working with SERIAL_CONSOLES nor
>> GRUB_OPTS, lets make a template that includes our own custom
>=20
> Why do SERIAL_CONSOLES nor GRUB_OPTS work here? Should explain
> that in this message.

According to the grub class, I believe we are supposed to be able
to modify GRUB_OPTS to append variables, for grub config. It was not
working for me.

SERIAL_CONSOLES is a bit of a misery to me. Although I did not spend
to much time on this, I tested both variables to see if the default
console would change but it did not work. So I am just pointing that
out as well.

>=20
> Looks like there is a comment that this needs fixed[0]. Since it
> affects you now, might be good to go fix this upstream.

Yes, that is a good idea. Ill keep it in mind, thanks.

>=20
> For now, this seems like a GRUB issue. Why do we use GRUB again,
> isn't one bootloader enough?.. uboot-extlinux-config.bbclass
> doesn't seem to have this issue, and the resulting extlinux.conf
> can be used directly by U-Boot (or used by GRUB if we really want
> to have a middle layer bootloader that only ends up breaking FIT,
> DT overlays, rproc loading, security, etc..)
>=20
> <rant>
> GRUB makes no sense on embedded, and it never did as we don't
> have an x86 legacy BIOS, the only reason anyone still uses GRUB.
> systemd-boot and efistub are the future for EFI capable systems
> like ours. Simple, better security, and already available in
> Yocto, let's switch already..
> </rant>

I do not have a strong opinion on what bootloader to use. imo, I think
we should just select one unanimously and be done with it.

Probably this will never happen.

Sign.. in any case, we have a grub config issue in our hands, so was
fixing it as quick as possible to unblock CICD.

~ Judith


>=20
> Andrew
>=20
> [0]=20
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe=
/grub-efi-cfg.bbclass#n22
>=20
>> console=3D and let am64x conf use this.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/am64xx.inc=C2=A0 | 2 ++
>> =C2=A0 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in | 8 ++++++++
>> =C2=A0 2 files changed, 10 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 49e996c8..be65aa6e 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -34,3 +34,5 @@ TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am64x"
>> =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw pruhsr-fw p=
rusw-fw"
>> +
>> +WKS_FILE =3D "${@bb.utils.contains("MACHINE_FEATURES", "efi",=20
>> "sdimage-2part-efi-csl.wks.in", "sdimage-2part.wks", d)}"
>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in=20
>> b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>> new file mode 100644
>> index 00000000..6dc69a17
>> --- /dev/null
>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>> @@ -0,0 +1,8 @@
>> +# short-description: Create SD card image with 2 partitions and EFI=20
>> support
>> +# long-description: Creates a partitioned SD card image for TI=20
>> platforms that
>> +# supports EFI.=C2=A0 Boot files are located in the first vfat partit=
ion=20
>> with extra
>> +# reserved space.=C2=A0 We cannot use a GPT here.
>> +
>> +bootloader --timeout=3D5 --append=3D"rootfstype=3Dext4 console=3DttyS=
2,115200n8"
>> +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}"=
=20
>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid=20
>> --fixed-size 128M
>> +part / --source rootfs --fstype=3Dext4 --label root --align 1024=20
>> --use-uuid
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18300):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/18300
>> Mute This Topic: https://lists.yoctoproject.org/mt/111133257/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


