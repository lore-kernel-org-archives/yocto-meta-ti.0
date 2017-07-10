Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A831E00C3B; Mon, 10 Jul 2017 13:02:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 052E2E00BB6
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 13:02:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6AK2agb014940
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 15:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499716956;
	bh=E6AEFCoy7cCk56FujmhRvjogXzuRTHE/ckjJ8zphuS8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XGxNX5+T6PtJ34Ltp47fTBcUrhFwT5iYidg3pXLq1FruxNFLBwG7dWm0cXuLyPB0y
	qsZxt4HXkZ225GKllSieIcKe3by6YprPXC7OX6NEGlpMtjfCFEXvF+h6EM32631b30
	QDhez/OhKS8GfTPVKC6coT6AGqfyf+Lw8k7RcmQA=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AK2VDT014615
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 15:02:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Jul 2017 15:02:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AK2Veo022945;
	Mon, 10 Jul 2017 15:02:31 -0500
Date: Mon, 10 Jul 2017 16:02:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20170710200228.GF14665@edge>
References: <1499380944-60574-1-git-send-email-m-radhakrishnan2@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D53EE3@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926D53EE3@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] icss-emac-lld-rtos: Added rtos recipe for icss-emac-lld
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
X-List-Received-Date: Mon, 10 Jul 2017 20:02:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hongmei,

Feel free to upstream icss-emac-lld recipes to meta-ti.


On Mon, Jul 10, 2017 at 02:29:59PM +0000, Gou, Hongmei wrote:
> As there are also recipes for Linux user space icss-emac-lld, can we create 
> icss-emac-lld.inc to include the common information such as SRC_URI, SRCREV, 
> and etc.?
> 
> Linux user space icss-emac-lld recipes in meta-processor-sdk:
> http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=tree;f=recipes-bsp/icss-emac-lld;h=0e6b07f5b436f6c32cb98f6f80cce1640f749b6d;hb=b90a8b708c29abe7e888118c269a4c8878d98b0d
> 
> Thanks,
> Hongmei
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> > Sent: Thursday, July 06, 2017 6:42 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for icss-
> > emac-lld
> > 
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 43
> > ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > 
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-
> > bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > new file mode 100644
> > index 0000000..53e6bf3
> > --- /dev/null
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > @@ -0,0 +1,43 @@
> > +inherit ti-pdk
> > +
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> > "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d851651130
> > 4f11a28586d"
> > +
> > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
> > +ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
> > +ICSS_EMAC_LLD_GIT_BRANCH = "master"
> > +ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
> > +
> > +# Below commit ID corresponds to "DEV.ICSS-EMAC_LLD.01.00.00.07C"
> > +ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
> > +
> > +BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
> > +SRC_URI =
> > "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFI
> > X};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> > +
> > +SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
> > +PV = "01.00.00.07C"
> > +PR = "r0"
> > +
> > +S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > +
> > +DEPENDS_append = " osal-rtos \
> > +                   pruss-lld-rtos \
> > +"
> > +DEPENDS_append_ti33x = " starterware-rtos \ "
> > +DEPENDS_append_ti43x = " starterware-rtos \ "
> > +
> > +# Build with make instead of XDC
> > +TI_PDK_XDCMAKE = "0"
> > +
> > +export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
> > +export DEST_ROOT="${S}"
> > +
> > +# HTML doc link params
> > +PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
> > +
> > +INSANE_SKIP_${PN} = "arch"
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

