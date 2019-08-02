Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 250F6E00EBF; Fri,  2 Aug 2019 12:34:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80B16E00EBB
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 12:34:52 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72JYqad117186
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564774492;
	bh=Hq8bV12oZW73m/E+yLVgbTIzk/nJiLUzo6ga+/hWTXo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OBJqo4YozTGjZ4WQ1H33wRuizJLkbCQI+TGj1bf5fgbUfRiZ5a4PhHl1pfoigqqT4
	nkUZcmA88higCPa+8ezXkp90XVoJ0mzyDlKH35qdKqbKW447BJPCtYP2TSsE6sT6+4
	9MNFVtCsbSqwFLZoxJXH1ajvqEE+d9ShxAoIWmiA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72JYqYs000734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:34:52 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 14:34:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 14:34:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72JYpbM046902;
	Fri, 2 Aug 2019 14:34:51 -0500
Date: Fri, 2 Aug 2019 15:34:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Message-ID: <20190802193451.GT20944@beryl>
References: <20190802193001.20559-1-g-tammana@ti.com>
	<c712cd58ad6d445e96780796c30eb6dc@ti.com>
	<20190802193228.GS20944@beryl>
MIME-Version: 1.0
In-Reply-To: <20190802193228.GS20944@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 19:34:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ah, you mean "thud" tag, Ok.

On Fri, Aug 02, 2019 at 03:32:28PM -0400, Denys Dmytriyenko wrote:
> It's automatic
> 
> On Fri, Aug 02, 2019 at 03:28:54PM -0400, Tammana, Gowtham wrote:
> > Missed on meta-ti tag in the subject. Will send v2.
> > 
> > Thanks,
> > Gowtham
> > 
> > >-----Original Message-----
> > >From: Tammana, Gowtham
> > >Sent: Friday, August 02, 2019 2:30 PM
> > >To: Dmytriyenko, Denys; meta-ti@yoctoproject.org
> > >Cc: Tammana, Gowtham
> > >Subject: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
> > >
> > >Updated the recipe to pick the newer version, 1.10.5371573, of rogue
> > >gpu kernel sources.
> > >
> > >Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > >---
> > > ...er_1.10.5187610.bb => ti-img-rogue-driver_1.10.5371573.bb} | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > > rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.10.5187610.bb =>
> > >ti-img-rogue-driver_1.10.5371573.bb} (92%)
> > >
> > >diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
> > >b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
> > >similarity index 92%
> > >rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
> > >rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
> > >index 9ae60c4e..fcf35edc 100644
> > >--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
> > >+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
> > >@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =
> > >"file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
> > >
> > > inherit module
> > >
> > >-MACHINE_KERNEL_PR_append = "e"
> > >+MACHINE_KERNEL_PR_append = "a"
> > > PR = "${MACHINE_KERNEL_PR}"
> > >
> > > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >@@ -20,7 +20,7 @@ BRANCH = "linuxws/thud/k4.19/${PV}"
> > > SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-
> > >driver.git;branch=${BRANCH}"
> > > S = "${WORKDIR}/git"
> > >
> > >-SRCREV = "976f73444ef86b231819052bba2020e5b00aeb06"
> > >+SRCREV = "1531b98ba602911359bfded2d683e49b3c731313"
> > >
> > > PVR_SOC = "j721e_linux"
> > > PVR_BVNC = "22.104.208.318"
> > >--
> > >2.22.0
> > 

