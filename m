Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99970E0090E; Wed, 27 Jan 2016 11:28:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1680FE00838
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 11:28:10 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJS84b018539;
	Wed, 27 Jan 2016 13:28:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJS8dQ018009;
	Wed, 27 Jan 2016 13:28:08 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:28:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJS8rl027090;
	Wed, 27 Jan 2016 13:28:08 -0600
Date: Wed, 27 Jan 2016 14:27:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Message-ID: <20160127192752.GS11314@edge>
References: <1453844240-15572-1-git-send-email-denis@denix.org>
	<3E54258959B69E4282D79E01AB1F32B704CED025@DFLE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B704CED025@DFLE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Andrianov,
	Vitaly" <vitalya@ti.com>
Subject: Re: [PATCH] netcp-sa-fw: add initial version 1.0.0
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
X-List-Received-Date: Wed, 27 Jan 2016 19:28:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 27, 2016 at 01:05:25AM +0000, Karicheri, Muralidharan wrote:
> Eric, Vitaly,
> 
> I think this can cause some potential confusion to customers. Isn't there a 
> SA PDSP firmware as well? If yes, we will have to rename the firmware.
> This is not a comment against the recipe itself, but want to avoid any 
> future confusion.

Murali,

Thanks! Any agreement on the FW name? If you decide to rename it, please 
submit corresponding patch against linux-firmware repo first, as well as the 
driver changes, of course.

-- 
Denys


> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On
> >Behalf Of Denys Dmytriyenko
> >Sent: Tuesday, January 26, 2016 4:37 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH] netcp-sa-fw: add initial version 1.0.0
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb | 29
> >+++++++++++++++++++++++++++++
> > 1 file changed, 29 insertions(+)
> > create mode 100644 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> >
> >diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-
> >fw_git.bb
> >new file mode 100644
> >index 0000000..5f07b92
> >--- /dev/null
> >+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> >@@ -0,0 +1,29 @@
> >+DESCRIPTION = "NETCP SA firmware for Keystone"
> >+
> >+LICENSE = "TI-TFL"
> >+LIC_FILES_CHKSUM = "file://LICENCE.ti-
> >keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
> >+
> >+PV = "1.0.0"
> >+PR = "r0"
> >+
> >+CLEANBROKEN = "1"
> >+
> >+COMPATIBLE_MACHINE = "keystone"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
> >+BRANCH ?= "ti-linux-firmware-4.1.y"
> >+
> >+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-
> >firmware.git;protocol=git;branch=${BRANCH}"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+TARGET = "sa_mci.fw"
> >+
> >+do_install() {
> >+	install -d ${D}${base_libdir}/firmware
> >+	install -m 0644 ${S}/ti-keystone/${TARGET}
> >${D}${base_libdir}/firmware/${TARGET}
> >+}
> >+
> >+FILES_${PN} = "${base_libdir}/firmware"
> >--
> >2.2.0
> >
> >--
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

