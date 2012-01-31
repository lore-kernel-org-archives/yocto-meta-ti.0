Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFC72E0030B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:13 -0800 (PST)
Received: by ghbz2 with SMTP id z2so607146ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=3wOv6kekbzG6W9I56Y7IqagHBPK3B8Kz1nWFjDgvLoQ=;
	b=RiJJQUVu6d/8rLg32C6nIsZtb6y08tq3fhVSZNhs0hzmNs0YnxWS5pp0MeHg3fKAYK
	E2DkDO+51Y7V5R9squLy5ElHPfMLm9um05wBQyjlCp9cyENixnI9RlO7gVEnz1limWW/
	H5MZ4J7x/1JMy7gPYXTmoFLmXWYxpf2l/MxqM=
Received: by 10.236.122.12 with SMTP id s12mr33908435yhh.63.1328013673167;
	Tue, 31 Jan 2012 04:41:13 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id t13sm55432563anh.2.2012.01.31.04.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 04:41:08 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 31 Jan 2012 06:40:53 -0600
Message-Id: <1328013657-2069-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] Resubmit TI DSP build issues related to installer
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
X-List-Received-Date: Tue, 31 Jan 2012 12:41:14 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

This patch set re-submits the (updated) uncommitted parts of my 27Dec2011
patch set to get gstreamer-ti and its dependencies to build in a pristine
work environment.  It was left back on 29Dec2011 with:

> I'm going to wait for Roger to get back from holidays to comment on the installer issues, I'll push the CE and dmai patches later today.

The installer issues are:

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

For the 31Jan2012 attempt, similar changes had to be made to
ti-codecs-omap3530.

For the 31Jan2012 attempt, the ti-dmai build required more than just
altering the striplevel: the ${S} value had to be changed since there was no
Makefile at its original value.  There is still an issue that prevents use
of where make 3.85 produces a "Entering an unknown directory" failure in
do_install, but that's an upstream problem: I just used make 3.81 to
complete the build.

Peter A. Bigot (4):
  ti-eula-unpack: remove extraneous newline in cmd output
  various: fix installation directories for corrected ti-eula-unpack
  ti-codecs-omap3530: fix for corrected ti-eula-unpack
  ti-dmai_svn: correct path within svn checkout

 recipes-ti/bios/ti-dspbios.inc                     |    3 ++-
 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20 ++++++++++----------
 recipes-ti/devtools/ti-xdctools.inc                |    3 ++-
 recipes-ti/dmai/ti-dmai_svn.bb                     |    9 ++++++---
 recipes-ti/edma3lld/ti-edma3lld.inc                |    3 ++-
 recipes-ti/includes/ti-eula-unpack.inc             |    2 +-
 6 files changed, 23 insertions(+), 17 deletions(-)

-- 
1.7.6.4


