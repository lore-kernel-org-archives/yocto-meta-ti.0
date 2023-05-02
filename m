Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8714C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 03:47:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.120082.1682999223867023977
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 20:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EF6D40C16;
	Tue,  2 May 2023 03:47:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abkAe5kaJ-Mk; Tue,  2 May 2023 03:47:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C752E40C13;
	Tue,  2 May 2023 03:46:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8ACE9163894; Mon,  1 May 2023 23:46:17 -0400 (EDT)
Date: Mon, 1 May 2023 23:46:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [meta-ti][kirkstone][PATCHv2 0/4] Enable vulkan
 proper
Message-ID: <20230502034617.GY9226@denix.org>
References: <20230427210746.1915362-1-rs@ti.com>
 <20230427215039.GQ9226@denix.org>
 <f6e872f1-982f-6d3a-9554-1385b08b77e7@ti.com>
 <20230428014234.GR9226@denix.org>
 <5ea30022-f140-9203-c205-8d7562147d77@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ea30022-f140-9203-c205-8d7562147d77@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 03:47:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16469

On Fri, Apr 28, 2023 at 11:30:06AM -0500, Randolph Sapp wrote:
> On 4/27/23 20:42, Denys Dmytriyenko wrote:
> >On Thu, Apr 27, 2023 at 06:58:32PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> >>On 4/27/23 16:50, Denys Dmytriyenko wrote:
> >>>On Thu, Apr 27, 2023 at 04:07:42PM -0500, rs@ti.com wrote:
> >>>>From: Randolph Sapp <rs@ti.com>
> >>>>
> >>>>Properly enable Vulkan with all WSI extensions enabled. Attempt some
> >>>>light packaging changes to the graphics umlibs recipe so we can decrease
> >>>>the number of check we have to skip, and the checks become a little more
> >>>>targeted.
> >>>>
> >>>>This version uses a cairo append that conditionally tweaks PACKAGECONFIG
> >>>>flags based on the GPU driver that is selected. We're using this driver
> >>>>flag instead of a machine feature because the open source driver will
> >>>>add a whole new set of preferred configs that will be optimized later.
> >>>
> >>>LGTM. Is it kirkstone-specific? Any plans for master?
> >>
> >>Actually, disregard that last response. It'll apply cleanly to
> >>master if you also cherry-pick the following patches from kirkstone:
> >>c994d48021664d328ced52829542a3b1b86c4e02
> >>2cc7895ebfea1df4afc2229f9762f129946b0b06
> >>b86fb13fb9638635bf957156833bccc10ddf5393
> >
> >Can you please be more specific - none of these 3 commits exist in meta-ti nor
> >meta-arago...
> >
> 
> Right, my bad. I meant this patch set:
> https://lists.yoctoproject.org/g/meta-ti/message/16397
> 
> Or these commits from kirkstone:
> 16a8078a43eef297449a04d6861fd9811bfeb052
> b9581a704648cb3ed70c6bcb28d5a1a89b08534d
> c8ba8aaade90101f06164aec1b393d7c8b3aa201

Thanks. The original patches for these commits were marked specifically for 
kirkstone (same as this series) and I guess the assumption was that they won't 
apply to master and were skipped.

I just cherry-picked them for master and can confirm everything applies and 
builds cleanly - I just re-sent them to the list just in case. Once they are 
in, this Vulkan series can also be applied to master.


> I don't know where I got those previous hashes. Must have done
> something goofy.
> 
> 
> >
> >>I must have incorrectly assumed those wouldn't apply to master when
> >>I submitted them originally. My bad, they apply fine.
> >>
> >>>
> >>>>Randolph Sapp (4):
> >>>>   ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
> >>>>   pvr-mesa: add new vulkan configuration options and wsi
> >>>>   cairo: resolve opengl version
> >>>>   ti-img-rogue-umlibs: package firmware separately
> >>>>
> >>>>  .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
> >>>>  .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
> >>>>  .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
> >>>>  .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
> >>>>  4 files changed, 37 insertions(+), 8 deletions(-)
> >>>>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend

