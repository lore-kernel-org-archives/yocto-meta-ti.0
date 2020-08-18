Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.73646.1597778195996413593
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 12:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iNyRxJbS;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D261FE0203E; Tue, 18 Aug 2020 12:16:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B723AE0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 12:16:34 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IJGYhH129744
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597778194;
	bh=5XCOefj4h8D2l3IydXuh8mnbeVhEKSuLM0xTLb7vgpY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iNyRxJbSfaxql4EI5WZJpYP0BKgDXRuIJOfzQe2xi+S8BFYWLxcMBSgXVPrlV20I9
	 BqRGX0FsDFA2B9dl7TxR7mN4DIe2UmZwCNC+wcq0jpcnP+x7aviN+nBtHQLtsWHGOq
	 CyLuyeFzzY0o7+mY6pLNl8FrgD2LmipyrWzdiV6U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IJGYRP079769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:16:34 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 14:16:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 14:16:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IJGX2o047750;
	Tue, 18 Aug 2020 14:16:33 -0500
Date: Tue, 18 Aug 2020 15:16:33 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][dunfell PATCH] recipes-kernel: linux-ti-staging: update SRCREV to latest
Message-ID: <20200818191633.GN10642@beryl>
References: <20200818185140.31666-1-nikhil.nd@ti.com>
 <394acfd5-a381-f3d8-c9d0-fb59f0477d11@ti.com>
MIME-Version: 1.0
In-Reply-To: <394acfd5-a381-f3d8-c9d0-fb59f0477d11@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 18, 2020 at 02:12:17PM -0500, Dan Murphy wrote:
> Nikhil
> 
> On 8/18/20 1:51 PM, Nikhil Devshatwar wrote:
> >Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >---
> >  recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> >index cf1ecc6e..0e87f7d8 100644
> >--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> >+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> >@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
> >  BRANCH = "ti-linux-5.4.y"
> >-SRCREV = "a32d62437eb9f2acd64a124c221de98d6f728bcc"
> >+SRCREV = "da26e63e96f403b7415fdf7e0b45eeaba63ddbe0"
> >  PV = "5.4.54+git${SRCPV}"
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 
> Nack
> 
> I just updated the kernel to 5.4.58

Also, need to update RT kernel as well, as it uses a different branch.

-- 
Denys
