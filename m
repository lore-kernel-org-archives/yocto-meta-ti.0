Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7332BE00533
	for <meta-ti@yoctoproject.org>; Mon,  3 Dec 2012 13:16:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0A3DB52AA6; Mon,  3 Dec 2012 21:16:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121203211650.0A3DB52AA6@arago-project.org>
Date: Mon,  3 Dec 2012 21:16:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: update from version 3.6-rc6 to 3.6.6
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
X-List-Received-Date: Mon, 03 Dec 2012 21:16:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 0a764d733691db4bf40539693fa3d93f6883baa7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0a764d733691db4bf40539693fa3d93f6883baa7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Dec  3 15:45:01 2012 -0500

linux-keystone: update from version 3.6-rc6 to 3.6.6

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc                  |    3 +-
 .../linux/linux-keystone-3.5+3.6-rc6/defconfig     | 1012 -------------
 .../linux/linux-keystone-3.6.6/defconfig           | 1533 ++++++++++++++++++++
 ...nux-keystone_3.6.bb => linux-keystone_3.6.6.bb} |    5 +-
 4 files changed, 1537 insertions(+), 1016 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=0a764d733691db4bf40539693fa3d93f6883baa7

