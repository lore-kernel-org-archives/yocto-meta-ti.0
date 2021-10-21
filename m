Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3732.1634848856342101188
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 13:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 158AB40BEB;
	Thu, 21 Oct 2021 20:40:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jG-c_W1XDBsZ; Thu, 21 Oct 2021 20:40:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDE5040BA8;
	Thu, 21 Oct 2021 20:40:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 40F411746A0; Thu, 21 Oct 2021 16:40:53 -0400 (EDT)
Date: Thu, 21 Oct 2021 16:40:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: John <r10kindsofpeople@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Dunfell, populate_sdk, how to build development image?
Message-ID: <20211021204053.GB10132@denix.org>
References: <16B01C382574D249.30033@lists.yoctoproject.org>
 <CAE8H0+Ux_X2eRKRqEbfTZwLLY+ePReEWAUT5=uBmFbk8-f935A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE8H0+Ux_X2eRKRqEbfTZwLLY+ePReEWAUT5=uBmFbk8-f935A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2021 at 02:53:23PM -0400, John wrote:
> On Thu, Oct 21, 2021 at 1:34 PM John via lists.yoctoproject.org
> <r10kindsofpeople=gmail.com@lists.yoctoproject.org> wrote:
> 
> > I've got a booting image for the AM335x under dunfell and so went on to
> > what I thought would be the easy step of building the cross-development
> > image using -c populate_sdk.  It completes, but when I try to install it,
> > it locks up at the 'cannot access /opt/poky/environment-setup-*' stage, and
> > it seems to be missing some other significant pieces, at least most of the
> > x86_64-arago-linux folder.
> >
> > Any suggestions on how to move forward?
> >
> > Or was my first mistake 'dunfell', and if so, suggestions on how far back
> > to step?  I got the impression that the TI SDK 07.03.00.005 was using
> > dunfell.
> 
> Sorry, I seem to have hit on the right search parameters shortly after
> hitting 'send'.
> See
> https://www.openembedded.org/pipermail/openembedded-core/2015-July/106931.html
> 
> In arago-image.inc, I believe:
> TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
> should be
> TOOLCHAIN_HOST_TASK_append +=  "nativesdk-buildtools-perl-dummy"
> 
> I haven't built anything with the resulting SDK yet, but the install
> completed.

John,

Thank you for your report!

It appears your email should have been sent to meta-arago mailing list 
instead. As meta-ti is just a BSP layer for TI platforms, it is not specific 
to TI SDK, since it does not define any distro policies, SDKs or even any 
rootfs images. Hence there's no arago-image.inc file. Any distro could 
utilize meta-ti, define own images and create SDKs with -c populate_sdk 
w/o problems.

As of meta-arago, it uses a different approach for creating SDKs by defining 
meta-toolchain recipes due to the way it uses toolchains and supports both 
external and internal toolchain variants. But that's a topic for a different 
mailing list...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
