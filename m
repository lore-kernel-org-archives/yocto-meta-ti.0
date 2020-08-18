Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72147.1597776172914954987
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mb1cJeIX;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE93FE0203E; Tue, 18 Aug 2020 11:42:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EA44E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:42:49 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIgnJw005935
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597776169;
	bh=6ZbBt13rfbZWfsJcbqu/XG4aPKHt2u7w3meyhwmDRbg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mb1cJeIXFUpLFP1Guf8tkDYr71CVK1wp2vL11h4ItqY/m3VQ+bYWTVyzXAFuH8cA9
	 2OaMKOfEJwrh77Wp6uW7ji3oM1FpainHWcSttlO6zkJJ8HVOx65pX7nfAxvLTJj0hh
	 eYWUsfRVtaaYgQ06j0PPoDnYUoEkWNnEwz5YU8IQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIgnBG047902
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:42:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:42:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:42:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIgmto034256;
	Tue, 18 Aug 2020 13:42:48 -0500
Date: Tue, 18 Aug 2020 14:42:48 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>
Subject: Re: [meta-ti][dunfell PATCH] conf: machine: j7200-evm: Add Jailhouse overlay
Message-ID: <20200818184247.GK10642@beryl>
References: <20200818183314.6089-1-nikhil.nd@ti.com>
 <a3f96a66-0037-76cf-fe22-9dd364c6569e@ti.com>
MIME-Version: 1.0
In-Reply-To: <a3f96a66-0037-76cf-fe22-9dd364c6569e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 19, 2020 at 12:09:32AM +0530, Nikhil Devshatwar wrote:
> 
> 
> On 19/08/20 12:03 am, Nikhil Devshatwar wrote:
> >j7200-evm supports virtualization with Jailhouse hypervisor.
> >To use Jailhouse, kernel needs to boot with an additional
> >DTB overlay. Include this in the list of DTBs for the machine.
> >
> Apply this after the kernel recipe is updated to latest.
> I assume Dan will send you the updated kernel recipe for rc1, that's why I
> am not sending one.

And rc1 is not planned for about a month. You patch might be lost by then...


> Regards,
> Nikhil D
> 
> >Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >---
> >  conf/machine/j7200-evm.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> >index d2a81771..dab6d8cb 100644
> >--- a/conf/machine/j7200-evm.conf
> >+++ b/conf/machine/j7200-evm.conf
> >@@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >  KERNEL_DEVICETREE = " \
> >      ti/k3-j7200-common-proc-board.dtb \
> >+    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
> >  "
> >  UBOOT_MACHINE = "j7200_evm_a72_config"
> >
