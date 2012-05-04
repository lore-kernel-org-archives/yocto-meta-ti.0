Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4C93E01412
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:07:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 43DCF52AA0; Fri,  4 May 2012 00:07:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120504000735.43DCF52AA0@arago-project.org>
Date: Fri,  4 May 2012 00:07:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-mainline 3.2: fix build of external SGX modules
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
X-List-Received-Date: Fri, 04 May 2012 00:07:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 368d7772dcde0a42e9952ca6b2762495d0f49602
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=368d7772dcde0a42e9952ca6b2762495d0f49602

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  1 21:06:50 2012 +0200

linux-mainline 3.2: fix build of external SGX modules

Patch downloaded from https://github.com/RobertCNelson/stable-kernel/tree/master/patches/sgx

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...DSS2-remove-update_mode-from-omapdss-v3.2.patch |  321 ++++++++++++++++++++
 recipes-kernel/linux/linux-mainline_3.2.bb         |    1 +
 2 files changed, 322 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=368d7772dcde0a42e9952ca6b2762495d0f49602

