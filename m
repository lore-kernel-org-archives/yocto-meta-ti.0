Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82694E01775
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 13:04:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9UK3xkM026885;
	Wed, 30 Oct 2013 15:03:59 -0500
Received: from DFLE72.ent.ti.com ([128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UK3xg6022264;
	Wed, 30 Oct 2013 15:03:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 30 Oct 2013 15:03:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UK3xeA013434;
	Wed, 30 Oct 2013 15:03:59 -0500
Date: Wed, 30 Oct 2013 16:03:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Russ Dill <Russ.Dill@ti.com>
Message-ID: <20131030200358.GH23669@edge>
References: <1383063875-10561-1-git-send-email-denis@denix.org>
	<F23EC138-76C4-4E07-B875-1DBA58309C19@ti.com>
	<526FF335.2000400@ti.com> <527046C7.1080406@ti.com>
MIME-Version: 1.0
In-Reply-To: <527046C7.1080406@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH] am33x-cm3: update PM firmware for AM335x to 05.00.00.00
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
X-List-Received-Date: Wed, 30 Oct 2013 20:04:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 29, 2013 at 11:37:43PM +0000, Russ Dill wrote:
> You may now also refer to 1628306779c05ee45f09d1d3131e722ddd3a5e2e as
> v05.00.00.00

Thanks, I'll update the comment :) Will there be any changes to the branch 
name?


> On 10/29/2013 05:41 PM, Dave Gerlach wrote:
> > Looks fine to me
> > 
> > Acked-by: Dave Gerlach <d-gerlach@ti.com>
> > 
> > 
> > On 10/29/2013 12:38 PM, Maupin, Chase wrote:
> >> Ack
> >>
> >> Sent from my iPhone
> >>
> >>> On Oct 29, 2013, at 9:25 AM, "Denys Dmytriyenko" <denis@denix.org>
> >>> wrote:
> >>>
> >>> From: Denys Dmytriyenko <denys@ti.com>
> >>>
> >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>> Cc: Dave Gerlach <d-gerlach@ti.com>
> >>> Cc: Chase Maupin <chase.maupin@ti.com>
> >>> Cc: Carlos Hernandez <ceh@ti.com>
> >>> Cc: Russ Dill <Russ.Dill@ti.com>
> >>> ---
> >>> recipes-bsp/ti/am33x-cm3_git.bb | 10 +++++-----
> >>> 1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb
> >>> b/recipes-bsp/ti/am33x-cm3_git.bb
> >>> index 9b36a9e..3be46b6 100644
> >>> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> >>> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> >>> @@ -3,12 +3,12 @@ DESCRIPTION = "Cortex-M3 binary blob for
> >>> suspend-resume"
> >>> LICENSE = "TI-BSD"
> >>> LIC_FILES_CHKSUM =
> >>> "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
> >>>
> >>> -PV = "04.06.00.11"
> >>> -PR = "r4"
> >>> +PV = "05.00.00.00"
> >>> +PR = "r0"
> >>>
> >>> -# SRCREV corresponds to tag "AM335xPSP_04.06.00.11"
> >>> -SRCREV = "750362868d914702086187096ec2c67b68eac101"
> >>> -BRANCH ?= "master"
> >>> +# SRCREV corresponds to the tip of next3 branch
> >>> +SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
> >>> +BRANCH ?= "next3"
> >>>
> >>> INITSCRIPT_NAME = "am335x-pm-firmware-load"
> >>> INITSCRIPT_PARAMS = "defaults 96"
> >>> -- 
> >>> 1.8.3.2
> >>>
> > 
> 

