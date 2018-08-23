Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07002E00718; Thu, 23 Aug 2018 09:13:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30B9FE003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 09:13:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NGDOYp034905
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 11:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535040804;
	bh=RqHWT6shW0YJWwPzHbBrRUW2UexyTh8MUvOrd8zOxVU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LAxyzU79R3tkgSaShspe7goVTyvzzIaiHRQfEj+pkBn/gwBz55QMTRwS1O9KPxIfK
	h6CWwdfmlxl8SmNWeDtp3HM2YkVynl7m5Lzfecdx1+3CSldxEOkRCJ6dYvY33hK99c
	HGs7wh3Fl8sKB9T17Zw21gFyjWpIFLRBFhzq95ho=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NGDOVg021551
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 11:13:24 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 11:13:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 11:13:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NGDO9D027600;
	Thu, 23 Aug 2018 11:13:24 -0500
Date: Thu, 23 Aug 2018 12:12:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180823161229.GQ29422@beryl>
References: <1534983904-16386-1-git-send-email-sam.nelson@ti.com>
	<1534983904-16386-4-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534983904-16386-4-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH v3 4/4] sciclient: Add recipe for SCI client driver
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
X-List-Received-Date: Thu, 23 Aug 2018 16:13:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2018 at 08:25:04PM -0400, Sam Nelson wrote:
> Sci client provides API to communicate with the core running System
> firmware
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous version of patch
> - Update compatibility to k3
> ---
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 89 +++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
> 
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> new file mode 100644
> index 0000000..e899b66
> --- /dev/null
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -0,0 +1,89 @@
> +SUMMARY = "TI RTOS low level driver for SCICLIENT"
> +DESCRIPTION = "TI RTOS low level driver for SCICLIENT "

By default, DESCRIPTION = "${SUMMARY}." so no need to duplicate it, unless you 
provide a more detailed description.


> +inherit ti-pdk
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> +
> +COMPATIBLE_MACHINE = "k3"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
> +SCICLIENT_GIT_PROTOCOL = "git"
> +SCICLIENT_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
> +SCICLIENT_SRCREV = "4ac052a70764c5fcf9dd18d521fe3b631bfcd875"
> +
> +BRANCH = "${SCICLIENT_GIT_BRANCH}"
> +SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${SCICLIENT_SRCREV}"
> +PV = "01.00.00.00"
> +PR = "r0"
> +
> +DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +SCICLIENT_PACKAGE_BASE   = "${S}/../sciclient_base"
> +SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
> +
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
> +
> +#export PDK_SCICLIENT_ROOT_PATH ="${WORKDIR}/build"
> +#export DEST_ROOT="${S}"
> +
> +LIMSOCS = "am65xx"
> +LIMSOCS_am65xx-evm = "am65xx"
> +
> +LIMBOARDS = "am65xx_evm"
> +LIMBOARDS_am65xx-evm = "am65xx_evm"

The above 4 lines look strange right now - the second line in each pair is 
redundant at the moment.


> +BOARD_PACKAGE = ""
> +BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "SCICLIENT"
> +
> +do_configure() {
> +
> +    rm -rf ${SCICLIENT_PACKAGE_BASE}
> +    cd ${S}
> +
> +    # remove any previous package
> +    rm -f ${SCICLIENT_PACKAGE_BASE}
> +
> +    # make the release package before building it
> +    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${SCICLIENT_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=${S}
> +
> +   # This is to ensure the make package completed successfully
> +    cat  ${SCICLIENT_ROOTPATH}/makefile
> +}
> +
> +do_compile() {
> +
> +    cd ${SCICLIENT_ROOTPATH}
> +
> +    # Clean
> +    # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> +
> +    # Build am65xx libraries
> +    make lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> +
> +    #archive
> +    tar -cf sciclient.tar --exclude='*.tar' ./*
> +}
> +
> +do_install() {
> +    cd ${SCICLIENT_ROOTPATH}
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

