Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D0B9E0044D
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 21:57:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D32B552A86; Mon,  5 Mar 2012 05:57:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305055712.D32B552A86@arago-project.org>
Date: Mon,  5 Mar 2012 05:57:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-omap4: update to 3.1.0 (latest ti-ubuntu branch)
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
X-List-Received-Date: Mon, 05 Mar 2012 05:57:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 73de853320363a58c676a09a4d46a3f9ffa2c2ea
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=73de853320363a58c676a09a4d46a3f9ffa2c2ea

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Mar  2 14:19:58 2012 +0100

linux-omap4: update to 3.1.0 (latest ti-ubuntu branch)

Boot tested on Pandaboard ES/Angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc                     |    2 +-
 .../linux/linux-omap4-3.1.0/omap4430-panda         |    1 +
 .../pandaboard}/defconfig                          | 2881 +++++++++++++-------
 .../{linux-omap4_3.0.0.bb => linux-omap4_3.1.0.bb} |    8 +-
 4 files changed, 1963 insertions(+), 929 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=73de853320363a58c676a09a4d46a3f9ffa2c2ea

