Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99EA8E00A70; Fri, 29 May 2015 12:37:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 165DFE0096A
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 12:37:50 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TJbnvl012372
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:37:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJbnq0023285
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:37:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 14:37:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJbmnJ007496;
	Fri, 29 May 2015 14:37:48 -0500
Date: Fri, 29 May 2015 15:37:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529193747.GP16418@edge>
References: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
	<1431094194-11852-2-git-send-email-j-stiffler@ti.com>
	<22A42254-B630-4E50-BB82-A52F1FA2CD84@gmail.com>
	<554CEFB6.3070708@ti.com> <20150519201102.GD31845@edge>
	<555C621A.6090704@ti.com> <20150522181216.GD8903@edge>
	<55674045.9080509@ti.com>
MIME-Version: 1.0
In-Reply-To: <55674045.9080509@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] ti-xdais: Add version 7.24.00.04
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
X-List-Received-Date: Fri, 29 May 2015 19:37:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 28, 2015 at 12:20:21PM -0400, Jacob Stiffler wrote:
> 
> 
> On 5/22/2015 2:12 PM, Denys Dmytriyenko wrote:
> >On Wed, May 20, 2015 at 06:29:46AM -0400, Jacob Stiffler wrote:
> >>
> >>On 5/19/2015 4:11 PM, Denys Dmytriyenko wrote:
> >>>On Fri, May 08, 2015 at 01:17:42PM -0400, Jacob Stiffler wrote:
> >>>>I was following the precedent set by existing RTOS packages (See
> >>>>recipes-ti/xdais/ti-xdais_6.26.01.03.bb).
> >>>>
> >>>>These RTOS packages are build only dependencies, and they do not get
> >>>>installed into the target filesystem. They are primarily used for
> >>>>building firmware.
> >>>Should they be "-native" then?
> >>>
> >>I suppose they should be, but this is how is was done before.
> >>
> >>If you look at recipes-ti/includes/ti-paths.inc, you'll see that all
> >>paths point into STAGING_DIR_TARGET
> >Ok, we may end up doing this on the target at some point.
> >Can we simply FILES_${PN} += "*" to pick up everything installed and shove it
> >into the package? That way we won't need INSANE_SKIP and the build deps can be
> >used on the target in the future...
> >
> 
> Adding all of these files to the ${PN} package causes them to be
> pulled into the filesystem. Should these instead go into the
> ${PN}-dev package (they are purely development files), and then
> ALLOW_EMPTY_${PN} = "1"?

Actually, that's a good idea. Should we modify other recipes similarly, when 
they only provide build dependencies for DSP?


> >>>>On 5/8/2015 12:23 PM, Khem Raj wrote:
> >>>>>>On May 8, 2015, at 7:09 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
> >>>>>>
> >>>>>>+INSANE_SKIP_${PN} = "installed-vs-shipped"
> >>>>>can this be fixed instead ?
> >>>>-- 
> >>>>_______________________________________________
> >>>>meta-ti mailing list
> >>>>meta-ti@yoctoproject.org
> >>>>https://lists.yoctoproject.org/listinfo/meta-ti
> 

