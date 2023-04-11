Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC92C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 20:04:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.25026.1681243472313872577
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 13:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FD8340C90;
	Tue, 11 Apr 2023 20:04:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQVOArDg4oao; Tue, 11 Apr 2023 20:04:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 41E4C40C13;
	Tue, 11 Apr 2023 20:04:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 475411637FE; Tue, 11 Apr 2023 16:03:49 -0400 (EDT)
Date: Tue, 11 Apr 2023 16:03:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 5/5] meta-ti-bsp: graphics:
 Correct dependency chain
Message-ID: <20230411200349.GZ9226@denix.org>
References: <20230406192847.7934-1-afd@ti.com>
 <20230406192847.7934-5-afd@ti.com>
 <20230406194653.GN9226@denix.org>
 <be1d8c94-1b46-5b26-399d-e0baa054e824@ti.com>
 <20230406212558.GO9226@denix.org>
 <87c83179-6894-8950-e519-71936c7b6935@ti.com>
 <d7ff8d60-748c-1657-509e-3a19947c00cb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7ff8d60-748c-1657-509e-3a19947c00cb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 20:04:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16357

On Mon, Apr 10, 2023 at 09:16:27AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 4/6/23 4:30 PM, Randolph Sapp wrote:
> >On 4/6/23 16:25, Denys Dmytriyenko wrote:
> >>On Thu, Apr 06, 2023 at 03:58:41PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>>On 4/6/23 2:46 PM, Denys Dmytriyenko wrote:
> >>>>On Thu, Apr 06, 2023 at 02:28:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>>Previously the virtual/gpudriver provider would point to the kernel-mode
> >>>>>driver, which would cause Mesa libraries to depend on those and not the
> >>>>>user-mode driver. It is the user-mode driver that should depend on the
> >>>>>kernel-mode driver, not the other way around. The logical dependency
> >>>>>chain should be:
> >>>>
> >>>>No, umlibs already has lots of virtual providers to choose from - virtual/egl,
> >>>>virtual/gles and even virtual/mesa. And virtual/gpudriver was specifically
> >>>>added to point to a kernel-mode driver - rogue-driver or sgx-km.
> >>>>
> >>>
> >>>But none of these virtual providers actually point to the umlibs anymore,
> >>>those all point to Mesa.
> >>
> >>Ah, right...
> >>
> >>
> >>>>So, flipping the dependency chain is probably the correct change, but changing
> >>>>what virtual/gpudriver means seems wrong.
> >>>>
> >>>
> >>>Not sure what the issue is with changing what this virtual provider means.
> >>>It is our creation that no one else uses, it exists today only as a flag to
> >>>tell our Mesa bbappend which backend to choose.
> >>
> >>It seems confusing - the kernel-mode for Rogue has the word "driver" in it.
> >>If it's not being used anywhere else any longer, and it should point to
> >>user-mode part now, why not also rename it to, let's say, virtual/gpulibs?
> >>
> 
> For GPU drivers, they are always two part drivers, so both mode drivers are
> "drivers". In SGX we use "UM/KM" instead of "umlib/driver", we could always
> rename the Rogue recipes if it's more clear.

Heh, and both ti-sgx-ddk-km and ti-img-rogue-driver recipes reside in the 
powervr-drivers directory... :) I know we've discussed already that it's 
no longer correct to call all these GPUs as PowerVR, but that's historic 
and isn't absolutely wrong. We have other references to "pvr" in other 
places, like Mesa now...


> Since both are parts of the
> "gpudriver" I still don't see an issue with pointing to either with that
> label.
> 
> If a rename like "virtual/umlibs" makes it easier then I also have no
> issue doing that.

I'd hate changing the behavior of an existing old variable, even if it's 
not that widely used in meta-ti - we don't know if there are any downstream 
layers using it, so don't want to break that.

So, the safest approach would be to leave KM recipes still providing this 
virtual/gpudriver, but add a new virtual provider for UM recipes to be 
used a dependency for Mesa. Whether it's "umlibs" or something else - I 
don't have strong preferences. Ryan?


> >>How does Imagination Tech call this proprietary piece?
> >>
> >They just refer to the whole bag of software as the DDK. No specific terminology for the components. Even if there was it, wouldn't apply here, unfortunately, as this is specifically our packaged version. But no, they don't even give us a hint to create a naming convention here.
> 
> In the DDK they just call the UM side without a postfix, and the KM
> side with "_km". So maybe "driver" and "driver_km", but as you say
> it doesn't much matter here.
> 
> Andrew

