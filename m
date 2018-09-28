Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 710C0E00A0A; Fri, 28 Sep 2018 10:55:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F003EE009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:55:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SHtwqc078048
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538157358;
	bh=VO1VqsX1/8JUnWf6VFUEBeymtMPIO2q6ZwN8hNSAHjQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VrgK/PiPNZ2c/3UdrAfBVdioEX6+fe3sQV1uaYRH1zON3r+gfVeWnxva6uKZ1v85L
	X8hM8S7gO7NEHtxm+o06+1FQDShFzEj0Ym6E294IRDJgTs0AQzMwSs30kzS6P/Y6Y+
	5zI5CXWGhQO6H8gNwr+v5/asjeISbHg8YF3H6g7I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHtwGp029201
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:55:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 12:55:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 12:55:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHtwrP009237;
	Fri, 28 Sep 2018 12:55:58 -0500
Date: Fri, 28 Sep 2018 13:55:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <20180928175557.GH13888@beryl>
References: <1538155548-33412-1-git-send-email-xuj@ti.com>
	<20180928173156.GF13888@beryl>
	<52cc466fc4ff44c397ea6182ec51497b@ti.com>
MIME-Version: 1.0
In-Reply-To: <52cc466fc4ff44c397ea6182ec51497b@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dsplib/mathlib: remove .metadata folder from packages
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
X-List-Received-Date: Fri, 28 Sep 2018 17:55:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 28, 2018 at 01:38:13PM -0400, Xu, Jianzhong wrote:
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, September 28, 2018 1:32 PM
> To: Xu, Jianzhong
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] dsplib/mathlib: remove .metadata folder from packages
> 
> On Fri, Sep 28, 2018 at 01:25:48PM -0400, Jianzhong Xu wrote:
> > dsplib/mathlib: remove .metadata folder from dsplib and mathlib packages
> 
> The log says "remove", but that's not what the code does, it seems...
> 
> - Yeah. Maybe "don't add .metadata to packages" is better. Should I resend the patch?

Ok, do not install/deploy .metadata would be clearer.


> > Remove .metadata folder from dsplib and mathlib packages.
> > This folder prevents CCS from finding and installing dsplib and mathlib.
> > 
> > Signed-off-by: Jianzhong Xu <xuj@ti.com>
> > ---
> >  recipes-ti/dsplib/dsplib.inc   | 2 --
> >  recipes-ti/mathlib/mathlib.inc | 2 --
> >  2 files changed, 4 deletions(-)
> > 
> > diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> > index 7180c4a..f369679 100644
> > --- a/recipes-ti/dsplib/dsplib.inc
> > +++ b/recipes-ti/dsplib/dsplib.inc
> > @@ -49,7 +49,6 @@ do_install() {
> >  
> >  	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
> >  	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> > -	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >  	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
> >  }
> >  
> > @@ -62,7 +61,6 @@ do_deploy() {
> >  	# and place the zip file in ${DEPLOYDIR}
> >  	mkdir ./${DSPLIB_PACKAGE_NAME}
> >  	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
> > -	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAME}
> >  	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
> >  	rm -r ./${DSPLIB_PACKAGE_NAME}
> >  }
> > diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> > index 3e981e4..6aea085 100644
> > --- a/recipes-ti/mathlib/mathlib.inc
> > +++ b/recipes-ti/mathlib/mathlib.inc
> > @@ -48,7 +48,6 @@ do_install() {
> >  
> >  	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
> >  	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DIR_RECIPE}
> > -	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata ${D}${MATHLIB_INSTALL_DIR_RECIPE}
> >  	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
> >  }
> >  
> > @@ -61,7 +60,6 @@ do_deploy() {
> >  	# and place the zip file in ${DEPLOYDIR}
> >  	mkdir ./${MATHLIB_PACKAGE_NAME}
> >  	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
> > -	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata ./${MATHLIB_PACKAGE_NAME}
> >  	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
> >  	rm -r ./${MATHLIB_PACKAGE_NAME}
> >  }
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

