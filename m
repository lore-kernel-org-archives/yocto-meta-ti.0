Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6BBCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:11:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.26035.1697717491737470455
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 05:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uZ2Do/E9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-mantena@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JCBRkJ009722;
	Thu, 19 Oct 2023 07:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697717487;
	bh=a4KAQdfWfKsHB8VGBD5V8N6r0mkwnM8J8LgDPR9yWlE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uZ2Do/E9OaNs2PbGmEESr51sCCCawTiyFPxWu+uAwp281CTolv2t4p4q1EBnuzt+C
	 66UnZq9tIXaUEhxUXpzj2wV4WrUOzEIw1RX7fewx+QvNgwBHykNkCDIVSPuJEpfKrq
	 yDdCpqYaViWkci9WqntOFlwQ+/XpfX8eec1oeuqk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JCBRgr091105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 07:11:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 07:11:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 07:11:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JCBP9H053026;
	Thu, 19 Oct 2023 07:11:26 -0500
Date: Thu, 19 Oct 2023 17:41:25 +0530
From: Prasanth Mantena <p-mantena@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-ti][kirkstone][PATCH 0/1] Update BBAI64 aarch64 target
 version
Message-ID: <20231019121124.o2jtpaybwsxykkw3@uda0496754>
References: <20231019113938.1657179-1-p-mantena@ti.com>
 <20231019120010.GO2408@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231019120010.GO2408@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 12:11:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17143

On 08:00-20231019, Denys Dmytriyenko wrote:
> On Thu, Oct 19, 2023 at 05:09:37PM +0530, Prasanth Babu Mantena via lists.yoctoproject.org wrote:
> > The following patch is to update the kernel version of linux-bb.org from 5.10 to 6.1 
> > and is verified on BBAI64 board for successful booting of kernel.
> 
> NAK.
> 
> I'm sitting on the same changes for a few weeks now, waiting for the 
> corresponding EEPROM fix in U-boot. Otherwise it doesn't boot. Was this 
> tested with an old U-boot?

The EEPROM fix has been post to lpr and pulled to ti-u-boot-2023.04-next.
This patch has been tested against the EEPROM fix. It was tested with
old u-boot without fix by booting kernel using custom get_fdt_mmc
throught uEnv.txt. But as proper fix is in place now, This patch should
work without issues.

Regards,
Prasanth

> 
> 
> > The existing dtbs are added to the machine conf file. Further addition
> > of dtb overlays to the tree requires them to be added to the machine conf
> > file. I am not working on adding the overlays of BBAI64 to the kernel.
> > 
> > 
> > Prasanth Babu Mantena (1):
> >   linux-bb.org: update to 6.1.46 for aarch64 targets
> > 
> >  meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 72 ++++++-------------
> >  .../recipes-kernel/linux/linux-bb.org_git.bb  |  8 +--
> >  2 files changed, 24 insertions(+), 56 deletions(-)
> > 
> > -- 
> > 2.33.3

