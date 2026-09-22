Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C91C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:59:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3672.1790103548293046518
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F1D340CB0;
	Tue, 22 Sep 2026 18:59:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNuT0JANcet7; Tue, 22 Sep 2026 18:59:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2888C40C3A;
	Tue, 22 Sep 2026 18:59:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C376617E96B; Tue, 22 Sep 2026 14:59:03 -0400 (EDT)
Date: Tue, 22 Sep 2026 14:59:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] kernel-selftest: Disable upstream
 patches
Message-ID: <20260922185903.GC4190@denix.org>
References: <20260922144347.926114-1-reatmon@ti.com>
 <20260922182654.GA4190@denix.org>
 <2b8c5cfb-1e71-422b-9d9c-59ff7c982536@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b8c5cfb-1e71-422b-9d9c-59ff7c982536@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:59:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20397

On Tue, Sep 22, 2026 at 01:30:53PM -0500, Ryan Eatmon wrote:
> 
> 
> On 9/22/2026 1:26 PM, Denys Dmytriyenko wrote:
> >On Tue, Sep 22, 2026 at 09:43:47AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>A recent commit in meta-openembedded [1] added a number of patches to
> >>fix testing issues, but those patches only apply to the latest 7.2
> >>kernel.  Since we have our own vendor kernel and support multiple older
> >>versions, we need to disable the patches for kernels that they will not
> >>apply to.
> >>
> >>[1] https://git.openembedded.org/meta-openembedded/commit/?id=11a9324c8449a8567461a7914aa5c7a592de3f45
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  .../kernel-selftest/kernel-selftest-ti.inc       | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >>diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> >>index bae5b7ab..e393b39f 100644
> >>--- a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> >>+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> >>@@ -51,3 +51,19 @@ TEST_LIST:append:bsp-ti-6_18 = " \
> >>  "
> >>  INSANE_SKIP:${PN} += "staticdev textrel"
> >>+
> >>+SRC_URI:remove:bsp-ti-6_6 = "\
> >>+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
> >>+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
> >>+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
> >>+"
> >>+SRC_URI:remove:bsp-ti-6_12 = "\
> >>+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
> >>+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
> >>+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
> >>+"
> >>+SRC_URI:remove:bsp-ti-6_18 = "\
> >>+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
> >>+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
> >>+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
> >>+"
> >
> >What about other BSPs, like Beagle?
> >I also see that neither mainline nor next are 7.2 (yet) in meta-ti.
> >
> >Maybe we should add an anonymous python function that checks the
> >KERNEL_VERSION and removes the patches if it's below 7.2?
> 
> Both are good points.  I keep forgetting about the beagle boards.  My bad.
> 
> I'm open to the anonymous function to make it more generic.  Do you
> want to take a stab at it?

Sure, I can look at it.

-- 
Denys

