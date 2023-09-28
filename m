Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E7CCE7AFB
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 05:44:31 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.7999.1695879861888808263
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Sep 2023 22:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4Rig2bD;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: res.sapp@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-57bce354d94so3285376eaf.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 27 Sep 2023 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695879861; x=1696484661; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8M2H7cjtP0vfo+wjmmWtGgE3uVvMLAt8T8vOpasYg6g=;
        b=K4Rig2bDUn34KUgS/B2Rk/RB0tDcHEEEEOYMoQPKWJSfXJr4qG+lSS63klSndDrkfF
         vIsQywca70HSqCY/tAv1u/nif0p9MfcR0IxLl4YTf6M61OkmijZHv4x2FFfv124Pg5Yw
         GWeNM7MUICvBLmY/W8T9QiptAhYMoNnOz6tADrxEsOfLMdhrxRZR5jw52C0TeUKCcDZW
         K9u6YJKZ7E7KWttsqb4JDSoEuelJJ58nTqy2i8M9aHkfD7l5hjHOLK6tHG59V1REd8NX
         FHern1kfsz34GVRKf43+hkqrQnER2QwFIi2OPUd6Ah6ztdsHgk+xYzIqJ9/t0pFjt34A
         X2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695879861; x=1696484661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8M2H7cjtP0vfo+wjmmWtGgE3uVvMLAt8T8vOpasYg6g=;
        b=I0+OAmKzuB1wyaYd+WwDAuv78yNIRrMDB7+x+NJ1HJIUv5nvyrMhtFfwxdGRz2W5lo
         xinho/s9sMgvpHc9hyNeI+FTHp9cjVdEqgD7Q/m9kjchyxCJBhyUXSzvNgopNFPXnuGM
         Sg5xZEiaczhSxkgM8W2YEscb2aowR4Wew6s6Mm9T7V1v2breiMXHOqQ4+Q+gwZBKT8qS
         m0lCV0RYBinUHgXXfFW4aL/tmfcIFpC8fhsrz2QhLLOq5bbvLZaszZAnuRWd1BGHQHiC
         Kzcx5i3cmL0j15fHKKh/jvwGyFweKrRhE6M7S9usYqXSS8qnh7dYX04SPXa62BPpwja5
         67Qw==
X-Gm-Message-State: AOJu0Yz9nEmPhMRhtXkIH2UkQzuq1nIzBIajkfjEk9EmNraWEkN0qaHy
	zjGAeYvLxVQyhO1hIeSLOTI=
X-Google-Smtp-Source: AGHT+IE/WW6ZX7l7rRHlhwoab8OnJgy20+mLwNwkdgjDjs1CBO62pHtcmMGCbrOQA171dqxZdGNuKw==
X-Received: by 2002:a05:6870:2314:b0:1c8:bfd1:ecc0 with SMTP id w20-20020a056870231400b001c8bfd1ecc0mr289470oao.0.1695879861007;
        Wed, 27 Sep 2023 22:44:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:eec4:a85f::3? ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id x21-20020a056870b1d500b001dd759484ffsm880030oak.20.2023.09.27.22.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 22:44:20 -0700 (PDT)
Message-ID: <e8d92c23-cf7b-4b5f-8092-ab587169c026@gmail.com>
Date: Thu, 28 Sep 2023 00:44:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [dunfell PATCH] wic: move uboot/spls mountpoint to
 /boot/firmware
Content-Language: en-US, en-US-large
To: Tom Rini <trini@konsulko.com>, Andrew Davis <afd@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Denys Dmytriyenko <denis@denix.org>,
 Ryan Eatmon <reatmon@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>,
 Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
 <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
 <20220728113112.GF1146598@bill-the-cat>
 <ba8d9b4c-a500-5775-bfaa-88f6bb2ef881@ti.com>
 <20230927190239.GC305624@bill-the-cat>
From: Res Sapp <res.sapp@gmail.com>
In-Reply-To: <20230927190239.GC305624@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 05:44:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17018

On 9/27/23 14:02, Tom Rini wrote:
> On Wed, Sep 27, 2023 at 02:00:26PM -0500, Andrew Davis wrote:
>> On 7/28/22 6:31 AM, Tom Rini wrote:
>>> On Mon, Jul 25, 2022 at 06:29:04PM -0500, Bryan Brattlof wrote:
>>>> On July 22, 2022 thus sayeth Tom Rini:
>>>>> On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
>>>>>> On July 21, 2022 thus sayeth Denys Dmytriyenko:
>>>>>>> I don't think this is a correct solution, or maybe I'm not understanding the
>>>>>>> problem. Can you please elaborate a bit more on the problem?
>>>>>>>
>>>>>>
>>>>>> I'm fairly new to yocto so I'm sure I've found the entirely wrong way to
>>>>>> get what I wanted :)
>>>>>>
>>>>>> After boot it appears /etc/fstab is setup to mount our vfat boot
>>>>>> partition to the /boot directory currently holding the Image and dtbs.
>>>>>> I guess because uboot has already thrown the kernel and dtb into ddr at
>>>>>> this point only Anand was able to notice this.
>>>>>>
>>>>>> My change should mount the vfat partition to /boot/firmware so we can
>>>>>> access to both our spls and kernel binaries in /boot.
>>>>>>
>>>>>> I'm also not sure what folder name to use here. It seem like there may
>>>>>> be a standard to this? Would /boot/uboot be more correct?
>>>>>
>>>>> So which SoCs are we talking about here?  For the 64bit parts, the
>>>>> intention should be that the FAT partition on p1 be functional as the
>>>>> ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
>>>>> how that's being treated in upstream OE around the notion of making an
>>>>> image that's what a UEFI system expects.
>>>>
>>>> Ideally this should be for all TI's K3 devices. I'm unfamiliar with the
>>>> UEFI format and don't know if we currently follow it, however I like the
>>>> idea of /boot/efi from what I googled.  I also found raspian is using
>>>> /boot/firmware. Could this be less of a standard than I think?
>>>
>>> Keep in mind this is a generic OE on 64bit Arm problem and not a TI
>>> specific problem.  Where to mount the ESP should have a consistent
>>> default.  And it should look like it does on an off the shelf distro.
>>>
>>
>> While not an exact ESP partition, we are working on making our boot
>> partition as close as we can given ROM constraints.
>>
>> I'm running into the problem now of updating kernel on a live system,
>> would fail as we have mounted our boot partition over the rootfs boot/
>> directory, so new images are not installed to the right spot/partition.
>>
>> Let's go with /boot/efi if that works for everyone.
>>
>> Bryan, could you re-send this with that change and the same for
>> sdimage-2part-efi.wks.in?
> 
> The only feedback I would provide here is to work with the ROM team to
> fix whatever constraints prevent an "ESP" itself from being used as this
> will hinder the long term viability of the processors being widely
> supported.

Haha, this debate has lasted so long that systemd-boot has standardized 
mounting the ESP partition to just /efi now [1].

[1] https://www.freedesktop.org/software/systemd/man/systemd-boot.html

Randolph

