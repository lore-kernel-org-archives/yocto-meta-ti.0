Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2450.1601595725753200906
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 16:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k5SrfOsU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091Ng4q1101888
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601595724;
	bh=DniaI/W4BNVrKJDR4uQ6aYRjqMD0KhSN6ZUUiOxvWn4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k5SrfOsUNaDuukLzZqmSa+whhkQkIuvw2FO/u0KfQetTqUS6eJMzgqLlafbJp3huU
	 WbAluwJdPtMIuu99hteOvdDDEOadZYX67eY132eC+vIaCpi678Rb0TooKX3L72bdFu
	 nc+ISnbUzDG3g1bGRxQlLUNViJjqeGT31YYaN10w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091Ng4qw106660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 18:42:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 18:42:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 18:42:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091Ng4w5041733;
	Thu, 1 Oct 2020 18:42:04 -0500
Date: Thu, 1 Oct 2020 19:42:03 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Quadros, Roger" <rogerq@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Nori,
 Sekhar" <nsekhar@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
Message-ID: <20201001234203.GN7434@beryl>
References: <20200925075118.4861-1-rogerq@ti.com>
 <20200925203812.GE14006@beryl>
 <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
 <195ce1128d74495e99012d7c695c213c@ti.com>
MIME-Version: 1.0
In-Reply-To: <195ce1128d74495e99012d7c695c213c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Roger,

I think SRCREV should be 534ae9bba2481d76b3284a6df46baaffb8688e57:
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=534ae9bba2481d76b3284a6df46baaffb8688e57

Also, do you want to update PV from 2.2.0.2-rc1 to 2.2.4.2?

-- 
Denys


On Mon, Sep 28, 2020 at 07:11:39PM -0400, Dmytriyenko, Denys wrote:
> Roger,
> 
> Where did you get this commit ID from?
> +SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
> 
> It doesn't seem to exist:
> ERROR: Fetcher failure: Unable to find revision 80a55e27024ad52433509e056e70e0e767a56038 in branch ti-linux-firmware even from upstream
> 
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=80a55e27024ad52433509e056e70e0e767a56038
> Bad commit reference: 80a55e27024ad52433509e056e70e0e767a56038
> 
> -- 
> Denys
> 
> 
> > -----Original Message-----
> > From: Quadros, Roger
> > Sent: Monday, September 28, 2020 2:38 AM
> > To: Dmytriyenko, Denys
> > Cc: meta-ti@lists.yoctoproject.org; Nori, Sekhar; Murphy, Dan
> > Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet
> > firmware
> > 
> > Denys,
> > 
> > On 25/09/2020 23:38, Denys Dmytriyenko wrote:
> > > Is it v2? What's the difference from v1? I already merged v1 to dunfell-next -
> > > should I drop it and merge this one instead?
> > 
> > There is no difference. Your merge is fine. Thanks!
> > 
> > cheers,
> > -roger
> > >
> > >
> > > On Fri, Sep 25, 2020 at 10:51:18AM +0300, Roger Quadros wrote:
> > >> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.04.02
> > >>
> > >> Signed-off-by: Roger Quadros <rogerq@ti.com>
> > >> ---
> > >>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-
> > bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> > >> index 6e17c4aa..734ca9c1 100644
> > >> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> > >> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> > >> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
> > >>
> > >>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >>
> > >> -SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
> > >> +SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
> > >>   BRANCH ?= "ti-linux-firmware"
> > >>
> > >>   SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-
> > firmware.git;protocol=git;branch=${BRANCH}"
> > >> --
> > >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > >> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > >>
> > 
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
