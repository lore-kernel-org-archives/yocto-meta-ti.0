Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAABC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:37:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.45219.1669905413774029452
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 06:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7FC840A0B;
	Thu,  1 Dec 2022 14:36:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJnsJFfrwwtY; Thu,  1 Dec 2022 14:36:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C030406B7;
	Thu,  1 Dec 2022 14:36:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DF2191636A4; Thu,  1 Dec 2022 09:36:43 -0500 (EST)
Date: Thu, 1 Dec 2022 09:36:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] linux-ti: Drop unneeded update_data calls
Message-ID: <20221201143643.GT22689@denix.org>
References: <20221201064805.2094474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201064805.2094474-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Dec 2022 14:37:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15382

NAK

cmem is being removed:
https://patchwork.yoctoproject.org/project/ti/patch/20221104224653.1223044-51-denis@denix.org/

ti-unpack is being patched already:
https://patchwork.yoctoproject.org/project/ti/patch/20221125230020.5316-1-reatmon@ti.com/

It's just getting longer to get the patches merged due to other breakages 
in master...

-- 
Denys


On Wed, Nov 30, 2022 at 10:48:05PM -0800, Khem Raj wrote:
>  datastore works dynamically we don't need the update_data calls
>  anymore, so far they were no-ops, now bitbake has recently dropped this
>  API and hence compile fails with core/master
> 
>  Fixes
>   *** 0052:        bb.data.update_data(localdata)
>      0053:
>      0054:        cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>      0055:
>      0056:    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
> Exception: AttributeError: module 'bb.data' has no attribute 'update_data'
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/cmem.inc        | 2 --
>  meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/cmem.inc b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> index fd913f6c..f560932c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/cmem.inc
> @@ -49,7 +49,6 @@ python do_unpack() {
>          # Create copy of data for additional override
>          localdata = bb.data.createCopy(d)
>          localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> -        bb.data.update_data(localdata)
>  
>          cmem_dtsi.add(localdata.getVar('CMEM_DTSI'))
>  
> @@ -67,7 +66,6 @@ python do_setup_cmem() {
>              # Create copy of data for additional override
>              localdata = bb.data.createCopy(d)
>              localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
> -            bb.data.update_data(localdata)
>  
>              # Get source directory and dtsi filename
>              src_dir  = localdata.getVar('WORKDIR')
> diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> index 46bfb957..13068843 100644
> --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
>          bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
>  
>      localdata = bb.data.createCopy(d)
> -    bb.data.update_data(localdata)
>  
>      binfile  = localdata.getVar('BINFILE')
>      binfile  = bb.data.expand(binfile, localdata)
> -- 
> 2.38.1
> 

