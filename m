Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 226F0E00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 12:17:05 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qASKH30Z029109;
	Wed, 28 Nov 2012 14:17:03 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qASKH3Mn000603;
	Wed, 28 Nov 2012 14:17:03 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 28 Nov 2012 14:17:03 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qASKH2FG005126;
	Wed, 28 Nov 2012 14:17:02 -0600
Date: Wed, 28 Nov 2012 15:17:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121128201702.GA14141@edge>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge> <50B66CDF.9050405@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50B66CDF.9050405@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 20:17:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 28, 2012 at 12:58:23PM -0700, Gary Thomas wrote:
> On 2012-11-28 10:34, Denys Dmytriyenko wrote:
> >On Wed, Nov 28, 2012 at 06:31:17PM +0100, Nicolas Dechesne wrote:
> >>Le 28 nov. 2012 18:28, "Gary Thomas" <gary@mlbassoc.com> a ?crit :
> >>>
> >>>On 2012-11-28 10:19, Denys Dmytriyenko wrote:
> >>>>
> >>>>http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196
> >>>
> >>>
> >>>Bottom line: I should just use the latest Poky/Yocto tree?  I just updated
> >>>the meta-ti(master) and the quoted patches don't seem to have been applied
> >>>(the xf86-video-omap_git.bb is still present)
> >>>
> >>
> >>Indeed you need to apply them for now. Denys should be merging them soon.
> >>But a tested-by won't hurt...
> >
> >They just been merged. Had a slight delay testing the master branch - too much
> >time spent dealing with denzil-based releases here from multiple teams... :(
> 
> Sadly, it's still breaking when I build using the latest:
> 
> checking whether to include DRI support... checking for /usr/include/xorg/dri.h... configure: error: cannot check for file existence when cross compiling
> Configure failed. The contents of all config.log files follows to aid debugging
> /home/local/p82_poky/tmp/work/armv7ahf-vfp-neon-amltd-linux-gnueabi/xf86-video-omap/2_0.4.2+gitr9+653ccadb38c87be565df3fbf2ff24a0cbe5a5e98-r20.1/git/config.log
> This file contains any messages produced by compilers while
> running configure, to aid debugging if configure makes a mistake.

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1184

-- 
Denys

