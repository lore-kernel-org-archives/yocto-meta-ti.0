Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.41.1574703456307232173
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 09:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E/sWGaes;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F36B9E00FCC; Mon, 25 Nov 2019 09:37:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEAA5E00F78
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 09:37:34 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPHbV3g063052;
	Mon, 25 Nov 2019 11:37:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574703451;
	bh=zRRiUpMjexjBb3KZtTiquUb285SDqJTuk2UMJ3DkgsA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E/sWGaes/xXC1jW+8wbLyVIybJGDlR0Uu2X9iJwxdexQys1B19QVfuNkN/uGe2oFr
	 SVa3eTjxoSS6uu4ghlamXRAQa2UYS6WBHw8DiLfwqndgt/i09VRAS2evWC311x0J5H
	 9NEfYBdQR+vxPMtqFdNl1n4bTKouXAHSVbHXZOYs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPHbUst013397;
	Mon, 25 Nov 2019 11:37:30 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 11:37:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 11:37:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPHbTUm004666;
	Mon, 25 Nov 2019 11:37:30 -0600
Date: Mon, 25 Nov 2019 12:37:28 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Paul Barker <paul@betafive.co.uk>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] Backport request for thud
Message-ID: <20191125173727.GB4706@beryl>
References: <2972340c-d2ba-481b-900c-9c758cb60fde@www.fastmail.com>
 <20191119182147.GF27719@beryl>
MIME-Version: 1.0
In-Reply-To: <20191119182147.GF27719@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 19, 2019 at 01:21:47PM -0500, Denys Dmytriyenko wrote:
> On Sat, Nov 16, 2019 at 11:43:19AM +0000, Paul Barker wrote:
> > I'm currently seeing build failures on the thud branch with meta-ti under 
> > Centos 7 and Centos 8. As /lib and /lib64 are links to /usr/lib and 
> > /usr/lib64 respectively, the logic in ti-unpack.inc is looking for the 
> > 32-bit C library under /lib32 which doesn't exist.
> > 
> > Could you backport 6f80b1e5595a13eec465581cfb352efcb0286bc8 from master to 
> > thud to fix this?
> 
> Paul,
> 
> I will backport this fix to thud, but currently it's frozen due to a pending 
> release. Please give it a week or so. Thanks.

It is now merged to thud.

-- 
Denys
