Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35FE5E00769; Fri,  5 Sep 2014 05:35:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.230 listed in list.dnswl.org]
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D584E006EF
	for <meta-ti@yoctoproject.org>; Fri,  5 Sep 2014 05:35:27 -0700 (PDT)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id nQbR1o00X1mTNtu01QbSvp; Fri, 05 Sep 2014 05:35:27 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Fri,  5 Sep 2014 07:34:42 -0500
Message-Id: <1409920483-18151-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH] make linux-ti-staging kernel origin configurable
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
X-List-Received-Date: Fri, 05 Sep 2014 12:35:33 -0000

Thanks to Denys for the details on linux-ti-staging's scope and
comparison with linux-mainline at
https://lists.yoctoproject.org/pipermail/meta-ti/2014-September/005176.html

I'm assuming the goal to push upstream everything in ti-kernel that
they'll accept, and because there's a lot there it's going to take some
time.  I'm very glad to see that the beagleboard kernel
https://github.com/beagleboard/linux is tracking ti-kernel closely.

The attached patch is submitted in hopes it can be used for the current
and future linux-ti-staging recipes to make it easier for people to try
patches and combinations that are based on TI's kernel while remaining
within the Yocto Project environment.

As a specific example: for my own use I need device tree modifications
and in-progress drivers.  It's a lot simpler to manage those by keeping
them in a local git kernel repository that merges in changes from
various sources.  The linux-yocto kernel infrastructure supports this
when I override SRC_URI in a bbappends file, because the kernel is the
only object listed there.

linux-ti-staging's configuration infrastructure adds references to
fragments and config files that are in the meta-ti layer, which means I
can't just override SRC_URI without having to replicate its contents in
my bbappends, which is fragile as I might miss important changes.

Specifying the kernel URI and protocol as variables lets me do the
following in a bbappends, which decouples me from meta-ti:

SRCREV = "872959a8eb82aa696bbd936bc052ec9020d9cd6f"
KERNEL_GIT_URI = "git:///prj/oe/linux"
KERNEL_GIT_PROTOCOL = "file"
BRANCH = "ti-kernel/ti-3.14.y/dev"

# fhandle: CONFIG_FHANDLE=y required for systemd getty
# kconfig: make running config available from procfs
SRC_URI =+ "\
    file://fhandle.cfg \
    file://kconfig.cfg \
"

KERNEL_CONFIG_FRAGMENTS =+ "\
    ${WORKDIR}/fhandle.cfg \
    ${WORKDIR}/kconfig.cfg \
"

This also makes it easy to integrate the beagleboard configurations into
YP for people who need meta-ti anyway.


Peter A. Bigot (1):
  linux-ti-staging_3.14: make kernel origin configurable

 recipes-kernel/linux/linux-ti-staging_3.14.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.8.5.5


