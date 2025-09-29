Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB5CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:23:02 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.751.1759159376216432253
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 08:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=AQ/oKrXV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58TFMtHk2243004;
	Mon, 29 Sep 2025 10:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759159375;
	bh=WyU3dzWOrP4etcetQJg6B6BnvB8nBgpeFaV6xWglGOs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AQ/oKrXVwNRavVpq3Azf4KI1hGWesewCJ+wUCL5wWauzoHk3RgA1ol6zfFfM94UwV
	 DVpxYGsD2UdQc2PlR9AR7q0Hso5NiY5IQTCJjs44w9e0OwrthPSyAu6eFWhcrgqR2p
	 xn7gqpcqE5/RxkTMPM1AonQg5q6W7uGRggFsFEWM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58TFMtVv1435208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 29 Sep 2025 10:22:55 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 29
 Sep 2025 10:22:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 10:22:54 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58TFMsTW1700959;
	Mon, 29 Sep 2025 10:22:54 -0500
Message-ID: <18b5400c-6380-4d25-a86f-09fdb73441f1@ti.com>
Date: Mon, 29 Sep 2025 10:22:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB config
 for TI platforms
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
 <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
 <e7320b7b-df90-484b-9269-10d501d08146@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e7320b7b-df90-484b-9269-10d501d08146@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58TFMtHk2243004
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 15:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19076



On 9/29/2025 12:22 AM, Moteen Shah wrote:
> Hey Ryan,
>=20
> Thanks for the review.
>=20
> On 24/09/25 02:45, Ryan Eatmon wrote:
>>
>>
>> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>>> Add a new grub config for TI specific platforms. While,
>>> only supporting to boot linux from filesystem on MMCSD, it
>>> will support booting linux and initrd image from eMMC, OSPI,
>>> UFS later down the line. Hence, make a new config altogether
>>> for easier development.
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
>>> =C2=A0 meta-ti-bsp/wic/ti-grub.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>> =C2=A0 2 files changed, 10 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 meta-ti-bsp/wic/ti-grub.cfg
>>>
>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/=20
>>> wic/sdimage-2part-efi.wks.in
>>> index ae38daa7..11912606 100644
>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>>> @@ -3,6 +3,6 @@
>>> =C2=A0 # supports EFI.=C2=A0 Boot files are located in the first vfat=
 partition=20
>>> with extra
>>> =C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>>> =C2=A0 -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4=20
>>> ${TI_WKS_BOOTLOADER_APPEND}"
>>> +bootloader --configfile=3D"ti-grub.cfg"
>>
>> Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used for=20
>> am64 to specify the serial console.=C2=A0 This likely needs to be bett=
er=20
>> tested before we just make blanket changes like that.
>=20
> I will include all that was originally there viz.=20
> ${TI_WKS_BOOTLOADER_APPEND} in the grub.cfg, will that suffice?

I doubt it.  Because the grub.cfg file will be installed and that=20
variable will not be set anywhere.  But I could be wrong.  You would=20
need to test it to be sure.


>>
>>
>>> =C2=A0 part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PRO=
VIDER}"=20
>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-=20
>>> size 128M
>>> =C2=A0 part / --source rootfs --fstype=3Dext4 --label root --align 10=
24 --=20
>>> use-uuid
>>> diff --git a/meta-ti-bsp/wic/ti-grub.cfg b/meta-ti-bsp/wic/ti-grub.cf=
g
>>> new file mode 100644
>>> index 00000000..b32b378f
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/wic/ti-grub.cfg
>>> @@ -0,0 +1,9 @@
>>> +# Set timeout and default options
>>> +set timeout=3D3
>>> +set default=3D0
>>> +
>>> +# Main boot entry
>>> +menuentry "Boot Linux" {
>>> +=C2=A0=C2=A0=C2=A0 linux /Image root=3D/dev/disk/by-label/root rootw=
ait rootfstype=3Dext4
>>> +=C2=A0=C2=A0=C2=A0 initrd /initrd.cpio.xz
>>
>> Change the name to ti-core-initramfs.cpio.xz to match the other=20
>> changes from patch #2.
>=20
> Noted.
>=20
> Regards,
> Moteen
>=20
>>
>>
>>> +}
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


