Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 317CAE0030B
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2012 13:08:07 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYM00EJ7QP7QQM2@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jan 2012 15:07:56 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C4E7820238; Mon,
	30 Jan 2012 16:07:55 -0500 (EST)
Date: Mon, 30 Jan 2012 16:07:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120130210755.GD2032@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [bitbake-devel] [PATCH 0/6] bitbake-layers improvements
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
X-List-Received-Date: Mon, 30 Jan 2012 21:08:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

There is a set of patches for bitbake-layers just posted to bitbake-devel 
mailing list by Paul with really nice improvements, such as showing overlayed 
(shadowed or extended) recipes and classes with layer priorities taken into 
account. Seems like a great overall improvement and definitely worth checking 
out.

Denys


----- Forwarded message from Paul Eggleton <paul.eggleton@linux.intel.com> -----

Date: Mon, 30 Jan 2012 16:25:48 +0000
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: bitbake-devel@lists.openembedded.org
X-Mailer: git-send-email 1.7.5.4
Subject: [bitbake-devel] [PATCH 0/6] bitbake-layers improvements

Make some significant improvements to bitbake-layers that should provide
more information about what files each layer is overlaying as well as
making the utility easier to use.

The following changes (against Poky, but apply cleanly with -p2 against
bitbake master) are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib paule/bitbake-layers-fix5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/bitbake-layers-fix5

Paul Eggleton (6):
  bitbake-layers: add copyright notice
  bitbake-layers: use dashes in subcommands
  bitbake-layers: use directory name as layer name
  bitbake-layers: improve show-overlayed output
  bitbake-layers: add show-recipes subcommand
  bitbake-layers: list overlayed classes in show-overlayed

 bitbake/bin/bitbake-layers  |  262 +++++++++++++++++++++++++++++++++++++------
 bitbake/lib/bb/cooker.py    |   14 +--
 bitbake/lib/bb/providers.py |   36 ++++++
 3 files changed, 265 insertions(+), 47 deletions(-)

-- 
1.7.5.4


_______________________________________________
bitbake-devel mailing list
bitbake-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/bitbake-devel


----- End forwarded message -----

