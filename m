Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8EF5E00B6C; Thu, 27 Sep 2018 13:13:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14C41E0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:13:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKDd4N113423
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538079219;
	bh=UuEHx94CC8pNfHtcR3wGL3IkqiJwmQGj+yftvmzPgfs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=u+JscDXtWNzb/hgCe6OBK9PDfC9TVTfMYSn+NKk0luhPgiS9dRqvC6VNm+KIjfPEe
	efwYumQD1GJlagNijMNoWBjyXBYGc9tw0eqalceBuNVyT06wWwqEPeQQqifB9CQvPU
	wCEt1h3JBP+Mw8a9OVg1TgbhpU1eBoFCW/iq2Z8o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKDdWY013310
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:13:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:13:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:13:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKDdhV003540;
	Thu, 27 Sep 2018 15:13:39 -0500
Date: Thu, 27 Sep 2018 16:13:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20180927201338.GF8582@beryl>
References: <1538078682-5378-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538078682-5378-2-git-send-email-m-radhakrishnan2@ti.com>
	<20180927200758.GD8582@beryl>
	<ca12e6b987354514a8daac5c10359236@ti.com>
MIME-Version: 1.0
In-Reply-To: <ca12e6b987354514a8daac5c10359236@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 02/30] common-csl-ip: Update to version 03.03.00.12
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
X-List-Received-Date: Thu, 27 Sep 2018 20:13:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:10:37PM -0400, Radhakrishnan, Mahesh wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, September 27, 2018 4:08 PM
> To: Radhakrishnan, Mahesh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko/master][PATCH v2 02/30] common-csl-ip: Update to version 03.03.00.12
> 
> On Thu, Sep 27, 2018 at 04:04:42PM -0400, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > index ed8078d..baa7898 100644
> > --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> >  
> >  COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
> >  
> > -PV = "05.01.00.00"
> > +PV = "03.03.00.12"
> 
> Still backwards.
> 
> The previous version up streamed was wrong. It should have been 03.03.00.x 
> consistent with the package.xdc & the versions mentioned in the release 
> notes of CSL throughout.
> This patch corrects it to the right version 03.03.00.12

Cannot easily move version backwards. At least need to bump epoch/PE...


> >  INC_PR = "r0"
> >  
> >  CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> > @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
> >  CSL_GIT_BRANCH = "master"
> >  CSL_GIT_DESTSUFFIX = "git"
> >  
> > -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.05.01.00.00"
> > -CSL_SRCREV = "8db3d673101a504fd7fb36d6c9c4981e1e15ff50"
> > +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12"
> > +CSL_SRCREV = "0c3b2c8a054d2af27fe1683e9aa579d43049a3bf"
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

