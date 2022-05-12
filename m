Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 14:05:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.4650.1652364348355545477
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 May 2022 07:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rdDs8gaa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CE5hXE066428;
	Thu, 12 May 2022 09:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652364343;
	bh=jfCJVqE5n9tkjunw6PWHGLrxD4IV3hGxISNB7NzZK0A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rdDs8gaaBbmVfGpn+6dFWy9wpoJ7oT/GQEy4kQMUrrnZ+Y2Zmoa061PbzXjFYPiP5
	 kUQF0ITC3Ic7ItpSwF2LllAlNpuSQ4L65PFyR9AVqdURAA/O6SftZ718QT+Kem2Bp1
	 b4JI2mxVK+kBdn5mjhi9q/1qHM31fXA85iGCP8o0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CE5hQo046181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 09:05:43 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 09:05:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 09:05:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CE5ht1072654;
	Thu, 12 May 2022 09:05:43 -0500
Date: Thu, 12 May 2022 09:05:43 -0500
From: Nishanth Menon <nm@ti.com>
To: <devarsht@ti.com>
CC: Aparna M <a-m1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <s-adivi@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Message-ID: <20220512140543.oqcnxfja75la4wdf@verify>
References: <20220512134657.31238-1-a-m1@ti.com>
 <2e0d6c43-5d99-ea35-7e2f-9c8b4a68da08@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e0d6c43-5d99-ea35-7e2f-9c8b4a68da08@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 May 2022 14:05:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14730

On 19:27-20220512, Devarsh Thakkar via lists.yoctoproject.org wrote:
> 
> On 12/05/22 19:16, Aparna M wrote:
> > Add DM firmware ipc_echo_testb_mcu1_0_release_strip.xer5f to deploy
> > directory for am62xx-evm. This is required for building tispl.bin.
> > 
> > Signed-off-by: Aparna M <a-m1@ti.com>
> > ---
> >   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > index 099473b4..bb88633a 100644
> > --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > @@ -186,6 +186,7 @@ do_deploy_am62xx-evm-k3r5() {
> >   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> >   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> >   	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> > +        install -m 644 ${S}/ti-dm/am62xx/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}/
> 
> What is SYSFW_TISCI being used for AM62 ? Any existing macros can't be used
> ?
> 
> Also is it changing indentation w.r.t previous line ?


This is the DM firmware. yes, it is already packaged as of tispl build, so
what is missing here?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

