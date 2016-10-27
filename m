Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6B76E008D3; Thu, 27 Oct 2016 09:40:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92B53E007DA
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 09:40:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RGeRKt024615
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 11:40:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RGeRtm001741
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 11:40:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 11:40:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RGeQLn002547;
	Thu, 27 Oct 2016 11:40:27 -0500
Date: Thu, 27 Oct 2016 12:40:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20161027164026.GF12745@edge>
References: <1477440362-20066-1-git-send-email-i-pang@ti.com>
	<20161026001735.GW12745@edge>
MIME-Version: 1.0
In-Reply-To: <20161026001735.GW12745@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
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
X-List-Received-Date: Thu, 27 Oct 2016 16:40:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 25, 2016 at 08:17:35PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 25, 2016 at 07:06:01PM -0500, Ivan Pang wrote:
> > Signed-off-by: Ivan Pang <i-pang@ti.com>
> > ---
> >  .../bios/{ti-sysbios_6.45.01.29.bb => ti-sysbios_6.46.01.38.bb}   | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename recipes-ti/bios/{ti-sysbios_6.45.01.29.bb => ti-sysbios_6.46.01.38.bb} (32%)
> 
> Now, we are talking, thanks!
> 
> 
> > diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > similarity index 32%
> > rename from recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > rename to recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > index 6ab4e27..407b3b4 100644
> > --- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > +++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > @@ -1,12 +1,12 @@
> >  require recipes-ti/bios/ti-sysbios.inc
> >  
> > -PV = "6_45_01_29"
> > +PV = "6_46_01_38"
> >  PR = "r0"
> >  
> > -LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
> > +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
> 
> Need a brief explanation why the checksum changed here. Specifically, if the 
> license changed in any way from the existing BSD.

ping


> > -SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
> > -SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
> > +SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
> > +SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
> >  
> >  TI_BIN_UNPK_CMDS=""
> >  TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
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

