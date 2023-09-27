Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83903E82CC6
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:00:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.25393.1695841234025271090
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Sep 2023 12:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MuTWfomt;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38RJ0R0k017130;
	Wed, 27 Sep 2023 14:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695841227;
	bh=2zMYLFPNmnTT6b4UPhSwFAe6ufkCIDOptyzuYJBZ5wE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MuTWfomtl3POdYwqXs529EXOE4AiQaGXDTKbnuv2U+GuXYnmcevbAm/OoLQY2eA61
	 wrrqA+N4eZok5ey0OtAC6IzNsHdK79oP2c2GqfmoE0vt+pWjLAz0mDVJRY4WkFVGYU
	 /IPj/tPE3pdOvs2QFx8iym3GMr2GB9C4gDdO1dCQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38RJ0RQN009594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Sep 2023 14:00:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Sep 2023 14:00:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Sep 2023 14:00:27 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38RJ0Qrj116025;
	Wed, 27 Sep 2023 14:00:26 -0500
Message-ID: <ba8d9b4c-a500-5775-bfaa-88f6bb2ef881@ti.com>
Date: Wed, 27 Sep 2023 14:00:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [meta-ti] [dunfell PATCH] wic: move uboot/spls mountpoint to
 /boot/firmware
To: Tom Rini <trini@konsulko.com>, Bryan Brattlof <bb@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>,
        Res Sapp
	<rs@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
 <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
 <20220728113112.GF1146598@bill-the-cat>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220728113112.GF1146598@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Sep 2023 19:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17015

On 7/28/22 6:31 AM, Tom Rini wrote:
> On Mon, Jul 25, 2022 at 06:29:04PM -0500, Bryan Brattlof wrote:
>> On July 22, 2022 thus sayeth Tom Rini:
>>> On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
>>>> On July 21, 2022 thus sayeth Denys Dmytriyenko:
>>>>> I don't think this is a correct solution, or maybe I'm not understanding the
>>>>> problem. Can you please elaborate a bit more on the problem?
>>>>>
>>>>
>>>> I'm fairly new to yocto so I'm sure I've found the entirely wrong way to
>>>> get what I wanted :)
>>>>
>>>> After boot it appears /etc/fstab is setup to mount our vfat boot
>>>> partition to the /boot directory currently holding the Image and dtbs.
>>>> I guess because uboot has already thrown the kernel and dtb into ddr at
>>>> this point only Anand was able to notice this.
>>>>
>>>> My change should mount the vfat partition to /boot/firmware so we can
>>>> access to both our spls and kernel binaries in /boot.
>>>>
>>>> I'm also not sure what folder name to use here. It seem like there may
>>>> be a standard to this? Would /boot/uboot be more correct?
>>>
>>> So which SoCs are we talking about here?  For the 64bit parts, the
>>> intention should be that the FAT partition on p1 be functional as the
>>> ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
>>> how that's being treated in upstream OE around the notion of making an
>>> image that's what a UEFI system expects.
>>
>> Ideally this should be for all TI's K3 devices. I'm unfamiliar with the
>> UEFI format and don't know if we currently follow it, however I like the
>> idea of /boot/efi from what I googled.  I also found raspian is using
>> /boot/firmware. Could this be less of a standard than I think?
> 
> Keep in mind this is a generic OE on 64bit Arm problem and not a TI
> specific problem.  Where to mount the ESP should have a consistent
> default.  And it should look like it does on an off the shelf distro.
> 

While not an exact ESP partition, we are working on making our boot
partition as close as we can given ROM constraints.

I'm running into the problem now of updating kernel on a live system,
would fail as we have mounted our boot partition over the rootfs boot/
directory, so new images are not installed to the right spot/partition.

Let's go with /boot/efi if that works for everyone.

Bryan, could you re-send this with that change and the same for
sdimage-2part-efi.wks.in?

Andrew

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14912): https://lists.yoctoproject.org/g/meta-ti/message/14912
> Mute This Topic: https://lists.yoctoproject.org/mt/92535778/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

