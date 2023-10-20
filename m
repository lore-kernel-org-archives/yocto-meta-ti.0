Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBE8CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:36:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.59132.1697819760077033330
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 09:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E9DD411E8;
	Fri, 20 Oct 2023 16:35:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8lFSEwqxCNX; Fri, 20 Oct 2023 16:35:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36DB340DD2;
	Fri, 20 Oct 2023 16:35:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BC528163D18; Fri, 20 Oct 2023 12:35:56 -0400 (EDT)
Date: Fri, 20 Oct 2023 12:35:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org, oss@ew.tq-group.com
Subject: Re: [meta-ti] [master][kirkstone][PATCH] conf: include
 TI_COMMON_DEPLOY in PSEUDO_IGNORE_PATHS
Message-ID: <20231020163556.GQ2408@denix.org>
References: <20231020121530.351358-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020121530.351358-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 16:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17157

On Fri, Oct 20, 2023 at 02:15:30PM +0200, Matthias Schiffer wrote:
> Since the introduction of TI_COMMON_DEPLOY, we've been seeing frequent
> Pseudo errors [1] breaking image build during development, in particular
> with partial rebuilds due to the externalsrc bbclass.

Indeed! We've been chasing a similar issue with TISDK bundle in Arago (which 
is a tarball of several images, SDKs and other prebuilt stuff). It was more 
severe though and would always fail on the second run - I posted a cleanup 
patch to address that and thought it was the end of it...

But I just saw this issue pop up in a different place last night - in a 
regular image do_rootfs. Like you said, it was a partial rebuild due to 
some changes in the dependency.

Somehow I completely missed PSEUDO_IGNORE_PATHS setting! A bit heavy-handed, 
as it would have masked our issues with TISDK bundle.


> The relevant part of the error log seems to be the following:
> 
>     ERROR: Task (/home/schifferm/Devel/src/ci-meta-tq-kirkstone/sources/meta
>         -tq/meta-dumpling/recipes-images/images/tq-image-generic-debug.bb:do
> 	_rootfs) failed with exit code '1'
>     Pseudo log:
>     path mismatch [1 link]: ino 12215614 db '/home/schifferm/Devel/src/ci-me
>         ta-tq-kirkstone/build-mba64xx/deploy-ti/images/tqma64xxl-mbax4xxl/tq
> 	-image-generic-debug-tqma64xxl-mbax4xxl-20231020091917.testdata.json
> 	' req '/home/schifferm/Devel/src/ci-meta-tq-kirkstone/build-mba64xx/
> 	tmp/work/tqma64xxl_mbax4xxl-tq-linux/tq-image-generic-debug/1.0-r0/r
> 	ootfs/usr/share/stress-ng/example-jobs/device.job;65324e26'.
> 
> My understanding is that all deploy dirs should be ignored by Pseudo, as
> openembedded-core/meta/bitbake.conf includes the whole of DEPLOY_DIR in
> PSEUDO_IGNORE_PATHS. With the introduction of TI_COMMON_DEPLOY,
> DEPLOY_DIR_IMAGE is not covered by that setting anymore, so we add it in
> meta-ti to avoid the issue.
> 
> [1] https://wiki.yoctoproject.org/wiki/Pseudo_Abort
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 460be02a..ffa47ae6 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -31,3 +31,4 @@ HOSTTOOLS_NONFATAL += "truncate xxd comm"
>  TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
>  DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>  SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
> +PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
> -- 

