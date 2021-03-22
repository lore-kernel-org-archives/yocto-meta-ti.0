Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.619.1616433187936051118
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 10:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 52C4A40C16;
	Mon, 22 Mar 2021 17:13:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KviVV2FH6OY5; Mon, 22 Mar 2021 17:13:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2305240A3D;
	Mon, 22 Mar 2021 17:13:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6C87D174557; Mon, 22 Mar 2021 13:13:03 -0400 (EDT)
Date: Mon, 22 Mar 2021 13:13:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Weaver, Lucas" <l-weaver@ti.com>
Cc: meta-ti@lists.yoctoproject.org, nikhil.nd@ti.com, praneeth@ti.com
Subject: Re: [EXTERNAL] Re: [meta-ti][dunfell/master][PATCH v2] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
Message-ID: <20210322171303.GI18041@denix.org>
References: <20210322160706.3304-1-l-weaver@ti.com>
 <20210322162131.GH18041@denix.org>
 <59ed911f-a1ab-0f13-c6f1-c17b0458b729@ti.com>
MIME-Version: 1.0
In-Reply-To: <59ed911f-a1ab-0f13-c6f1-c17b0458b729@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 11:54:10AM -0500, Weaver, Lucas wrote:
> 
> 
> On 3/22/2021 11:21 AM, Denys Dmytriyenko wrote:
> >On Mon, Mar 22, 2021 at 09:37:06PM +0530, l-weaver via lists.yoctoproject.org wrote:
> >>From: Lucas Weaver <l-weaver@ti.com>
> >>
> >>The J7200 ti-sci-fw needs to be installed in the deploy
> >>directory so that it can be packaged in Processor SDK bundle
> >>
> >>This is required because the ti-sci-fw is needed in the
> >>installer prebuilt-images in order to build the combined boot
> >>image for J7200
> >>
> >>Signed-off-by: Lucas Weaver <l-weaver@ti.com>
> >>---
> >>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >>diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>index e7580a57..25fac359 100644
> >>--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>@@ -99,6 +99,7 @@ do_deploy_j7200-evm-k3r5() {
> >>  	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> >>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> >>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> >>+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> >
> >This is already done for all platforms:
> >
> >https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb#n87
> >
> >do_deploy () {
> >	...
> >
> >	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> >}
> >
> >
> From my understanding, I thought that the do_deploy_j7200-evm-k3r5
> shown below will overwrite the do_deploy task for the j7200-evm-k3r5
> platform.  This was seemingly confirmed when I tried to bundle the
> ti-sci-fw for J7200 in the Processor SDK bundle but this file was
> not found.  After adding the change from this patch, the bundle step
> succeeded.  Could you please clarify my understanding?

Ah, you are right. I somehow misread those as appends and not complete 
overrides. In that case your change is correct.

I just wonder if the same change is needed for am64x platforms. And that 
portion of the code needs some unification and cleanup...


> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb#n97
> 
> 
> do_deploy_j7200-evm-k3r5() {
> 	install -d ${DEPLOYDIR}
> 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY}
> ${DEPLOYDIR}/${UBOOT_IMAGE}
> 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> }
> >>  }
> >>  do_install_am64xx-evm-k3r5() {
> >>-- 
> >>2.17.1
> >>
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
