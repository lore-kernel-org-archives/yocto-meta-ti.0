Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FEFCE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 18:14:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17373.1695147232044349410
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 11:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECA6C40C2C;
	Tue, 19 Sep 2023 18:13:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEDLa-c5iH2F; Tue, 19 Sep 2023 18:13:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 01EF140C2B;
	Tue, 19 Sep 2023 18:13:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00322163CAB; Tue, 19 Sep 2023 14:13:41 -0400 (EDT)
Date: Tue, 19 Sep 2023 14:13:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"Eatmon, Ryan" <reatmon@ti.com>,
	"Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
	"Gupta, Gyan" <g-gupta@ti.com>,
	"Khasim, Syed Mohammed" <khasim@ti.com>,
	"Pothukuchi, Vijay" <vijayp@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Message-ID: <20230919181341.GC7013@denix.org>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org>
 <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
 <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
 <cfe86ebae4374412817e3c4c2c4fc423@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfe86ebae4374412817e3c4c2c4fc423@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Sep 2023 18:14:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16991

Anand,

Please check corresponding -next branches (master/kirkstone) - CICD automerges 
and SRCREV bumps are queued up there and I'm guessing they are going through 
the build and boot-test cycles now. If everything's green, they should be 
merged back to main kirkstone and master branches automatically. Ryan can 
definitely explain the entire CICD process in more detail.

-- 
Denys


On Tue, Sep 19, 2023 at 04:35:30AM +0000, Balagopalakrishnan, Anand wrote:
> Praneeth,
> 
> srcrev in kernel recipe for kirkstone branch needs to be bumped. The last CICD build was 6-Sep - also a good idea to trigger another full build.
> 
> Regards,
> Anand
> 
> -----Original Message-----
> From: Bajjuri, Praneeth <praneeth@ti.com> 
> Sent: Friday, September 15, 2023 9:47 PM
> To: Balagopalakrishnan, Anand <anandb@ti.com>; Denys Dmytriyenko <denis@denix.org>
> Cc: meta-ti@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Gupta, Gyan <g-gupta@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Pothukuchi, Vijay <vijayp@ti.com>
> Subject: Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add config preempt for am335x and am437x
> 
> 
> 
> On 9/14/2023 8:47 PM, Balagopalakrishnan, Anand wrote:
> > Hi Denys,
> > 
> > This is only needed for v7 platforms like AM3 / AM4 and possibly AM57x also. CONFIG_PREEMPT is enabled by default on arm64 platforms like AM65x.
> > 
> > Praneeth will send a kernel patch for TI kernel. This meta-ti patch is meant to unblock anyone who wants to enable SGX drive in the meanwhile.
> 
> 
> This patch can be abandoned .
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.1.y-cicd&id=e025e31126fff01ded59d901af916abe87646ca6 
> enables CONFIG_PREEMPT
> 
> 
> > 
> > Regards,
> > Anand
> > 
> > -----Original Message-----
> > From: Denys Dmytriyenko <denis@denix.org>
> > Sent: Friday, September 15, 2023 1:25 AM
> > To: Balagopalakrishnan, Anand <anandb@ti.com>
> > Cc: meta-ti@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Gupta, Gyan <g-gupta@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Pothukuchi, Vijay <vijayp@ti.com>; Bajjuri, Praneeth <praneeth@ti.com>
> > Subject: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add config preempt for am335x and am437x
> > 
> > On Thu, Sep 14, 2023 at 03:36:18PM -0400, Denys Dmytriyenko wrote:
> >> On Thu, Sep 14, 2023 at 10:40:26PM +0530, Anand Balagopalakrishnan via lists.yoctoproject.org wrote:
> >>> SGX needs a preemptible kernel. CONFIG_PREEMPT has always been
> >>> enabled on TI Linux kernels upto K5.1.
> >>>
> >>> This is enabled on AM65x by default but missed out AM335x and AM437x.
> >>> Add a kernel config fragment to enable config preempt.
> >>
> >> Hi, Anand,
> >>
> >> Is this only needed for am335x and am437x, as the subject suggests? If
> >> so, why the code adds the config fragment to all platforms?
> >>
> >> Second question - historically this has been enabled in the TI kernel itself.
> >> Why not do it like that again, why add the fragment to the OE metadata
> >> instead of keeping it in-tree? How the distro-agnostic approach would be handled?
> >>
> >>
> >>> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> >>> ---
> >>>   .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
> >>>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
> >>>   2 files changed, 13 insertions(+)
> >>>   create mode 100644
> >>> meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> >>>
> >>> diff --git
> >>> a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> >>> b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
> >>> new file mode 100644
> >>> index 00000000..c1e5ad7d
> >>> --- /dev/null
> >>> +++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.
> >>> +++ cfg
> >>
> >> This is not the right location for the file. You want to add to the
> >> linux-ti-staging-rt-6.1/ directory, since you are only using it from
> >> the corresponding linux-ti-staging_6.1.bb recipe.
> > 
> > Sorry, typo here - linux-ti-staging-6.1/ directory, if it's not RT-specific.
> > 
> >>
> >>> @@ -0,0 +1,12 @@
> >>> +CONFIG_PREEMPT_BUILD=y
> >>> +# CONFIG_PREEMPT_NONE is not set
> >>> +CONFIG_PREEMPT=y
> >>> +CONFIG_PREEMPT_COUNT=y
> >>> +CONFIG_PREEMPTION=y
> >>> +CONFIG_PREEMPT_RCU=y
> >>> +CONFIG_TASKS_RCU_GENERIC=y
> >>> +CONFIG_TASKS_RCU=y
> >>> +CONFIG_UNINLINE_SPIN_UNLOCK=y
> >>> +# CONFIG_CEC_GPIO is not set
> >>> +CONFIG_DEBUG_PREEMPT=y
> >>> +# CONFIG_PREEMPT_TRACER is not set
> >>> diff --git
> >>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >>> index 8a883878..0ee63358 100644
> >>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >>> @@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
> >>>   
> >>>   KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> >>>   KERNEL_GIT_PROTOCOL = "https"
> >>> +KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/config-preempt.cfg"
> >>
> >> Since this file is out-of-tree and in the OE metadata, it would also
> >> require listing it in SRC_URI.
> >>
> >>
> >>>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> >>>               file://defconfig"
> >>>   
> >>> --
> >>> 2.34.1

