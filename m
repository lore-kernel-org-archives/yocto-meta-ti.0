Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAFECAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:22:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.46999.1759123326872544004
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 22:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=PJYoGO6P;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58T5M6j72142606;
	Mon, 29 Sep 2025 00:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759123326;
	bh=+oytpI2y4LarLzxmb5J1DknmX9u1SdXguDhtGqNfwh4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PJYoGO6PfYrDY03dJM+hveNsaQ61co+PbpPEflR2wrwsFrzxDuzH8r6Dl52hv4InD
	 2/2TKFie3UV2QoeEpG1VAgFvvguIirhcf7pyEfzyRGJAqEfpap9+cT5mSXEW0f4DKb
	 t34Taj/3Ml3ABus76wR5igJO4vsTVZo885kwIpbk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58T5M5KA1674176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 29 Sep 2025 00:22:05 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 29
 Sep 2025 00:22:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 00:22:05 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58T5M1Ei663609;
	Mon, 29 Sep 2025 00:22:02 -0500
Message-ID: <e7320b7b-df90-484b-9269-10d501d08146@ti.com>
Date: Mon, 29 Sep 2025 10:52:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 3/4 v2] meta-ti-bsp: wic: Add a new GRUB config
 for TI platforms
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-4-m-shah@ti.com>
 <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <6e5d6135-9571-419d-8879-1626155c2a82@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58T5M6j72142606
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 05:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19071

Hey Ryan,

Thanks for the review.

On 24/09/25 02:45, Ryan Eatmon wrote:
>
>
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
>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in=20
>> b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> index ae38daa7..11912606 100644
>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> @@ -3,6 +3,6 @@
>> =C2=A0 # supports EFI.=C2=A0 Boot files are located in the first vfat =
partition=20
>> with extra
>> =C2=A0 # reserved space.=C2=A0 We cannot use a GPT here.
>> =C2=A0 -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4=20
>> ${TI_WKS_BOOTLOADER_APPEND}"
>> +bootloader --configfile=3D"ti-grub.cfg"
>
> Your change dropped the ${TI_WKS_BOOTLOADER_APPEND} which is used for=20
> am64 to specify the serial console.=C2=A0 This likely needs to be bette=
r=20
> tested before we just make blanket changes like that.

I will include all that was originally there viz.=20
${TI_WKS_BOOTLOADER_APPEND} in the grub.cfg, will that suffice?

>
>
>> =C2=A0 part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROV=
IDER}"=20
>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid=20
>> --fixed-size 128M
>> =C2=A0 part / --source rootfs --fstype=3Dext4 --label root --align 102=
4=20
>> --use-uuid
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
>
> Change the name to ti-core-initramfs.cpio.xz to match the other=20
> changes from patch #2.

Noted.

Regards,
Moteen

>
>
>> +}
>

