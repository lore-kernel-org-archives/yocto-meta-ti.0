Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5433E01771
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 03:30:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PAUY29011065;
	Fri, 25 Oct 2013 05:30:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PAUYQt011046;
	Fri, 25 Oct 2013 05:30:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 05:30:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PAUYdI029351;
	Fri, 25 Oct 2013 05:30:34 -0500
Date: Fri, 25 Oct 2013 06:30:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Message-ID: <20131025103033.GA13772@edge>
References: <526A4413.2090801@digitalendoscopy.de>
MIME-Version: 1.0
In-Reply-To: <526A4413.2090801@digitalendoscopy.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: State of dylan branch in meta-ti
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
X-List-Received-Date: Fri, 25 Oct 2013 10:30:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:
> I just checked out the dylan branch of the yocto core and the
> meta-ti repository.
> It seems like the state of the meta-ti branch is not yet consistent
> to work out of the box.
> 
> I currently had to remove the update-modules part from the ti
> recipes and had to add
> RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc
> 
> Did I miss something or the dylan branch just not yet in a consistent state?

It's in great shape - better than ever! What you don't mention is what 
platform you are using. You do mention dsplink though, but that is long since 
unsupported. As a matter of fact, most of the old DSP related recipes are not 
supported [1]. The new replacements are not ready yet. Other than that, it 
provides great BSP support for platforms listed in the conf/ directory.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan

-- 
Denys

