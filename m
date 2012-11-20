Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4BE4E0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 08:24:24 -0800 (PST)
Received: from cpebcc8100fb8db-cmbcc8100fb8d8.cpe.net.cable.rogers.com
	([174.116.196.46]:34008 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Taqca-0005VA-0m
	for meta-ti@yoctoproject.org; Tue, 20 Nov 2012 11:24:24 -0500
Date: Tue, 20 Nov 2012 11:24:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1211201114100.29485@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: building for pandaboard fails fetching u-boot *way* into the build phase
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
X-List-Received-Date: Tue, 20 Nov 2012 16:24:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm sure there's a trivial workaround/explanation for this, but i
wanted to build the basic meta-ti based build for my panda ES, so i
started with oe-core and added the meta-ti layer.  then, because of
some license issues (and based on a quick google search), i added this
to my local.conf:

  BBMASK = "meta-ti/recipes-misc"

at that point, after selecting "pandaboard" as the machine, i wanted
to prefetch everything:

$ bitbake -c fetchall core-image-minimal

which used solely my pre-mirror directory so that didn't take long.

  *then*, because i allegedly had fetched everything i needed for the
build, i edited my site.conf file and added:

BB_NO_NETWORK = "1"

which, AIUI, should be perfectly safe since i had just done a
fetchall.  not so:

ERROR: Function failed: Network access disabled through BB_NO_NETWORK
but access requested with command git clone --bare --mirror
git://www.denx.de/git/u-boot.git
/home/rpjday/y/builds/ti/panda/downloads/git2/www.denx.de.git.u-boot.git
(for url None)
ERROR: Logfile of failure stored in:
/home/rpjday/y/builds/ti/panda/tmp-eglibc/work/pandaboard-oe-linux-gnueabi/u-boot-2011.12-r8/temp/log.do_fetch.29635

hmmmmmm ...

$ bitbake -s | grep u-boot
nativesdk-u-boot-mkimage                          :2011.06-r0
u-boot                                            :2011.12-r8
u-boot-fw-utils                                   :2011.06-r1
u-boot-mkimage                                    :2011.06-r0
u-boot-mkimage-native                             :2011.06-r0
$

  ok, now i'm confused.  the above suggests that the version of u-boot
to be used here is 2011.12-r8, but that was never fetched, and it's
only now toward the end of the build that the fetch is attempted.

  can someone clarify what's happening here?  why did my "fetchall"
operation not fetch everything the build was going to need?

rday


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

