Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.463.1597444089657244066
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 15:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vHLD+6Xs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07EMS5nu066335;
	Fri, 14 Aug 2020 17:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597444085;
	bh=br+ey5+Sa9WfkOuxhvMhj/98Shuak/PgZPyTXIhgvK0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vHLD+6XspGwBjIalpbpnARD/m9Pdi0I9zPTpHL1OLYoFP4HZvPwtbHAG9N3UqpXAj
	 8e4nkKz9o3mD6bwUPA41/BbhYTY7o8nnhoxYzNIpjJI8LCIyVzcG5/sFUeBl99a93a
	 LRJ9fyiSzjUltUDdTxs7SNQs2pSBjFiCR9DofSnQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07EMS4QD061503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2020 17:28:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 14
 Aug 2020 17:28:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 14 Aug 2020 17:28:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07EMS4Ze102654;
	Fri, 14 Aug 2020 17:28:04 -0500
Date: Fri, 14 Aug 2020 18:28:04 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] pru-icss: Replace hardcoded lib with libdir variable
Message-ID: <20200814222804.GO13081@beryl>
References: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu>
 <20200717203244.GG13182@beryl>
 <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
 <20200722212440.GC10098@beryl>
 <CAPk1OjEtwvkMrGOFUHRGQgQoZ+HEN59cqtmnf=hrkc60kyP-GA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPk1OjEtwvkMrGOFUHRGQgQoZ+HEN59cqtmnf=hrkc60kyP-GA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 23, 2020 at 08:49:14AM +0200, Alessio Igor Bogani wrote:
> Hi Denys,
> 
> On Wed, 22 Jul 2020 at 23:24, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sat, Jul 18, 2020 at 09:58:05AM +0200, Alessio Igor Bogani wrote:
> > > Hi Denys,
> > >
> > > Thank you for reply.
> > >
> > > On Fri, 17 Jul 2020 at 22:32, Denys Dmytriyenko <denys@ti.com> wrote:
> > > > NAK, libdir is usually /usr/lib
> > >
> > > Sorry it was my mistake. Are you willing to accept a patch with
> > > ${base_libdir} instead?
> >
> > Any specific reason for this change?
> > I'm not against it, but I haven't seen any setups where ${base_libdir} != /lib
> 
> Using usrmerge DISTRO_FEATURE /lib become a symlink against /usr/lib.

Alessio,

Is this still required?
Were you going to submit a new patch with ${base_libdir}?
Please let me know. Thanks.

-- 
Denys
