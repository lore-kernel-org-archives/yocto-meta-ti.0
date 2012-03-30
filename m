Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CE25E006C7
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 16:11:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A3A2552A57; Fri, 30 Mar 2012 23:11:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330231126.A3A2552A57@arago-project.org>
Date: Fri, 30 Mar 2012 23:11:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: improve cape support
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
X-List-Received-Date: Fri, 30 Mar 2012 23:11:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a04b218eb638d7fe1835028ac4d283d0885f6173
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a04b218eb638d7fe1835028ac4d283d0885f6173

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Mar 19 15:04:32 2012 +0100

linux-ti33x-psp 3.2: improve cape support

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...add-more-beagleboardtoys-cape-partnumbers.patch |   53 ++++++++
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |  129 ++++++++++++++++++++
 ...25-beaglebone-add-enter-key-for-lcd7-cape.patch |   40 ++++++
 .../0026-beaglebone-add-gpio-keys-for-lcd.patch    |  113 +++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 340 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=a04b218eb638d7fe1835028ac4d283d0885f6173

