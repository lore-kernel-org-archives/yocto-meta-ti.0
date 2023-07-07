Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF10EEB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 20:51:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5781.1688763087353438573
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 13:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A60540C83;
	Fri,  7 Jul 2023 20:51:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUYXvtsK2ak2; Fri,  7 Jul 2023 20:51:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF5E840C30;
	Fri,  7 Jul 2023 20:51:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 002F5163BF0; Fri,  7 Jul 2023 16:51:22 -0400 (EDT)
Date: Fri, 7 Jul 2023 16:51:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
 multiconfig to baremetal
Message-ID: <20230707205122.GH1518@denix.org>
References: <20230706193122.1891075-1-denis@denix.org>
 <778da68c-e71d-5305-121a-51d0ab704ace@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778da68c-e71d-5305-121a-51d0ab704ace@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 20:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16833

On Fri, Jul 07, 2023 at 11:33:33AM -0500, Ryan Eatmon wrote:
> 
> 
> On 7/6/2023 2:31 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >There are couple of k3r5 components that need to be built for the target
> >and they are self-contained and don't use glibc. Moreover, when building
> >a cross-compile toolchain for k3r5, there's no need to build glibc and
> >all its dependencies. While build-time speed up is nice, the main benefit
> >comes when packaging a nativesdk toolchain for distribution, reducing the
> >number of packages and the resulting size of the toolchain installer.
> >
> >To avoid potential namespace conflict in package feeds between nativesdk
> >binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the
> >package suffix accordingly.
> >
> >This also requires a rather impactful change in the deployment structure,

Should have said disruptive here instead of impactful - may have caught more 
attention...


> >which affects CIs and user experience. By default different TCLIBC builds
> >(e.g. glibc and baremetal in this case) are built in separate TMPDIRs to
> >avoid conflicts, especially on the nativesdk side. Also the default config
> >has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can be
> >changed by local.conf or <distro>.conf, which meta-ti-bsp has no control
> >over. Unlike multiconfig-image-packager example that can access deployed
> >artifacts across multiconfigs to package in an image, we use wic and its
> >IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot
> >access deployed artifacts across multiconfigs in separate TMPDIRs, as it
> >uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need
> >to set up a "common" deploy directory for images and sdks produced by
> >multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLOY
> >variable that can be changed or adjusted by distros as needed.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-ti-bsp/conf/layer.conf            | 4 ++++
> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> >index bb286c2b..db6f9de9 100644
> >--- a/meta-ti-bsp/conf/layer.conf
> >+++ b/meta-ti-bsp/conf/layer.conf
> >@@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >  "
> >  HOSTTOOLS_NONFATAL += "truncate xxd comm"
> >+
> >+TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
> 
> During testing, this one threw me for a bit.  None of the build
> scripts were copying anything... 

Heh, that's the lengthy explanation in the commit log above... I guess nobody 
reads that anyway :)


> I can deal with that.  But, we
> pull a few things out of the deploy dir.  Images, sdk, ipk...
> should we also have something that uses this new TI_COMMON_DEPLOY
> for the ipk and licenses?

I only wanted to do the bare minimum here in meta-ti for all distros to work 
out of the box w/o breaking. As mentioned in the description above the correct 
place for this stuff is either in the distro configuration or local.conf. And 
I didn't want to get in the way of that. That said, it should be perfectly 
fine to completely switch over to this "combined" deploy dir for all the 
remaining pieces, but should be done in the distro, not here.


> >+DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> >+SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
> >diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >index deb07210..04b9a746 100644
> >--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >@@ -1,5 +1,7 @@
> >  MAINMACHINE := "${MACHINE}"
> >-DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
> >+DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
> >  MACHINE:append = "-k3r5"
> >+TCLIBC = "baremetal"
> >+SDKPKGSUFFIX = "k3r5-nativesdk"

