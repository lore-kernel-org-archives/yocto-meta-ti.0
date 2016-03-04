Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CFD9E00BBF; Fri,  4 Mar 2016 11:12:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1403BE00B37
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 11:12:46 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24JCkn9022087
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 13:12:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24JCkWo017447
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 13:12:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 13:12:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24JCjca024179;
	Fri, 4 Mar 2016 13:12:45 -0600
Date: Fri, 4 Mar 2016 14:12:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Sobota, Justin" <jsobota@ti.com>
Message-ID: <20160304191229.GD7505@edge>
References: <1457048726-16687-1-git-send-email-jsobota@ti.com>
	<20160304030225.GT7505@edge>
	<311ECDE3E284F649854AED0B108A0CE13AF35766@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <311ECDE3E284F649854AED0B108A0CE13AF35766@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Fri, 04 Mar 2016 19:12:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Justin,

Please do the update then - i.e. please replace the old version with the new.

-- 
Denys


On Fri, Mar 04, 2016 at 02:01:16PM -0500, Sobota, Justin wrote:
> Denys,
> 
> The bios patch replaces version 6.42.02.29 and the xdc patch replaces 
> version 3.31.02.38.
> 
> Justin
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, March 03, 2016 10:02 PM
> To: Sobota, Justin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
> 
> Justin,
> 
> Any reason these patches don't replace the version, but add a new one?
> 
> -- 
> Denys
> 
> 
> On Thu, Mar 03, 2016 at 06:45:25PM -0500, Justin Sobota wrote:
> > Signed-off-by: Justin Sobota <jsobota@ti.com>
> > ---
> >  recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >  create mode 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > 
> > diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > new file mode 100644
> > index 0000000..6ab4e27
> > --- /dev/null
> > +++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > @@ -0,0 +1,12 @@
> > +require recipes-ti/bios/ti-sysbios.inc
> > +
> > +PV = "6_45_01_29"
> > +PR = "r0"
> > +
> > +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
> > +
> > +SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
> > +SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
> > +
> > +TI_BIN_UNPK_CMDS=""
> > +TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> > -- 
> > 1.7.10.4
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

