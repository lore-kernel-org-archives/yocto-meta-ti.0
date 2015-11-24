Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CE76E00B46; Tue, 24 Nov 2015 11:21:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5CB4E00B44
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 11:21:25 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAOJLND4013848;
	Tue, 24 Nov 2015 13:21:24 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAOJLNgo030449;
	Tue, 24 Nov 2015 13:21:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Nov 2015 13:21:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAOJLKw6029797;
	Tue, 24 Nov 2015 13:21:22 -0600
Date: Tue, 24 Nov 2015 14:21:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151124192102.GQ18230@edge>
References: <1448392297-15733-1-git-send-email-denis@denix.org>
	<5654B81E.30500@ti.com>
MIME-Version: 1.0
In-Reply-To: <5654B81E.30500@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] pmmc-fw: add initial PMMC firmware binary
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
X-List-Received-Date: Tue, 24 Nov 2015 19:21:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I had the same question, but I don't have an answer yet. Right now I'm running 
with the assumption it's not required, as we don't place any other FW images 
in deploy.


On Tue, Nov 24, 2015 at 02:18:54PM -0500, Jacob Stiffler wrote:
> Will this firmware be placed in the DEPLOY_DIR_IMAGES?
> 
> On 11/24/2015 2:11 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  recipes-bsp/pmmc-fw/pmmc-fw_git.bb | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 recipes-bsp/pmmc-fw/pmmc-fw_git.bb
> >
> >diff --git a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
> >new file mode 100644
> >index 0000000..0363bf6
> >--- /dev/null
> >+++ b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
> >@@ -0,0 +1,27 @@
> >+DESCRIPTION = "PMMC firmware"
> >+
> >+LICENSE = "TI-TFL"
> >+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
> >+
> >+PR = "r0"
> >+
> >+CLEANBROKEN = "1"
> >+
> >+COMPATIBLE_MACHINE = "k2g-evm"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
> >+BRANCH ?= "master"
> >+
> >+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >+
> >+S = "${WORKDIR}/git"
> >+TARGET = "pmmc-firmware.bin"
> >+
> >+do_install() {
> >+	mkdir -p ${D}/boot
> >+	cp ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
> >+}
> >+
> >+FILES_${PN} = "/boot"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

