Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7F97E013DE
	for <meta-ti@yoctoproject.org>; Thu, 13 Jun 2013 11:28:48 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MOC00CL0GN1FIM1@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 13 Jun 2013 13:28:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ED8B4200E2; Thu,
	13 Jun 2013 14:28:12 -0400 (EDT)
Date: Thu, 13 Jun 2013 14:28:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sudhangathan B S <sudhangathan@gmail.com>
Message-id: <20130613182812.GC11656@denix.org>
References: <CANwz6nzC4O8bN92q2YCCLtmGKK1S9LwYPLyWR0VZZBY+EiAUtg@mail.gmail.com>
	<CAMUsWmD6F_qEm95q5y92xuP5yg3sNeBm+6GnaMQGOge3CmP8xw@mail.gmail.com>
	<CAP71Wjx=WoR6MAgGpU+nVAGt2Grnk1Y88qOepDjUeyKeX027Ug@mail.gmail.com>
	<CAGX3a99G=JzBMJ5EB8LyD0_WuvK-2sqbGT1NUDfVi5Lm5z0G4Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAGX3a99G=JzBMJ5EB8LyD0_WuvK-2sqbGT1NUDfVi5Lm5z0G4Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [yocto] yocto with meta-ti
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
X-List-Received-Date: Thu, 13 Jun 2013 18:28:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 13, 2013 at 03:22:03PM +0530, Sudhangathan B S wrote:
> Hello all,
> 
> I'm trying to integrate meta-ti with Yocto/poky, since I need to add the
> 2.6.32 kernel for the beableboard image.
> 
> Can I please know how to download the correct version, i.e. i'm using
> danny-8.0, so for this, which version of the meta-ti and meta-oe should I
> download, and from where.. and also after downloading where should I put
> these folders (correct location for each)..
> 
> I downloaded the danny branch of yocto, meta-ti, meta-oe and also the danny
> branch of openembedded-core as the dependency. Is it correct.?
> 
> Is there is weblink that I can follow..?
> 
> For now, this is the error i'm getting..
> 
> *danny-8.0/build$ bitbake -k core-image-minimal*
> *Pseudo is not present but is required, building this first before the main
> build*
> *WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> with this version of the build system; you may possibly experience
> unexpected failures. It is recommended that you use a tested distribution.*
> *Loading cache: 100%
> |################################################################################################################################|
> ETA:  00:00:00*
> *Loaded 22 entries from dependency cache.*
> *ERROR: ExpansionError during parsing
> /home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/
> ti-local-power-manager_1.24.02.09.bb: Failure expanding variable FILESPATH,
> expression was ${@base_set_filespath([
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/files",
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager" ],
> d)} which triggered exception SyntaxError: EOL while scanning string
> literal (FILESPATH, line 1)*

This error is caused by including meta-yocto-bsp and meta-ti layers that both 
define "beagleboard" machine config. You have meta-yocto-bsp configured before 
meta-ti in your bblayers.conf, which takes the beagleboard definition from 
meta-yocto-bsp layer, so you can't safely use corresponding recipes from 
meta-ti. You should swap those two layers or just drop meta-yocto-bsp 
completely.

-- 
Denys

> *ERROR: Command execution failed: Exited with 1*
> *
> *
> *Summary: There was 1 WARNING message shown.*
> *Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> *
> 
> I hope this is not version mismatch problem..!! may be yes..!
> 
> ---------------------------------
> Sudhangathan BS
> Ph:(+91) 9731-905-205
> ---------------------------------
> 
> 
> On Wed, Jun 5, 2013 at 11:35 AM, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
> 
> >
> > On Wed, Jun 5, 2013 at 7:55 AM, Akshay Sahota <akki.sahota@gmail.com>wrote:
> >
> >> *
> >> BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"
> >>  #BBMASK = "meta-ti/recipes-misc meta-oe/recipes-graphics"
> >> #BBMASK = "meta-oe/recipes-devtools"
> >> #BBMASK = "meta-oe/recipes-graphics"
> >> #
> >> # Parallelism Options*...
> >>
> >>
> >> and bblayers.conf
> >>
> >> *BBLAYERS ?= " \
> >>   /home/asahota/poky-try/poky/meta \
> >>   /home/asahota/poky-try/poky/meta-yocto \
> >>   /home/asahota/poky-try/poky/meta-yocto-bsp \
> >>   /home/asahota/poky-try/poky/meta-ti \
> >>   /home/asahota/poky-try/poky/meta-openembedded/meta-oe \
> >>   "
> >> *
> >>
> >
> > i suspect you are using wrong combination of branch/version, but you don't
> > give what branch/version you are using, not cannot confirm.
> >
> >
> >> *
> >> BBLAYERS_NON_REMOVABLE ?= " \
> >>   /home/asahota/poky-try/poky/meta \
> >>   /home/asahota/poky-try/poky/meta-yocto \
> >>   "*
> >>
> >> and the output is :
> >> *$ bitbake -k core-image-minimal
> >> Pseudo is not present but is required, building this first before the
> >> main build
> >> WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> >> with this version of the build system; you may possibly experience
> >> unexpected failures. It is recommended that you use a tested distribution.
> >> ERROR: ParseError at
> >> /home/asahota/poky-try/poky/meta-openembedded/meta-oe/recipes-devtools/cloud9/
> >> cloud9_0.6.bb:11: Could not inherit file classes/systemd.bbclass
> >> *
> >>
> >
> > systemd.bbclass was introduced in 'dylan' version of Yocto (aka 1.4). are
> > you sure this is what you are using? to be it sounds like you are using
> > Yocto/danny with meta-ti and meta-oe 'master' branch (or dylan branch).
> >
> >
> > *ERROR: Command execution failed: Exited with 1
> >>
> >> Summary: There was 1 WARNING message shown.
> >> Summary: There were 2 ERROR messages shown, returning a non-zero exit
> >> code.
> >> *
> >> What is the mistake, sounds too silly.!
> >
> >
> >
> >
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
> >
> >

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


