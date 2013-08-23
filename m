Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0809DE003D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:08:48 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS000JUO2M7EOJ0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 Aug 2013 15:08:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A2610200E2; Fri,
	23 Aug 2013 16:08:30 -0400 (EDT)
Date: Fri, 23 Aug 2013 16:08:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130823200830.GA7108@denix.org>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
	<1377287906-17115-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101596DEFAC@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED101596DEFAC@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/4] u-boot-ti-staging: add the latest integration tree in prep for 2013.10 release
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 20:08:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 23, 2013 at 08:05:55PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, August 23, 2013 2:58 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 2/4] u-boot-ti-staging: add the latest
> >integration tree in prep for 2013.10 release
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 19
> >+++++++++++++++++++
> > 1 file changed, 19 insertions(+)
> > create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> >
> >diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> >b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> >new file mode 100644
> >index 0000000..bd6188d
> >--- /dev/null
> >+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> >@@ -0,0 +1,19 @@
> >+require u-boot-ti.inc
> >+
> >+DESCRIPTION = "u-boot bootloader for TI devices"
> >+
> >+LIC_FILES_CHKSUM =
> >"file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
> >+
> >+PV = "2013.09+2013.10-rc1"
> 
> Shouldn't this be more 2013.07+2013.10-rc1?

Yes, I believe you are right - u-boot uses quarterly releases, but messes up 
my mind by using YYYY.MM format :)


> Also, will you update the other machines like dra7xx-evm to use this tree?

Sure, if we need to. 2013.07 would probably be better, as this is supposed to 
be unstable.


> >+PR = "r0+gitr${SRCPV}"
> >+
> >+DEFAULT_PREFERENCE = "-1"
> >+
> >+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-
> >boot.git;protocol=git;branch=${BRANCH}"
> >+
> >+BRANCH ?= "master"
> >+
> >+SRCREV = "39bc12ddc36c9e30199471da0f3a929b178a04b2"
> >+
> >+SPL_BINARY = "MLO"
> >+SPL_UART_BINARY = "u-boot-spl.bin"
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> 

