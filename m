Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2580FC64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 01:27:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11607.1677634021012924836
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 17:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19CD240C6B;
	Wed,  1 Mar 2023 01:27:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hdZKqwMQPLF; Wed,  1 Mar 2023 01:27:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EAAA440C2C;
	Wed,  1 Mar 2023 01:26:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E32C163766; Tue, 28 Feb 2023 20:26:32 -0500 (EST)
Date: Tue, 28 Feb 2023 20:26:32 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use
 udev for userspace initialization
Message-ID: <20230301012631.GP22689@denix.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
 <20221219210029.GU22689@denix.org>
 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
 <20230223013826.GJ22689@denix.org>
 <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Mar 2023 01:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15964

On Thu, Feb 23, 2023 at 10:20:12AM +0100, Matthias Schiffer wrote:
> On Wed, 2023-02-22 at 20:38 -0500, Denys Dmytriyenko wrote:
> > So, testing the latest patch series, I started getting breakage on all SGX 
> > platforms:
> > 
> > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
> > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
> > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
> > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.156835
> > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
> > 
> > 
> > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
> > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
> > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
> > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.164346
> > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
> > 
> > 
> > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
> > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
> > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
> > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.159785
> > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'
> > 
> > 
> > Reverting this commit helps with the build:
> > https://git.yoctoproject.org/meta-ti/commit/?h=kirkstone&id=f50f55102f926ba58ea22339a98e4239370af6c6
> > 
> > 
> > So far I didn't have time to dig deeper, though it's not obvious right away...
> > 
> 
> Hi Denys,
> 
> I assume that the failing postinst script must come from update-
> rc.d.bbclass, but without knowing what command in the script is failing
> it's difficult to say anything for certain. Would it be possible for
> you to make a ti-sgx-ddk-um RPM or similar from the failing build
> available for us to have a look at?
> 
> What DISTRO_FEATURES is your build using? sysvinit, no systemd?

Matthias,

This is default Arago distro with both systemd and sysvinit in the 
DISTRO_FEATURES, and it generates IPKs. I looked at the corresponding 
postinst scripts and didn't see anything obvious.

Unfortunately, I didn't have time to debug that further and had to 
switch to graphics updates. Part of it was updating SGX UM recipe 
and forcing rebuild, so I haven't seen any breakage since then.

I might try reshuffling my patch queue in order to reproduce it, if I 
have time, to see if it was due to stale sstate or something similar.

-- 
Denys

