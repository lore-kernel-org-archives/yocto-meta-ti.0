Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2384.1582157737463355354
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 16:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xpgLEN3M;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K0Faqc100819
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:15:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582157736;
	bh=STvWCsWyRUV50oAIrAU87VJnqAEUZQTTWH3w2myZz4s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xpgLEN3MliUyjZgHiPIsbnXTfZyKGGMbLbYNVif5uTpS5JeYCYJ8GM4pAun4XmG/e
	 Y4doC7ynS9b3Jpm+6l8tLZymLmQD+Uj5t+uDT/Gx89gsjuY4Sh5hWnrHH8InhtJ30e
	 rNhOVloG6MJ9wDkhvew95ZQQ2LzeAvf0pN+s1b5Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01K0Fax6067307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:15:36 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 18:15:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 18:15:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K0FaFO058017;
	Wed, 19 Feb 2020 18:15:36 -0600
Date: Wed, 19 Feb 2020 19:15:36 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
Message-ID: <20200220001535.GA720@beryl>
References: <20200218160621.26272-1-afd@ti.com>
 <20200218175234.GJ720@beryl>
 <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com>
 <20200219235832.GY720@beryl>
 <b1012ba2-e080-3c50-4e92-b16ccf67f1ac@ti.com>
MIME-Version: 1.0
In-Reply-To: <b1012ba2-e080-3c50-4e92-b16ccf67f1ac@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 19, 2020 at 07:06:29PM -0500, Andrew F. Davis wrote:
> On 2/19/20 6:58 PM, Denys Dmytriyenko wrote:
> > On Tue, Feb 18, 2020 at 01:08:46PM -0500, Andrew F. Davis wrote:
> >> On 2/18/20 12:52 PM, Denys Dmytriyenko wrote:
> >>> I was sitting on a similar patch in a private testing branch:
> >>> https://lists.yoctoproject.org/g/meta-ti/message/12418
> >>
> >> Why RRECOMMENDS? It should be a real dependency right?
> > 
> > Andrew,
> > 
> > Historically kernel modules used RRECOMMENDS.
> > 
> > Plus, it's easier to break RRECOMMENDS dependency than RDEPENDS. And we had 
> > instances in the past, when we needed to be able to build against UM libs, 
> > even when KM support is not there. Of course, it may not be an issue in the 
> > future, when we split up UM libs package into individual libs and/or move to 
> > Mesa based builds...
> > 
> 
> Okay then, either way works for me, I'm just looking to get the
> dependency tree in order so we don't have to explicitly include the
> "gpudriver" anymore. It should be pulled in by any app using 3D.

Oh, I totally agree! BTW, I've been starting to look into dependency cleanup 
as part of that parallel private work I mentioned - the patch I linked is from 
that series. I'm hoping to be able to merge everything in the near future, as 
it's diverging quite rapidly, since it was based on Thud for few months...

-- 
Denys
