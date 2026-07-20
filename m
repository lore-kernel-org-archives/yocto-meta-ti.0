Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC66C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:53:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.698.1784562788623418538
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 08:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFA5B40CB1;
	Mon, 20 Jul 2026 15:53:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXPxdbj1QoNl; Mon, 20 Jul 2026 15:53:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B507140B88;
	Mon, 20 Jul 2026 15:53:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AD6221769EE; Mon, 20 Jul 2026 11:53:03 -0400 (EDT)
Date: Mon, 20 Jul 2026 11:53:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rasmus.villemoes@prevas.dk
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] mesa-pvr: correct INSANE_SKIP for
 mesa-megadriver
Message-ID: <20260720155303.GO10186@denix.org>
References: <20260717124847.2123825-1-ravi@prevas.dk>
 <742aca9a-705f-4b52-89c4-c028eca51825@ti.com>
 <8733xerv31.fsf@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733xerv31.fsf@prevas.dk>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jul 2026 15:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20168

On Mon, Jul 20, 2026 at 09:14:42AM +0200, Rasmus Villemoes via lists.yoctoproject.org wrote:
> On Fri, Jul 17 2026, Ryan Eatmon <reatmon@ti.com> wrote:
> 
> > On 7/17/2026 7:48 AM, Rasmus Villemoes via lists.yoctoproject.org wrote:
> >> In the original file this was copied from, $PN == mesa. But in this
> >> context, $PN == mesa-pvr, while the PACKAGES and FILES logic still
> >> explicitly refers to the mesa-megadriver package. Hence the build
> >> fails
> >> 
> >
> > Good catch.  I wonder why we are not seeing these QA errors in our
> > builds.  Are you turning something special on?
> 
> No, not that I know of. I hit this immediately when trying to update
> from whinlatter to wrynose, but I don't think we have any special flags
> set anywhere that should increase bitbake warning/pedantic level or
> something like that.

It's not about warning or pedantic level. It's rather about how you have 
mesa and the entire distro configured. Because we don't have any of those 
4 libraries in /usr/lib/dri/ being built, as we only build for Wayland, but 
not X11.

PACKAGECONFIG="gallium video-codecs vulkan wayland opengl egl gles gbm virgl opencl libclc gallium-llvm zink xmlconfig gallium-llvm"
DISTRO_FEATURES="pam opencl systemd usrmerge 3g acl alsa bluetooth debuginfod ext2 gobject-introspection-data ipv4 ipv6 ldconfig multiarch nfc nfs opengl pci pulseaudio seccomp vfat vulkan wayland wifi xattr zeroconf"
DISTRO_FEATURES_OPTED_OUT="ptest x11"

Might want to compare these to your settings.

Anyway, your fix is correct - this is just an explanation for why we are not 
seeing the error in our builds.

-- 
Denys

