Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0220BE005B3
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 07:23:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RENKt0000921
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:23:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RENKlX002182
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:23:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:23:20 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RENJp2004113;
	Thu, 27 Jun 2013 09:23:19 -0500
Date: Thu, 27 Jun 2013 10:23:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130627142318.GK28379@edge>
References: <20130627101300.GA6299@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961B7AF@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015961B7AF@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipes-kernel: Add GLSDK specific kernel tree	for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 14:23:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> >+
> >+S = "${WORKDIR}/git"
> >+
> >+BRANCH = "master"
> >+
> >+# This commit corresponds to ti2013.04.02 release tag
> 
> Sorry to nit-pick here, but any reason to re-use the tag name from the 
> linux-ti-staging tree?  The reason I ask is back to it being confusing if I 
> have two trees with the same tag name (including version) it becomes kind of 
> confusing.  Especially since this tree is part of the same git.ti.com 
> project as the other one.  Thoughts?

Currently, it's just an identical copy of our LCPD tree w/o any patches on 
top, so it has the same tags and commit IDs...

One can argue though, if the trees are still the same, what's the reason to 
create a new recipe so early in advance?


> >+SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
> >+PV = "3.8.13"
> >+
> >+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
> >a rebuild
> >+MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
> 
> Go ahead and reset your append here to a+ gitr${SRCPV}.  No need to start 
> from f.
> 
> Thanks for the submission.  Overall looks pretty good, just a few things to 
> fix up.

+1 keep up the good work!

-- 
Denys

