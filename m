Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC39EEE3F34
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 21:22:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2384.1694553760958949721
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 14:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D298C408CD;
	Tue, 12 Sep 2023 21:22:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wNrJghUoQT1; Tue, 12 Sep 2023 21:22:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD6D740023;
	Tue, 12 Sep 2023 21:22:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9FF7A163CAA; Tue, 12 Sep 2023 17:22:28 -0400 (EDT)
Date: Tue, 12 Sep 2023 17:22:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] recipes-bsp: u-boot:
 Add u-boot-mergeconfig.inc to handle fragment u-boot config
Message-ID: <20230912212228.GI3359@denix.org>
References: <20230908203004.2764200-1-c-shilwant@ti.com>
 <17843F638C7D08CD.16291@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17843F638C7D08CD.16291@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 21:22:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16960

On Tue, Sep 12, 2023 at 04:04:03PM -0400, Denys Dmytriyenko wrote:
> On Sat, Sep 09, 2023 at 02:00:04AM +0530, Chirag Shilwant wrote:
> > - Add a new file u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs
> > using a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment u-boot config 
> > to be used.
> 
> Would be nice to provide extra details here in the commit message about config 
> fragment support in U-boot and its recipe. E.g.:
> 
> * U-boot recipe in OE-Core supports out-of-tree config fragments that are 
> passed via SRC_URI and automatically merges all *.cfg files as fragments. 
> This makes specifying config fragments in the machine configuration a bit 
> difficult.
> 
> * U-boot itself supports in-tree config fragments and recently been adding 
> fragments with *.config extension (first in configs/ dir, but will be moving 
> to the corresponding board/ dir), so adding a way to specify and pass those.
> 
> 
> > - Include u-boot-mergeconfig.inc in u-boot-ti.inc
> > 
> > Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> > ---
> >  meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
> >  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
> >  2 files changed, 8 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> > 
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> > new file mode 100644
> > index 00000000..69db6260
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> > @@ -0,0 +1,7 @@
> > +do_compile:prepend () {
> 
> Should be done in do_configure instead. Tasks should be self-contained and 
> granular. Plus, do_compile can be repeated w/o do_configure. If you are 
> re-configuring every time and generate a new .config file in do_compile, 
> that would probably trigger full re-compile due to make tracking file 
> timestamps...
> 
> 
> > +   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
> 
> Multiple fragments are supported, so maybe call it UBOOT_CONFIG_FRAGMENTS 
> plural?
> 
> 
> > +   then
> > +       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
> > +       oe_runmake -C ${S} O=${B} olddefconfig
> > +   fi
> 
> So, this basically repeats configuration done in u-boot-configure.inc in 
> OE-Core. But it also ignores UBOOT_CONFIG support for multiple (def-)configs. 
> While I realize you just want to address a single use-case, making it a bit 
> future-proof shouldn't be overlooked.
> 
> Think of supporting both UBOOT_CONFIG and UBOOT_CONFIG_FRAGMENTS at the same 
> time. Probably completely rewriting do_configure from u-boot-configure.inc 
> would be needed...
> 
> BTW, UBOOT_CONFIG naming is unfortunate - it has nothing to do with config 
> fragments. While UBOOT_MACHINE specifies a single defconfig, UBOOT_CONFIG 
> takes a list of defconfigs and iterates through them building each separately.

Ah, forget another use-case. So, besides combining UBOOT_CONFIG_FRAGMENTS with 
UBOOT_CONFIG, what about mixing in-tree and out-of-tree fragments? :) I know 
the matrix of possible options is getting quite complex, that's why we have a 
separate setup-defconfig.inc for the kernel in meta-ti to cover all the bases.


> > +}
> > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > index f3285c23..5292517b 100644
> > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
> >  
> >  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
> >  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> > +require u-boot-mergeconfig.inc
> >  
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
> >  
> > -- 
> > 2.34.1

