Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F254CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 17:23:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2703.1758821025111194718
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 10:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NLWL63HK;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PHNhJu1481164;
	Thu, 25 Sep 2025 12:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758821023;
	bh=KHcOKHiyYoIl5kVWmC01TipGMY50atDE8vuAyrZYzOA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NLWL63HK1oUlpbxpdt0CSEOF5MHUg79V2GDrMtGByjzNoL9BeLFT6lC7asWqMs6Oo
	 Ukcw71lClmdKbeEjbhfiVPkWqRzDy/TM7UwE35lRD3r3e+QYi5QyeJocOhvE6TYMfr
	 usXhR4ish4utgzCxzDFoKb9wgdsiqTabxODZoH80=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PHNh5i332216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 12:23:43 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 12:23:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 12:23:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PHNgET4111357;
	Thu, 25 Sep 2025 12:23:42 -0500
Message-ID: <88e41345-a0a5-4897-afaf-ba1435be5758@ti.com>
Date: Thu, 25 Sep 2025 12:23:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB
 config for TI platforms
To: <reatmon@ti.com>, Moteen Shah <m-shah@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
 <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58PHNhJu1481164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Sep 2025 17:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19063

On 9/23/25 4:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>> Add a new grub config for TI specific platforms. While,
>> only supporting to boot linux from filesystem on MMCSD, it
>> will support booting linux and initrd image from eMMC, OSPI,
>> UFS later down the line. Hence, make a new config altogether
>> for easier development.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>> =C2=A0 meta-ti-bsp/wic/ti-grub.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>> =C2=A0 2 files changed, 10 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg
>>
>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wi=
c/sdimage-2part-efi.wks.in
>> index ae38daa7..11912606 100644
>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> @@ -3,6 +3,6 @@
>> =C2=A0 # supports EFI.=C2=A0 Boot files are located in the first vfat =
partition with extra
>> =C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 ${TI_WKS_BOOTL=
OADER_APPEND}"
>> +bootloader --configfile=3D"ti-grub.cfg"
>=20
> Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used for a=
m64 to specify the serial console.=C2=A0 This likely needs to be better t=
ested before we just make blanket changes like that.
>=20

Just a side note on this, AM64 needs "console=3DttyS2,115200n8" passed in=
 on the kernel
command line or you will not get kernel output. This is something we can =
pass to all
K3 boards (although not strictly needed for other boards, it is safe/corr=
ect to do
for them all). Non-K3 boards will want "console=3DttyS0,115200n8" (note t=
heS0). So
having this selectable per-SoC/family is still useful.

Andrew

>=20
>> =C2=A0 part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROV=
IDER}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fi=
xed-size 128M
>> =C2=A0 part / --source rootfs --fstype=3Dext4 --label root --align 102=
4 --use-uuid
>> diff --git a/meta-ti-bsp/wic/ti-grub.cfg b/meta-ti-bsp/wic/ti-grub.cfg
>> new file mode 100644
>> index 00000000..b32b378f
>> --- /dev/null
>> +++ b/meta-ti-bsp/wic/ti-grub.cfg
>> @@ -0,0 +1,9 @@
>> +# Set timeout and default options
>> +set timeout=3D3
>> +set default=3D0
>> +
>> +# Main boot entry
>> +menuentry "Boot Linux" {
>> +=C2=A0=C2=A0=C2=A0 linux /Image root=3D/dev/disk/by-label/root rootwa=
it rootfstype=3Dext4
>> +=C2=A0=C2=A0=C2=A0 initrd /initrd.cpio.xz
>=20
> Change the name to ti-core-initramfs.cpio.xz to match the other changes=
 from patch #2.
>=20
>> +}
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19057): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19057
> Mute This Topic: https://lists.yoctoproject.org/mt/115325157/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


