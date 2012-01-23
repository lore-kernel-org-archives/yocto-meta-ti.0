Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E74E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 11:28:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LY900F6ZNEKRSW1@vms173009.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 23 Jan 2012 13:27:57 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2CDF020333; Mon,
	23 Jan 2012 14:27:55 -0500 (EST)
Date: Mon, 23 Jan 2012 14:27:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120123192755.GH17838@denix.org>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 19:28:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 23, 2012 at 03:18:22PM +0100, Koen Kooi wrote:
> This series reworks the packaging of the sgx recipes in the following ways:
> 
> 1) all the es 'versions' are now subpackaged in to PN-foo-es<version and PN-foo RRECOMMENDS all of them
> 2) the DRI WS is now packaged as well
> 3) For recent SDKs the X11 WS is packaged, but nothing is done to shuffle the base libraries around
> 4) all the PN-foo subpackages remove /etc/powervr-esrev to trigger the relocation code
> 5) the initscript doesn't depend in the the 'initscripts' package anymore making use work in a systemd world as well as a sysvinit world. 
> 
> The most noticable effect is that user can now deinstall (e.g. using 
> BAD_RECOMMENDATIONS) all the es 'versions' they don't need saving a few 
> megabytes of space.

So, is BAD_RECOMMENDATIONS still broken or was it fixed in latest BitBake?

-- 
Denys


> Koen Kooi (7):
>   libgles-omap3: split support for ES revisions into subpackages where
>     possible
>   libgles-omap3: merge in updates from arago
>   libgles-omap3: package DRI windowing system as well
>   libgles-omap3: install X11 windowing system for newer SDK releases as
>     well
>   libgles-omap3: adjust packaging for all windowing systems to remove
>     the magic esrev file
>   omap3-sgx-modules: add 4.05.00.03
>   libgles-omap3: add 4.05.00.03
> 
>  ....16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} |   12 +-
>  recipes-graphics/libgles/libgles-omap3.inc         |  119 +++++++++++++++++---
>  recipes-graphics/libgles/libgles-omap3/cputype     |   10 ++-
>  recipes-graphics/libgles/libgles-omap3/rc.pvr      |   29 ++++-
>  ...3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} |   14 +--
>  5 files changed, 145 insertions(+), 39 deletions(-)
>  copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_1.6.16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} (81%)
>  copy recipes-graphics/libgles/{libgles-omap3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} (68%)
> 
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

