Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EFDBE01646
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:50:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QFo5Y6022116
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 10:50:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QFo5gm012400
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 10:50:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 10:50:05 -0500
Received: from [172.24.81.205] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QFo2lo031425;
	Thu, 26 Sep 2013 10:50:03 -0500
Message-ID: <524457A9.8060908@ti.com>
Date: Thu, 26 Sep 2013 21:20:01 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1380138591-17071-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597510CF@DLEE11.ent.ti.com>
	<52444CFB.2000807@ti.com> <20130926153525.GR14528@edge>
In-Reply-To: <20130926153525.GR14528@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Rini,
	Tom" <trini@ti.com>
Subject: Re: [PATCHv2 4/4] ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2013 15:50:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/26/2013 9:05 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 26, 2013 at 08:34:27PM +0530, Siddharth Heroor wrote:
>> On 9/26/2013 5:29 PM, Maupin, Chase wrote:
>>> Acked-by: Chase Maupin <chase.maupin@ti.com>
>>
>> Just a question - is it possible to override the KERNEL_IMAGETYPE in a
>> branding.inc file? In general, we want to move to zImage for GLSDK but
>> some customers who might want to stay on uImage as they ramp.
> 
> It won't be very easy to do from a branding file. That's why I had to rev 
> the other patch to keep GLSDK 3.8 and AMSDK 3.2 kernel recipes on uImage, but 
> switch other platforms to zImage which already have recent enough u-boot...
> 
> When you have a new kernel/u-boot that prefers zImage (like the new 
> linux-ti-staging_git.bb we have for 3.12 integration), you can set the image 
> type to zImage in the kernel recipe, or rather not specify it at all, since 
> it will be picked up from machine config.
> 
> In other words, after the setting in the machine config, you have one more 
> option to override it in a specific kernel recipe. That way if your branding 
> selects latest kernel/u-boot combo, you get zImage by default from the machine 
> config. But if branding selects 3.2 kernel with early u-boot, it gets 
> overwritten back to uImage...
> 

Got it.

Thanks,
Sid

