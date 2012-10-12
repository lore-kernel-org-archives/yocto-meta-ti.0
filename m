Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C50DE0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 07:04:34 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CE4RM0018177;
	Fri, 12 Oct 2012 09:04:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CE4RAo002548;
	Fri, 12 Oct 2012 09:04:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 09:04:27 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9CE4Qex009793;
	Fri, 12 Oct 2012 09:04:26 -0500
Date: Fri, 12 Oct 2012 10:04:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20121012140425.GB26956@edge>
References: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
	<5077EFE3.7000603@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5077EFE3.7000603@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Introducing meta-beagleboard
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
X-List-Received-Date: Fri, 12 Oct 2012 14:04:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 12, 2012 at 11:24:35AM +0100, Jack Mitchell wrote:
> On 11/10/12 16:46, Jason Kridner wrote:
> >To help foster fast development, future releases of the Angstrom
> >Distribution that ships with BeagleBoard.org platforms (such as
> >BeagleBone and BeagleBoard-xM) will be built using meta-beagleboard,
> >rather than meta-ti. While this produces the seemingly undesirable
> >effect of providing yet-another-BSP for BeagleBoard.org platforms,
> >collaboration in the mainline kernel and bootloaders that are the key
> >elements for the BSPs has made this possible and multiple goals for
> >the various BSPs has made it desirable.
> >
> >The objectives for meta-beagleboard are:
> >1) Provide the best possible out-of-box-experience for BeagleBoard.org platforms
> >2) Enable as much add-on hardware as possible
> >3) Enable public contributions to extend the experience and hardware support
> >4) Deliver information to the BeagleBoard.org community regarding the
> >development status
> >
> >The repository will be hosted at:
> >https://github.com/beagleboard/meta-beagleboard
> 
> Great news! Will the kernel in this BSP be attempting to follow
> mainline + public patches? I'm chomping at the bit for an easy way
> to build a tested DT kernel with recent patches.

Jack,

Here's a little bit of information to help you and others understand the 
situation a bit better.

The beagleboard kernel recipe in meta-ti was already following mainline + 
public patches. As of the beaglebone:

The mainline kernel team for am335x inside TI has been hard at work pushing 
patches upstream for quite a while now. You can see significant improvements 
in the mainline kernel already, even in 3.6, when it comes to supporting 
am335x. But the goal is to have most, if not all, of the features in place by 
the time Linus releases 3.8 kernel. According to the schedule, that is around 
the end of this year or early next year.

Due to limited resources of testing and validation, the integration team 
decided to not spend time on kernels between the last staging (i.e. PSP) 3.2 
kernel and 3.8, when everything is available in mainline.

Unfortunately, that does not work for BeagleBoard.org and Koen needs mainline 
support sooner, integrating incomplete 3.6 and 3.7 with the work-in-progress 
patches. That's one of the points behind creating meta-beagleboard layer.

That said, meta-ti will also be switching to the mainline kernel once it is 
available, i.e. with 3.8 release. It's just that meta-beagleboard gets there 
sooner... :)

-- 
Denys

