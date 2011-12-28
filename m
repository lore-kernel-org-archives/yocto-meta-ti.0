Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04901E00744
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:12 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenm10 with SMTP id m10so7984998yen.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZIfn4BXnYCYw5QXK5EVJjQD9oht2UC0N+hJ7C5PYvOc=;
	b=oZ32OAm8m6UJLT/rU+tf1FtUUg7QWOYSifjhrlZCOLweaD2QvgEs7FRxtSCWQNkwS+
	MVotSk6LpbEm28OH772AStIcII1m10srpvj3uCiHNwYqq9lfDdN4cXCGlC1P8bMf5ncb
	guLEbBXal0F8JqoTnMb+odPYSsN5YdQd/sE+g=
Received: by 10.236.155.74 with SMTP id i50mr41145888yhk.23.1325033532184;
	Tue, 27 Dec 2011 16:52:12 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:11 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:51:55 -0600
Message-Id: <1325033520-6907-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/5] Updates to support building dsp tools
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:13 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

I finally got the dsp tools to build.  I don't know how y'all want this
fixed, but here's what's going on:

ti-eula-unpack spawns the installer, then writes canned input to it to do
things like set the output directory.  The function that does this
explicitly tacks a second newline on, in addition to the one normally added
by Python's print statement.

For ti-cgt6x, the result is that a bare newline is fed to the installer at
the point where the installation directory is requested, instead of the
workdir.  Hence, the default directory gets used; for this package, that's
in /opt/TI.

For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also caused
the default installation directory to be requested, but for this package
that's ${HOME}/ti.  Since ti-eula-unpack overrides the HOME environment
variable to be the work directory, everything somehow happened to work out,
at least for other folks.  I don't think that's a great solution though, so
I updated the recipes to do it "right", by changing the commands to conform
to what the current installers expect.  There may be other installation
recipes for other tools that need the same fixes.

At this point, ti-codec-engine failed to build with the unanswered issue
raised in
http://e2e.ti.com/support/dsp/omap_applications_processors/f/447/t/110920.aspx.
I've added a patch for that; the corresponding PR change is a best guess.

The striplevel of the patches in ti-dmai is off by one.  There's a patch for
that; there's no patch for the fact that make 3.85 produces a "Entering an
unknown directory" failure in do_install, since I could use make 3.81 and
get the package built.

Finally, the kernel configuration for CONFIG_FB_OMAP2_NUM_FBS dropped back
from 3 in the 2.6.x days (early November) to 2 with 3.0.14, preventing
xstart from working with a ULCD7 display because /dev/fb2 didn't exist.

With all this, I still haven't managed to get an environment where
matrix-gui runs on the xM with ULCD7, but at least it builds now, and I'm
done for the night.  BTW, matrix-tui doesn't build because it doesn't have
license checksums.


Peter A. Bigot (5):
  ti-eula-unpack: remove extraneous newline in cmd output
  various: fix installation directories for corrected ti-eula-unpack
  ti-codec-engine: work around XDC runtime error
  ti-dmai: fix patch striplevel
  linux 3.0: put back support for graphics on ULCD7

 .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
 recipes-kernel/linux/linux_3.0.bb                  |    2 +-
 recipes-ti/bios/ti-dspbios.inc                     |    3 +-
 .../bypass-GCArmv5T-used-is-sealed.patch           |   22 ++++++++++++++++++++
 .../codec-engine/ti-codec-engine_2.26.02.11.bb     |    3 ++
 recipes-ti/devtools/ti-xdctools.inc                |    3 +-
 recipes-ti/dmai/ti-dmai_svn.bb                     |    6 ++--
 recipes-ti/edma3lld/ti-edma3lld.inc                |    3 +-
 recipes-ti/includes/ti-eula-unpack.inc             |    2 +-
 9 files changed, 37 insertions(+), 9 deletions(-)
 create mode 100644 recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch

-- 
1.7.6.4


