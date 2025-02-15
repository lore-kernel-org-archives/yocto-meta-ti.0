Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDADC021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 17:42:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.13582.1739641347682396910
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Feb 2025 09:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jO/eiJjl;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51FHgOxw351391
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 15 Feb 2025 11:42:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739641344;
	bh=b/hlcsm4UBv4tHtsu1kvbngISxQ4Y85stHEilZWeiHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jO/eiJjlOK9BZ+dF1tdWmR5XOvw6jSj8Qsm3/cpVh3HFflNQ6/GtptYzQl7cjmGdx
	 SWkf9H82egCoISXEjMVMp8SaUsbxridsYdvOwaehtzXOxQf8ZiIdGwI9LvSc7OyTkW
	 R/z5h7Iomd7WaNsaiNDRqXuE/vWh7ThV81cBCNDA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51FHgOIB062226;
	Sat, 15 Feb 2025 11:42:24 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 15
 Feb 2025 11:42:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 15 Feb 2025 11:42:24 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51FHgNFQ098032;
	Sat, 15 Feb 2025 11:42:23 -0600
Message-ID: <6603314c-3a21-4896-8a69-77244b1a97b8@ti.com>
Date: Sat, 15 Feb 2025 11:42:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] HACK: conf: machine: am64x: Use new
 sdimage efti wks template
To: Denys Dmytriyenko <denis@denix.org>
CC: <jm@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
References: <20250211231115.139972-1-jm@ti.com>
 <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
 <20250214233314.GW21608@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250214233314.GW21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Feb 2025 17:42:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18322

On 2/14/25 5:33 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 12, 2025 at 01:42:08PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 2/11/25 5:11 PM, Mendez, Judith via lists.yoctoproject.org wrote:
>>> Currently am64x boards are failing SD card boot since standard
>>> boot is the current boot method for the boards. With standard
>>> boot, the grub shell is invoked and the grub.cfg used to pass
>>> kernel parameters to Linux. Normally we would like to use grub
>>> class to modify the kernel parameters passed to Linux but
>>> since this is not currently working with SERIAL_CONSOLES nor
>>> GRUB_OPTS, lets make a template that includes our own custom
>>
>> Why do SERIAL_CONSOLES nor GRUB_OPTS work here? Should explain
>> that in this message.
>>
>> Looks like there is a comment that this needs fixed[0]. Since it
>> affects you now, might be good to go fix this upstream.
>>
>> For now, this seems like a GRUB issue.
> 
> Andrew,
> 
>> Why do we use GRUB again,
> 
> Might want to ask Nishanth for specific details, but this was part of
> the "generic distro boot" support and EFI boot on K3:
> 
> https://git.yoctoproject.org/meta-ti/commit/?id=993d80764de4d7c2b181d4262d18e950f86c3467
> https://git.yoctoproject.org/meta-ti/commit/?id=f2d9882e175db1832a90378a01f72d3c3b3f2264
> 
> 

I'm all for generic distro boot, things like extlinux.conf being provided
by the distro, and not baked into u-boot scripts, is the way to go.

But going distro/EFI doesn't mean going GRUB now that we have much simpler
options like systemd-boot and/or efistub, I'd like to look into those.
Or rather make sure there are no objections to dropping GRUB. And if
not, then actually doing the switch might be a good project for +Bryan,
who has already been working to streamline our boot strategy.

Andrew

>> isn't one bootloader enough?.. uboot-extlinux-config.bbclass
>> doesn't seem to have this issue, and the resulting extlinux.conf
>> can be used directly by U-Boot (or used by GRUB if we really want
>> to have a middle layer bootloader that only ends up breaking FIT,
>> DT overlays, rproc loading, security, etc..)
>>
>> <rant>
>> GRUB makes no sense on embedded, and it never did as we don't
>> have an x86 legacy BIOS, the only reason anyone still uses GRUB.
>> systemd-boot and efistub are the future for EFI capable systems
>> like ours. Simple, better security, and already available in
>> Yocto, let's switch already..
>> </rant>
>>
>> Andrew
>>
>> [0] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/grub-efi-cfg.bbclass#n22
>>
>>> console= and let am64x conf use this.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   meta-ti-bsp/conf/machine/include/am64xx.inc  | 2 ++
>>>   meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in | 8 ++++++++
>>>   2 files changed, 10 insertions(+)
>>>   create mode 100644 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>>> index 49e996c8..be65aa6e 100644
>>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>>> @@ -34,3 +34,5 @@ TFA_BOARD = "lite"
>>>   OPTEEMACHINE = "k3-am64x"
>>>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
>>> +
>>> +WKS_FILE = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi-csl.wks.in", "sdimage-2part.wks", d)}"
>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>>> new file mode 100644
>>> index 00000000..6dc69a17
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
>>> @@ -0,0 +1,8 @@
>>> +# short-description: Create SD card image with 2 partitions and EFI support
>>> +# long-description: Creates a partitioned SD card image for TI platforms that
>>> +# supports EFI.  Boot files are located in the first vfat partition with extra
>>> +# reserved space.  We cannot use a GPT here.
>>> +
>>> +bootloader --timeout=5 --append="rootfstype=ext4 console=ttyS2,115200n8"
>>> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>>> +part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid

