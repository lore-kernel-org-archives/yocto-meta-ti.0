Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58345C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:58:07 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2936.1742461080020694495
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 01:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=P4ahm9ZF;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52K8vsTh3196357
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 03:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742461074;
	bh=CQj14sikbQDTsO1Z9F2RP6TnupYOn3asXQKOCbVcYtk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P4ahm9ZFtgcOedOUaXignCou+FSrK/7iWyUmAWGJ6WnXeuwrBBfVvIbVEo4WyYEzl
	 T7Jg1ITsHTctfiTubkFHoDVWelJi380C0aHjP3Jlmqz6Kz+vJlrZmCs5/m0hth4tOe
	 1ZCVj+F6cNoRDvJqTfZJZ7Ma5zcJP+T1i7edoHBA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52K8vscd012769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 03:57:54 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 03:57:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 03:57:54 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52K8vpLM011835;
	Thu, 20 Mar 2025 03:57:52 -0500
Message-ID: <e2d64698-0e54-4c99-b42b-bfed0b24f83d@ti.com>
Date: Thu, 20 Mar 2025 14:27:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH] omap-a15.inc: don't include ipu1
 firmware in the boot partition
To: "Limaye, Aniket" <a-limaye@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, "Kumar, Udit" <u-kumar1@ti.com>,
        "CHAVDA, ANKIT" <a-chavda@ti.com>
References: <20250315020224.3100249-1-denis@denix.org>
 <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 52K8vsTh3196357
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:58:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18413


On 15/03/25 10:29, Limaye, Aniket wrote:
>
> On 3/15/2025 7:32 AM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> This reverts commit c58af0b172660ef1248a3454af06251d872770b1.
>>
>> This adds an undesired dependency on meta-ti-extras - more details:
>> https://lists.yoctoproject.org/g/meta-ti/topic/110003435
>>
>> Cc: Aniket Limaye <a-limaye@ti.com>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
>> ---
>
> The fw binary is actually a requirement for AM57x boards to boot now.=20
> U-Boot expects
> the firmware to be present in the boot partition, and fails if not foun=
d.
> (Beleswar can correct me if I'm mistaken).


The firmware is required for Early boot of remote processors (IPU in=20
this case) by U-Boot. Without the firmware, there won't be a system boot=20
failure, only rproc boot will fail.

>
> If we don't want to break this board, we need to maybe migrate the=20
> ti-ipc-rtos recipe from
> meta-ti-extras to meta-ti-bsp, since it is anyway a requirement for=20
> AM57X u-boot recipe.
> Denys, I also see that you mentioned that the ti-ipc-rtos recipe=20
> currently resides in extras
> due to the legacy recipes built from sources using old tools like XDC,=20
> SYS/BIOS and CGT...
> which cannot be easily moved to meta-ti-bsp.
>
> A temporary fix might be to somehow add these inside of=20
> meta-ti-extras/conf/layer.conf?
>
> However, I Ack the revert in case it is needed for now:
>
> Acked-by: Aniket Limaye <a-limaye@ti.com>
>
>
>> meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc=20
>> b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> index a258decd..be086936 100644
>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>> @@ -48,6 +48,5 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext=
2=20
>> screen alsa gpu mmip dsp gc3
>> =C2=A0 =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 WKS_FILE ?=3D "sdimage-2part.wks"
>> -IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}=20
>> ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
>> +IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}=20
>> ${UBOOT_EXTLINUX_BOOT_FILES}"
>> =C2=A0 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
>> -do_image_wic[depends] +=3D "ti-ipc-rtos:do_deploy"

