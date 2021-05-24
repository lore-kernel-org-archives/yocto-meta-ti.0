Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2248.1621897032159264248
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 May 2021 15:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 79C6140C92;
	Mon, 24 May 2021 22:57:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFUCKkFggkVN; Mon, 24 May 2021 22:57:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3A04140BFF;
	Mon, 24 May 2021 22:57:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 80E5916C044; Mon, 24 May 2021 18:57:06 -0400 (EDT)
Date: Mon, 24 May 2021 18:57:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: nm@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master][PATCH V2] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210524225706.GX1528@denix.org>
References: <20210524202608.24622-1-yogeshs@ti.com>
 <20210524215201.72svjoseh6mjvuxg@turbojet>
 <20210524220234.GW1528@denix.org>
 <1f1bbead-54f1-34bf-57a4-1dbaa88f1406@ti.com>
MIME-Version: 1.0
In-Reply-To: <1f1bbead-54f1-34bf-57a4-1dbaa88f1406@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 05:29:15PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
> 
> On 5/24/21 5:02 PM, Denys Dmytriyenko wrote:
> >On Mon, May 24, 2021 at 04:52:01PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> >>On 15:26-20210524, Yogesh Siraswar wrote:
> >>>Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> >>>compile dtbs with symbols. This fixes the issue where the dtbs
> >>>are build without symbols causing issue with overlays.
> >>Might be worthwhile to add that enabling overlay support increases the
> >>size of the dtb, hence it is done at a platform level rather than
> >>globally to allow custom boards derived from meta-ti to not pay the
> >>penalty of extra dtb size, yet have the flexibility to enable on need
> >>basis.
> Will add in new version
> >>
> >>>Changes from last version:
> >>>1) Added human readable flag KERNEL_DTB_OVERLAY_SUPPORT to control
> >>>DTC_FLAGS.
> >>>2) The KERNEL_DTB_OVERLAY_SUPPORT is also derived from build-root
> >>>usage.
> >>Please don't add change log of patch version in commit message. That is
> >>not an information that is useful in git history.
> Will remove it

Should instead go below --- line.


> >>>Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> >>>---
> >>>  conf/machine/am335x-evm.conf                  | 2 ++
> >>>  conf/machine/am335x-hs-evm.conf               | 2 ++
> >>>  conf/machine/am437x-evm.conf                  | 2 ++
> >>>  conf/machine/am437x-hs-evm.conf               | 2 ++
> >>>  conf/machine/am57xx-evm.conf                  | 2 ++
> >>>  conf/machine/am57xx-hs-evm.conf               | 3 +++
> >>>  conf/machine/am65xx-evm.conf                  | 2 ++
> >>>  conf/machine/am65xx-hs-evm.conf               | 2 ++
> >>>  conf/machine/dra7xx-evm.conf                  | 2 ++
> >>>  conf/machine/dra7xx-hs-evm.conf               | 3 +++
> >>>  conf/machine/j7-evm.conf                      | 2 ++
> >>>  conf/machine/j7-hs-evm.conf                   | 2 ++
> >>>  conf/machine/j7200-evm.conf                   | 2 ++
> >>>  conf/machine/k2g-evm.conf                     | 2 ++
> >>>  conf/machine/k2g-hs-evm.conf                  | 2 ++
> >>>  recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
> >>>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
> >>>  recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
> >>>  18 files changed, 49 insertions(+), 4 deletions(-)
> >>>  create mode 100644 recipes-kernel/linux/ti-kernel.inc
> >>>
> >>>+
> >>[...]
> >>
> >>>+def get_extra_dtc_args(d):
> >>>+    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
> >>>+        return "DTC_FLAGS=-@"
> >>>+    else:
> >>>+        return ""
> >>>+
> >>>+EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
> >>>-- 
> >>>2.17.1
> >>>
> >>just for the record for other bb files:
> >>linux-ti-staging-rt_5.10.bb linux-ti-staging-systest_5.10.bb
> >>
> >>I think this opens up other possibilities in the future to move common
> >>operations into ti-kernel.inc and probably drop duplications
> >Both -rt and -systest are built on top of the main recipe, they just change
> >defconfig and/or branch:
> >https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> >https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> I guess no action here.
> >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
