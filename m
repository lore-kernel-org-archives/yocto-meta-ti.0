Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.186.1634850497734209571
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 14:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2654B40BEB;
	Thu, 21 Oct 2021 21:08:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLv-ndEI4tOB; Thu, 21 Oct 2021 21:08:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 05392406B7;
	Thu, 21 Oct 2021 21:08:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF7971746A7; Thu, 21 Oct 2021 17:08:12 -0400 (EDT)
Date: Thu, 21 Oct 2021 17:08:12 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Sinthu Raja M <sinthu.raja@mistralsolutions.com>,
	meta-ti@lists.yoctoproject.org, Nishanth Menon <nm@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
Message-ID: <20211021210812.GE10132@denix.org>
References: <20211019082221.4767-1-sinthu.raja@ti.com>
 <20211019171544.GN10132@denix.org>
 <CAEd-yTQ6f37sp7bpXucQH3s02S=hy_3PEwy8qWYj84X+64i0rw@mail.gmail.com>
 <5acf4b8e-be87-ad85-a8ec-5d7f233cca73@ti.com>
MIME-Version: 1.0
In-Reply-To: <5acf4b8e-be87-ad85-a8ec-5d7f233cca73@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 07:52:21PM -0500, praneeth via lists.yoctoproject.org wrote:
> 
> 
> On 10/20/2021 12:42 PM, Sinthu Raja M wrote:
> >Denys,
> >
> >On Tue, Oct 19, 2021 at 10:45 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >>On Tue, Oct 19, 2021 at 01:52:21PM +0530, Sinthu Raja wrote:
> >>>From: Sinthu Raja <sinthu.raja@ti.com>
> >>>
> >>>The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
> >>>so replace the eaik dtb with sk dtb file
> >>>
> >>>[1] https://www.ti.com/tool/SK-TDA4VM
> >>>
> >>>Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >>>---
> >>>  conf/machine/j7-evm.conf | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> >>>index 7cde9f4d..1f47f00c 100644
> >>>--- a/conf/machine/j7-evm.conf
> >>>+++ b/conf/machine/j7-evm.conf
> >>>@@ -13,7 +13,7 @@ KERNEL_DEVICETREE = " \
> >>>      ti/k3-j721e-common-proc-board.dtb \
> >>>      ti/k3-j721e-proc-board-tps65917.dtb \
> >>>      ti/k3-j721e-common-proc-board-infotainment.dtbo \
> >>>-    ti/k3-j721e-eaik.dtb \
> >>>+    ti/k3-j721e-sk.dtb \
> >>
> >>Was there a corresponding kernel change with the file rename?
> >>
> >Yes, The kernel changes are there in the review state and will get merged today.
> 
> merged now :
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=2654df7db9e8f024be9ac4e769cdb454a61907e0

And kernel recipe should also have been updated first before changing 
KERNEL_DEVICETREE - I see Yogesh is taking care of that:
https://lists.yoctoproject.org/g/meta-ti/message/14082


> >
> >Regards,
> >Sinthu Raja.
> >>
> >>>  "
> >>>
> >>>  UBOOT_MACHINE = "j721e_evm_a72_config"
> >>>--
> >>>2.31.1
> >>>

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
