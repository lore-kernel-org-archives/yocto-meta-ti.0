Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7299E00546; Wed, 22 Aug 2018 17:02:20 -0700 (PDT)
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
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04120E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:02:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N02JOo111700
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534982539;
	bh=Iyp8F8ueBL78GbfqiV6ig4BqDRrL5xoCUCMgJtnszJE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cgqdGnXVf2tTB6seEX9c9FJFlTAEMk76Kd6/iJ4ybJzYwaQ1Pi48eWyC9vHSuqcS+
	M8T+bjgFd8S1azzF5pxKHwFHAt0lbegrz9UlUeYfydZn904e2mjGBhBTkMmgAlI5X2
	VikOJPUE/oMQ0Juf4BaeOp7iyb6b595j0kFAOm/Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N02JJB009502
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:02:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 19:02:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 19:02:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N02IA0010318;
	Wed, 22 Aug 2018 19:02:18 -0500
Date: Wed, 22 Aug 2018 20:01:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20180823000123.GO29422@beryl>
References: <1534974652-28676-1-git-send-email-sam.nelson@ti.com>
	<20180822224727.GJ29422@beryl>
	<c2b488e8352948d994a4a4988bce5b2e@ti.com>
MIME-Version: 1.0
In-Reply-To: <c2b488e8352948d994a4a4988bce5b2e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH 1/4] ti-pdk-build-rtos: Update to new version 1.0.0.10
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
X-List-Received-Date: Thu, 23 Aug 2018 00:02:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2018 at 07:28:53PM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, August 22, 2018 6:47 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [rocko][PATCH 1/4] ti-pdk-build-rtos: Update to new
> > version 1.0.0.10
> > 
> > On Wed, Aug 22, 2018 at 05:50:49PM -0400, Sam Nelson wrote:
> > > Add support for am65xx-evm
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-
> > pdk-build/ti-pdk-build-rtos_git.bb
> > > index c838d71..fd716d7 100644
> > > --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > > +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > > @@ -4,25 +4,24 @@ LIC_FILES_CHKSUM =
> > "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
> > >
> > >  require recipes-ti/includes/ti-paths.inc
> > >
> > > -PV = "01.00.00.09A"
> > > +PV = "01.00.00.10"
> > >  PR = "r0"
> > >
> > >  PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-
> > build.git"
> > >  PDK_BUILD_GIT_PROTOCOL = "git"
> > >  PDK_BUILD_GIT_BRANCH = "master"
> > >
> > > -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.09A"
> > > -PDK_BUILD_SRCREV = "4870d6cfcab92dfedae8ed28054fdc61169e28b1"
> > > +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.10"
> > > +PDK_BUILD_SRCREV = "f06835474e51a5fd63cf23bab0d2f42b0f73f19d"
> > >
> > >  BRANCH = "${PDK_BUILD_GIT_BRANCH}"
> > >  SRC_URI = "\
> > >
> > ${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BR
> > ANCH} \
> > > -    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch \
> > 
> > ???
> 
> This patch is already part of the new baseline. So can be removed..

Then you'd want to remove corresponding file.


> > >      "
> > >
> > >  SRCREV = "${PDK_BUILD_SRCREV}"
> > >
> > > -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
> > > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-
> > a15|keystone|omapl1|c66x|am65xx-evm"
> > 
> > k3?
> 
> Yes k3.

I meant maybe you want to use "k3" isntead of "am65xx-evm" here?


> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > >  S = "${WORKDIR}/git/"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

