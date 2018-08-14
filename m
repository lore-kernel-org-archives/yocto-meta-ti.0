Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B148E00A54; Tue, 14 Aug 2018 12:08:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB741E00A54
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 12:08:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EJ8htD098497
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:08:43 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJ8ha4020732
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 14:08:43 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 14:08:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 14:08:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EJ8ghj032170;
	Tue, 14 Aug 2018 14:08:43 -0500
Date: Tue, 14 Aug 2018 15:07:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
Message-ID: <20180814190738.GH2547@beryl>
References: <1533894867-29738-1-git-send-email-hzhang@ti.com>
	<20180814005610.GY2547@beryl>
	<bd0cf0d2aa7441a48bb02bb3fb2bb064@ti.com>
	<20180814183945.GF2547@beryl>
MIME-Version: 1.0
In-Reply-To: <20180814183945.GF2547@beryl>
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
X-List-Received-Date: Tue, 14 Aug 2018 19:08:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 14, 2018 at 02:39:45PM -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 14, 2018 at 10:58:21AM -0400, Zhang, Hao wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, August 13, 2018 8:56 PM
> > > To: Zhang, Hao
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH 1/2] recipes-ti: devtools: add TI XDC tools
> > > 3.50.07.20
> > > 
> > > On Fri, Aug 10, 2018 at 05:54:27AM -0400, hzhang@ti.com wrote:
> > > > From: Hao Zhang <hzhang@ti.com>
> > > >
> > > > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > > > ---
> > > >  recipes-ti/devtools/ti-xdctools_3.50.07.20.bb | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >  create mode 100644 recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
> > > 
> > > Why is 3.50.03 being left around?
> > > 
> > Please keep the old version for now, we will remove it later if it is not 
> > needed.
> 
> The general OE convention is to keep only the latest version, unless there are 
> clear uses for older version as well.
> 
> That said, we keep on adding new versions and never remove old ones - 3.23, 
> 3.30, 3.50 and now another minor version of 3.50.
> 
> I'd understand the need for 3.23 and 3.30 if they are API/ABI incompatible 
> with 3.50, but two minor versions of 3.50?
> 
> Please start cleaning those up. Thanks.

And also please make patches as diffs against old versions - use -C/-M flags.


> > > > diff --git a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb b/recipes-
> > > ti/devtools/ti-xdctools_3.50.07.20.bb
> > > > new file mode 100644
> > > > index 0000000..d45f373
> > > > --- /dev/null
> > > > +++ b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
> > > > @@ -0,0 +1,9 @@
> > > > +require recipes-ti/devtools/ti-xdctools-core.inc
> > > > +
> > > > +PV = "3_50_07_20"
> > > > +PR = "r0"
> > > > +
> > > > +LIC_FILES_CHKSUM =
> > > "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1
> > > 796f68c3d32d408415f5612f1f60652"
> > > > +
> > > > +SRC_URI[xdczip.md5sum] = "52e4b5ddf2e004c6acff52104840724e"
> > > > +SRC_URI[xdczip.sha256sum] =
> > > "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07
> > > "
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

