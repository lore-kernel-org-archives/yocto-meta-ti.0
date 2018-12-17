Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B53FE00C10; Mon, 17 Dec 2018 10:56:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C410E00566
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 10:56:17 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBHIuGq9107918
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 12:56:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545072976;
	bh=fG4wbKq+CaiWLYfrHQAgo0DbsKEtySUreWhdjD9wZaU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=G0hiSjyBKpaytj7XOFhDY3b+990z4b4wA0Wa9N8HLvbWXgoMaPZgaItVmMXDi4cZs
	eEqMHnXMcMVMVD20w1HqoMRqkbcUS7zx2dm5SJ5mU6R4w0AvGZOtWeGWFTvvHeS3TX
	lGojQ5rxpq7m7zehcSOmYRGvLe3sj/fNLwSFoNuI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBHIuGBe031265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Dec 2018 12:56:16 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 17 Dec 2018 12:56:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 17 Dec 2018 12:56:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBHIuGlR029503;
	Mon, 17 Dec 2018 12:56:16 -0600
Date: Mon, 17 Dec 2018 13:56:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20181217185615.GZ517@beryl>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
	<1544815903-10792-6-git-send-email-m-radhakrishnan2@ti.com>
	<20181214221726.GT517@beryl>
	<33114b0a3ab841dfb1eed1e0a56e90a3@ti.com>
MIME-Version: 1.0
In-Reply-To: <33114b0a3ab841dfb1eed1e0a56e90a3@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH 05/34] common-csl-ip: SRCREV update to 03.03.00.13 and use 'release' branch
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
X-List-Received-Date: Mon, 17 Dec 2018 18:56:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 17, 2018 at 10:25:51AM -0500, Radhakrishnan, Mahesh wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, December 14, 2018 5:17 PM
> To: Radhakrishnan, Mahesh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko/master][PATCH 05/34] common-csl-ip: SRCREV update to 03.03.00.13 and use 'release' branch
> 
> On Fri, Dec 14, 2018 at 02:31:14PM -0500, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/common-csl-ip/common-csl-ip.inc | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > index 61fc3e6..201a524 100644
> > --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > @@ -4,17 +4,17 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> >  
> >  COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
> >  
> > -PV = "03.03.00.12A"
> > +PV = "03.03.00.13"
> >  INC_PR = "r0"
> > -PE = "1"
> > +PE = "0"
> 
> Once Epoch gets bumped, you cannot go back. IIRC, it was due to PV going 
> backwards in a major way.
> 
> 
> Okay, I will put it back and send an update 

No need, I fixed it locally, it's in rocko-next for testing now.


> >  CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> >  CSL_GIT_PROTOCOL ="git"
> > -CSL_GIT_BRANCH = "master"
> > +CSL_GIT_BRANCH = "release"
> >  CSL_GIT_DESTSUFFIX = "git"
> >  
> > -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12A"
> > -CSL_SRCREV = "852cfe681c766a2096007fee37358c0782194897"
> > +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.13"
> > +CSL_SRCREV = "463b1f31dfc79e6fe393fcb9027c612872d4f7b1"
> >  
> >  BRANCH="${CSL_GIT_BRANCH}"
> >  SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

