Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17222.1601652606382020562
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zDFtOHP4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 092FU5fv070009
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Oct 2020 10:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601652605;
	bh=inDumGrWn2WS+y/0KZS0TSIDjGTyK1RBqKs4nldyvpA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zDFtOHP48qOjSguLAHkOsIWtzyw5GM/R7n/BDQvO3tcfwjA9D8R82Wj2IXdBnz6xf
	 I2tvhkjjsMTQFXiVMoqhSd/08ngxaYiVyoboOGaNyOZADdd5bsscdQdE9pqJx3+epA
	 Y9LevkoQfxi6VZ/hDh41/vcVP5W/AFKA/+MOd+N0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 092FU5JW001353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Oct 2020 10:30:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 10:30:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 10:30:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 092FU4Iu032435;
	Fri, 2 Oct 2020 10:30:04 -0500
Date: Fri, 2 Oct 2020 11:30:04 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Nori,
 Sekhar" <nsekhar@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
Message-ID: <20201002153004.GY7434@beryl>
References: <20200925075118.4861-1-rogerq@ti.com>
 <20200925203812.GE14006@beryl>
 <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
 <195ce1128d74495e99012d7c695c213c@ti.com>
 <20201001234203.GN7434@beryl>
 <4d077b95-8e57-7fb9-2743-fb7fe700a84c@ti.com>
MIME-Version: 1.0
In-Reply-To: <4d077b95-8e57-7fb9-2743-fb7fe700a84c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 02, 2020 at 11:39:55AM +0300, Roger Quadros wrote:
> Denys,
> 
> On 02/10/2020 02:42, Denys Dmytriyenko wrote:
> >Roger,
> >
> >I think SRCREV should be 534ae9bba2481d76b3284a6df46baaffb8688e57:
> >https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=534ae9bba2481d76b3284a6df46baaffb8688e57
> 
> You are right. I made a copy paste error.
> 
> I think we can drop this patch since the f/w version got bumped again.
> I will send a fresh patch once the patch is accepted in ti-linux-firmware
> 
> >
> >Also, do you want to update PV from 2.2.0.2-rc1 to 2.2.4.2?
> >
> 
> currently it is
> PV = "2.2.0.1+2.2.0.2-rc1"
> 
> So for the new patch it should be
> PV = "2.2.7.2"
> correct?

Yes, correct.

-- 
Denys
