Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4C24DE0074A
	for <meta-ti@yoctoproject.org>; Mon, 23 Jan 2012 08:52:12 -0800 (PST)
Received: (qmail invoked by alias); 23 Jan 2012 16:52:10 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp011) with SMTP; 23 Jan 2012 17:52:10 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18nzUEG4bgnubuvzCxd3iTGx44dDcjys4MJWO/0tD
	cPqguN7fWC2gAA
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jan 2012 17:52:11 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.9-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<3E3A330E-A821-4CD4-A983-EE798CEF58DF@dominion.thruhere.net>
In-Reply-To: <3E3A330E-A821-4CD4-A983-EE798CEF58DF@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201201231752.12060.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 0/7] SGX recipe rework
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2012 16:52:12 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 23, 2012 03:20:05 PM Koen Kooi wrote:
> Op 23 jan. 2012, om 15:18 heeft Koen Kooi het volgende geschreven:
> > This series reworks the packaging of the sgx recipes in the following
> > ways:
> > 
> > 1) all the es 'versions' are now subpackaged in to PN-foo-es<version and
> > PN-foo RRECOMMENDS all of them 2) the DRI WS is now packaged as well
> > 3) For recent SDKs the X11 WS is packaged, but nothing is done to shuffle
> > the base libraries around 4) all the PN-foo subpackages remove
> > /etc/powervr-esrev to trigger the relocation code 5) the initscript
> > doesn't depend in the the 'initscripts' package anymore making use work
> > in a systemd world as well as a sysvinit world.
> > 
> > The most noticable effect is that user can now deinstall (e.g. using
> > BAD_RECOMMENDATIONS) all the es 'versions' they don't need saving a few
> > megabytes of space.
> > 
> > Koen Kooi (7):
> >  libgles-omap3: split support for ES revisions into subpackages where
> >  
> >    possible
> >  
> >  libgles-omap3: merge in updates from arago
> >  libgles-omap3: package DRI windowing system as well
> >  libgles-omap3: install X11 windowing system for newer SDK releases as
> >  
> >    well
> >  
> >  libgles-omap3: adjust packaging for all windowing systems to remove
> >  
> >    the magic esrev file
> >  
> >  omap3-sgx-modules: add 4.05.00.03
> >  libgles-omap3: add 4.05.00.03
> 
> And you can find it as a git branch at
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument
> s/log/?h=sgx-rework _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
I checked out that branch, build omap3-sgx-modules and get

WARNING: /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
gnueabi/omap3-sgx-modules-4.05.00.03-
r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING could not be copied for 
some reason. It may not exist. WARN for now.
ERROR: Function failed: omap3-sgx-modules: LIC_FILES_CHKSUM points to an 
invalid file: /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
gnueabi/omap3-sgx-modules-4.05.00.03-
r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING
ERROR: Logfile of failure stored in: /home/andreas/tmp/oe-core-
eglibc/work/overo-angstrom-linux-gnueabi/omap3-sgx-modules-4.05.00.03-
r115a/temp/log.do_configure.17459
Log data follows:
| NOTE: Checking autotools environment for common misconfiguration
| ERROR: Function failed: omap3-sgx-modules: LIC_FILES_CHKSUM points to an 
invalid file: /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
gnueabi/omap3-sgx-modules-4.05.00.03-
r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM/COPYING
| + cd /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-
gnueabi/omap3-sgx-modules-4.05.00.03-
r115a/Graphics_SDK_4_05_00_03/GFX_Linux_KM
| + do_configure
| + base_do_configure
| + :
NOTE: package omap3-sgx-modules-4.05.00.03-r115a: task do_configure: Failed

The error is a bit different from [1] but reason is same: workdir only contains 
an empty folder GFX_Linux_KM. The error is different only because there are no 
more patches to apply. In do_unpack I see

NOTE: Unpacking 
/home/andreas/data/Downloads/packets/dl/Graphics_SDK_setuplinux_4_05_00_03.bin 
to /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-
sgx-modules-4.05.00.03-r115a/

Interesting: At console I moved into workdir and entered
./Graphics_SDK_setuplinux_4_05_00_03.bin -> nothing happened and I get return 
value 127. Is there some packet which needs installation on my build hosts?

Andreas

