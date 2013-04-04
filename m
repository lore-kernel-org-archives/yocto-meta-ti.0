Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B240DE014EE
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 18:10:08 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r341A8N8010749
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 20:10:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r341A8te028345
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 20:10:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 3 Apr 2013 20:10:07 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r341A718020080;
	Wed, 3 Apr 2013 20:10:07 -0500
Date: Wed, 3 Apr 2013 21:10:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130404011007.GR10072@edge>
References: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
	<1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>
	<20130403225248.GE31233@denix.org>
	<47BFB0D4-4FB5-4C58-A905-C12C79B8E60C@ti.com>
MIME-Version: 1.0
In-Reply-To: <47BFB0D4-4FB5-4C58-A905-C12C79B8E60C@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] ti33x: Add DTB filter for building SDKs
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
X-List-Received-Date: Thu, 04 Apr 2013 01:10:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 03, 2013 at 08:38:28PM -0400, Maupin, Chase wrote:
> We could probably do it in the image recipe with machine overrides.  How's 
> that?

Seems better, as it is nicely localized. And in case it grows up on us and 
starts being used for other purposes or by other components/recipes, we can 
always revisit adding it to meta-ti/BSP.

-- 
Denys


> On Apr 3, 2013, at 5:53 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Wed, Apr 03, 2013 at 11:56:01AM -0500, Chase Maupin wrote:
> >> * Add a DTB_FILTER variable to only package the am335x DTB files
> >>  in the SDK.
> >> 
> >> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> ---
> >> conf/machine/include/ti33x.inc |    2 ++
> >> 1 files changed, 2 insertions(+), 0 deletions(-)
> >> 
> >> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> >> index e8aa2ba..50844d1 100644
> >> --- a/conf/machine/include/ti33x.inc
> >> +++ b/conf/machine/include/ti33x.inc
> >> @@ -25,6 +25,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> >> 
> >> KERNEL_IMAGETYPE = "uImage"
> >> 
> >> +DTB_FILTER = "am335x"
> > 
> > I'm not sure about adding a new variable to meta-ti that is only used in tisdk 
> > part of meta-arago... Any other options?
> > 
> > 
> >> UBOOT_ARCH = "arm"
> >> UBOOT_MACHINE = "am335x_evm_config"
> >> 
> >> -- 
> >> 1.7.0.4
> >> 
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> >> 

