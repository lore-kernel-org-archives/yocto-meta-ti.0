Return-Path: <miguel.gazquez@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D44C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:55:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.17255.1752832539898530883
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 02:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g5apnMnT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: miguel.gazquez@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 781D643379;
	Fri, 18 Jul 2025 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752832538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDqZ/VEQcHFLzKPfl7sLmsuLWGDNmVajW8BGBEjNmjo=;
	b=g5apnMnTeSWDNwCImtVs4DWlctejaS0bTKOV3UX0RzhejzrXZMlBSYSkBLsXPUAjmcr3sK
	6GZxZ+4QgZc15YXyCSXpDbnj0RjtBxPG4RiQbBEv8fDJRejgOj7140G3hh3v3BzI1Y+vTP
	j6EzdgfXB34A4UCkPOUYZqO09YZamBR0KYCINASq+wOJ/mgGxYzLHWtpZgGhxN5DYwVx2w
	zTr3oXdNcQbL8OSYD+plHaEIgH1PzP4+iiINai9a3EkRNc/cJmdtS7Pb3O6FFOYPFXobdA
	lcvX9rtCV5YrOE03lJmYDhQJuk20dwuFIPRQxErl1O2WkxmccxjrcQAyuK5heA==
Message-ID: <e7e1e822-5f2e-42d2-ac40-4d210c9f769d@bootlin.com>
Date: Fri, 18 Jul 2025 11:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] conf: machine: add BeagleBone Green Eco to
 KERNEL_DEVICETREE
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com, praneeth@ti.com,
 romain.gantois@bootlin.com, kory.maincent@bootlin.com,
 thomas.bonnefille@bootlin.com, denys@konsulko.com, robertcnelson@gmail.com
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
 <20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
 <40c291ff-c3ee-4d9f-a45a-3affb088cf7e@ti.com>
 <53308664-c3e5-4442-9eca-3c4bce84395e@bootlin.com>
 <51b4f094-3a20-4b4b-8b37-2eba3e2e3fc2@ti.com>
Content-Language: en-US
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
In-Reply-To: <51b4f094-3a20-4b4b-8b37-2eba3e2e3fc2@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefoihhguhgvlhcuifgriihquhgviicuoehmihhguhgvlhdrghgriihquhgviiessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedviedtgfffueefveegjedtkeeujefggfefgfethefhjedvudejheelheehheejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddvngdpmhgrihhlfhhrohhmpehmihhguhgvlhdrghgriihquhgviiessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrvggrthhmohhnsehtihdrtghomhdprhgtphhtthhopehmvghtrgdqthhisehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprhgrnhgvvghthhesthhirdgtohhmpdhrtghpt
 hhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvnhihsheskhhonhhsuhhlkhhordgtohhm
X-GND-Sasl: miguel.gazquez@bootlin.com
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Jul 2025 09:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18798



Le 17/07/2025 à 20:01, Ryan Eatmon a écrit :
> 
> 
> On 7/17/2025 12:55 PM, Miguel Gazquez wrote:
>>
>>
>> Le 15/07/2025 à 15:52, Ryan Eatmon a écrit :
>>>
>>>
>>> On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
>>>> Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in ti33x.inc
>>>>
>>>> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
>>>> ---
>>>>   meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti- 
>>>> bsp/ conf/machine/include/ti33x.inc
>>>> index 
>>>> 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d65548588b3333839857a3a50 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>> @@ -28,6 +28,7 @@ KERNEL_DEVICETREE = " \
>>>>       ti/omap/am335x-boneblack.dtb \
>>>>       ti/omap/am335x-boneblue.dtb \
>>>>       ti/omap/am335x-bonegreen-wireless.dtb \
>>>> +    ti/omap/am335x-bonegreen-eco.dtb \
>>>>       ti/omap/am335x-bonegreen.dtb \
>>>>       ti/omap/am335x-chiliboard.dtb \
>>>>       ti/omap/am335x-cm-t335.dtb \
>>>
>>> NAK.  As has been mentioned several times on this list, we do not 
>>> update KERNEL_DEVICETREE directly.  As we support multiple kernel 
>>> versions with each branch, we cannot have a single KERNEL_DEVICETREE 
>>> that works for all kernel versions.
>>>
>>> To that end we setup the KERNEL_DEVICETREE_PREFIX variable that will 
>>> pattern match and change the value for KERNEL_DEVICETREE based on the 
>>> available matching DTBs in the given kernel.  The only kernel version 
>>> that uses KERNEL_DEVICETREE is the mainline (aka latest stable) 
>>> kernel. And the value for this variable is automatically updated to 
>>> include all of the available DTBs in the mainline kernel at the time 
>>> we update the recipe to that version.
>>>
>>> As the KERNEL_DEVICETREE_PREFIX already has an entry that will pick 
>>> up this new DTB when it is available, this change is not needed.
>>
>> When building for the am335x_evm without this patch, the devicetree 
>> for the beaglebone green eco is not included in the wic image, so the 
>> kernel can't boot.
>>
>> As you said, in the linux-ti-staging recipe, KERNEL_DEVICETREE does 
>> contains the dtb for the bbg eco.
>>
>> But core-image-minimal (which create the wic image) uses the value of 
>> KERNEL_DEVICETREE from ti33x.inc, and not the one generated from 
>> KERNEL_DEVICETREE_PREFIX, so it doesn't contains the devicetree for 
>> the bbge. This can be checked with `bitbake-getvar -r core-image- 
>> minimal KERNEL_DEVICETREE`.
>>
>> It probably works for others boards because, apart from the bbge, 
>> there isn't any board supported in ti-linux-6.12.y but not in mainline.
>>
>> If we can't modify KERNEL_DEVICETREE here, what should I do to include 
>> the devicetree into the final image ?
> 
> Are you talking about a poky build with a poky kernel?  Or a poky build 
> with the TI kernel?
> 
> If you are talking about the TI kernel, then the mainline recipe does 
> not point to a kernel that has this DTB.  So are you trying to use the 
> mainline recipe but change the SRCREV to point a commit that does 
> contain this new DTB file?

I'm using a poky build with the TI kernel, which by default uses the 
branch "ti-linux-6.12.y", with the SRCREV equal to 
"78e6abff322081d53c5a685d927476086c9b2846" (on the scarthgap branch, I 
forgot to mention it). And on this branch there is the commit 
"ab7f0d695e9a3268deb760dcd0fa58812a614cd8" adding the devicetree for the 
beaglebone green eco.


>>>
>>> Right now this new DTB is only available on linux-next and has not 
>>> made it into any released kernels.
>>>
>>>
>>
> 

-- 
Miguel Gazquez, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


