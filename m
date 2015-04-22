Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CBE2E00997; Wed, 22 Apr 2015 07:57:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 039D8E0098D
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 07:57:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3MEvKFH008643
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:57:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MEvJXJ012747
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:57:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Apr 2015 09:57:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MEvJXj024007;
	Wed, 22 Apr 2015 09:57:19 -0500
Date: Wed, 22 Apr 2015 10:57:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150422145718.GE25236@edge>
References: <1429674314-15019-1-git-send-email-sam.nelson@ti.com>
	<20150422134506.GD25236@edge>
	<4F9216F96E5DF9428610502835A9F4905818DFE7@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905818DFE7@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] ipc: Update to new version 3.35.1.7
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
X-List-Received-Date: Wed, 22 Apr 2015 14:57:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for the explanation! I'll go ahead and push this one then.


On Wed, Apr 22, 2015 at 10:07:07AM -0400, Nelson, Sam wrote:
> The patch was introduced earlier to overcome an issue. But looks like that 
> patch is not generic right now.
> Discussion on right now to have a proper fix.
> We may have an update later on with the newer version of IPC.
> With regards,
> Sam
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, April 22, 2015 9:45 AM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] ipc: Update to new version 3.35.1.7
> 
> On Tue, Apr 21, 2015 at 11:45:14PM -0400, Sam Nelson wrote:
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > 
> > ---
> > Change from previous verison of patch
> > - Removed patch file
> 
> What about the patch? Do you still need it? Was it included by mistake?
> 
> 
> > ---
> > ---
> >  recipes-ti/ipc/ti-ipc_git.bb |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-ti/ipc/ti-ipc_git.bb 
> > b/recipes-ti/ipc/ti-ipc_git.bb index 6f46295..bb2c3c9 100644
> > --- a/recipes-ti/ipc/ti-ipc_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc_git.bb
> > @@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = 
> > "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
> >  
> >  DEPENDS += "virtual/kernel"
> >  
> > -PV = "3.35.00.05"
> > +PV = "3.35.01.07"
> >  
> >  BRANCH = "master"
> >  SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
> >             file://tiipclad-daemon.sh \
> >             "
> > -# Commit corresponds to 3.35.00.05
> > -SRCREV = "ce35c999f5c3368e387740a38aef3358290579b3"
> > +# Commit corresponds to 3.35.01.07
> > +SRCREV = "358d966c9f5973faf9ab71fb1d7dfe5d3e08a8dc"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > --
> > 1.7.9.5
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

