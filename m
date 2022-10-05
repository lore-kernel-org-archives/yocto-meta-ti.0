Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511B4C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:43:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1086.1664991813218202718
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SDV9RTea;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 295GNSTT031255;
	Wed, 5 Oct 2022 11:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664987008;
	bh=APvUROR6WQTaZb0EO1aBzebUp57funM+9s9DHBoM2ao=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=SDV9RTea3gEQbBM3pP9Bsltrukxq3KLuaVNmZQ+czncq1h2/sFHt1abSFTkiX5A6i
	 tHYuEd4PRC2s4wnlvgzQTl+eUoCh+JSXsG77H5oAyWIm+AKCCDYYYRvelSILbkeHP6
	 EvBo4yJmboTZ1NP10z5lQYxn68Ozb7tKLdFCun4U=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 295GNSYh023159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Oct 2022 11:23:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 5 Oct
 2022 11:23:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 5 Oct 2022 11:23:28 -0500
Received: from [10.250.35.37] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 295GNSQG045582;
	Wed, 5 Oct 2022 11:23:28 -0500
Message-ID: <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
Date: Wed, 5 Oct 2022 11:23:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Content-Language: en-US
To: Paul Barker <paul.barker@sancloud.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:43:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15113

On 10/5/22 7:47 AM, Paul Barker wrote:
> On 28/09/2022 15:21, Paul Barker wrote:
>> Hi Andrew,
>>
>> On 27/09/2022 18:53, Andrew Davis wrote:
>>> On 9/27/22 12:01 PM, Paul Barker wrote:
>>>> Hi folks,
>>>>
>>>> I'm trying to add support for the Yocto Project kirkstone release to our
>>>> meta-sancloud BSP layer and I'm facing a build issue. I've reproduced the
>>>> issue using just the meta-ti layer and its dependencies, targeting the
>>>> beaglebone machine. I've used the kirkstone-next branch of meta-ti as
>>>> the kirkstone branch has not been updated in 5 months and has the same
>>>> issue.
>>>>
>>>> The build fails due to a lack of buildable providers for virtual/libgl.
>>>> Is this a known issue?
>>>>
>>>
>>>
>>> I've run into this before, Cairo package pulls in desktop OpenGL when
>>> GLES2 would be more appropriate. I'll look for the exact fix but
>>> you can try putting this in your distro .conf file:
>>>
>>> PACKAGECONFIG_remove_pn-cairo = "opengl"
>>> PACKAGECONFIG_append_pn-cairo = " egl"
>>> PACKAGECONFIG_append_pn-cairo = " glesv2"
>>
>> If these settings are required they should be applied by default (perhaps via a
>> MACHINE_FEATURE). I would expect the beaglebone machine to build
>> "out-of-the-box" with the poky distro. If that really isn't possible then
>> necessary settings should be documented in the readme file for the layer, added
>> to a local.conf.sample file or applied via a setup script.
>>
>> Thanks
> Looking at this again today, I attempted to try the above PACKAGECONFIG changes
> however they do not match the correct override syntax for kirkstone. That
> suggests to me that they haven't been tested.
> 

They have not been tested on Kirkstone. These are the changes I needed for
Dunfell, I'd guess fixing the override syntax and trying the same on
Kirkstone will help your issue, but no guarantees.

> Please also note that this is not specificly an issue with the cairo
> configuration, attempting to build core-image-x11 & core-image-weston also fail.
> For example, for core-image-x11 the errors are as follows, re-tested today with
> the current HEAD of the kirkstone branch (2b11afa8aa19):
> 
> ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb, /workdir/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb, /workdir/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
> mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa, not mesa-gl
> mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-ddk-um, not mesa
> NOTE: Runtime target 'xserver-xorg' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xserver-xorg', 'virtual/libgl']
> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
> ERROR: Required build target 'core-image-x11' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-x11', 'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
> 
> Is the kirkstone branch currently tested or expected to work? If there are known
> limitations or additional configuration changes neccessary in local.conf, could
> they be documented in the readme?
> 

Kirkstone is still WIP, the base builds and boots, but there are some
spots still being readied yet (especially around graphics).

Xorg by default assumes desktop OpenGL support, being an embedded device
we only support OpenGLES. Xorg does work just fine with OpenGLES but
you have to tell it what to use with distro level PACKAGECONFIG selecting
(same for cairo).

In the future I'd like to split the "opengl" DISTRO_FEATURE into two
(one for OpenGL and one for GLES2) and move them into MACHINE_FEATURE
where they belong. Then we can set these down in the BSP layer.
Until then you'll have to do the manual selecting.

Thanks,
Andrew

> Thanks,
> 

