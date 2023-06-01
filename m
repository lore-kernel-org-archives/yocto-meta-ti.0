Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E28AC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 20:23:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3096.1685651008258108155
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 13:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vF4vEK/t;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: bb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 351KNPtx114837;
	Thu, 1 Jun 2023 15:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685651005;
	bh=Le3d5GgDaagkN37kegpBe3stUfjUREy4JoS92EvY+KA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vF4vEK/tU2FP3s77LzoqBN4z6me8x+Oj7dAJWPLKaqF/rsLT2K7x04CQLMdhjbVBT
	 qBfDOvodn9h+TnIVFkMywWXxLYRx1aj91/I4hFB1s09OXInLmfAzDTCm3Vp1N/hmq4
	 OYjAoztgdcg8pvjLtNhn7IHMm9RNWzhzL8lgALFI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 351KNPMt036071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 15:23:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 15:23:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 15:23:24 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 351KNOn4002082;
	Thu, 1 Jun 2023 15:23:24 -0500
Date: Thu, 1 Jun 2023 15:23:24 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Res Sapp <rs@ti.com>
Subject: Re: [meta-ti kirkstone/master PATCH] ti-kernel: Apply RT config
 fragments to RT kernel defconfig
Message-ID: <20230601202324.2gmc3pd3v6ktxuxn@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20230601185739.2862707-1-bb@ti.com>
 <765722ff-f117-32f9-34b3-b531c2b6816c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <765722ff-f117-32f9-34b3-b531c2b6816c@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Jun 2023 20:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16649

Hi Andrew!

On June  1, 2023 thus sayeth Andrew Davis:
> On 6/1/23 1:57 PM, Bryan Brattlof wrote:
> > For the v6.1 LTS kernel, we (TI) have moved to using defconfig fragments
> > to build the different kernel configurations. To properly build a kernel
> > with full preemption support, add the ti_arm64_rt.config to the
> > linux-ti-staging-rt-6.1/k3/defconfig
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >   .../recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig   | 2 +-
> 
> Looks good for k3, what about non-k3 and omapl138?
> 

Ah! good point... I'll add them in my v2 :)

~Bryan

