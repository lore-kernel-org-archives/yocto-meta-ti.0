Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.18365.1579638475863506447
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jan 2020 12:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jwtdyHaf;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00LKRtag119372
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 14:27:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579638475;
	bh=IfD3apFa8eAFwt+RhnSZO6nCq+WyUJ8oN2N+sOJLVHo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jwtdyHafpxXgmeotwmQs5EbvulVoJXW+EV7ImngMX7RNvGWC8iedVp3h36IsxvXz8
	 4Q3+R+AuvUQljmmqy4Sco0gAZqN4UTTQi5ibUZkcmLKvauPCuFmCey8fqCFAFKScyf
	 RRY6aYhBGZgUGYAa6/fyOpdqW8nyvtQR+BnGK46o=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00LKRtGK085792
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 14:27:55 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 14:27:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 14:27:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LKRsoI115539;
	Tue, 21 Jan 2020 14:27:54 -0600
Date: Tue, 21 Jan 2020 15:27:54 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <ajhernandez@ti.com>
CC: <d-huang@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Message-ID: <20200121202754.GD31036@beryl>
References: <20200121185653.15419-1-d-huang@ti.com>
 <b04580d0-359a-46d9-91d1-55e78bde992c@ti.com>
MIME-Version: 1.0
In-Reply-To: <b04580d0-359a-46d9-91d1-55e78bde992c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, looks good to me - will merge shortly.

Denys


On Tue, Jan 21, 2020 at 02:40:52PM -0500, Alejandro Hernandez via Lists.Yoctoproject.Org wrote:
> ACK.
> 
> Thanks and regards,
> 
> Alejandro Hernandez
> 
> On 1/21/20 1:56 PM, d-huang@ti.com wrote:
> >From: David Huang <d-huang@ti.com>
> >
> >Pick up latest version of ti-img-encode-decode with improvements
> >to V4L2 decoder stream restart and slice map calculation, and
> >encoder performance profiling options.
> >
> >Signed-off-by: David Huang <d-huang@ti.com>
> >---
> >  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> >index 87ed70a8c48c..86d954756600 100644
> >--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> >+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> >@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
> >  inherit module
> >-MACHINE_KERNEL_PR_append = "e"
> >+MACHINE_KERNEL_PR_append = "f"
> >  PR = "${MACHINE_KERNEL_PR}"
> >  COMPATIBLE_MACHINE = "j7-evm"
> >-SRCREV = "fe07667a9405f17f04f5d26de5b0ba0626fec807"
> >+SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
> >  EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
> >  TARGET_CC_ARCH += "${LDFLAGS}"

> 

