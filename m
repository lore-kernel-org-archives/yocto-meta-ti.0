Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC18C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:30:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.23982.1747920611421755278
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 May 2025 06:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x2j4kZ3X;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54MDU7qn605683;
	Thu, 22 May 2025 08:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747920607;
	bh=xAAzP030vQhawSAGBvvxz5YiqyuUH1t5nPXB9xZOc7E=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=x2j4kZ3XmRZYgb1gr6tugmiSC6jYrn3Az2diwn8XvoyL6S8UtlEzn7amQ3mg8h9FJ
	 xebZvoiGoKYWiutGo4+I2ec4L47mj8PZoE+zMOxZ59XxvEUFGJx6X38jfvk5thxitN
	 ttgOv1IbV2V7hR5W5J2O7KRvjXFi/M0rMubxXQCA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54MDU6q33022611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 08:30:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 08:30:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 08:30:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54MDU6F1033921;
	Thu, 22 May 2025 08:30:06 -0500
Message-ID: <fed58e89-af6a-4925-ac3d-e894203dd0e3@ti.com>
Date: Thu, 22 May 2025 08:30:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup error
To: <sebastian.krahl@lacon.de>, <meta-ti@lists.yoctoproject.org>
References: <1013.1747134334265598229@lists.yoctoproject.org>
 <20405.1747834624930341770@lists.yoctoproject.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20405.1747834624930341770@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 May 2025 13:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18587

Decided to give this a test run here locally. I can confirm the display does not work
for BeagleBone Black with the "am335x-evm" MACHINE. It seems something is missing
from our vendor kernel to make the HDMI work, but luckily that change is available
in the Beagle kernel tree. We can use the latest Beagle kernel v6.6 by setting
MACHINE=beaglebone. If we want Beagle kernel v6.12 we will need some patches
available in `scarthgap-wip`[0], that is what I used for testing here.

With that I can build `core-image-weston` and see the HDMI display works, but
not weston, only boot console.. So checking the logs, I see in /tmp/weston.log:

> [12:37:42.-1093082536] GL vendor: Imagination Technologies
> [12:37:42.-1093082536] GL renderer: PowerVR SGX 530
> [12:37:42.-1093082536] GL_EXT_unpack_subimage not available.
> [12:37:42.-1093082536] EGL error state: EGL_SUCCESS (0x3000)

This seems to be the reason for the crash (which we can check with gdb)

> (gdb) bt
> #0  0xb6db7fc8 in weston_dmabuf_feedback_destroy () from /usr/lib/libweston-13.so.0
> #1  0xb558257e in ?? () from /usr/lib/libweston-13/gl-renderer.so
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)

The fix for missing GL_EXT_unpack_subimage is this patch here in meta-arago[1].
Since that is needed for all SGX platforms the fix probably belongs in meta-ti,
not meta-arago.. With that, still no weston.. To the logs again:

> [12:53:00.-1093127416] Output 'HDMI-A-1' using color profile: stock sRGB color profile
> [12:53:00.000] format XRGB8888 not supported by output HDMI-A-1
> [12:53:00.-1093127752] failed to create gbm surface
> [12:53:00.24360944] Failed to init output gl state

Ah, bad output format selection, and again the solution to a hardware issue is hiding in
the distro layer[2], not the hardware/bsp layer.. Updating the weston.ini to include
gbm-format=rgb565 I can see weston running again!

Andrew

[0] https://git.yoctoproject.org/meta-ti/tree/meta-beagle/recipes-kernel/linux?h=scarthgap-wip
[1] https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
[2] https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini

On 5/21/25 8:37 AM, Sebastian via lists.yoctoproject.org wrote:
> Hi there,
> 
> as suggested I've tested further with ti-6_1, ti-6_6 using the am335-evm as a target on the beaglebone black. I've found out that the fb0 is created at least when the external monitor is detected by lcdc. The xserver and weston rejects to show any output on the display.
> 
> I'm attaching the logs accodingly. Is there anything I can try to bring it to life at least on the HDMI output on the beaglebone black?
> 
> I've tried with core-image-weston too but it crashes with an segmentation fault.
> 
> What could I try in addition instead of retreating and go by the meta-yocto-bsp approach?
> 
> Regards,
> 
> Sebastian
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18586): https://lists.yoctoproject.org/g/meta-ti/message/18586
> Mute This Topic: https://lists.yoctoproject.org/mt/112650476/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

