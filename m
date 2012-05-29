Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA3BBE013B7
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 13:51:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 58EBA52A88; Tue, 29 May 2012 20:51:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120529205125.58EBA52A88@arago-project.org>
Date: Tue, 29 May 2012 20:51:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: merge in 6 musb patches from PSP
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
X-List-Received-Date: Tue, 29 May 2012 20:51:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0dc054072d133ba96cc799ef9ac4b9f37b69a139
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0dc054072d133ba96cc799ef9ac4b9f37b69a139

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May 22 08:06:26 2012 +0200

linux-ti33x-psp 3.2: merge in 6 musb patches from PSP

Updating the SRCREV would require redoing all boardfile patches due to the
EVM-SK changes. So cherry-pick the 6 patches we need.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...pi41-revisit-the-teardown-path-to-fix-iso.patch |  103 ++++++++++++++++++++
 ...musb-fix-bug-in-data-toggle-sw-workaround.patch |   31 ++++++
 ...udc-core-stop-UDC-on-device-initiated-dis.patch |   41 ++++++++
 ...udc-core-fix-asymmetric-calls-in-remove_d.patch |   43 ++++++++
 ...-usb-gadget-udc-core-fix-wrong-call-order.patch |   33 ++++++
 ...udc-core-fix-incompatibility-with-dummy-h.patch |   46 +++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    8 ++-
 7 files changed, 304 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=0dc054072d133ba96cc799ef9ac4b9f37b69a139

