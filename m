Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF007EEAA7B
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 22:25:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7895.1694730295720334166
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 15:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 841A840C13;
	Thu, 14 Sep 2023 22:24:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECnrtOPK1TO2; Thu, 14 Sep 2023 22:24:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A05B40023;
	Thu, 14 Sep 2023 22:24:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ADDBE163CAA; Thu, 14 Sep 2023 18:24:45 -0400 (EDT)
Date: Thu, 14 Sep 2023 18:24:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: c-shilwant@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] recipes-bsp: u-boot:
 Add u-boot-mergeconfig.inc to handle fragment u-boot config
Message-ID: <20230914222445.GQ3359@denix.org>
References: <20230908203004.2764200-1-c-shilwant@ti.com>
 <20230912200403.GH3359@denix.org>
 <bd28e092-e4f0-0f5a-e1ef-3ba0c03cf7f7@ti.com>
 <20230914170845.GK3359@denix.org>
 <a7d610de-4f30-f3d0-34af-b3ecfddab65b@ti.com>
 <20230914194239.GN3359@denix.org>
 <34a98fa2-fb0e-0f59-2531-11c4240921ff@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34a98fa2-fb0e-0f59-2531-11c4240921ff@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 22:25:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16981

On Thu, Sep 14, 2023 at 03:46:57PM -0500, Ryan Eatmon wrote:
> 
> 
> On 9/14/2023 2:42 PM, Denys Dmytriyenko wrote:
> >On Thu, Sep 14, 2023 at 01:23:31PM -0500, Ryan Eatmon wrote:
> >>
> >>
> >>On 9/14/2023 12:08 PM, Denys Dmytriyenko wrote:
> >>>On Wed, Sep 13, 2023 at 10:12:57PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> >>>>On 13/09/23 01:34, Denys Dmytriyenko wrote:
> >>>>>On Sat, Sep 09, 2023 at 02:00:04AM +0530, Chirag Shilwant wrote:
> >>>>>>- Add a new file u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs
> >>>>>>using a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment u-boot config
> >>>>>>to be used.
> >>>>>Would be nice to provide extra details here in the commit message about config
> >>>>>fragment support in U-boot and its recipe. E.g.:
> >>>>>
> >>>>>* U-boot recipe in OE-Core supports out-of-tree config fragments that are
> >>>>>passed via SRC_URI and automatically merges all *.cfg files as fragments.
> >>>>>This makes specifying config fragments in the machine configuration a bit
> >>>>>difficult.
> >>>>>
> >>>>>* U-boot itself supports in-tree config fragments and recently been adding
> >>>>>fragments with *.config extension (first in configs/ dir, but will be moving
> >>>>>to the corresponding board/ dir), so adding a way to specify and pass those.
> >>>>
> >>>>Sure, will update the commit message & provide extra details in my
> >>>>v2 PATCH.
> >>>>
> >>>>>
> >>>>>>- Include u-boot-mergeconfig.inc in u-boot-ti.inc
> >>>>>>
> >>>>>>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>>>>>---
> >>>>>>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
> >>>>>>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
> >>>>>>  2 files changed, 8 insertions(+)
> >>>>>>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> >>>>>>
> >>>>>>diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> >>>>>>new file mode 100644
> >>>>>>index 00000000..69db6260
> >>>>>>--- /dev/null
> >>>>>>+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> >>>>>>@@ -0,0 +1,7 @@
> >>>>>>+do_compile:prepend () {
> >>>>>Should be done in do_configure instead. Tasks should be self-contained and
> >>>>>granular. Plus, do_compile can be repeated w/o do_configure. If you are
> >>>>>re-configuring every time and generate a new .config file in do_compile,
> >>>>>that would probably trigger full re-compile due to make tracking file
> >>>>>timestamps...
> >>>>>
> >>>>Yes, we can update this to happen in do_configure. I believe
> >>>>do_configure:append should be good & will work. Will handle this in
> >>>>v2.
> >>>>
> >>>>>>+   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
> >>>>>Multiple fragments are supported, so maybe call it UBOOT_CONFIG_FRAGMENTS
> >>>>>plural?
> >>>>>
> >>>>>
> >>>>>>+   then
> >>>>>>+       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
> >>>>>>+       oe_runmake -C ${S} O=${B} olddefconfig
> >>>>>>+   fi
> >>>>>So, this basically repeats configuration done in u-boot-configure.inc in
> >>>>>OE-Core. But it also ignores UBOOT_CONFIG support for multiple (def-)configs.
> >>>>>While I realize you just want to address a single use-case, making it a bit
> >>>>>future-proof shouldn't be overlooked.
> >>>>>
> >>>>>Think of supporting both UBOOT_CONFIG and UBOOT_CONFIG_FRAGMENTS at the same
> >>>>>time. Probably completely rewriting do_configure from u-boot-configure.inc
> >>>>>would be needed...
> >>>>>
> >>>>>BTW, UBOOT_CONFIG naming is unfortunate - it has nothing to do with config
> >>>>>fragments. While UBOOT_MACHINE specifies a single defconfig, UBOOT_CONFIG
> >>>>>takes a list of defconfigs and iterates through them building each separately.
> >>>>>
> >>>>Thanks for your suggestions. I appreciate your idea to cover all use
> >>>>cases with u-boot-mergeconfig.inc, but I have few concerns due to
> >>>>the current release situation we are into.
> >>>>
> >>>>As far as I know, meta-ti does not have a use case for UBOOT_CONFIG
> >>>>itself.
> >>>
> >>>It does:
> >>>https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/am335x-hs-evm.conf#n7
> >>>
> >>>Which means, since your new code is added to all TI platforms, it could
> >>>potentially break AM335x HS platform.
> >>
> >>The code is wrapped behind the setting of UBOOT_CONFIG_FRAGMENT, so
> >>unless we set both UBOOT_CONFIG_FRAGMENT and UBOOT_CONFIG in am335
> >>it should be ok.
> >
> >Correct, that's why I phrased it as "could potentially break". Maybe not even
> >specific to TI's AM335x HS, but to some downstream customer platform using
> >meta-ti. As meta-ti is not the end product.
> 
> Excellent point.  We really do need to do this the right way and not
> punt this too far off into the future to do the correct
> implementation.

At least doing an extra check for UBOOT_MACHINE being set, as I mentioned in 
another thread, would be a good first step.


> >>>>We are using UBOOT_MACHINE for handling the base defconfig,
> >>>>which works well for our needs. The concept of having u-boot
> >>>>fragments was introduced recently in ti-u-boot after we got a
> >>>>feedback from upstream uboot as around 90% of configs were same
> >>>>between am62xx-evm & am62xxsip-evm. This was a valid input and hence
> >>>>we considered in ti-u-boot. In order to support that I had to find a
> >>>>quick way to handle this in Yocto it with UBOOT_MACHINE along with
> >>>>UBOOT_CONFIG_FRAGMENT logic, which I had also discussed with you on
> >>>>the syncup call.
> >>>
> >>>Actually, the support was pretty much always there in U-boot, as kconfig
> >>>framework along with support for fragments by calling merge_config.sh was
> >>>borrowed from the kernel long ago and had been periodically synced with
> >>>latest. Though U-boot didn't have own in-tree config fragments until very
> >>>recently. First few got into the main config/ directory, but going forward
> >>>those will reside in the corresponding board/ directories...
> >>>
> >>>
> >>>>Considering that the am62xxsip-evm release is only two weeks away,
> >>>>can we consider the fragments approach for now and avoid any
> >>>>potential risks or delays. I will work with you in coming weeks to
> >>>>make this better by handling all the cases of uboot-config and
> >>>>fragments.
> >>>
> >>>Sure, this can be handled in stages. A bit more checks would be needed then
> >>>to avoid breaking at least UBOOT_CONFIG use case.
> >>>
> >>>
> >>>>Please let me know if I you agree with my views and if I can proceed
> >>>>with fixing the other issues you highlighted, they are trivial I can
> >>>>submit a patch tomorrow.

