Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FA3CE00AE4; Fri, 30 Aug 2019 09:16:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64D4BE00AE4
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:16:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGGVRR027543
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567181791;
	bh=vWRzVzQFYcEu9wLvw4HITDzB4Bl7fnAs4ZyrtxU3pvE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jFoz2E4kqXTZ/7cIHdyBKx54br8dlaVQqtAjhAxF66tCHAbnaLXqvgKqhNavkrjBC
	c2qRz9UMOQPk2tTX+tDQXIqzyTcOcrCwWaRKgs7OaE0LEfqeo966i18j6I86Wz4Wlf
	XvtQh44izGyJ6laV70aymxMgDWnZpxB5eO56YGuI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGGVt0032362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:16:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:16:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:16:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGGVIo009799;
	Fri, 30 Aug 2019 11:16:31 -0500
Date: Fri, 30 Aug 2019 12:16:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190830161630.GE3307@beryl>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-2-git-send-email-j-stiffler@ti.com>
	<20190830160324.GB3307@beryl>
	<7b67963e-0f27-a3d2-e7db-b6f7e1d9ce34@ti.com>
MIME-Version: 1.0
In-Reply-To: <7b67963e-0f27-a3d2-e7db-b6f7e1d9ce34@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH v2 2/3] jailhouse: provide tools package
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
X-List-Received-Date: Fri, 30 Aug 2019 16:16:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 30, 2019 at 12:10:53PM -0400, Jacob Stiffler wrote:
> 
> On 8/30/2019 12:03 PM, Denys Dmytriyenko wrote:
> >On Tue, Aug 20, 2019 at 02:11:11PM -0400, Jacob Stiffler wrote:
> >>Create a package containing the jailhouse tools which are used to work
> >>with the cells and inmates. This recipe provides a good example for
> >Should it be s/recipe/package/ here ^^^?
> 
> 
> I did mean recipe as the do_install task show an usage example.

Ah, Ok, now I see what you mean.


> >>using the jailhouse-cell-linux tool.
> >>
> >>The tools require the pyjailhouse python modules, so package them as
> >>well.
> >Any specific reason to package into own "pyjailhouse" package instead of
> >bundling with ${PN}-tools, as it's the only consumer now?
> 
> 
> It just seemed logical to me. pyjailhouse appears to be a proper python
> module, so I kept it separate.

Thanks.


> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  recipes-kernel/jailhouse/jailhouse_git.bb | 24 ++++++++++++++++++++----
> >>  1 file changed, 20 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> >>index d637d51..5d572d0 100644
> >>--- a/recipes-kernel/jailhouse/jailhouse_git.bb
> >>+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> >>@@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
> >>  S = "${WORKDIR}/git"
> >>  require jailhouse-arch.inc
> >>-inherit module pythonnative bash-completion deploy
> >>+inherit module pythonnative bash-completion deploy setuptools
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>  COMPATIBLE_MACHINE = "(ti-soc)"
> >>@@ -78,12 +78,21 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
> >>  TOOLS_SRC_DIR = "${S}/tools"
> >>  TOOLS_OBJ_DIR = "${S}/tools"
> >>+EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}"
> >>+
> >>+
> >>  do_compile() {
> >>-	oe_runmake V=1 ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}
> >>+	oe_runmake V=1
> >>  }
> >>  do_install() {
> >>-	oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} DESTDIR=${D} install
> >>+	# Install pyjailhouse python modules needed by the tools
> >>+	distutils_do_install
> >>+
> >>+	# We want to install the python tools, but we do not want to use pip...
> >>+	# At least with v0.10, we can work around this with
> >>+	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
> >>+	oe_runmake PIP=: PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
> >>  	install -d ${D}${CELL_DIR}
> >>  	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
> >>@@ -115,8 +124,15 @@ do_install() {
> >>  	fi
> >>  }
> >>-PACKAGE_BEFORE_PN = "kernel-module-jailhouse"
> >>+PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
> >>  FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
> >>+FILES_pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
> >>+FILES_${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
> >>+
> >>+RDEPENDS_${PN}-tools = "pyjailhouse python-mmap python-math python-argparse python-datetime python-curses python-compression"
> >>+RDEPENDS_pyjailhouse = "python-core python-ctypes python-fcntl python-shell"
> >>+
> >>+RRECCOMMENDS_${PN} = "${PN}-tools"
> >>  INSANE_SKIP_${PN} = "ldflags"
> >>-- 
> >>2.7.4
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti

