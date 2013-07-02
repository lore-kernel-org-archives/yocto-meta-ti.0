Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D76B2E01476
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:02:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0889252AB0; Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702160252.0889252AB0@arago-project.org>
Date: Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x-psp: Add patch to enable SR on PG 2. x boards.
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
X-List-Received-Date: Tue, 02 Jul 2013 16:02:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 5f945012c9705a23a3eb9a2827807e3c3ed263a1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f945012c9705a23a3eb9a2827807e3c3ed263a1

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jun 27 10:57:32 2013 -0500

linux-am335x-psp: Add patch to enable SR on PG 2.x boards.

* Add patch that enables Smart Reflex on new PG 2.x boards.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...lex-support-for-ES-2.x-and-suspend-resume.patch | 1928 ++++++++++++++++++++
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    3 +-
 2 files changed, 1930 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=5f945012c9705a23a3eb9a2827807e3c3ed263a1

