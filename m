Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.29475.1595453085842891888
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 14:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DqiO9Lio;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MLOfAW107227;
	Wed, 22 Jul 2020 16:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595453081;
	bh=beWH8WzY6fRU8u2MaXv0K8HTZKPLxXkt0D0JvnwvCkw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DqiO9Liom2uYk/mgGhHJNtc6Vi7+0IfCDC/WbUIIfqI1jtwjUkIck2YP66IqR1IZ4
	 9xu7+oI8Y8YZHLGQE3XepXv7Rqtk0L3sVkyR6ejjZ+/ET2iNo7qAD3XixUOrprs/cu
	 Q0VvF5ZifAoAIwVXhHL26/zRqBKKUmDUl6P3liSY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MLOfnC022373
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jul 2020 16:24:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 16:24:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 16:24:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MLOfZ1083993;
	Wed, 22 Jul 2020 16:24:41 -0500
Date: Wed, 22 Jul 2020 17:24:41 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] pru-icss: Replace hardcoded lib with libdir variable
Message-ID: <20200722212440.GC10098@beryl>
References: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu>
 <20200717203244.GG13182@beryl>
 <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Jul 18, 2020 at 09:58:05AM +0200, Alessio Igor Bogani wrote:
> Hi Denys,
> 
> Thank you for reply.
> 
> On Fri, 17 Jul 2020 at 22:32, Denys Dmytriyenko <denys@ti.com> wrote:
> > NAK, libdir is usually /usr/lib
> 
> Sorry it was my mistake. Are you willing to accept a patch with
> ${base_libdir} instead?

Any specific reason for this change?
I'm not against it, but I haven't seen any setups where ${base_libdir} != /lib

-- 
Denys


> Thanks!
> 
> Ciao,
> Alessio
