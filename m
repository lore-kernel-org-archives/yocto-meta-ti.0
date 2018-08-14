Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67D92E006B3; Tue, 14 Aug 2018 11:40:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EDB8E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 11:40:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EIeo5M024460
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 13:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534272050;
	bh=EvlE/D2d+0KwXqvFmcU/J4vzKB/wMDtNozl2OWKBvqo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=psrO7uMAm5iy8QslTtj5h1V4QUiVMh3QlCi6KaBSzcdI0zMR/bcNwU+yFiIw8Eu0p
	FftC8WogqMB+wpkzrfs1vKEkAlG7thPihgOVhQdjeiAlR35D+pKEMm4NXWhtZvaigN
	kcL/EeiT2uHBuTKD7bXn60cjiKl+XLsF7Qiz/M+Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EIeoH0031097
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 13:40:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 13:40:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 13:40:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EIen55023366;
	Tue, 14 Aug 2018 13:40:49 -0500
Date: Tue, 14 Aug 2018 14:39:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
Message-ID: <20180814183945.GF2547@beryl>
References: <1533894867-29738-1-git-send-email-hzhang@ti.com>
	<20180814005610.GY2547@beryl>
	<bd0cf0d2aa7441a48bb02bb3fb2bb064@ti.com>
MIME-Version: 1.0
In-Reply-To: <bd0cf0d2aa7441a48bb02bb3fb2bb064@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] recipes-ti: devtools: add TI XDC tools 3.50.07.20
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
X-List-Received-Date: Tue, 14 Aug 2018 18:40:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 14, 2018 at 10:58:21AM -0400, Zhang, Hao wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, August 13, 2018 8:56 PM
> > To: Zhang, Hao
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 1/2] recipes-ti: devtools: add TI XDC tools
> > 3.50.07.20
> > 
> > On Fri, Aug 10, 2018 at 05:54:27AM -0400, hzhang@ti.com wrote:
> > > From: Hao Zhang <hzhang@ti.com>
> > >
> > > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > > ---
> > >  recipes-ti/devtools/ti-xdctools_3.50.07.20.bb | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >  create mode 100644 recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
> > 
> > Why is 3.50.03 being left around?
> > 
> Please keep the old version for now, we will remove it later if it is not 
> needed.

The general OE convention is to keep only the latest version, unless there are 
clear uses for older version as well.

That said, we keep on adding new versions and never remove old ones - 3.23, 
3.30, 3.50 and now another minor version of 3.50.

I'd understand the need for 3.23 and 3.30 if they are API/ABI incompatible 
with 3.50, but two minor versions of 3.50?

Please start cleaning those up. Thanks.


> > > diff --git a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb b/recipes-
> > ti/devtools/ti-xdctools_3.50.07.20.bb
> > > new file mode 100644
> > > index 0000000..d45f373
> > > --- /dev/null
> > > +++ b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
> > > @@ -0,0 +1,9 @@
> > > +require recipes-ti/devtools/ti-xdctools-core.inc
> > > +
> > > +PV = "3_50_07_20"
> > > +PR = "r0"
> > > +
> > > +LIC_FILES_CHKSUM =
> > "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1
> > 796f68c3d32d408415f5612f1f60652"
> > > +
> > > +SRC_URI[xdczip.md5sum] = "52e4b5ddf2e004c6acff52104840724e"
> > > +SRC_URI[xdczip.sha256sum] =
> > "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07
> > "
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

