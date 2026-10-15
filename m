Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446D7CCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 19:24:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5712.1792092255342705498
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 12:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58C4640C85;
	Thu, 15 Oct 2026 19:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3KipLCAiwSy; Thu, 15 Oct 2026 19:24:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E210D40B66;
	Thu, 15 Oct 2026 19:24:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1095F17EEF4; Thu, 15 Oct 2026 15:24:08 -0400 (EDT)
Date: Thu, 15 Oct 2026 15:24:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"Eatmon, Ryan" <reatmon@ti.com>, "Sapp, Randolph" <rs@ti.com>,
	"Etheridge, Darren" <detheridge@ti.com>,
	"Brnich, Brandon" <b-brnich@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix
 nativesdk-flutter-engine-sdk build failures
Message-ID: <20261015192407.GT4190@denix.org>
References: <20261014204330.2837679-1-t-lannynd@ti.com>
 <20261014214348.GS4190@denix.org>
 <ea8180fd3680489091a6fefda501327c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea8180fd3680489091a6fefda501327c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 19:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20464

On Thu, Oct 15, 2026 at 02:11:02AM +0000, Thorsten Lannynd via lists.yoctoproject.org wrote:
> 
>  On Wed, Oct 14, 2026 at 04:44 PM, Denys Dmytriyenko wrote:
> > On Wed, Oct 14, 2026 at 03:43:30PM -0500, Thorsten Lannynd via
> > lists.yoctoproject.org wrote:
> > > Without BB_DEFER_BBCLASSES, :ti-soc is missing from OVERRIDES from a
> > > nativesdk context so DEPLOY_DIR_IMAGE results in an incorrect path.
> > >
> > > Add :class-nativesdk to layer.conf and a flutter dynamic layer
> > > bbappend to skip file-rdeps on the bundled host binaries.
> > >
> > > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > > ---
> > >  meta-ti-bsp/conf/layer.conf                                    | 2 ++
> > >  .../flutter-engine/flutter-engine-sdk_git.bbappend             | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >  create mode 100644
> > > meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engi
> > > ne/flutter-engine-sdk_git.bbappend
> > >
> > > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> > > index d87d040b..ef4d233f 100644
> > > --- a/meta-ti-bsp/conf/layer.conf
> > > +++ b/meta-ti-bsp/conf/layer.conf
> > > @@ -24,6 +24,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
> > >
> > >  BBFILES_DYNAMIC += " \
> > >
> > > openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-
> > layer/recip
> > > es*/*/*.bbappend \
> > > +
> > > + flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.
> > > + bbappend \
> > >  "
> > >
> > >  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> > > @@ -34,6 +35,7 @@ HOSTTOOLS_NONFATAL += "truncate xxd comm"
> > >
> > >  TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
> > >  DEPLOY_DIR_IMAGE:ti-soc =
> > "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> > > +DEPLOY_DIR_IMAGE:class-nativesdk =
> > "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> > 
> > I don't think this is correct.
> > What nativesdk package are you trying to deploy to the target image deploy
> > area?
> 
> Hi Denys,
> 
> No package is being deployed to the target image deploy area. The
> nativesdk-flutter-engine-sdk needs to know where to find the files
> from the target recipe.
> 
> I believe an alternative is to add this to the bbappend file instead:
> DEPLOY_DIR_IMAGE:pn-nativesdk-flutter-engine-sdk = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> 
> The error I was previously seeing in the flutter automated build:
> ERROR: flutter-engine-sdk-native-3.47.5-r0 do_install: flutter-engine deployed no host tools at /scratch/chromium_build/chromium_flutter_yocto/build/arago-tmp-default-glibc/deploy/images/am62pxx-evm/flutter-engine-sdk/3.47.5

Something weird is going on here with flutter, specifically why is 
flutter-engine-sdk-native expecting nativesdk-flutter-engine-sdk 
"host" tools to be deployed to the "target"-specific DEPLOY_DIR_IMAGE 
and not the SDK_DEPLOY...

But since both native.bbclass and nativesdk.bbclass remove 
MACHINEOVERRIDES, they should still point to the same default 
DEPLOY_DIR_IMAGE anyway...


> Thanks,
> Thorsten Lannynd
> 
> > 
> > 
> > >  SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
> > >  PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
> > >
> > > diff --git a/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-
> > graphics/flutter-engine/flutter-engine-sdk_git.bbappend b/meta-ti-
> > bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-
> > engine-sdk_git.bbappend
> > > new file mode 100644
> > > index 00000000..92e38f1e
> > > --- /dev/null
> > > +++ b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-
> > engine/flutter-engine-sdk_git.bbappend
> > > @@ -0,0 +1,3 @@
> > > +# Pre-built x86-64 host binaries that link against libc/libm from the build
> > > +# host, not a packaged nativesdk dep.
> > > +INSANE_SKIP:class-nativesdk:append = " file-rdeps"
> > > --
> > > 2.34.1

