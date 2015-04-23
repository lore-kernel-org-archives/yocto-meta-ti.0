Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA32CE009C6; Thu, 23 Apr 2015 13:15:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C884E009BE
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 13:15:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NKFEIH032126
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 15:15:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NKFDEb010160
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 15:15:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 15:15:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NKFClZ009997;
	Thu, 23 Apr 2015 15:15:12 -0500
Date: Thu, 23 Apr 2015 16:15:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150423201511.GT25236@edge>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
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
X-List-Received-Date: Thu, 23 Apr 2015 20:15:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 23, 2015 at 07:42:09AM -0400, Jacob Stiffler wrote:
> This is a proposal for adding a CMEM region in the device tree.
> 
> I wanted to get comments on the following:
> 
> * implementation of using an inc file to enable this.
> * Whether the actual configuration belongs in the kernel recipe, or if
>   this is something that should be handled at the distro or branding
>   level. (RFC sets the configuration in kernel recipe).
>     - I have verified that this configuration may also be set in the
>        branding file using, for example,
> 
>          CMEM_BASE_pn-linux-ti-staging_omap-a15 = "a0000000"
>          CMEM_SIZE_pn-linux-ti-staging_omap-a15 = "20000000"

Hmm, on one hand I don't like this change being so invasive. But on the other 
hand, I'm not sure there's a better cleaner way to do a dts injection like 
that. Let me think about it...


> Jacob Stiffler (2):
>   linux/cmem.inc: Support reserving memory for CMEM.
>   linux-ti-staging_3.14: Add CMEM region for omap-a15.
> 
>  recipes-kernel/linux/cmem.inc                 |   22 ++++++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
>  recipes-kernel/linux/linux/cmem.dtsi          |   24 ++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/cmem.inc
>  create mode 100644 recipes-kernel/linux/linux/cmem.dtsi
> 
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

