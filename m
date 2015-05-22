Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67F10E009E5; Fri, 22 May 2015 11:12:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3943BE00945
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 11:12:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4MICHvt004666;
	Fri, 22 May 2015 13:12:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4MICHGO013642;
	Fri, 22 May 2015 13:12:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 22 May 2015 13:12:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4MICGFV027168;
	Fri, 22 May 2015 13:12:16 -0500
Date: Fri, 22 May 2015 14:12:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150522181216.GD8903@edge>
References: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
	<1431094194-11852-2-git-send-email-j-stiffler@ti.com>
	<22A42254-B630-4E50-BB82-A52F1FA2CD84@gmail.com>
	<554CEFB6.3070708@ti.com> <20150519201102.GD31845@edge>
	<555C621A.6090704@ti.com>
MIME-Version: 1.0
In-Reply-To: <555C621A.6090704@ti.com>
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
X-List-Received-Date: Fri, 22 May 2015 18:12:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 20, 2015 at 06:29:46AM -0400, Jacob Stiffler wrote:
> 
> 
> On 5/19/2015 4:11 PM, Denys Dmytriyenko wrote:
> >On Fri, May 08, 2015 at 01:17:42PM -0400, Jacob Stiffler wrote:
> >>I was following the precedent set by existing RTOS packages (See
> >>recipes-ti/xdais/ti-xdais_6.26.01.03.bb).
> >>
> >>These RTOS packages are build only dependencies, and they do not get
> >>installed into the target filesystem. They are primarily used for
> >>building firmware.
> >Should they be "-native" then?
> >
> I suppose they should be, but this is how is was done before.
> 
> If you look at recipes-ti/includes/ti-paths.inc, you'll see that all
> paths point into STAGING_DIR_TARGET

Ok, we may end up doing this on the target at some point.
Can we simply FILES_${PN} += "*" to pick up everything installed and shove it 
into the package? That way we won't need INSANE_SKIP and the build deps can be 
used on the target in the future...


> >>On 5/8/2015 12:23 PM, Khem Raj wrote:
> >>>>On May 8, 2015, at 7:09 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
> >>>>
> >>>>+INSANE_SKIP_${PN} = "installed-vs-shipped"
> >>>can this be fixed instead ?
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 

