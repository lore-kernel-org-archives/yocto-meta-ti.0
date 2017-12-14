Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD37CE00D48; Thu, 14 Dec 2017 09:57:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DDADE00D41
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 09:57:23 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEHvNGK022375
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 11:57:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513274243;
	bh=7onq4qNn4nuQ1pxuiYJ3TTxyrE4VplYeX3wICOyVBio=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Yk6AF3EtPdhRJdSSx6w6cljqC0sFsumiWhzkktrS6Fe3i0PQ5bXIG+YRhDozWlBGp
	vVde8jjhrnb5hoH/1glYgI7YuYz6FS4W3w0JPvyqI0mi04QfPcblv8vWWydlV7pDfj
	nPNf4NGhsN/zX26pFrw5ZDc7yzGWKUkQPBMbpBi0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEHvNn5010131
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 11:57:23 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 11:57:23 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 11:57:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEHvMnS025141;
	Thu, 14 Dec 2017 11:57:23 -0600
Date: Thu, 14 Dec 2017 12:57:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20171214175722.GA31492@edge>
References: <1513196504-15487-1-git-send-email-m-radhakrishnan2@ti.com>
	<20171214023656.GB30822@edge>
MIME-Version: 1.0
In-Reply-To: <20171214023656.GB30822@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] icss-emac-lld: Update to version 1.0.0.10A
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
X-List-Received-Date: Thu, 14 Dec 2017 17:57:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping.

icss-emac has already been updated to 1.0.0.8 by Jake last month. Please 
rebase.


On Wed, Dec 13, 2017 at 09:36:56PM -0500, Denys Dmytriyenko wrote:
> Doesn't apply, please rebase.
> 
> 
> On Wed, Dec 13, 2017 at 03:21:44PM -0500, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > index 8e2ffd4..37ff6e0 100644
> > --- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > @@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
> >  ICSS_EMAC_LLD_GIT_BRANCH = "master"
> >  ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
> >  
> > -# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> > -ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
> > +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.10A"
> > +ICSS_EMAC_LLD_SRCREV = "91f70af3714a823df4f71bde3c4d954728e07856"
> >  
> >  BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
> >  SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> >  
> >  SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
> > -PV = "01.00.00.07C"
> > +PV = "01.00.00.10A"
> >  INC_PR = "r0"
> >  
> >  S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

