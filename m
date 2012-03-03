Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3202E003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 00:30:14 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0A00DF4VMDN2O5@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 03 Mar 2012 02:30:14 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 894CB20272; Sat,
	03 Mar 2012 03:30:13 -0500 (EST)
Date: Sat, 03 Mar 2012 03:30:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120303083013.GH24667@denix.org>
References: <1330721492-16982-1-git-send-email-Chase.Maupin@ti.com>
	<CC63D387-6DF4-4157-AA0D-601F43337F86@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <CC63D387-6DF4-4157-AA0D-601F43337F86@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp: place configs in MACHINE directory
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 08:30:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 03, 2012 at 09:13:00AM +0100, Koen Kooi wrote:
> 
> Op 2 mrt. 2012, om 21:51 heeft Chase Maupin het volgende geschreven:
> 
> > * create a configs directory in the MACHINE directory for both
> >  am335x-evm and beaglebone.  This resolves an issue with the
> >  unpack step until a root cause for not finding the shared
> >  configs diretory can be found.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

NAK for now, unless my fix doesn't work.

But either way we shouldn't have empty configs in every machine and SOC 
directory...

-- 
Denys

> > ---
> > .../{ => am335x-evm}/configs/empty                 |    0
> > .../beaglebone}/configs/empty                      |    0
> > 2 files changed, 0 insertions(+), 0 deletions(-)
> > rename recipes-kernel/linux/linux-ti33x-psp-3.2/{ => am335x-evm}/configs/empty (100%)
> > copy recipes-kernel/linux/{files => linux-ti33x-psp-3.2/beaglebone}/configs/empty (100%)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
> > similarity index 100%
> > rename from recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty
> > rename to recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
> > diff --git a/recipes-kernel/linux/files/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
> > similarity index 100%
> > copy from recipes-kernel/linux/files/configs/empty
> > copy to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

