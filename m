Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A7FC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 15:42:32 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.web11.77569.1705938149591626865
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 07:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=Q3z626bM;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id D68E222C0B;
	Mon, 22 Jan 2024 16:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1705938147;
	bh=N9wJuylIgo9RlF158bzljMea5Hv7ejqK3ipFv6/vJ+Q=; h=From:To:Subject;
	b=Q3z626bMv8BVlEILCy6jEvFPYKA+Ww0UcaGQwY0/nLftmLdoqdP7w4B/9y4UZKdLk
	 JBN/oc2uZ5+DDLt9jvSJoDEnraRc7MIRZoeSXso/nVnWqz26gN6PVwQownKjX6JfkX
	 uiyfX39tYfObY5eIF37VMasiQc3ZsU5bdHtRcCjsDfAzxvlAy3kWDKz2xLXjny8WTd
	 JAHYbQ5FoxzNRwxVJqPSVkcNTWFkSPj/2pk6p5ptMPuKOH7WnoqnT84ejmaXjWqlsE
	 bQe1qK1ZkCitw8/yZ2UMlVcdV6zjSR1CYsD6ozVPsZOqo/l609Zf+4rjEnR98rPuTo
	 8z5zibpWpZ/Ew==
Date: Mon, 22 Jan 2024 16:42:22 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Randolph Sapp <rs@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] [meta-ti] AM62, GPU driver on OE master
Message-ID: <20240122154222.GA29452@francesco-nb>
References: <20230906152257.2362602-1-max.oss.09@gmail.com>
 <e59adfac-e7f1-4a41-936d-95776a33c761@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e59adfac-e7f1-4a41-936d-95776a33c761@ti.com>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jan 2024 15:42:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17406

Hello Randolph,

On Wed, Sep 06, 2023 at 11:18:38AM -0500, Randolph Sapp wrote:
> On 9/6/23 10:22, Max Krummenacher wrote:
> > I'm trying to build and run latest OE master for a AM62 based machine
> > All builds fine.
> > I don't have the GPU working at runtime while the GPU works fine
> > using the 'same' configuration with kirkstone branches.
> > Apart from the GPU I did not (yet) see any regression as compared
> > with kirkstone. Note that the kernel is based on
> > ti-linux-6.1.y, 09.00.00.008.
> > 
> > 
> > First issue found is the shared objects in ti-img-rogue-umlibs are not
> > versioned shared objects, but the *.so files are packaged into the
> > ti-img-rogue-umlibs-dev package and thus not installed by default:
> > 
> > In that state OpenGL falls back to software rendering which works,
> > albeit slowly.

> Hey Max, thanks for the update. Unfortunately I haven't had any time to
> verify the master branch lately. I'll kick up a build later today if I get
> time and see if I can unblock you.
> 
> We should be skipping the dev-so check and shipping the required links
> regardless, but I know upstream has been having some fun with the binary
> package class so I may need to move this recipe to something more stable.


Any update on this? This is broken since quite some time now.

Francesco


