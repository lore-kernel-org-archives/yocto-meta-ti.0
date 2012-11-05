Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CA9EE011AF
	for <meta-ti@yoctoproject.org>; Sun,  4 Nov 2012 20:50:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2087D52A1C; Mon,  5 Nov 2012 04:50:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121105045018.2087D52A1C@arago-project.org>
Date: Mon,  5 Nov 2012 04:50:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: add kernel for keystone SOC
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
X-List-Received-Date: Mon, 05 Nov 2012 04:50:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 12f4fb47abf8f59bd72396774e783d20d27e6e5f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12f4fb47abf8f59bd72396774e783d20d27e6e5f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov  1 20:44:13 2012 -0400

linux-keystone: add kernel for keystone SOC

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-keystone-3.5+3.6-rc6/defconfig     | 1012 ++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.6.bb         |   17 +
 2 files changed, 1029 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=12f4fb47abf8f59bd72396774e783d20d27e6e5f

