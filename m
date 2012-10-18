Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFA4EE01275
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 09:23:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 343A752AB7; Thu, 18 Oct 2012 16:23:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121018162306.343A752AB7@arago-project.org>
Date: Thu, 18 Oct 2012 16:23:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?SGVydsOpIEZhY2hlIGxpbnV4LW9tYXA0OiB1cGRhdGUgdG8gMy40IGZyb20gR0xQIDEuNi4gNiByZWxlYXNl?=
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
X-List-Received-Date: Thu, 18 Oct 2012 16:23:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4f3522a9dc7f04e2f650199d66badb08dad214c6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f3522a9dc7f04e2f650199d66badb08dad214c6

Author: Hervé Fache <h-fache@ti.com>
Date:   Fri Oct  5 14:57:42 2012 +0200

linux-omap4: update to 3.4 from GLP 1.6.6 release

Used Herve's version as a base with some mods from Enrico and additional fixes
on top, defconfig is the validated one from GLP release.

Signed-off-by: Hervé Fache <h-fache@ti.com>
Cc: Enrico Butera <ebutera@users.berlios.de>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-omap4-3.4/pandaboard/defconfig     | 4152 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap4_3.4.bb            |   17 +
 2 files changed, 4169 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4f3522a9dc7f04e2f650199d66badb08dad214c6

