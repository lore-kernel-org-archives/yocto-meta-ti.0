Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7441E0073F
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1766F52A90; Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210315.1766F52A90@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: backport PM and USB fixes from PSP
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 536748db584b77158c166c068ffe8960b0847ea5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=536748db584b77158c166c068ffe8960b0847ea5

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun  7 17:40:42 2012 +0200

linux-ti33x-psp 3.2: backport PM and USB fixes from PSP

The complete patchset will get rebased to the tip of the PSP tree soon, but the
conflicts take a lot of time to resolve.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-AM33XX-Add-missing-EMIF-register-offsets.patch |   61 +++
 ...33XX-PM-Get-rid-of-hardcoded-resume-addre.patch |   99 +++++
 ...33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch |  397 ++++++++++++++++++
 ...AM33XX-PM-Save-and-restore-EMIF-registers.patch |  241 +++++++++++
 ...33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch |   37 ++
 ...33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch |  139 +++++++
 ...-AM33XX-Update-the-sleep-code-to-handle-D.patch |  150 +++++++
 ...008-usb-musb-update-babble-workaround-fix.patch |  168 ++++++++
 ...81xx-print-the-usbss-revision-id-during-i.patch |   29 ++
 ...ppi41-enable-txfifo-empty-interrupt-logic.patch |  425 ++++++++++++++++++++
 ...ost-Flush-txfifo-only-if-TxPktRdy-bit-set.patch |   57 +++
 ...pi41-use-dsb-to-make-sure-PDs-are-updated.patch |   43 ++
 ...3-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch |   46 +++
 ...-usb-musb-host-fix-for-urb-error-handling.patch |   66 +++
 ...pi41-txdma-flushfifo-fixes-during-channel.patch |   50 +++
 ...6-usb-musb-cppi41-tx-dma-completion-fixes.patch |   41 ++
 ...st-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch |   30 ++
 ...-usb-musb-ti81xx-fix-role-switching-issue.patch |   65 +++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   20 +-
 19 files changed, 2163 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=536748db584b77158c166c068ffe8960b0847ea5

