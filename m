Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C626E009C1; Thu, 14 May 2015 15:22:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 276A1E00985
	for <meta-ti@yoctoproject.org>; Thu, 14 May 2015 15:21:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EMLqPG023624
	for <meta-ti@yoctoproject.org>; Thu, 14 May 2015 17:21:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EMLqFG012796
	for <meta-ti@yoctoproject.org>; Thu, 14 May 2015 17:21:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 17:21:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EMLquX013126;
	Thu, 14 May 2015 17:21:52 -0500
Date: Thu, 14 May 2015 18:21:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150514222151.GJ30969@edge>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
	<20150423201511.GT25236@edge> <55436D5E.8000900@ti.com>
MIME-Version: 1.0
In-Reply-To: <55436D5E.8000900@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC 0/2] Proposal for enabling CMEM
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
X-List-Received-Date: Thu, 14 May 2015 22:22:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 01, 2015 at 08:11:10AM -0400, Jacob Stiffler wrote:
> 
> 
> On 4/23/2015 4:15 PM, Denys Dmytriyenko wrote:
> >On Thu, Apr 23, 2015 at 07:42:09AM -0400, Jacob Stiffler wrote:
> >>This is a proposal for adding a CMEM region in the device tree.
> >>
> >>I wanted to get comments on the following:
> >>
> >>* implementation of using an inc file to enable this.
> >>* Whether the actual configuration belongs in the kernel recipe, or if
> >>   this is something that should be handled at the distro or branding
> >>   level. (RFC sets the configuration in kernel recipe).
> >>     - I have verified that this configuration may also be set in the
> >>        branding file using, for example,
> >>
> >>          CMEM_BASE_pn-linux-ti-staging_omap-a15 = "a0000000"
> >>          CMEM_SIZE_pn-linux-ti-staging_omap-a15 = "20000000"
> >Hmm, on one hand I don't like this change being so invasive. But on the other
> >hand, I'm not sure there's a better cleaner way to do a dts injection like
> >that. Let me think about it...
> 
> Any thoughts on this yet?

Jake,

After discussing this matter internally, since cmem is something that LCPD 
currently doesn't support being an out-of-tree module and so on, I can accept 
the patchset, but it will be disabled by default and not tested by us. All the 
testing will be on you to make sure it's not broken by future changes in the 
kernel. Will that be sufficient?

-- 
Denys


> >>Jacob Stiffler (2):
> >>   linux/cmem.inc: Support reserving memory for CMEM.
> >>   linux-ti-staging_3.14: Add CMEM region for omap-a15.
> >>
> >>  recipes-kernel/linux/cmem.inc                 |   22 ++++++++++++++++++++++
> >>  recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
> >>  recipes-kernel/linux/linux/cmem.dtsi          |   24 ++++++++++++++++++++++++
> >>  3 files changed, 51 insertions(+), 1 deletion(-)
> >>  create mode 100644 recipes-kernel/linux/cmem.inc
> >>  create mode 100644 recipes-kernel/linux/linux/cmem.dtsi
> >>
> >>-- 
> >>1.7.9.5
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 

