Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25686E01423
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 11:15:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5E46A52A77; Wed, 30 May 2012 18:15:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120530181515.5E46A52A77@arago-project.org>
Date: Wed, 30 May 2012 18:15:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: sgx fix from PSP + dvi cape audio fix
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
X-List-Received-Date: Wed, 30 May 2012 18:15:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1d44de8f58cdfd71c90ce078070be1b6c6574832
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1d44de8f58cdfd71c90ce078070be1b6c6574832

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May 23 16:18:16 2012 +0200

linux-ti33x-psp 3.2: sgx fix from PSP + dvi cape audio fix

Also move more things to modules to speed up boot.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...unding-FB-size-to-satisfy-SGX-buffer-requ.patch |   59 ++++++
 .../0063-beaglebone-dvi-cape-audio-hacks.patch     |  217 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |  124 ++++++++----
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 +-
 4 files changed, 360 insertions(+), 44 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=1d44de8f58cdfd71c90ce078070be1b6c6574832

