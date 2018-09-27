Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7E15E00754; Thu, 27 Sep 2018 12:15:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B5BDE00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 12:15:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RJF8vX100568
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538075708;
	bh=zKkcOWft8QtUTgIZNFFrFmOmTduIlIwJgCR2SJngNIc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=peeypjFeyMUmVhT3+1rCLfkpdqcpzqOKwxFKEqJdcUe7AZPXw0lmBxme6gnUPdqeq
	GD/mZdfchUcwQg8E5ku1NOBpJGXbVbNY+d7IYef1hWM3CndLCew5AmQph535o6sC4g
	JxrVBhYNFpquLfDUhbNqtntOG9oyBVurlXsKD+7g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJF8l8015912
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:15:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 14:15:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 14:15:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJF81K017203;
	Thu, 27 Sep 2018 14:15:08 -0500
Date: Thu, 27 Sep 2018 15:15:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20180927191507.GA8582@beryl>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538061764-54977-19-git-send-email-m-radhakrishnan2@ti.com>
	<10f13a26-c8e9-b7f3-ef70-1be7576a56e5@ti.com>
	<9885e39a94cd4c9ca5afa69eff105796@ti.com>
MIME-Version: 1.0
In-Reply-To: <9885e39a94cd4c9ca5afa69eff105796@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [rocko/master][PATCH 18/30] udma-lld-rtos: Added support for udma-lld on rtos (initial version)
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
X-List-Received-Date: Thu, 27 Sep 2018 19:15:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 07:11:23PM +0000, Radhakrishnan, Mahesh wrote:
> 
> 
> -----Original Message-----
> From: Stiffler, Jacob 
> Sent: Thursday, September 27, 2018 12:34 PM
> To: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
> Subject: Re: [EXTERNAL] [meta-ti] [rocko/master][PATCH 18/30] udma-lld-rtos: Added support for udma-lld on rtos (initial version)
> 
> 
> 
> On 9/27/2018 11:22 AM, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >   recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 81 +++++++++++++++++++++++++++++++
> >   1 file changed, 81 insertions(+)
> >   create mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> >
> > diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> > new file mode 100644
> > index 0000000..1a68aa9
> > --- /dev/null
> > +++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> > @@ -0,0 +1,81 @@
> > +SUMMARY = "TI RTOS low level driver for UDMA"
> > +DESCRIPTION = "TI RTOS low level driver for Universal DMA module "
> > +
> > +inherit ti-pdk
> > +
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
> > +
> > +COMPATIBLE_MACHINE = "k3"
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +UDMA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/udma-lld.git"
> > +UDMA_LLD_GIT_PROTOCOL = "git"
> > +UDMA_LLD_GIT_BRANCH = "master"
> > +
> > +# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.00"
> > +UDMA_LLD_SRCREV = "745f7d3fa12cca6507821489451ffe0cfad4609e"
> > +
> > +BRANCH = "${UDMA_LLD_GIT_BRANCH}"
> > +SRC_URI = "${UDMA_LLD_GIT_URI};protocol=${UDMA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> > +
> > +SRCREV = "${UDMA_LLD_SRCREV}"
> > +PV = "01.00.00.00"
> > +PR = "r0"
> > +
> > +DEPENDS_append = " osal-rtos \
> > +                   sciclient-rtos \
> > +"
> > +
> > +# Build with make instead of XDC
> > +TI_PDK_XDCMAKE = "0"
> > +
> > +UDMA_PACKAGE_BASE   = "${S}/../udma_base"
> > +UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
> > +
> > +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> > +export PDK_UDMA_ROOT_PATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages"
> > +
> > +LIMSOCS = ""
> > +LIMSOCS_am65xx-evm = "am65xx"
> > +
> > +LIMBOARDS = ""
> > +LIMBOARDS_am65xx-evm = "am65xx_evm"
> 
> Can these definitions be added to the machine configuration as was done 
> for all others?
> This would mean, defining as below, correct?
> LIMSOCS_k3 = "am65xx"
> LIMBOARDS_k3 = "am65xx_evm"
> BOARD_PACKAGE_k3 = "am65xx_evm"

No, move them to the machine config in am65xx-evm.conf.


> > +
> > +BOARD_PACKAGE = ""
> > +BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
> > +
> > +# HTML doc link params
> > +PDK_COMP_LINK_TEXT = "UDMA LLD"
> > +
> > +do_configure() {
> > +
> > +   # remove any previous package
> > +    rm -rf ${UDMA_PACKAGE_BASE}
> > +
> > +    cd ${S}
> > +
> > +    # make the release package before building it
> > +    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${UDMA_PACKAGE_BASE} PDK_UDMA_COMP_PATH=${S}
> > +}
> > +
> > +do_compile() {
> > +
> > +    cd ${UDMA_LLD_ROOTPATH}
> > +
> > +    # Build am65xx libraries
> > +    make clean lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> > +
> > +    #archive
> > +    tar -cf udma_lld.tar --exclude='*.tar' ./*
> > +}
> > +
> > +do_install() {
> > +    cd ${UDMA_LLD_ROOTPATH}
> > +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma
> > +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/udma \;
> > +}
> > +
> > +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> > +
> > +INSANE_SKIP_${PN} = "arch ldflags"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

